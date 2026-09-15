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
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeLambdaParameter
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimeReturnType
import com.here.gluecodium.model.lime.LimeStruct
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test

class TypeScriptGenerationTest {
    private val generator = TypeScriptGenerator()

    @Before
    fun setUp() {
        generator.initialize(GeneratorOptions())
    }

    private fun generateModel(vararg elements: com.here.gluecodium.model.lime.LimeNamedElement) =
        generator.generate(LimeModel(referenceMap = emptyMap(), topElements = elements.toList()))

    @Test
    fun `generates enum file`() {
        val enumeration =
            LimeEnumeration(
                LimePath(listOf("gluecodium", "calculator"), listOf("CalculatorError")),
                enumerators =
                    listOf(
                        LimeEnumerator(
                            LimePath(
                                listOf("gluecodium", "calculator"),
                                listOf("CalculatorError", "RESULT_OUT_OF_BOUNDS"),
                            ),
                        ),
                        LimeEnumerator(
                            LimePath(
                                listOf("gluecodium", "calculator"),
                                listOf("CalculatorError", "DIVIDE_BY_ZERO"),
                            ),
                            previous =
                                LimeEnumerator(
                                    LimePath(
                                        listOf("gluecodium", "calculator"),
                                        listOf("CalculatorError", "RESULT_OUT_OF_BOUNDS"),
                                    ),
                                ),
                        ),
                    ),
            )
        val files = generateModel(enumeration)
        assertEquals(1, files.size)
        assertTrue(files[0].targetFile.path.endsWith("CalculatorError.ts"))
        assertTrue(files[0].content.contains("export enum CalculatorError"))
        assertTrue(files[0].content.contains("RESULT_OUT_OF_BOUNDS"))
        assertTrue(files[0].content.contains("DIVIDE_BY_ZERO"))
    }

    @Test
    fun `generates struct file`() {
        val struct =
            LimeStruct(
                LimePath(listOf("gluecodium", "calculator"), listOf("DivideArguments")),
                fields =
                    listOf(
                        LimeField(
                            LimePath(listOf("gluecodium", "calculator"), listOf("DivideArguments", "dividend")),
                            typeRef = LimeBasicTypeRef(TypeId.INT32),
                        ),
                        LimeField(
                            LimePath(listOf("gluecodium", "calculator"), listOf("DivideArguments", "divider")),
                            typeRef = LimeBasicTypeRef(TypeId.INT32),
                        ),
                    ),
            )
        val files = generateModel(struct)
        assertEquals(1, files.size)
        assertTrue(files[0].content.contains("export interface DivideArguments"))
        assertTrue(files[0].content.contains("dividend: number"))
        assertTrue(files[0].content.contains("divider: number"))
    }

    @Test
    fun `generates lambda file`() {
        val lambda =
            LimeLambda(
                LimePath(listOf("gluecodium", "calculator"), listOf("SubtructCallback")),
                parameters =
                    listOf(
                        LimeLambdaParameter(
                            LimeBasicTypeRef(TypeId.INT32, isNullable = true),
                            LimePath(
                                listOf("gluecodium", "calculator"),
                                listOf("SubtructCallback", "call", "p0"),
                            ),
                        ),
                        LimeLambdaParameter(
                            LimeBasicTypeRef(TypeId.INT32, isNullable = true),
                            LimePath(
                                listOf("gluecodium", "calculator"),
                                listOf("SubtructCallback", "call", "p1"),
                            ),
                        ),
                    ),
                returnType = LimeReturnType(LimeBasicTypeRef(TypeId.VOID)),
            )
        val files = generateModel(lambda)
        assertEquals(1, files.size)
        assertTrue(files[0].content.contains("export type SubtructCallback"))
        assertTrue(files[0].content.contains("number | null"))
    }

    @Test
    fun `generates class with methods`() {
        val limeClass =
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
                    ),
            )
        val files = generateModel(limeClass)
        assertTrue(files.isNotEmpty())
        val classFile = files.find { it.targetFile.name == "Calculator.ts" }!!
        assertTrue(classFile.content.contains("export abstract class Calculator"))
        assertTrue(classFile.content.contains("summarize"))
        assertTrue(classFile.content.contains("first: number"))
    }

    @Test
    fun `generates interface file`() {
        val iface =
            LimeInterface(
                LimePath(listOf("gluecodium", "calculator"), listOf("MultiplyCallback")),
                functions =
                    listOf(
                        LimeFunction(
                            LimePath(
                                listOf("gluecodium", "calculator"),
                                listOf("MultiplyCallback", "onResult"),
                            ),
                            parameters =
                                listOf(
                                    LimeParameter(
                                        LimePath(
                                            listOf("gluecodium", "calculator"),
                                            listOf("MultiplyCallback", "onResult", "result"),
                                        ),
                                        typeRef = LimeBasicTypeRef(TypeId.INT32),
                                    ),
                                ),
                            returnType = LimeReturnType(LimeBasicTypeRef(TypeId.VOID)),
                        ),
                    ),
            )
        val files = generateModel(iface)
        assertEquals(1, files.size)
        assertTrue(files[0].content.contains("export interface MultiplyCallback"))
        assertTrue(files[0].content.contains("onResult"))
        assertTrue(files[0].content.contains("result: number"))
    }

    @Test
    fun `generates exception file`() {
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
        val exception =
            LimeException(
                LimePath(listOf("gluecodium", "calculator"), listOf("Calculator", "CalculatorException")),
                errorType = LimeDirectTypeRef(enumeration),
            )
        val limeClass =
            LimeClass(
                LimePath(listOf("gluecodium", "calculator"), listOf("Calculator")),
                enumerations = listOf(enumeration),
                exceptions = listOf(exception),
            )
        val files = generateModel(limeClass)
        val exceptionFile = files.find { it.targetFile.name == "CalculatorException.ts" }
        assertTrue("Exception file should be generated", exceptionFile != null)
        assertTrue(exceptionFile!!.content.contains("export type CalculatorException"))
        assertTrue(exceptionFile.content.contains("CalculatorError"))
    }

    @Test
    fun `generates nested enum from class`() {
        val enumeration =
            LimeEnumeration(
                LimePath(listOf("gluecodium", "calculator"), listOf("Calculator", "CalculatorError")),
                enumerators =
                    listOf(
                        LimeEnumerator(
                            LimePath(
                                listOf("gluecodium", "calculator"),
                                listOf("Calculator", "CalculatorError", "VALUE_A"),
                            ),
                        ),
                    ),
            )
        val limeClass =
            LimeClass(
                LimePath(listOf("gluecodium", "calculator"), listOf("Calculator")),
                enumerations = listOf(enumeration),
            )
        val files = generateModel(limeClass)
        val enumFile = files.find { it.targetFile.name == "CalculatorError.ts" }
        assertTrue("Nested enum should be generated as separate file", enumFile != null)
        assertTrue(enumFile!!.content.contains("export enum CalculatorError"))
    }

    @Test
    fun `generates constructor as static method`() {
        val limeClass =
            LimeClass(
                LimePath(listOf("gluecodium", "calculator"), listOf("Calculator")),
                functions =
                    listOf(
                        LimeFunction(
                            LimePath(listOf("gluecodium", "calculator"), listOf("Calculator", "make")),
                            isConstructor = true,
                            returnType = LimeReturnType(LimeBasicTypeRef(TypeId.VOID)),
                        ),
                    ),
            )
        val files = generateModel(limeClass)
        val classFile = files.find { it.targetFile.name == "Calculator.ts" }!!
        assertTrue(classFile.content.contains("static make"))
    }

    @Test
    fun `file path includes package path`() {
        val enumeration =
            LimeEnumeration(
                LimePath(listOf("gluecodium", "calculator"), listOf("CalculatorError")),
                enumerators = emptyList(),
            )
        val files = generateModel(enumeration)
        assertEquals(1, files.size)
        assertTrue(
            "File path should include package",
            files[0].targetFile.path.contains("gluecodium/calculator"),
        )
    }

    @Test
    fun `auto-generated header in output`() {
        val enumeration =
            LimeEnumeration(
                LimePath(listOf("gluecodium", "calculator"), listOf("CalculatorError")),
                enumerators = emptyList(),
            )
        val files = generateModel(enumeration)
        assertTrue(files[0].content.contains("Auto-generated by Gluecodium"))
    }
}
