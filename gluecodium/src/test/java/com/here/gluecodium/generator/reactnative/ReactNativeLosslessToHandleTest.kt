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
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeValue
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Golden test for the lossless `_toHandle()` serialization gap (spec task 15.4 / PLAN 27.14).
 *
 * A struct whose fields are ALL defaulted AND that declares NO explicit constructor previously got a
 * no-argument synthetic native `make()` (its `uninitializedFields` set is empty), and the wrapper's
 * `_toHandle()` called that field-dropping `make()`. A fully-populated JS instance therefore crossed
 * the FFI as an EMPTY native handle: every scalar zeroed, every map `nullptr`. That is precisely the
 * EV consumption-model / EV-options shape (all fields defaulted, `Map<K,V>` speed tables) that made
 * the native EV router null-deref (see the EV SIGSEGV pitfall in AGENTS.md and the `xit`s in refapp
 * `transport_modes.test.ts` / `map_marshalling.test.ts`).
 *
 * The fix: any struct that serializes a real instance MUST marshal its ACTUAL fields through a
 * field-carrying native factory (`makeFull(...allFields)`) — numbers by value, nullable fields boxed,
 * and `Map<K,V>` fields via the 27.23 tuple-array map path (`[...(map ?? new Map())]`). The no-arg
 * `make()` stays only for `fromDefaults()` (SDK defaults).
 *
 * The `AllDefaulted` fixture is product-NEUTRAL — no HERE identifiers — but mirrors the failing shape:
 * scalar defaulted fields, a nullable field, and a `Map<Int,Double>` field, with NO explicit ctor.
 *
 * Validates: Requirements 7.1, 7.3 (design §1.5 lossless wrapper construction; PLAN 27.14).
 */
class ReactNativeLosslessToHandleTest {
    private val rootNamespace = listOf("gluecodium", "model")

    private val typeScriptGenerator =
        TypeScriptGenerator().apply {
            initialize(GeneratorOptions(tags = setOf("react-native")))
        }

    private val reactNativeGenerator =
        ReactNativeGenerator().apply {
            initialize(GeneratorOptions(cppRootNamespace = rootNamespace, libraryName = "library"))
        }

    private fun intToDoubleMapRef() = LimeDirectTypeRef(LimeMap(LimeBasicTypeRef(TypeId.INT32), LimeBasicTypeRef(TypeId.DOUBLE)))

    /**
     * `AllDefaulted` — every field carries a LIME default and there is NO explicit constructor, so
     * `uninitializedFields` is empty and the synthetic native factory is zero-argument. It has:
     *   - two defaulted scalar Doubles (`ascent`, `auxiliary`),
     *   - a defaulted `Map<Int,Double>` field (`speedTable`), the EV speed-table shape, and
     *   - a nullable string field (`note`) to exercise the boxed-optional path.
     */
    private fun createAllDefaultedStruct(): LimeStruct {
        val ascent =
            LimeField(
                LimePath(rootNamespace, listOf("AllDefaulted", "ascent")),
                typeRef = LimeBasicTypeRef(TypeId.DOUBLE),
                defaultValue = LimeValue.Literal(LimeBasicTypeRef(TypeId.DOUBLE), "0.0"),
            )
        val speedTable =
            LimeField(
                LimePath(rootNamespace, listOf("AllDefaulted", "speedTable")),
                typeRef = intToDoubleMapRef(),
                defaultValue = LimeValue.Literal(intToDoubleMapRef(), "[]"),
            )
        val auxiliary =
            LimeField(
                LimePath(rootNamespace, listOf("AllDefaulted", "auxiliary")),
                typeRef = LimeBasicTypeRef(TypeId.DOUBLE),
                defaultValue = LimeValue.Literal(LimeBasicTypeRef(TypeId.DOUBLE), "0.0"),
            )
        val note =
            LimeField(
                LimePath(rootNamespace, listOf("AllDefaulted", "note")),
                typeRef = LimeBasicTypeRef(TypeId.STRING, isNullable = true),
                defaultValue = LimeValue.Null(LimeBasicTypeRef(TypeId.STRING, isNullable = true)),
            )
        return LimeStruct(
            LimePath(rootNamespace, listOf("AllDefaulted")),
            fields = listOf(ascent, speedTable, auxiliary, note),
        )
    }

    private fun wrapperContent(vararg elements: LimeNamedElement): String {
        val files = typeScriptGenerator.generate(LimeModel(referenceMap = emptyMap(), topElements = elements.toList()))
        val wrapper = files.find { it.targetFile.path.contains("wrapper/") && it.targetFile.name == "AllDefaulted.ts" }
        assertTrue("wrapper class AllDefaulted.ts should be generated", wrapper != null)
        return wrapper!!.content
    }

    private fun specContent(vararg elements: LimeNamedElement): String {
        val files = typeScriptGenerator.generate(LimeModel(referenceMap = emptyMap(), topElements = elements.toList()))
        val spec = files.find { it.targetFile.name == "NativeAllDefaultedModule.ts" }
        assertTrue("TurboModule spec should be generated", spec != null)
        return spec!!.content
    }

    private fun bridgeImpl(vararg elements: LimeNamedElement): String {
        val files = reactNativeGenerator.generate(LimeModel(referenceMap = emptyMap(), topElements = elements.toList()))
        val impl = files.find { it.targetFile.name == "NativeAllDefaultedModule.cpp" }
        assertTrue("C++ bridge impl should be generated", impl != null)
        return impl!!.content
    }

    @Test
    fun `wrapper _toHandle serializes every actual field through a field-carrying factory not the no-arg make`() {
        val wrapper = wrapperContent(createAllDefaultedStruct())
        val toHandleBody =
            Regex("_toHandle\\(\\)\\s*:\\s*string\\s*\\{[\\s\\S]*?\\n  \\}").find(wrapper)?.value ?: ""
        assertTrue("_toHandle must exist. Wrapper:\n$wrapper", toHandleBody.isNotEmpty())
        assertTrue(
            "_toHandle must NOT call the field-dropping no-arg make(). Body:\n$toHandleBody",
            !Regex("\\.make\\(\\s*\\)").containsMatchIn(toHandleBody),
        )
        assertTrue(
            "_toHandle must marshal every scalar field (ascent, auxiliary). Body:\n$toHandleBody",
            toHandleBody.contains("this.ascent") && toHandleBody.contains("this.auxiliary"),
        )
        assertTrue(
            "_toHandle must marshal the Map<K,V> field via the 27.23 tuple-array path. Body:\n$toHandleBody",
            toHandleBody.contains("[...(this.speedTable ?? new Map())]"),
        )
        assertTrue(
            "_toHandle must marshal the nullable field (note). Body:\n$toHandleBody",
            toHandleBody.contains("this.note"),
        )
    }

    @Test
    fun `wrapper still emits a zero-arg fromDefaults delegating to the no-arg native make`() {
        val wrapper = wrapperContent(createAllDefaultedStruct())
        assertTrue(
            "fromDefaults() must still be emitted for SDK defaults. Wrapper:\n$wrapper",
            Regex("static\\s+fromDefaults\\s*\\(\\s*\\)\\s*:\\s*AllDefaulted").containsMatchIn(wrapper),
        )
        assertTrue(
            "fromDefaults() must delegate to the zero-arg native make(). Wrapper:\n$wrapper",
            Regex("fromDefaults[\\s\\S]*?_fromHandle\\(\\s*\\w+\\.make\\(\\s*\\)\\s*\\)").containsMatchIn(wrapper),
        )
    }

    @Test
    fun `spec declares a field-carrying makeFull factory alongside the zero-arg make`() {
        val spec = specContent(createAllDefaultedStruct())
        assertTrue(
            "spec must keep the zero-arg make(). Spec:\n$spec",
            Regex("readonly\\s+make\\s*:\\s*\\(\\s*\\)\\s*=>\\s*string").containsMatchIn(spec),
        )
        assertTrue(
            "spec must declare a field-carrying makeFull(...) returning a handle. Spec:\n$spec",
            Regex("readonly\\s+makeFull\\s*:").containsMatchIn(spec),
        )
    }

    @Test
    fun `bridge emits a field-carrying create_handle call with real args not all zeros and nullptr`() {
        val impl = bridgeImpl(createAllDefaultedStruct())
        assertTrue(
            "bridge must still emit the no-arg make() calling create_handle with defaults. Body:\n$impl",
            impl.contains("create_handle(0.0, nullptr, 0.0, nullptr)") ||
                impl.contains("create_handle("),
        )
        val makeFullBody =
            Regex("NativeAllDefaultedModule::makeFull\\([\\s\\S]*?\\n\\}").find(impl)?.value ?: ""
        assertTrue(
            "bridge must emit a makeFull(...) implementation. Impl:\n$impl",
            makeFullBody.isNotEmpty(),
        )
        assertTrue(
            "makeFull must build the FFI map from the tuple array (not pass nullptr for the map). Body:\n$makeFullBody",
            makeFullBody.contains("library_MapOf_Int32_to_Double_create_handle()") ||
                makeFullBody.contains("_create_handle()") && makeFullBody.contains("_put("),
        )
    }
}
