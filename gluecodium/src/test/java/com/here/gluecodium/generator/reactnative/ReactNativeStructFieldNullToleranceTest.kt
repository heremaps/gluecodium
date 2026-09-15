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
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimeStruct
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Golden test for Task 23 / Phase 27.27 follow-up: struct `_fromHandle` must tolerate a NULL native
 * handle on a NON-NULLABLE nested class/struct field instead of hard-failing the WHOLE struct
 * reconstruction.
 *
 * Root cause (confirmed on-device, emulator-5554): HERE's `RouteProgress` struct carries the
 * non-nullable nested class fields `route` and `routeMatchedLocation`. During live navigation the
 * SDK legitimately returns a NULL handle for these on early ticks (before a map-match lock is
 * acquired), even with a mounted MapView. With the null-handle hardening, the eager
 * `Type._fromHandle(nullHandle)` inside the generated struct `_fromHandle` THROWS "FFI returned null
 * handle". Because struct `_fromHandle` reconstructs every field eagerly, that transient-null nested
 * field aborts the entire reconstruction — so the sibling `sectionProgress` field the navigation
 * footer needs (remaining distance + ETA) is never returned. The captured evidence:
 *   [NAVDIAG] tick #1 _fromHandle THREW: FFI returned null handle
 *   [NAVDIAG] tick #2 _fromHandle THREW: FFI returned null handle
 *   [NAVDIAG] tick #3 _fromHandle THREW: FFI returned null handle
 *
 * The fix has TWO layers, both product-neutral:
 *   1. C++ bridge (ReactNativeGenerator.buildFieldGetterBody + the field-getter return-type
 *      override): a NON-NULLABLE class/struct/interface FIELD getter returns `std::optional` +
 *      `std::nullopt` on a null native handle instead of `throw jsi::JSError("FFI returned null
 *      handle")`. This is the ACTUAL throw site — the getter (e.g. NativeRouteProgressModule::getRoute)
 *      threw in native code BEFORE the value ever reached the TS wrapper, so a TS-only guard could
 *      never catch it.
 *   2. TS wrapper (TypeScriptWrapperEmitter.marshalFromNativeForStructField): the non-nullable nested
 *      class/struct field is reconstructed only when its handle is present, and left `undefined`
 *      otherwise — consuming the now-nullable C++ getter.
 * Both layers are scoped to struct FIELD reconstruction only; the method-return path (which keeps its
 * non-null contract, still throwing on null) is untouched.
 *
 * The fixture is product-NEUTRAL (`Progress` with a non-nullable nested class `Trace`, a non-nullable
 * nested struct `Marker`, and a list of `Marker`). It proves the behaviour is not HERE-specific and
 * covers the class, struct, and list cases: the nested class and struct field getters must be
 * null-tolerant, while the list field keeps its existing `?? []` tolerance.
 */
class ReactNativeStructFieldNullToleranceTest {
    private val rootNamespace = listOf("gluecodium", "model")

    private val typeScriptGenerator =
        TypeScriptGenerator().apply {
            initialize(GeneratorOptions(tags = setOf("react-native")))
        }

    private val reactNativeGenerator =
        ReactNativeGenerator().apply {
            initialize(GeneratorOptions(cppRootNamespace = rootNamespace, libraryName = "library"))
        }

    /** A trivial opaque class used as a non-nullable nested class field (the `RouteMatchedLocation` shape). */
    private fun createTraceClass(): LimeClass = LimeClass(LimePath(rootNamespace, listOf("Trace")))

    /** A trivial value struct used as a non-nullable nested struct field and list element. */
    private fun createMarkerStruct(): LimeStruct {
        val id =
            LimeField(
                LimePath(rootNamespace, listOf("Marker", "id")),
                typeRef = LimeBasicTypeRef(TypeId.STRING),
            )
        return LimeStruct(LimePath(rootNamespace, listOf("Marker")), fields = listOf(id))
    }

    /**
     * `Progress` — the `RouteProgress` shape: a list of nested structs (`markers`, always tolerant),
     * a non-nullable nested class field (`trace`, the `routeMatchedLocation` analogue) and a
     * non-nullable nested struct field (`primaryMarker`, the `route`/struct analogue) that the SDK
     * can transiently return null for.
     */
    private fun createProgressStruct(
        trace: LimeClass,
        marker: LimeStruct,
    ): LimeStruct {
        val markers =
            LimeField(
                LimePath(rootNamespace, listOf("Progress", "markers")),
                typeRef = LimeDirectTypeRef(LimeList(LimeDirectTypeRef(marker))),
            )
        val traceField =
            LimeField(
                LimePath(rootNamespace, listOf("Progress", "trace")),
                typeRef = LimeDirectTypeRef(trace),
            )
        val primaryMarker =
            LimeField(
                LimePath(rootNamespace, listOf("Progress", "primaryMarker")),
                typeRef = LimeDirectTypeRef(marker),
            )
        return LimeStruct(
            LimePath(rootNamespace, listOf("Progress")),
            fields = listOf(markers, traceField, primaryMarker),
        )
    }

    private fun progressWrapper(): String {
        val trace = createTraceClass()
        val marker = createMarkerStruct()
        val files =
            typeScriptGenerator.generate(
                LimeModel(
                    referenceMap = emptyMap(),
                    topElements = listOf<LimeNamedElement>(trace, marker, createProgressStruct(trace, marker)),
                ),
            )
        val wrapper = files.find { it.targetFile.path.contains("wrapper/") && it.targetFile.name == "Progress.ts" }
        assertTrue("wrapper class Progress.ts should be generated", wrapper != null)
        return wrapper!!.content
    }

    @Test
    fun `non-nullable nested class field is rebuilt only when its handle is present`() {
        val wrapper = progressWrapper()
        // The class field getter must be bound once and reconstructed null-tolerantly, NOT eagerly
        // via Trace._fromHandle(getTrace(__handle)) which throws on a null handle.
        assertTrue(
            "the non-nullable nested class field must bind the getter to a single raw local " +
                "(no double FFI call). Wrapper:\n$wrapper",
            wrapper.contains("const trace__rawHandle = NativeProgressModule.getTrace(__handle);"),
        )
        assertTrue(
            "the non-nullable nested class field must be rebuilt only when the handle is present and non-empty, " +
                "leaving it undefined otherwise. Wrapper:\n$wrapper",
            wrapper.contains(
                "const trace = ((trace__rawHandle) != null && (trace__rawHandle) !== '' ? " +
                    "Trace._fromHandle((trace__rawHandle)!) : undefined);",
            ),
        )
        assertTrue(
            "the non-nullable nested class field must NOT eagerly reconstruct (the throwing form). Wrapper:\n$wrapper",
            !wrapper.contains("const trace = Trace._fromHandle(NativeProgressModule.getTrace(__handle));"),
        )
    }

    @Test
    fun `non-nullable nested struct field is rebuilt only when its handle is present`() {
        val wrapper = progressWrapper()
        assertTrue(
            "the non-nullable nested struct field must bind the getter to a single raw local. Wrapper:\n$wrapper",
            wrapper.contains("const primaryMarker__rawHandle = NativeProgressModule.getPrimaryMarker(__handle);"),
        )
        assertTrue(
            "the non-nullable nested struct field must be rebuilt only when the handle is present. Wrapper:\n$wrapper",
            wrapper.contains(
                "const primaryMarker = ((primaryMarker__rawHandle) != null && (primaryMarker__rawHandle) !== '' ? " +
                    "Marker._fromHandle((primaryMarker__rawHandle)!) : undefined);",
            ),
        )
    }

    @Test
    fun `nested-struct list field keeps its existing null-tolerant map`() {
        val wrapper = progressWrapper()
        // The list path was already tolerant (?? []); the fix must not disturb it, and it must NOT be
        // rewritten into the single-handle raw-local form (a list getter returns an array).
        assertTrue(
            "the list field must keep the per-element _fromHandle map with a `?? []` fallback. Wrapper:\n$wrapper",
            wrapper.contains(
                "const markers = (NativeProgressModule.getMarkers(__handle) as string[])?.map((h: string) => " +
                    "Marker._fromHandle(h)) ?? [];",
            ),
        )
        assertTrue(
            "the list field must NOT be rewritten into the single-handle raw-local form. Wrapper:\n$wrapper",
            !wrapper.contains("const markers__rawHandle ="),
        )
    }

    // ── C++ bridge layer (the ACTUAL throw site) ───────────────────────────────────────────────

    private fun progressBridgeImpl(): String {
        val trace = createTraceClass()
        val marker = createMarkerStruct()
        val files =
            reactNativeGenerator.generate(
                LimeModel(
                    referenceMap = emptyMap(),
                    topElements = listOf<LimeNamedElement>(trace, marker, createProgressStruct(trace, marker)),
                ),
            )
        val impl = files.find { it.targetFile.name == "NativeProgressModule.cpp" }
        assertTrue("C++ bridge impl NativeProgressModule.cpp should be generated", impl != null)
        return impl!!.content
    }

    private fun progressBridgeHeader(): String {
        val trace = createTraceClass()
        val marker = createMarkerStruct()
        val files =
            reactNativeGenerator.generate(
                LimeModel(
                    referenceMap = emptyMap(),
                    topElements = listOf<LimeNamedElement>(trace, marker, createProgressStruct(trace, marker)),
                ),
            )
        val header = files.find { it.targetFile.name == "NativeProgressModule.h" }
        assertTrue("C++ bridge header NativeProgressModule.h should be generated", header != null)
        return header!!.content
    }

    @Test
    fun `non-nullable class field getter returns empty string on a null handle instead of throwing`() {
        val impl = progressBridgeImpl()
        // The class field getter is the ACTUAL native throw site. It must return an empty jsi::String
        // on a null field handle, never `throw jsi::JSError(rt, "FFI returned null handle")`.
        assertTrue(
            "the non-nullable class field getter must return an empty jsi::String on a null handle. Body:\n$impl",
            impl.contains("if (!__r) return jsi::String::createFromUtf8(rt, \"\");"),
        )
        assertTrue(
            "the non-nullable class/struct field getters must NOT throw \"FFI returned null handle\". Body:\n$impl",
            !impl.contains("if (!__r) throw jsi::JSError(rt, \"FFI returned null handle\");"),
        )
    }

    @Test
    fun `non-nullable class and struct field getters keep the jsi String return type in the header`() {
        val header = progressBridgeHeader()
        // The getter return type MUST stay jsi::String to match the TurboModule spec's `=> string`, so
        // RN Codegen's CxxSpec bridging static_assert (supportsToJs<ReturnT, JSReturnT>) holds. The
        // empty-string sentinel — not std::optional — carries the absence.
        assertTrue(
            "the non-nullable class field getter must stay jsi::String in the header. Header:\n$header",
            Regex("jsi::String\\s+getTrace\\b").containsMatchIn(header),
        )
        assertTrue(
            "the non-nullable struct field getter must stay jsi::String in the header. Header:\n$header",
            Regex("jsi::String\\s+getPrimaryMarker\\b").containsMatchIn(header),
        )
        assertTrue(
            "the non-nullable handle field getters must NOT be widened to std::optional. Header:\n$header",
            !header.contains("std::optional<jsi::String> getTrace") &&
                !header.contains("std::optional<jsi::String> getPrimaryMarker"),
        )
    }
}
