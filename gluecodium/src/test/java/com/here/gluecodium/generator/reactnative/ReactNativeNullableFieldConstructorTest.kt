/*
 * Copyright (C) 2016-2026 HERE Europe B.V.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 * License-Filename: LICENSE
 */

package com.here.gluecodium.generator.reactnative

import com.here.gluecodium.generator.common.GeneratorOptions
import com.here.gluecodium.generator.typescript.TypeScriptGenerator
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeAttributes
import com.here.gluecodium.model.lime.LimeBasicType.TypeId
import com.here.gluecodium.model.lime.LimeBasicTypeRef
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeFieldConstructor
import com.here.gluecodium.model.lime.LimeFieldRef
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeValue
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Golden tests for Phase 27.14 (spec task 5.1): synthetic struct constructors for structs with
 * NULLABLE fields.
 *
 * Design §1.4: synthetic constructor emission SHALL support structs with nullable fields, delegating
 * conversion to the existing type-marshalling layer, NOT hardcoded per type:
 *   - nullable string  -> std-string create + `<lib>_String_create_handle_nullable` (present) / `nullptr` (absent),
 *   - nullable date    -> `<lib>_Date_create_handle_nullable(uint64_t)` (NOT a raw pointer cast),
 *   - nullable object  -> registry lookup + `<lib>_..._create_handle_nullable` wrapper (present) / `nullptr` (absent),
 *   - absent value     -> `nullptr`.
 * The TS TurboModule spec SHALL type each nullable param as `T | null`.
 *
 * The HERE verification cases are `TransitWaypoint.make(coordinates, place_name: String?)` (nullable
 * STRING, worked around by `_patch_transit_waypoint_make`) and `Location.makeWithTime(coordinates,
 * time: Date?)` (nullable DATE, worked around by `_patch_location_make_timestamped`). These neutral
 * fixtures prove the behaviour is not HERE-specific and cover both struct shapes:
 *   1. `Profile`  — a struct with an EXPLICIT LIME field constructor (nullable string/date/object), and
 *   2. `Waypoint` — a struct with NO explicit constructor (the real `TransitWaypoint`/`Location`
 *      shape), for which the generator synthesizes a `make(<uninitialized fields>)`.
 *
 * TDD status (spec task 5.1 red step): these characterization assertions confirm the generator on the
 * current `feature/rn-event-driven-callbacks` HEAD ALREADY emits the design §1.4 nullable-field
 * marshalling correctly in BOTH shapes — there is no genuine emission gap to force red on. This mirrors
 * the task 2.3 finding (routing overloads already emitted; the patch was redundant due to name skew).
 * They therefore lock in the correct behaviour so task 5.2 can retire `_patch_transit_waypoint_make`
 * and `_patch_location_make_timestamped` by name-reconciliation without silently regressing the
 * marshalling. Notably, the two patches themselves are LESS correct than the generator: they marshal a
 * nullable string by `reinterpret_cast<const char*>` of a registry handle, whereas the generator calls
 * `.utf8(rt)` on the JSI string — see the report accompanying this task.
 *
 * Validates: Requirements 3.3, 7.1 (design §1.4 synthetic nullable-field struct constructors).
 */
class ReactNativeNullableFieldConstructorTest {
    private val rootNamespace = listOf("gluecodium", "model")

    private val reactNativeGenerator =
        ReactNativeGenerator().apply {
            initialize(
                GeneratorOptions(
                    cppRootNamespace = rootNamespace,
                    libraryName = "library",
                ),
            )
        }

    private val typeScriptGenerator =
        TypeScriptGenerator().apply {
            initialize(GeneratorOptions(tags = setOf("react-native")))
        }

    // ── Fixtures ────────────────────────────────────────────────────────────────────────────────

    /** A trivial value struct used as a nullable OBJECT field. */
    private fun createAccountStruct(): LimeStruct {
        val name =
            LimeField(
                LimePath(rootNamespace, listOf("Account", "name")),
                typeRef = LimeBasicTypeRef(TypeId.STRING),
            )
        return LimeStruct(LimePath(rootNamespace, listOf("Account")), fields = listOf(name))
    }

    /**
     * `Profile` with an EXPLICIT LIME field constructor exposing a non-nullable string plus one
     * nullable field of each supported kind (string, date, object).
     */
    private fun createProfileStruct(account: LimeStruct): LimeStruct {
        val idField =
            LimeField(
                LimePath(rootNamespace, listOf("Profile", "id")),
                typeRef = LimeBasicTypeRef(TypeId.STRING),
            )
        val labelField =
            LimeField(
                LimePath(rootNamespace, listOf("Profile", "label")),
                typeRef = LimeBasicTypeRef(TypeId.STRING, isNullable = true),
            )
        val updatedAtField =
            LimeField(
                LimePath(rootNamespace, listOf("Profile", "updatedAt")),
                typeRef = LimeBasicTypeRef(TypeId.DATE, isNullable = true),
            )
        val ownerField =
            LimeField(
                LimePath(rootNamespace, listOf("Profile", "owner")),
                typeRef = LimeDirectTypeRef(account, isNullable = true),
            )
        val fields = listOf(idField, labelField, updatedAtField, ownerField)
        val structRef = LimeDirectTypeRef(LimeStruct(LimePath(rootNamespace, listOf("Profile")), fields = fields))
        val fieldConstructor =
            LimeFieldConstructor(
                LimePath(rootNamespace, listOf("Profile", "make")),
                structRef = structRef,
                fieldRefs =
                    fields.map { field ->
                        object : LimeFieldRef() {
                            override val field = field
                        }
                    },
            )
        return LimeStruct(
            LimePath(rootNamespace, listOf("Profile")),
            fields = fields,
            fieldConstructors = listOf(fieldConstructor),
        )
    }

    /**
     * `Waypoint` — a struct with fields but NO explicit LIME field constructor, exactly the
     * `TransitWaypoint`/`Location` situation the two patches target. The generator synthesizes a
     * `make(<uninitialized fields>)` for it.
     */
    private fun createWaypointStructNoCtor(account: LimeStruct): LimeStruct {
        val coordinates =
            LimeField(
                LimePath(rootNamespace, listOf("Waypoint", "coordinates")),
                typeRef = LimeDirectTypeRef(account),
            )
        val placeName =
            LimeField(
                LimePath(rootNamespace, listOf("Waypoint", "placeName")),
                typeRef = LimeBasicTypeRef(TypeId.STRING, isNullable = true),
            )
        val time =
            LimeField(
                LimePath(rootNamespace, listOf("Waypoint", "time")),
                typeRef = LimeBasicTypeRef(TypeId.DATE, isNullable = true),
            )
        return LimeStruct(
            LimePath(rootNamespace, listOf("Waypoint")),
            fields = listOf(coordinates, placeName, time),
        )
    }

    /**
     * `Landmark` — a struct whose ONLY field constructor is `@Skip(Java, Swift)`, exactly the
     * `TransitWaypoint` shape (`field constructor(coordinates)` with `@Skip(Cpp, Java, Kotlin,
     * Swift)`). Because the RN emitter excludes any callable that is `@Skip(Java)` AND `@Skip(Swift)`
     * (`shouldExcludeFunction`), this struct previously produced NO constructor at all: the explicit
     * field ctor was excluded, `makeFull` requires an exposed primary ctor (so it returned null), and
     * the synthetic no-arg `make` was gated off by the mere PRESENCE of a field constructor — leaving
     * the struct uninstantiable through the wrapper. `_patch_transit_waypoint_make` exists only to
     * fill that void.
     *
     * The generic fix (spec task 5.2): a struct with NO EXPOSED constructor SHALL still receive a
     * synthetic `make(<uninitialized fields>)` routed through the existing field-constructor
     * marshalling machinery, so nullable fields box correctly and non-nullable fields are validated.
     */
    private fun createLandmarkStructSkippedCtor(account: LimeStruct): LimeStruct {
        val coordinates =
            LimeField(
                LimePath(rootNamespace, listOf("Landmark", "coordinates")),
                typeRef = LimeDirectTypeRef(account),
            )
        val placeName =
            LimeField(
                LimePath(rootNamespace, listOf("Landmark", "placeName")),
                typeRef = LimeBasicTypeRef(TypeId.STRING, isNullable = true),
                defaultValue = LimeValue.Null(LimeBasicTypeRef(TypeId.STRING, isNullable = true)),
            )
        val fields = listOf(coordinates, placeName)
        val structRef = LimeDirectTypeRef(LimeStruct(LimePath(rootNamespace, listOf("Landmark")), fields = fields))
        // Only `coordinates` is bound by the ctor; `placeName` is omitted (nullable, defaults null).
        val skippedFieldConstructor =
            LimeFieldConstructor(
                LimePath(rootNamespace, listOf("Landmark", "make")),
                attributes =
                    LimeAttributes.Builder()
                        .addAttribute(LimeAttributeType.JAVA, LimeAttributeValueType.SKIP)
                        .addAttribute(LimeAttributeType.SWIFT, LimeAttributeValueType.SKIP)
                        .build(),
                structRef = structRef,
                fieldRefs =
                    listOf(
                        object : LimeFieldRef() {
                            override val field = coordinates
                        },
                    ),
            )
        return LimeStruct(
            LimePath(rootNamespace, listOf("Landmark")),
            fields = fields,
            fieldConstructors = listOf(skippedFieldConstructor),
        )
    }

    private fun reactNativeFiles(vararg elements: LimeNamedElement) =
        reactNativeGenerator.generate(LimeModel(referenceMap = emptyMap(), topElements = elements.toList()))

    private fun typeScriptFiles(vararg elements: LimeNamedElement) =
        typeScriptGenerator.generate(LimeModel(referenceMap = emptyMap(), topElements = elements.toList()))

    private fun bridgeImpl(
        moduleFileName: String,
        vararg elements: LimeNamedElement,
    ): String {
        val files = reactNativeFiles(*elements)
        val impl = files.find { it.targetFile.name == moduleFileName }
        assertTrue("C++ bridge impl ($moduleFileName) should be generated", impl != null)
        return impl!!.content
    }

    private fun bridgeHeader(
        moduleFileName: String,
        vararg elements: LimeNamedElement,
    ): String {
        val files = reactNativeFiles(*elements)
        val header = files.find { it.targetFile.name == moduleFileName }
        assertTrue("C++ bridge header ($moduleFileName) should be generated", header != null)
        return header!!.content
    }

    private fun specContent(
        specFileName: String,
        vararg elements: LimeNamedElement,
    ): String {
        val files = typeScriptFiles(*elements)
        val spec = files.find { it.targetFile.name == specFileName }
        assertTrue("TurboModule spec ($specFileName) should be generated", spec != null)
        return spec!!.content
    }

    // ── Shape 1: EXPLICIT LIME field constructor (Profile.make) ──────────────────────────────────

    @Test
    fun `explicit-ctor make marshals a nullable STRING field via std-string create plus nullable box`() {
        val account = createAccountStruct()
        val impl = bridgeImpl("NativeProfileModule.cpp", account, createProfileStruct(account))
        assertTrue(
            "nullable string must be created from utf8 then boxed via String_create_handle_nullable. Body:\n$impl",
            impl.contains("library_std_string_create_handle(") &&
                impl.contains("library_String_create_handle_nullable("),
        )
        assertTrue(
            "nullable string absent case must default to nullptr and be guarded by has_value(). Body:\n$impl",
            Regex("FfiOpaqueHandle __ffi_label_\\d+ = nullptr;").containsMatchIn(impl) &&
                impl.contains("if (label.has_value())"),
        )
    }

    @Test
    fun `explicit-ctor make marshals a nullable DATE field via the ULong nullable box uint64`() {
        val account = createAccountStruct()
        val impl = bridgeImpl("NativeProfileModule.cpp", account, createProfileStruct(account))
        // A nullable Date is ABI-identical to a nullable uint64: both box as
        // `std::optional<uint64_t>*` (see FfiConversionBase.mustache). The SDK exports NO
        // `<lib>_Date_create_handle_nullable` symbol (the Dart backend inlines the optional
        // boxing via header-only Conversion<> templates), so the RN bridge must reuse the
        // SDK-exported `<lib>_ULong_create_handle_nullable(uint64_t)` box. The Date epoch is
        // already the microsecond count carried by value.
        assertTrue(
            "nullable date must box via ULong_create_handle_nullable(static_cast<uint64_t>(...)), NOT a " +
                "non-exported Date box. Body:\n$impl",
            Regex("library_ULong_create_handle_nullable\\(static_cast<uint64_t>\\(updatedAt\\.value\\(\\)\\)\\)")
                .containsMatchIn(impl),
        )
        assertTrue(
            "the nullable date FFI declaration must reuse the ULong box taking uint64_t. Body:\n$impl",
            impl.contains("FfiOpaqueHandle library_ULong_create_handle_nullable(uint64_t value);"),
        )
        assertTrue(
            "the RN bridge must NOT reference a non-exported Date box symbol. Body:\n$impl",
            !impl.contains("library_Date_create_handle_nullable"),
        )
    }

    @Test
    fun `explicit-ctor make marshals a nullable OBJECT field via registry lookup plus nullable wrapper`() {
        val account = createAccountStruct()
        val impl = bridgeImpl("NativeProfileModule.cpp", account, createProfileStruct(account))
        assertTrue(
            "nullable object must be retrieved from the handle registry then boxed via its " +
                "*_create_handle_nullable. Body:\n$impl",
            impl.contains("FfiHandleRegistry::instance().retrieve(") &&
                impl.contains("library_gluecodium_model_Account_create_handle_nullable("),
        )
        assertTrue(
            "nullable object absent case must default to nullptr guarded by has_value(). Body:\n$impl",
            Regex("FfiOpaqueHandle __ffi_owner_\\d+ = nullptr;").containsMatchIn(impl) &&
                impl.contains("if (owner.has_value())"),
        )
    }

    @Test
    fun `explicit-ctor header types nullable params as std optional`() {
        val account = createAccountStruct()
        val header = bridgeHeader("NativeProfileModule.h", account, createProfileStruct(account))
        assertTrue(
            "nullable params must be std::optional so has_value() is valid. Header:\n$header",
            header.contains("std::optional<jsi::String> label") &&
                header.contains("std::optional<double> updatedAt") &&
                header.contains("std::optional<jsi::String> owner"),
        )
    }

    @Test
    fun `explicit-ctor TS spec types each nullable param as T-or-null`() {
        val account = createAccountStruct()
        val spec = specContent("NativeProfileModule.ts", account, createProfileStruct(account))
        assertTrue(
            "nullable string param must be `string | null` in the spec. Spec:\n$spec",
            Regex("label\\s*:\\s*string\\s*\\|\\s*null").containsMatchIn(spec),
        )
        assertTrue(
            "nullable date param must be `number | null` in the spec. Spec:\n$spec",
            Regex("updatedAt\\s*:\\s*number\\s*\\|\\s*null").containsMatchIn(spec),
        )
        assertTrue(
            "nullable object param must be a handle `string | null` in the spec. Spec:\n$spec",
            Regex("owner\\s*:\\s*string\\s*\\|\\s*null").containsMatchIn(spec),
        )
    }

    // ── Shape 2: SYNTHESIZED make for a struct with NO explicit ctor (TransitWaypoint/Location) ───

    @Test
    fun `synthesized make marshals nullable STRING and DATE fields and validates the non-nullable object`() {
        val account = createAccountStruct()
        val impl = bridgeImpl("NativeWaypointModule.cpp", account, createWaypointStructNoCtor(account))
        // Non-nullable object field: retrieve + null-check (never nullptr into FFI).
        assertTrue(
            "non-nullable object field must be retrieved and null-checked before the FFI call. Body:\n$impl",
            impl.contains("retrieveChecked(__hid_coordinates, \"param 'coordinates'\")"),
        )
        // Nullable string field.
        assertTrue(
            "synthesized make must marshal the nullable string via std-string + String_create_handle_nullable, " +
                "nullptr when absent. Body:\n$impl",
            impl.contains("if (placeName.has_value())") &&
                impl.contains("library_String_create_handle_nullable("),
        )
        // Nullable date field — the exact correctness point from _patch_location_make_timestamped.
        // Boxed via the SDK-exported ULong nullable box (ABI-identical std::optional<uint64_t>*),
        // since no `<lib>_Date_create_handle_nullable` symbol is exported by the SDK.
        assertTrue(
            "synthesized make must box the nullable date via ULong_create_handle_nullable(uint64_t). Body:\n$impl",
            Regex("library_ULong_create_handle_nullable\\(static_cast<uint64_t>\\(time\\.value\\(\\)\\)\\)")
                .containsMatchIn(impl),
        )
        assertTrue(
            "synthesized make must NOT reference a non-exported Date box symbol. Body:\n$impl",
            !impl.contains("library_Date_create_handle_nullable"),
        )
    }

    @Test
    fun `synthesized make must NOT reinterpret_cast a registry handle to a c-string (the patch bug)`() {
        val account = createAccountStruct()
        val impl = bridgeImpl("NativeWaypointModule.cpp", account, createWaypointStructNoCtor(account))
        assertTrue(
            "the generator must call .utf8(rt) on the JSI string, never reinterpret_cast a registry handle " +
                "to const char* (as _patch_transit_waypoint_make does). Body:\n$impl",
            !impl.contains("reinterpret_cast<const char*>"),
        )
    }

    @Test
    fun `synthesized make TS spec types nullable string and date params as T-or-null`() {
        val account = createAccountStruct()
        val spec = specContent("NativeWaypointModule.ts", account, createWaypointStructNoCtor(account))
        assertTrue(
            "nullable string param must be `string | null`. Spec:\n$spec",
            Regex("placeName\\s*:\\s*string\\s*\\|\\s*null").containsMatchIn(spec),
        )
        assertTrue(
            "nullable date param must be `number | null`. Spec:\n$spec",
            Regex("time\\s*:\\s*number\\s*\\|\\s*null").containsMatchIn(spec),
        )
    }

    @Test
    fun `nullable DATE field getter round-trips through the ULong unbox not a non-exported Date box`() {
        val account = createAccountStruct()
        // NativeProfileModule.cpp also emits the field GETTER for the nullable `updatedAt: Date?`.
        // The getter must unbox via the SDK-exported ULong nullable box (get_value_nullable +
        // release_handle_nullable) — the same std::optional<uint64_t>* representation a nullable
        // Date uses — and must NOT call a non-exported `<lib>_Date_get_value_nullable` symbol.
        val impl = bridgeImpl("NativeProfileModule.cpp", account, createProfileStruct(account))
        assertTrue(
            "nullable date getter must call the ULong unbox get_value_nullable. Body:\n$impl",
            impl.contains("library_ULong_get_value_nullable(") &&
                impl.contains("library_ULong_release_handle_nullable("),
        )
        assertTrue(
            "nullable date getter must NOT reference a non-exported Date unbox symbol. Body:\n$impl",
            !impl.contains("library_Date_get_value_nullable") &&
                !impl.contains("library_Date_release_handle_nullable"),
        )
    }

    // ── Shape 3: struct whose ONLY field ctor is @Skip(Java, Swift) (real TransitWaypoint shape) ──

    @Test
    fun `struct with only an excluded field ctor still gets a synthetic make over uninitialized fields`() {
        val account = createAccountStruct()
        val impl = bridgeImpl("NativeLandmarkModule.cpp", account, createLandmarkStructSkippedCtor(account))
        assertTrue(
            "a struct with no EXPOSED ctor must still receive a synthetic make() that constructs the " +
                "handle. Body:\n$impl",
            impl.contains("NativeLandmarkModule::make(") &&
                impl.contains("library_gluecodium_model_Landmark_create_handle("),
        )
        // The non-nullable object field must be retrieved + null-checked, never nullptr into FFI.
        assertTrue(
            "the non-nullable object field must be retrieved and null-checked before the FFI call. Body:\n$impl",
            impl.contains("retrieveChecked(__hid_coordinates, \"param 'coordinates'\")"),
        )
        // The generator must never reinterpret_cast a registry handle to a c-string (the patch bug).
        assertTrue(
            "the generator must not reinterpret_cast a registry handle to const char*. Body:\n$impl",
            !impl.contains("reinterpret_cast<const char*>"),
        )
    }

    @Test
    fun `struct with only an excluded field ctor exposes make in the TS spec`() {
        val account = createAccountStruct()
        val spec = specContent("NativeLandmarkModule.ts", account, createLandmarkStructSkippedCtor(account))
        assertTrue(
            "the synthesized make must appear in the TurboModule spec taking the uninitialized " +
                "`coordinates` handle. Spec:\n$spec",
            Regex("readonly make\\s*:\\s*\\(coordinates\\s*:\\s*string\\)").containsMatchIn(spec),
        )
    }
}
