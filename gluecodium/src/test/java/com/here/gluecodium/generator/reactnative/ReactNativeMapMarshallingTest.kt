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
import com.here.gluecodium.model.lime.LimeBasicType.TypeId
import com.here.gluecodium.model.lime.LimeBasicTypeRef
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimeReturnType
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeTypeRef
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Golden tests for Phase 27.23 (spec task 15.3): `Map<K,V>` marshalling across all three RN emission
 * layers — C++ JSI bridge, TurboModule TypeScript spec, and idiomatic TypeScript wrapper.
 *
 * Before this change the generator treated `Map<K,V>` as an unimplemented stub: the C++ bridge param
 * marshaller emitted `// TODO: map marshalling` + `nullptr`, the JSI type mapper mapped a map to
 * `jsi::String`, the TurboModule spec typed it as `string`, and the wrapper widened it to `any` /
 * never reconstructed a `Map`. That gap is exactly what makes EV routing crash: HERE's
 * `EVConsumptionModel` freeFlow/traffic speed tables are `Map<Double,Double>` and, with no map
 * marshalling, they arrive empty and the EV router null-derefs (see the EV SIGSEGV pitfall in
 * AGENTS.md and the `xit` in refapp `transport_modes.test.ts`).
 *
 * The SDK exports a full generic-map FFI (FfiGenericTypesHeader.mustache), the by-value primitive ABI
 * mirror of List/Set plus a key alongside each value:
 *   <lib>_MapOf_K_to_V_create_handle / _put(handle, K, V) / _release_handle
 *   <lib>_MapOf_K_to_V_iterator / _iterator_is_valid / _iterator_increment / _iterator_release_handle
 *   <lib>_MapOf_K_to_V_iterator_get_key : K   /   _iterator_get_value : V
 * For a non-complex, non-enum key/value (e.g. Double) K/V are the C type BY VALUE (`double`), NOT a
 * boxed handle — this is the exact ABI the pre-built SDK binaries expose.
 *
 * A map crosses the TurboModule boundary as an array of `[key, value]` tuples (jsi::Array of
 * 2-element arrays): JS `Map` serializes to it via `[...map]`, it is RN-Codegen-safe (unlike an
 * object with numeric keys), and it preserves ordering and non-string keys. The idiomatic wrapper
 * re-exposes a real `Map<K,V>` and converts on the edge.
 *
 * The `Map<Double,Double>` fixture is product-NEUTRAL: no HERE identifiers. It mirrors the
 * `EVConsumptionModel` speed-table shape without naming it.
 *
 * Validates: Requirements 7.1, 7.3 (design §1.6 collection marshalling; PLAN 27.23 Map<K,V>).
 */
class ReactNativeMapMarshallingTest {
    private val rootNamespace = listOf("gluecodium", "model")

    private val reactNativeGenerator =
        ReactNativeGenerator().apply {
            initialize(GeneratorOptions(cppRootNamespace = rootNamespace, libraryName = "library"))
        }

    private val typeScriptGenerator =
        TypeScriptGenerator().apply {
            initialize(GeneratorOptions(tags = setOf("react-native")))
        }

    private fun doubleToDoubleMapRef(): LimeTypeRef =
        LimeDirectTypeRef(
            LimeMap(
                keyType = LimeBasicTypeRef(TypeId.DOUBLE),
                valueType = LimeBasicTypeRef(TypeId.DOUBLE),
            ),
        )

    /**
     * `SpeedTable` — a class with:
     *   - `setConsumption(table: Map<Double,Double>): void`  (map PARAM direction), and
     *   - `getConsumption(): Map<Double,Double>`             (map RETURN direction).
     * Product-neutral analogue of the EV consumption-model speed table.
     */
    private fun createSpeedTableClass(): LimeClass {
        val setter =
            LimeFunction(
                LimePath(rootNamespace, listOf("SpeedTable", "setConsumption")),
                parameters =
                    listOf(
                        LimeParameter(
                            LimePath(rootNamespace, listOf("SpeedTable", "setConsumption", "table")),
                            typeRef = doubleToDoubleMapRef(),
                        ),
                    ),
                returnType = LimeReturnType(LimeBasicTypeRef(TypeId.VOID)),
            )
        val getter =
            LimeFunction(
                LimePath(rootNamespace, listOf("SpeedTable", "getConsumption")),
                returnType = LimeReturnType(doubleToDoubleMapRef()),
            )
        return LimeClass(
            LimePath(rootNamespace, listOf("SpeedTable")),
            functions = listOf(setter, getter),
        )
    }

    private fun bridgeImpl(vararg elements: LimeNamedElement): String {
        val files = reactNativeGenerator.generate(LimeModel(referenceMap = emptyMap(), topElements = elements.toList()))
        val impl = files.find { it.targetFile.name == "NativeSpeedTableModule.cpp" }
        assertTrue("C++ bridge impl should be generated", impl != null)
        return impl!!.content
    }

    private fun specContent(vararg elements: LimeNamedElement): String {
        val files = typeScriptGenerator.generate(LimeModel(referenceMap = emptyMap(), topElements = elements.toList()))
        val spec = files.find { it.targetFile.name == "NativeSpeedTableModule.ts" }
        assertTrue("TurboModule spec should be generated", spec != null)
        return spec!!.content
    }

    private fun wrapperContent(vararg elements: LimeNamedElement): String {
        val files = typeScriptGenerator.generate(LimeModel(referenceMap = emptyMap(), topElements = elements.toList()))
        val wrapper = files.find { it.targetFile.path.contains("wrapper/") && it.targetFile.name == "SpeedTable.ts" }
        assertTrue("wrapper class SpeedTable.ts should be generated", wrapper != null)
        return wrapper!!.content
    }

    // ── C++ bridge (JSI ↔ FFI) ───────────────────────────────────────────────────────────────────

    @Test
    fun `bridge marshals a map PARAM by building the FFI map and putting each by-value entry`() {
        val impl = bridgeImpl(createSpeedTableClass())
        assertTrue(
            "must create the FFI map handle. Body:\n$impl",
            impl.contains("library_MapOf_Double_to_Double_create_handle()"),
        )
        assertTrue(
            "put must be declared with by-value double key and value (SDK generic-types ABI), NOT boxed. Body:\n$impl",
            impl.contains("void library_MapOf_Double_to_Double_put(FfiOpaqueHandle handle, double key, double value);"),
        )
        assertTrue(
            "must iterate the JS [key,value] tuple array and put each entry by value. Body:\n$impl",
            impl.contains(".asObject(rt).asArray(rt)") &&
                Regex("library_MapOf_Double_to_Double_put\\(__ffi_[a-zA-Z0-9_]+, __k\\.asNumber\\(\\), __v\\.asNumber\\(\\)\\)")
                    .containsMatchIn(impl),
        )
        assertTrue(
            "the map param must NOT be the old nullptr stub. Body:\n$impl",
            !impl.contains("// TODO: map marshalling"),
        )
    }

    @Test
    fun `bridge marshals a map RETURN by iterating entries into an array of key-value tuples`() {
        val impl = bridgeImpl(createSpeedTableClass())
        assertTrue(
            "return path must declare by-value get_key/get_value returning double. Body:\n$impl",
            impl.contains("double library_MapOf_Double_to_Double_iterator_get_key(FfiOpaqueHandle iterHandle);") &&
                impl.contains("double library_MapOf_Double_to_Double_iterator_get_value(FfiOpaqueHandle iterHandle);"),
        )
        assertTrue(
            "return path must build 2-element [key,value] tuples into a jsi::Array. Body:\n$impl",
            impl.contains("library_MapOf_Double_to_Double_iterator(") &&
                impl.contains("library_MapOf_Double_to_Double_iterator_is_valid(") &&
                impl.contains("jsi::Array(rt, 2)") &&
                impl.contains("__tuple.setValueAtIndex(rt, 0,") &&
                impl.contains("__tuple.setValueAtIndex(rt, 1,"),
        )
        assertTrue(
            "return path must release the iterator and the map handle. Body:\n$impl",
            impl.contains("library_MapOf_Double_to_Double_iterator_release_handle(") &&
                impl.contains("library_MapOf_Double_to_Double_release_handle("),
        )
    }

    // ── TurboModule TypeScript spec ───────────────────────────────────────────────────────────────

    @Test
    fun `spec types a map as a ReadonlyArray of key-value tuples`() {
        val spec = specContent(createSpeedTableClass())
        assertTrue(
            "map param must be a ReadonlyArray<[number, number]> in the spec. Spec:\n$spec",
            Regex("table\\s*:\\s*ReadonlyArray<\\[number,\\s*number\\]>").containsMatchIn(spec),
        )
        assertTrue(
            "map return must be a ReadonlyArray<[number, number]> in the spec. Spec:\n$spec",
            Regex("getConsumption\\s*:\\s*\\([^)]*\\)\\s*=>\\s*ReadonlyArray<\\[number,\\s*number\\]>")
                .containsMatchIn(spec),
        )
    }

    // ── Idiomatic TypeScript wrapper ──────────────────────────────────────────────────────────────

    @Test
    fun `wrapper exposes a real Map and converts to and from the tuple array`() {
        val wrapper = wrapperContent(createSpeedTableClass())
        assertTrue(
            "wrapper setter must accept a real Map<number, number>. Wrapper:\n$wrapper",
            Regex("setConsumption\\(table:\\s*Map<number,\\s*number>\\)").containsMatchIn(wrapper),
        )
        assertTrue(
            "wrapper getter must return a real Map<number, number>. Wrapper:\n$wrapper",
            Regex("getConsumption\\(\\):\\s*Map<number,\\s*number>").containsMatchIn(wrapper),
        )
        assertTrue(
            "wrapper must serialize the Map to the tuple array with spread. Wrapper:\n$wrapper",
            wrapper.contains("[...(table ?? new Map())]"),
        )
        assertTrue(
            "wrapper must reconstruct a real Map from the returned tuple array. Wrapper:\n$wrapper",
            wrapper.contains("new Map("),
        )
        assertTrue(
            "wrapper must NOT widen the map to any. Wrapper:\n$wrapper",
            !Regex("getConsumption\\(\\):\\s*any").containsMatchIn(wrapper),
        )
    }

    // ── Struct FIELD getter (the EVConsumptionModel speed-table shape) ────────────────────────────
    //
    // A map that is a STRUCT FIELD goes through a different emitter path (ReactNativeGenerator field
    // getter) than a method return (FfiMethodBodyBuilder). It is the path EVConsumptionModel's
    // freeFlowSpeedTable/trafficSpeedTable actually use, so it must ALSO iterate the map into a
    // tuple array using the by-value get_key/get_value ABI — not return an opaque handle string.

    /** `Consumption` — a struct with a `Map<Double,Double>` field (EVConsumptionModel speed-table shape). */
    private fun createConsumptionStruct(): LimeStruct {
        val table =
            LimeField(
                LimePath(rootNamespace, listOf("Consumption", "speedTable")),
                typeRef = doubleToDoubleMapRef(),
            )
        return LimeStruct(LimePath(rootNamespace, listOf("Consumption")), fields = listOf(table))
    }

    @Test
    fun `struct field getter iterates a map into a tuple array using by-value get_key and get_value`() {
        val files =
            reactNativeGenerator.generate(
                LimeModel(referenceMap = emptyMap(), topElements = listOf(createConsumptionStruct())),
            )
        val impl = files.find { it.targetFile.name == "NativeConsumptionModule.cpp" }
        assertTrue("Consumption bridge should be generated", impl != null)
        val body = impl!!.content
        assertTrue(
            "field getter must declare by-value double get_key/get_value. Body:\n$body",
            body.contains("double library_MapOf_Double_to_Double_iterator_get_key(FfiOpaqueHandle iterHandle);") &&
                body.contains("double library_MapOf_Double_to_Double_iterator_get_value(FfiOpaqueHandle iterHandle);"),
        )
        assertTrue(
            "field getter must build [key,value] tuples into a jsi::Array, NOT store an opaque handle. Body:\n$body",
            body.contains("jsi::Array(rt, 2)") &&
                body.contains("__tuple.setValueAtIndex(rt, 0,") &&
                body.contains("__mapEntries.push_back("),
        )
    }

    @Test
    fun `struct field getter types the map field as Map in the wrapper`() {
        val files =
            typeScriptGenerator.generate(
                LimeModel(referenceMap = emptyMap(), topElements = listOf(createConsumptionStruct())),
            )
        val wrapper = files.find { it.targetFile.path.contains("wrapper/") && it.targetFile.name == "Consumption.ts" }
        assertTrue("Consumption wrapper should be generated", wrapper != null)
        val body = wrapper!!.content
        assertTrue(
            "the map field must be typed Map<number, number>, not any. Wrapper:\n$body",
            body.contains("Map<number, number>") && !body.contains("speedTable: any"),
        )
        assertTrue(
            "the field getter must reconstruct a real Map from the tuple array. Wrapper:\n$body",
            body.contains("new Map("),
        )
    }

    // ── Import-dependency collection for Map<K,V> key/value types (spec task 34) ──────────────────
    //
    // A wrapper file that uses a complex (class/struct) type only in a `Map<K,V>` key OR value
    // position calls `K._fromHandle(...)` / `V._fromHandle(...)` in its emitted body, so it MUST
    // `import { K }` / `import { V }`. Before this fix, `collectTypeDeps` recursed into `LimeList`
    // element types but had NO `LimeMap` branch, so map key/value types were dropped from the import
    // set — the emitted wrapper named the type without importing it (a dangling `TS2304` reference
    // that the `scripts/repair_dangling_wrapper_refs.py` sync-step was papering over for surviving
    // types such as `SDKOptions`' `Map<EngineBaseURL, EngineOptions>` and `MapArrow`'s
    // `Map<MapMeasure, number>`). The generator must emit the imports itself; the repair step should
    // only ever have to stub types whose module was pruned against the pre-built binary.
    //
    // Fixture is product-NEUTRAL: a `Registry` class with a `Map<KeyType, ValueType>` field where
    // both sides are LIME classes.

    private fun createRegistryClassWithComplexMap(): List<LimeNamedElement> {
        val keyClass = LimeClass(LimePath(rootNamespace, listOf("KeyType")))
        val valueClass = LimeClass(LimePath(rootNamespace, listOf("ValueType")))
        val complexMapRef =
            LimeDirectTypeRef(
                LimeMap(
                    keyType = LimeDirectTypeRef(keyClass),
                    valueType = LimeDirectTypeRef(valueClass),
                ),
            )
        val getter =
            LimeFunction(
                LimePath(rootNamespace, listOf("Registry", "getEntries")),
                returnType = LimeReturnType(complexMapRef),
            )
        val registry = LimeClass(LimePath(rootNamespace, listOf("Registry")), functions = listOf(getter))
        return listOf(registry, keyClass, valueClass)
    }

    @Test
    fun `wrapper imports both the key and value types of a complex Map`() {
        val elements = createRegistryClassWithComplexMap()
        val files =
            typeScriptGenerator.generate(
                LimeModel(referenceMap = emptyMap(), topElements = elements),
            )
        val wrapper = files.find { it.targetFile.path.contains("wrapper/") && it.targetFile.name == "Registry.ts" }
        assertTrue("Registry wrapper should be generated", wrapper != null)
        val body = wrapper!!.content
        assertTrue(
            "wrapper must import the Map KEY type. Wrapper:\n$body",
            body.contains("import { KeyType } from './KeyType';"),
        )
        assertTrue(
            "wrapper must import the Map VALUE type. Wrapper:\n$body",
            body.contains("import { ValueType } from './ValueType';"),
        )
    }
}
