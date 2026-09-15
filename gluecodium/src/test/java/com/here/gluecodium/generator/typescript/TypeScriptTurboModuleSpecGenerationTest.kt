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

package com.here.gluecodium.generator.typescript

import com.here.gluecodium.generator.common.GeneratorOptions
import com.here.gluecodium.model.lime.LimeBasicType.TypeId
import com.here.gluecodium.model.lime.LimeBasicTypeRef
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeEnumerator
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeLambdaParameter
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimeReturnType
import com.here.gluecodium.model.lime.LimeStruct
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test

class TypeScriptTurboModuleSpecGenerationTest {
    private val generator = TypeScriptGenerator()

    @Before
    fun setUp() {
        generator.initialize(GeneratorOptions(tags = setOf("react-native")))
    }

    private fun generateModel(vararg elements: com.here.gluecodium.model.lime.LimeNamedElement) =
        generator.generate(LimeModel(referenceMap = emptyMap(), topElements = elements.toList()))

    private fun createCalculatorClass(): LimeClass {
        val enumeration =
            LimeEnumeration(
                LimePath(listOf("gluecodium", "calculator"), listOf("Calculator", "CalculatorError")),
                enumerators =
                    listOf(
                        LimeEnumerator(
                            LimePath(
                                listOf("gluecodium", "calculator"),
                                listOf("Calculator", "CalculatorError", "RESULT_OUT_OF_BOUNDS"),
                            ),
                        ),
                    ),
            )
        return LimeClass(
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
            enumerations = listOf(enumeration),
        )
    }

    @Test
    fun `generates TurboModule spec for class with primitive methods`() {
        val files = generateModel(createCalculatorClass())
        val specFile = files.find { it.targetFile.name == "NativeCalculatorModule.ts" }
        assertTrue("TurboModule spec should be generated", specFile != null)
        assertTrue(specFile!!.content.contains("readonly summarize"))
    }

    @Test
    fun `TurboModule spec uses NativeXxxModule naming convention`() {
        val files = generateModel(createCalculatorClass())
        val specFile = files.find { it.targetFile.name == "NativeCalculatorModule.ts" }!!
        assertTrue(specFile.content.contains("NativeCalculatorModule"))
    }

    @Test
    fun `TurboModule spec uses import type for TurboModule`() {
        val files = generateModel(createCalculatorClass())
        val specFile = files.find { it.targetFile.name == "NativeCalculatorModule.ts" }!!
        assertTrue(specFile.content.contains("import type {TurboModule} from 'react-native'"))
    }

    @Test
    fun `TurboModule spec exports default with getEnforcing`() {
        val files = generateModel(createCalculatorClass())
        val specFile = files.find { it.targetFile.name == "NativeCalculatorModule.ts" }!!
        assertTrue(specFile.content.contains("TurboModuleRegistry.getEnforcing<Spec>('NativeCalculatorModule')"))
    }

    @Test
    fun `TurboModule spec uses readonly arrow function syntax`() {
        val files = generateModel(createCalculatorClass())
        val specFile = files.find { it.targetFile.name == "NativeCalculatorModule.ts" }!!
        assertTrue(
            "Should use readonly arrow syntax",
            specFile.content.contains("readonly summarize: ("),
        )
        assertTrue(
            "Should use => for return type",
            specFile.content.contains(") => number;"),
        )
    }

    @Test
    fun `TurboModule spec with nullable parameters uses null not undefined`() {
        val files = generateModel(createCalculatorClass())
        val specFile = files.find { it.targetFile.name == "NativeCalculatorModule.ts" }!!
        assertTrue(specFile.content.contains("number | null"))
        assertFalse(specFile.content.contains("undefined"))
    }

    @Test
    fun `TurboModule spec not generated without react-native tag`() {
        val generatorNoTag = TypeScriptGenerator()
        generatorNoTag.initialize(GeneratorOptions(tags = emptySet()))
        val files =
            generatorNoTag.generate(
                LimeModel(referenceMap = emptyMap(), topElements = listOf(createCalculatorClass())),
            )
        val specFile = files.find { it.targetFile.name == "NativeCalculatorModule.ts" }
        assertTrue("Spec should NOT be generated without tag", specFile == null)
    }

    @Test
    fun `TurboModule spec with struct parameter as string handle`() {
        val struct =
            LimeStruct(
                LimePath(listOf("gluecodium", "calculator"), listOf("Calculator", "DivideArguments")),
                fields =
                    listOf(
                        LimeField(
                            LimePath(
                                listOf("gluecodium", "calculator"),
                                listOf("Calculator", "DivideArguments", "dividend"),
                            ),
                            typeRef = LimeBasicTypeRef(TypeId.INT32),
                        ),
                        LimeField(
                            LimePath(
                                listOf("gluecodium", "calculator"),
                                listOf("Calculator", "DivideArguments", "divider"),
                            ),
                            typeRef = LimeBasicTypeRef(TypeId.INT32),
                        ),
                    ),
            )
        val limeClass =
            LimeClass(
                LimePath(listOf("gluecodium", "calculator"), listOf("Calculator")),
                structs = listOf(struct),
                functions =
                    listOf(
                        LimeFunction(
                            LimePath(listOf("gluecodium", "calculator"), listOf("Calculator", "divide")),
                            parameters =
                                listOf(
                                    LimeParameter(
                                        LimePath(
                                            listOf("gluecodium", "calculator"),
                                            listOf("Calculator", "divide", "divideArguments"),
                                        ),
                                        typeRef = LimeDirectTypeRef(struct),
                                    ),
                                ),
                            returnType = LimeReturnType(LimeBasicTypeRef(TypeId.DOUBLE)),
                        ),
                    ),
            )
        val files = generateModel(limeClass)
        val specFile = files.find { it.targetFile.name == "NativeCalculatorModule.ts" }!!
        assertTrue(
            "Struct param should be string (opaque handle) in FFI approach",
            specFile.content.contains("divideArguments: string"),
        )
    }

    @Test
    fun `TurboModule spec with lambda callback as inline function`() {
        val lambda =
            LimeLambda(
                LimePath(listOf("gluecodium", "calculator"), listOf("Calculator", "SubtructCallback")),
                parameters =
                    listOf(
                        LimeLambdaParameter(
                            LimeBasicTypeRef(TypeId.INT32, isNullable = true),
                            LimePath(
                                listOf("gluecodium", "calculator"),
                                listOf("Calculator", "SubtructCallback", "call", "p0"),
                            ),
                        ),
                        LimeLambdaParameter(
                            LimeBasicTypeRef(TypeId.INT32, isNullable = true),
                            LimePath(
                                listOf("gluecodium", "calculator"),
                                listOf("Calculator", "SubtructCallback", "call", "p1"),
                            ),
                        ),
                    ),
                returnType = LimeReturnType(LimeBasicTypeRef(TypeId.VOID)),
            )
        val limeClass =
            LimeClass(
                LimePath(listOf("gluecodium", "calculator"), listOf("Calculator")),
                lambdas = listOf(lambda),
                functions =
                    listOf(
                        LimeFunction(
                            LimePath(listOf("gluecodium", "calculator"), listOf("Calculator", "subtract")),
                            parameters =
                                listOf(
                                    LimeParameter(
                                        LimePath(
                                            listOf("gluecodium", "calculator"),
                                            listOf("Calculator", "subtract", "minuend"),
                                        ),
                                        typeRef = LimeBasicTypeRef(TypeId.INT32),
                                    ),
                                    LimeParameter(
                                        LimePath(
                                            listOf("gluecodium", "calculator"),
                                            listOf("Calculator", "subtract", "subtrahend"),
                                        ),
                                        typeRef = LimeBasicTypeRef(TypeId.INT32),
                                    ),
                                    LimeParameter(
                                        LimePath(
                                            listOf("gluecodium", "calculator"),
                                            listOf("Calculator", "subtract", "callback"),
                                        ),
                                        typeRef = LimeDirectTypeRef(lambda),
                                    ),
                                ),
                            returnType = LimeReturnType(LimeBasicTypeRef(TypeId.VOID)),
                        ),
                    ),
            )
        val files = generateModel(limeClass)
        val specFile = files.find { it.targetFile.name == "NativeCalculatorModule.ts" }!!
        assertTrue(
            "Lambda should be inline callback",
            specFile.content.contains("(p0: number | null, p1: number | null) => void"),
        )
    }

    @Test
    fun `TurboModule spec includes constructors as factory methods`() {
        val limeClass =
            LimeClass(
                LimePath(listOf("gluecodium", "calculator"), listOf("Calculator")),
                functions =
                    listOf(
                        LimeFunction(
                            LimePath(listOf("gluecodium", "calculator"), listOf("Calculator", "make")),
                            isConstructor = true,
                        ),
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
                                ),
                            returnType = LimeReturnType(LimeBasicTypeRef(TypeId.INT32)),
                        ),
                    ),
            )
        val files = generateModel(limeClass)
        val specFile = files.find { it.targetFile.name == "NativeCalculatorModule.ts" }!!
        assertTrue("Constructor should appear as factory method returning handle", specFile.content.contains("make"))
        assertTrue(specFile.content.contains("summarize"))
    }

    @Test
    fun `TurboModule spec file is in specs directory`() {
        val files = generateModel(createCalculatorClass())
        val specFile = files.find { it.targetFile.name == "NativeCalculatorModule.ts" }!!
        assertTrue(
            "Spec file should be under specs/",
            specFile.targetFile.path.contains("specs/"),
        )
    }
}
