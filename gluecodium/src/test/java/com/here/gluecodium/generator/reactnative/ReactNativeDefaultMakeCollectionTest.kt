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
import com.here.gluecodium.model.lime.LimeBasicType.TypeId
import com.here.gluecodium.model.lime.LimeBasicTypeRef
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeValue
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Golden test for the no-arg synthetic `make()` on a struct whose ONLY constructor is synthesized
 * (no explicit LIME constructor). Root cause (confirmed on-device, emulator-5554): HERE's
 * `EVConsumptionModel` struct carries two NON-NULLABLE `Map<Int,Double>` speed-table fields. The
 * generated no-arg `make()` (routed through the field-constructor machinery →
 * FfiMethodBodyBuilder.fieldDefaultValue) built empty collection handles for non-nullable List/Set
 * fields but fell through to `nullptr` for a non-nullable Map field. The SDK's `create_handle`
 * dereferences the two null map pointers → SIGSEGV (signal 11, fault addr 0x20):
 *   #01 ..._EVConsumptionModel_create_handle+128
 *   #02 NativeEVCarOptionsModule::make(jsi::Runtime&)   <-- the NO-ARG make
 *
 * The fix (product-neutral, FfiMethodBodyBuilder.fieldDefaultValue): a non-nullable Map field is
 * treated exactly like a non-nullable List/Set — an EMPTY collection handle is built via
 * `{lib}_{ffiName}_create_handle()` (temp + released after the enclosing create_handle), never a
 * `nullptr`.
 *
 * The fixture is product-NEUTRAL (`Curve` with a non-nullable `Map<Int,Double>` field, a
 * non-nullable `List<Int>` field, and a plain double field, and NO explicit constructor). It proves
 * the behaviour is not HERE-specific and covers both the map (the fix) and the list (the pre-existing
 * behaviour that must be preserved).
 */
class ReactNativeDefaultMakeCollectionTest {
    private val rootNamespace = listOf("gluecodium", "model")

    private val reactNativeGenerator =
        ReactNativeGenerator().apply {
            initialize(GeneratorOptions(cppRootNamespace = rootNamespace, libraryName = "library"))
        }

    /**
     * `Curve` — the `EVConsumptionModel` shape: a struct with all fields defaulted (no explicit
     * constructor), including a non-nullable `Map<Int,Double>` field (the speed-table analogue), a
     * non-nullable `List<Int>` field, and a plain scalar field.
     */
    private fun createCurveStruct(): LimeStruct {
        val speedTableType =
            LimeDirectTypeRef(LimeMap(LimeBasicTypeRef(TypeId.INT32), LimeBasicTypeRef(TypeId.DOUBLE)))
        val speedTable =
            LimeField(
                LimePath(rootNamespace, listOf("Curve", "speedTable")),
                typeRef = speedTableType,
                // A defaulted collection field (empty-map default) is what makes make() no-arg.
                defaultValue = LimeValue.InitializerList(speedTableType, emptyList()),
            )
        val samplesType = LimeDirectTypeRef(LimeList(LimeBasicTypeRef(TypeId.INT32)))
        val samples =
            LimeField(
                LimePath(rootNamespace, listOf("Curve", "samples")),
                typeRef = samplesType,
                defaultValue = LimeValue.InitializerList(samplesType, emptyList()),
            )
        val ratioType = LimeBasicTypeRef(TypeId.DOUBLE)
        val ratio =
            LimeField(
                LimePath(rootNamespace, listOf("Curve", "ratio")),
                typeRef = ratioType,
                defaultValue = LimeValue.Literal(ratioType, "0.0"),
            )
        return LimeStruct(
            LimePath(rootNamespace, listOf("Curve")),
            fields = listOf(speedTable, samples, ratio),
        )
    }

    private fun curveBridgeImpl(): String {
        val files =
            reactNativeGenerator.generate(
                LimeModel(
                    referenceMap = emptyMap(),
                    topElements = listOf<LimeNamedElement>(createCurveStruct()),
                ),
            )
        val impl = files.find { it.targetFile.name == "NativeCurveModule.cpp" }
        assertTrue("C++ bridge impl NativeCurveModule.cpp should be generated", impl != null)
        return impl!!.content
    }

    /** The body of the synthetic no-arg `make()` — the ONLY place the field-default logic is emitted. */
    private fun curveMakeBody(): String {
        val impl = curveBridgeImpl()
        val body = Regex("jsi::String NativeCurveModule::make\\([\\s\\S]*?\\n\\}").find(impl)?.value
        assertTrue("the no-arg make() body must be present in NativeCurveModule.cpp:\n$impl", body != null)
        return body!!
    }

    /** The single FFI create_handle CALL inside the no-arg make() body (excludes the extern decl). */
    private fun curveCreateHandleCallArgs(): String {
        val body = curveMakeBody()
        val call = Regex("__handle = library_gluecodium_model_Curve_create_handle\\(([^;]*)\\);").find(body)
        assertTrue("the Curve create_handle call must be emitted in make(). Body:\n$body", call != null)
        return call!!.groupValues[1]
    }

    @Test
    fun `no-arg make builds an empty map handle for a non-nullable map field`() {
        val body = curveMakeBody()
        assertTrue(
            "the no-arg make() must build an EMPTY map handle for the non-nullable map field. Body:\n$body",
            body.contains("library_MapOf_Int_to_Double_create_handle()"),
        )
        assertTrue(
            "the no-arg make() must release the temporary map handle after create_handle. Body:\n$body",
            body.contains("library_MapOf_Int_to_Double_release_handle("),
        )
    }

    @Test
    fun `no-arg make does not pass nullptr for a non-nullable map field`() {
        // The Curve create_handle takes (map, list, double). Before the fix the map arg was `nullptr`
        // and the list arg an empty-list temp. After the fix BOTH collection args are empty-collection
        // temps, so the create_handle CALL must carry NO bare `nullptr` argument.
        val args = curveCreateHandleCallArgs()
        assertTrue(
            "the no-arg make() must NOT pass nullptr for any field (the map field must be an empty " +
                "handle, not nullptr). create_handle args were: <$args>",
            !args.contains("nullptr"),
        )
    }

    @Test
    fun `no-arg make still builds an empty list handle for a non-nullable list field`() {
        val body = curveMakeBody()
        // The pre-existing List behaviour must be preserved by the fix.
        assertTrue(
            "the no-arg make() must build an EMPTY list handle for the non-nullable list field. Body:\n$body",
            body.contains("library_ListOf_Int_create_handle()"),
        )
    }
}
