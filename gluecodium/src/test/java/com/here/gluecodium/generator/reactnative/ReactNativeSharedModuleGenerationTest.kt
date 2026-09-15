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
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimeReturnType
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test

class ReactNativeSharedModuleGenerationTest {
    private val generator = ReactNativeGenerator()

    @Before
    fun setUp() {
        generator.initialize(
            GeneratorOptions(
                cppRootNamespace = listOf("gluecodium", "calculator"),
                libraryName = "library",
            ),
        )
    }

    private fun generateModel(vararg elements: com.here.gluecodium.model.lime.LimeNamedElement) =
        generator.generate(LimeModel(referenceMap = emptyMap(), topElements = elements.toList()))

    private fun createCalculatorClass(): LimeClass =
        LimeClass(
            LimePath(listOf("gluecodium", "calculator"), listOf("Calculator")),
            functions =
                listOf(
                    LimeFunction(
                        LimePath(listOf("gluecodium", "calculator"), listOf("Calculator", "summarize")),
                        parameters =
                            listOf(
                                LimeParameter(
                                    LimePath(
                                        listOf("gluecodium", "calculator"),
                                        listOf("Calculator", "summarize", "first"),
                                    ),
                                    typeRef = LimeBasicTypeRef(TypeId.INT32),
                                ),
                                LimeParameter(
                                    LimePath(
                                        listOf("gluecodium", "calculator"),
                                        listOf("Calculator", "summarize", "second"),
                                    ),
                                    typeRef = LimeBasicTypeRef(TypeId.INT32),
                                ),
                            ),
                        returnType = LimeReturnType(LimeBasicTypeRef(TypeId.INT32)),
                    ),
                    LimeFunction(
                        LimePath(listOf("gluecodium", "calculator"), listOf("Calculator", "max")),
                        parameters =
                            listOf(
                                LimeParameter(
                                    LimePath(
                                        listOf("gluecodium", "calculator"),
                                        listOf("Calculator", "max", "first"),
                                    ),
                                    typeRef = LimeBasicTypeRef(TypeId.INT32, isNullable = true),
                                ),
                                LimeParameter(
                                    LimePath(
                                        listOf("gluecodium", "calculator"),
                                        listOf("Calculator", "max", "second"),
                                    ),
                                    typeRef = LimeBasicTypeRef(TypeId.INT32, isNullable = true),
                                ),
                            ),
                        returnType = LimeReturnType(LimeBasicTypeRef(TypeId.INT32, isNullable = true)),
                    ),
                ),
        )

    @Test
    fun `generates header with correct class declaration`() {
        val files = generateModel(createCalculatorClass())
        val header = files.find { it.targetFile.name == "NativeCalculatorModule.h" }
        assertTrue("Header should be generated", header != null)
        assertTrue(header!!.content.contains("class NativeCalculatorModule"))
    }

    @Test
    fun `header extends NativeXxxModuleCxxSpec`() {
        val files = generateModel(createCalculatorClass())
        val header = files.find { it.targetFile.name == "NativeCalculatorModule.h" }!!
        assertTrue(
            header.content.contains("NativeCalculatorModuleCxxSpec<NativeCalculatorModule>"),
        )
    }

    @Test
    fun `header includes AppSpecsJSI`() {
        val files = generateModel(createCalculatorClass())
        val header = files.find { it.targetFile.name == "NativeCalculatorModule.h" }!!
        assertTrue(header.content.contains("#include <AppSpecsJSI.h>"))
        // No longer includes C++ class header — we use FFI instead
        assertFalse(header.content.contains("Calculator.h"))
    }

    @Test
    fun `header lives in facebook react namespace`() {
        val files = generateModel(createCalculatorClass())
        val header = files.find { it.targetFile.name == "NativeCalculatorModule.h" }!!
        assertTrue(header.content.contains("namespace facebook::react"))
    }

    @Test
    fun `generates method with primitive parameters`() {
        val files = generateModel(createCalculatorClass())
        val header = files.find { it.targetFile.name == "NativeCalculatorModule.h" }!!
        assertTrue(header.content.contains("summarize"))
        assertTrue(header.content.contains("double first"))
        assertTrue(header.content.contains("double second"))
    }

    @Test
    fun `generates method with optional parameters`() {
        val files = generateModel(createCalculatorClass())
        val header = files.find { it.targetFile.name == "NativeCalculatorModule.h" }!!
        assertTrue(header.content.contains("std::optional<double> first"))
    }

    @Test
    fun `generates impl with FFI calls`() {
        val files = generateModel(createCalculatorClass())
        val impl = files.find { it.targetFile.name == "NativeCalculatorModule.cpp" }
        assertTrue("Impl should be generated", impl != null)
        // Should include FFI headers and extern "C" block
        assertTrue(impl!!.content.contains("FfiHandleRegistry.h"))
        assertTrue(impl.content.contains("extern \"C\""))
    }

    @Test
    fun `generates impl method with jsi Runtime parameter`() {
        val files = generateModel(createCalculatorClass())
        val impl = files.find { it.targetFile.name == "NativeCalculatorModule.cpp" }!!
        assertTrue(impl.content.contains("jsi::Runtime& rt"))
    }

    @Test
    fun `generates release method`() {
        val files = generateModel(createCalculatorClass())
        val header = files.find { it.targetFile.name == "NativeCalculatorModule.h" }!!
        assertTrue(header.content.contains("release"))
    }

    @Test
    fun `output files are in react-native directory`() {
        val files = generateModel(createCalculatorClass())
        val header = files.find { it.targetFile.name == "NativeCalculatorModule.h" }!!
        val impl = files.find { it.targetFile.name == "NativeCalculatorModule.cpp" }!!
        assertTrue(header.targetFile.path.contains("react-native/"))
        assertTrue(impl.targetFile.path.contains("react-native/"))
    }

    @Test
    fun `empty model produces only support files`() {
        val files = generator.generate(LimeModel(referenceMap = emptyMap(), topElements = emptyList()))
        // An empty model emits ONLY product-neutral support files (no per-type Native*Module).
        // Assert the invariant, not a brittle exact count that drifts as the runtime grows.
        assertTrue(files.any { it.targetFile.name == "FfiOpaqueHandle.h" })
        assertTrue(files.any { it.targetFile.name == "FfiHandleRegistry.h" })
        assertTrue(files.none { it.targetFile.name.startsWith("Native") })
    }

    @Test
    fun `generates FfiOpaqueHandle support file`() {
        val files = generateModel(createCalculatorClass())
        val handle = files.find { it.targetFile.name == "FfiOpaqueHandle.h" }
        assertTrue("FfiOpaqueHandle.h should be generated", handle != null)
        assertTrue(handle!!.content.contains("typedef void* FfiOpaqueHandle"))
    }

    @Test
    fun `generates FfiHandleRegistry support file`() {
        val files = generateModel(createCalculatorClass())
        val registry = files.find { it.targetFile.name == "FfiHandleRegistry.h" }
        assertTrue("FfiHandleRegistry.h should be generated", registry != null)
        assertTrue(registry!!.content.contains("class FfiHandleRegistry"))
    }

    @Test
    fun `generates iOS provider files`() {
        val files = generateModel(createCalculatorClass())
        val providerH = files.find { it.targetFile.name == "NativeCalculatorModuleProvider.h" }
        val providerMM = files.find { it.targetFile.name == "NativeCalculatorModuleProvider.mm" }
        assertTrue("Provider header should be generated", providerH != null)
        assertTrue("Provider impl should be generated", providerMM != null)
    }
}
