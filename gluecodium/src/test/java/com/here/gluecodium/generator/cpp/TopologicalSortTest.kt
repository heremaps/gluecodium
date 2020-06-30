/*
 * Copyright (C) 2016-2020 HERE Europe B.V.
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

package com.here.gluecodium.generator.cpp

import com.here.gluecodium.generator.cpp.TopologicalSortTestHelper.createConstant
import com.here.gluecodium.generator.cpp.TopologicalSortTestHelper.createConstantWithAliasType
import com.here.gluecodium.generator.cpp.TopologicalSortTestHelper.createPath
import com.here.gluecodium.generator.cpp.TopologicalSortTestHelper.createStruct
import com.here.gluecodium.generator.cpp.TopologicalSortTestHelper.createTypeAlias
import com.here.gluecodium.generator.cpp.TopologicalSortTestHelper.createTypeRef
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimeReturnType
import com.here.gluecodium.model.lime.LimeStruct
import org.junit.Assert.assertEquals
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

@RunWith(Parameterized::class)
class TopologicalSortTest(
    @Suppress("UNUSED_PARAMETER") testName: String,
    private val elements: List<LimeNamedElement>,
    private val expectedOrder: List<Int>
) {

    @Test
    fun checkOrder() {
        val sortedElements = TopologicalSort(elements).sort()

        assertEquals(elements.size, sortedElements.size)

        elements.indices.forEach {
            val index = expectedOrder[it]
            assertEquals(elements[index], sortedElements[it])
        }
    }

    companion object {
        private const val TYPE_A = "A"
        private const val TYPE_B = "B"
        private const val TYPE_C = "C"
        private const val FIRST_STRUCT_NAME = "StructA"
        private const val SECOND_STRUCT_NAME = "StructB"
        private const val THIRD_STRUCT_NAME = "StructC"

        private const val ENUM_NAME = "Kind"
        private const val TYPE_DEF_NAME = "shortcut"

        private val LIME_ENUM = LimeEnumeration(createPath(ENUM_NAME))

        private val LIME_ALIAS = createTypeAlias(
            TYPE_DEF_NAME, createTypeRef(
                TYPE_A
            ))

        @JvmStatic
        @Parameterized.Parameters(name = "{0}")
        fun testData(): Collection<Array<Any>> =
            listOf(
                arrayOf(
                    "sortIndependentStructsKeepsSameOrder", listOf(
                        createStruct(FIRST_STRUCT_NAME, TYPE_A, TYPE_B),
                        createStruct(SECOND_STRUCT_NAME, TYPE_B, TYPE_C)
                    ), listOf(0, 1)
                ), arrayOf(
                    "sortDependentStructs", listOf(
                        createStruct(FIRST_STRUCT_NAME, TYPE_A, SECOND_STRUCT_NAME),
                        createStruct(SECOND_STRUCT_NAME, TYPE_B, TYPE_C)
                    ), listOf(1, 0)
                ), arrayOf(
                    "sortSortedDependentStructsKeepsSameOrder", listOf(
                        createStruct(FIRST_STRUCT_NAME, TYPE_A, TYPE_B),
                        createStruct(SECOND_STRUCT_NAME, TYPE_B, FIRST_STRUCT_NAME)
                    ), listOf(0, 1)
                ), arrayOf(
                    "sortMultipleStructsWithDependencies", listOf(
                        createStruct(FIRST_STRUCT_NAME, SECOND_STRUCT_NAME, THIRD_STRUCT_NAME),
                        createStruct(SECOND_STRUCT_NAME, TYPE_B, THIRD_STRUCT_NAME),
                        createStruct(THIRD_STRUCT_NAME, TYPE_A, TYPE_B)
                    ), listOf(2, 1, 0)
                ), arrayOf(
                    "sortEnumWithStructDependingOnIt",
                    listOf(createStruct(FIRST_STRUCT_NAME, TYPE_A, ENUM_NAME), LIME_ENUM),
                    listOf(1, 0)
                ), arrayOf(
                    "enumWithStructNotDependingOnItKeepsSameOrder",
                    listOf(createStruct(FIRST_STRUCT_NAME, TYPE_A, TYPE_B), LIME_ENUM),
                    listOf(0, 1)
                ), arrayOf(
                    "enumWithUsingDependingOnIt",
                    listOf(createTypeAlias(TYPE_DEF_NAME, createTypeRef(ENUM_NAME)), LIME_ENUM),
                    listOf(1, 0)
                ), arrayOf(
                    "enumWithUsingNotDependingOnItKeepsSameOrder",
                    listOf(LIME_ALIAS, LIME_ENUM),
                    listOf(0, 1)
                ), arrayOf(
                    "enumWithConstantDependingOnIt",
                    listOf(createConstant(ENUM_NAME), LIME_ENUM),
                    listOf(1, 0)
                ), arrayOf(
                    "enumWithConstantNotDependingOnItKeepsSameOrder",
                    listOf(createConstant(TYPE_A), LIME_ENUM),
                    listOf(0, 1)
                ), arrayOf(
                    "constantDependingOnStruct", listOf(
                        createConstant(FIRST_STRUCT_NAME),
                        createStruct(FIRST_STRUCT_NAME, TYPE_A, TYPE_B)
                    ), listOf(1, 0)
                ), arrayOf(
                    "constantNotDependingOnStructKeepsSameOrder", listOf(
                        createConstant(TYPE_A),
                        createStruct(FIRST_STRUCT_NAME, TYPE_A, TYPE_B)
                    ), listOf(0, 1)
                ), arrayOf(
                    "constantDependingOnDefinition",
                    listOf(createConstantWithAliasType(), LIME_ALIAS),
                    listOf(1, 0)
                ), arrayOf(
                    "constantNotDependingOnDefinitionKeepsSameOrder",
                    listOf(createConstant(TYPE_B), LIME_ALIAS),
                    listOf(0, 1)
                ), arrayOf(
                    "usingDependingOnUsing", listOf(
                        createTypeAlias(
                            "anotherShortcut",
                            LimeDirectTypeRef(createTypeAlias(TYPE_DEF_NAME, createTypeRef(TYPE_A)))
                        ),
                        LIME_ALIAS
                    ), listOf(1, 0)
                ), arrayOf(
                    "usingNotDependingOnUsingKeepsSameOrder",
                    listOf(LIME_ALIAS, createTypeAlias("anotherShortcut", createTypeRef(TYPE_B))),
                    listOf(0, 1)
                ), arrayOf(
                    "usingDependingOnStruct", listOf(
                        createTypeAlias(TYPE_DEF_NAME, createTypeRef(FIRST_STRUCT_NAME)),
                        createStruct(FIRST_STRUCT_NAME, TYPE_A, TYPE_B)
                    ), listOf(1, 0)
                ), arrayOf(
                    "usingNotDependingOnStructKeepsSameOrder", listOf(
                        createTypeAlias(TYPE_DEF_NAME, createTypeRef(TYPE_C)),
                        createStruct(FIRST_STRUCT_NAME, TYPE_A, TYPE_B)
                    ), listOf(0, 1)
                ), arrayOf(
                    "usingFunctionTypeRefDependingOnStruct", listOf(
                        createTypeAlias(
                            TYPE_DEF_NAME,
                            LimeDirectTypeRef(LimeLambda(createPath(FIRST_STRUCT_NAME)))
                        ),
                        createStruct(FIRST_STRUCT_NAME, TYPE_A, TYPE_B)
                    ), listOf(1, 0)
                ), arrayOf(
                    "structDependingOnDefinition",
                    listOf(
                        createStruct(FIRST_STRUCT_NAME, TYPE_DEF_NAME, TYPE_B),
                        LIME_ALIAS
                    ),
                    listOf(1, 0)
                ), arrayOf(
                    "structNotDependingOnDefinitionKeepsSameOrder", listOf(
                        createStruct(FIRST_STRUCT_NAME, TYPE_A, TYPE_B),
                        createTypeAlias(TYPE_DEF_NAME, createTypeRef(TYPE_C))
                    ), listOf(0, 1)
                ), arrayOf(
                    "sortStructsDependentThroughMethodReturnType", listOf(
                        LimeStruct(
                            path = createPath(FIRST_STRUCT_NAME),
                            functions = listOf(
                                LimeFunction(
                                    createPath("x"),
                                    returnType = LimeReturnType(createTypeRef(SECOND_STRUCT_NAME))
                                )
                            )
                        ),
                        createStruct(SECOND_STRUCT_NAME, TYPE_B, TYPE_C)
                    ), listOf(1, 0)
                ), arrayOf(
                    "sortStructsDependentThroughMethodParameter", listOf(
                        LimeStruct(
                            path = createPath(FIRST_STRUCT_NAME),
                            functions = listOf(
                                LimeFunction(
                                    createPath("x"),
                                    parameters = listOf(
                                        LimeParameter(
                                            createPath("x"),
                                            typeRef = createTypeRef(SECOND_STRUCT_NAME)
                                        ))
                                )
                            )
                        ),
                        createStruct(SECOND_STRUCT_NAME, TYPE_B, TYPE_C)
                    ), listOf(1, 0)
                ), arrayOf(
                    "sortStructDependentOnSelfDoesNotCrash", listOf(
                        LimeStruct(
                            path = createPath(FIRST_STRUCT_NAME),
                            functions = listOf(
                                LimeFunction(
                                    createPath("x"),
                                    returnType = LimeReturnType(createTypeRef(FIRST_STRUCT_NAME))
                                )
                            )
                        )
                    ), listOf(0)
                )
            )
    }
}
