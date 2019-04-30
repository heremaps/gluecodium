/*
 * Copyright (C) 2016-2019 HERE Europe B.V.
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

package com.here.genium.generator.cpp

import com.here.genium.model.common.Include
import com.here.genium.model.cpp.CppComplexTypeRef
import com.here.genium.model.cpp.CppConstant
import com.here.genium.model.cpp.CppElement
import com.here.genium.model.cpp.CppEnum
import com.here.genium.model.cpp.CppField
import com.here.genium.model.cpp.CppMethod
import com.here.genium.model.cpp.CppParameter
import com.here.genium.model.cpp.CppStruct
import com.here.genium.model.cpp.CppTypeDefRef
import com.here.genium.model.cpp.CppTypeRef
import com.here.genium.model.cpp.CppUsing
import com.here.genium.model.cpp.CppValue
import org.junit.Assert.assertEquals
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

@RunWith(Parameterized::class)
class TopologicalSortTest(
    @Suppress("UNUSED_PARAMETER") testName: String,
    private val elements: List<CppElement>,
    private val expectedOrder: List<Int>
) {

    @Test
    fun checkOrder() {
        val sortedElements = TopologicalSort(elements).sort()

        assertEquals(elements.size, sortedElements.size)

        for (i in elements.indices) {
            val index = expectedOrder[i]
            assertEquals(elements[index], sortedElements[i])
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

        private val CPP_ENUM = CppEnum(ENUM_NAME, ENUM_NAME, false, emptyList())
        private val CPP_USING = createUsing(TYPE_DEF_NAME, CppComplexTypeRef(TYPE_A))

        @JvmStatic
        @Parameterized.Parameters(name = "{0}")
        fun testData(): Collection<Array<Any>> {
            return listOf(
                arrayOf(
                    "sortIndependentStructsKeepsSameOrder", listOf(
                        createCppStruct(FIRST_STRUCT_NAME, TYPE_A, TYPE_B),
                        createCppStruct(SECOND_STRUCT_NAME, TYPE_B, TYPE_C)
                    ), listOf(0, 1)
                ), arrayOf(
                    "sortDependentStructs", listOf(
                        createCppStruct(FIRST_STRUCT_NAME, TYPE_A, SECOND_STRUCT_NAME),
                        createCppStruct(SECOND_STRUCT_NAME, TYPE_B, TYPE_C)
                    ), listOf(1, 0)
                ), arrayOf(
                    "sortSortedDependentStructsKeepsSameOrder", listOf(
                        createCppStruct(FIRST_STRUCT_NAME, TYPE_A, TYPE_B),
                        createCppStruct(SECOND_STRUCT_NAME, TYPE_B, FIRST_STRUCT_NAME)
                    ), listOf(0, 1)
                ), arrayOf(
                    "sortMultipleStructsWithDependencies", listOf(
                        createCppStruct(
                            FIRST_STRUCT_NAME,
                            SECOND_STRUCT_NAME,
                            THIRD_STRUCT_NAME
                        ),
                        createCppStruct(SECOND_STRUCT_NAME, TYPE_B, THIRD_STRUCT_NAME),
                        createCppStruct(THIRD_STRUCT_NAME, TYPE_A, TYPE_B)
                    ), listOf(2, 1, 0)
                ), arrayOf(
                    "sortEnumWithStructDependingOnIt",
                    listOf(
                        createCppStruct(FIRST_STRUCT_NAME, TYPE_A, ENUM_NAME),
                        CPP_ENUM
                    ),
                    listOf(1, 0)
                ), arrayOf(
                    "enumWithStructNotDependingOnItKeepsSameOrder",
                    listOf(createCppStruct(FIRST_STRUCT_NAME, TYPE_A, TYPE_B), CPP_ENUM),
                    listOf(0, 1)
                ), arrayOf(
                    "enumWithUsingDependingOnIt",
                    listOf(
                        createUsing(TYPE_DEF_NAME, CppComplexTypeRef(ENUM_NAME)),
                        CPP_ENUM
                    ),
                    listOf(1, 0)
                ), arrayOf(
                    "enumWithUsingNotDependingOnItKeepsSameOrder",
                    listOf(CPP_USING, CPP_ENUM),
                    listOf(0, 1)
                ), arrayOf(
                    "enumWithConstantDependingOnIt",
                    listOf(createConstant(ENUM_NAME), CPP_ENUM),
                    listOf(1, 0)
                ), arrayOf(
                    "enumWithConstantNotDependingOnItKeepsSameOrder",
                    listOf(createConstant(TYPE_A), CPP_ENUM),
                    listOf(0, 1)
                ), arrayOf(
                    "constantDependingOnStruct", listOf(
                        createConstant(FIRST_STRUCT_NAME),
                        createCppStruct(FIRST_STRUCT_NAME, TYPE_A, TYPE_B)
                    ), listOf(1, 0)
                ), arrayOf(
                    "constantNotDependingOnStructKeepsSameOrder", listOf(
                        createConstant(TYPE_A),
                        createCppStruct(FIRST_STRUCT_NAME, TYPE_A, TYPE_B)
                    ), listOf(0, 1)
                ), arrayOf(
                    "constantDependingOnDefinition",
                    listOf(createConstantWithUsing(TYPE_DEF_NAME), CPP_USING),
                    listOf(1, 0)
                ), arrayOf(
                    "constantNotDependingOnDefinitionKeepsSameOrder",
                    listOf(createConstant(TYPE_B), CPP_USING),
                    listOf(0, 1)
                ), arrayOf(
                    "usingDependingOnUsing", listOf(
                        createUsing(
                            "anotherShortcut",
                            CppTypeDefRef(
                                TYPE_DEF_NAME,
                                listOf(Include.createInternalInclude("foo")),
                                CppComplexTypeRef(TYPE_A)
                            )
                        ),
                        CPP_USING
                    ), listOf(1, 0)
                ), arrayOf(
                    "usingNotDependingOnUsingKeepsSameOrder",
                    listOf(
                        CPP_USING,
                        createUsing("anotherShortcut", CppComplexTypeRef(TYPE_B))
                    ),
                    listOf(0, 1)
                ), arrayOf(
                    "usingDependingOnStruct", listOf(
                        createUsing(TYPE_DEF_NAME, CppComplexTypeRef(FIRST_STRUCT_NAME)),
                        createCppStruct(FIRST_STRUCT_NAME, TYPE_A, TYPE_B)
                    ), listOf(1, 0)
                ), arrayOf(
                    "usingNotDependingOnStructKeepsSameOrder", listOf(
                        createUsing(TYPE_DEF_NAME, CppComplexTypeRef(TYPE_C)),
                        createCppStruct(FIRST_STRUCT_NAME, TYPE_A, TYPE_B)
                    ), listOf(0, 1)
                ), arrayOf(
                    "structDependingOnDefinition",
                    listOf(
                        createCppStruct(FIRST_STRUCT_NAME, TYPE_DEF_NAME, TYPE_B),
                        CPP_USING
                    ),
                    listOf(1, 0)
                ), arrayOf(
                    "structNotDependingOnDefinitionKeepsSameOrder", listOf(
                        createCppStruct(FIRST_STRUCT_NAME, TYPE_A, TYPE_B),
                        createUsing(TYPE_DEF_NAME, CppComplexTypeRef(TYPE_C))
                    ), listOf(0, 1)
                ), arrayOf(
                    "sortStructsDependentThroughMethodReturnType", listOf(
                        CppStruct(
                            name = FIRST_STRUCT_NAME,
                            fullyQualifiedName = FIRST_STRUCT_NAME,
                            methods = listOf(
                                CppMethod("x", returnType = CppComplexTypeRef(SECOND_STRUCT_NAME))
                            )
                        ),
                        createCppStruct(SECOND_STRUCT_NAME, TYPE_B, TYPE_C)
                    ), listOf(1, 0)
                ), arrayOf(
                    "sortStructsDependentThroughMethodParameter", listOf(
                        CppStruct(
                            name = FIRST_STRUCT_NAME,
                            fullyQualifiedName = FIRST_STRUCT_NAME,
                            methods = listOf(
                                CppMethod(
                                    "x",
                                    parameters = listOf(CppParameter(
                                        "foo",
                                        CppComplexTypeRef(SECOND_STRUCT_NAME)
                                    ))
                                )
                            )
                        ),
                        createCppStruct(SECOND_STRUCT_NAME, TYPE_B, TYPE_C)
                    ), listOf(1, 0)
                ), arrayOf(
                    "sortStructDependentOnSelfDoesNotCrash", listOf(
                        CppStruct(
                            name = FIRST_STRUCT_NAME,
                            fullyQualifiedName = FIRST_STRUCT_NAME,
                            methods = listOf(
                                CppMethod("x", returnType = CppComplexTypeRef(FIRST_STRUCT_NAME))
                            )
                        )
                    ), listOf(0)
                )
            )
        }

        private fun createCppStruct(name: String, firstType: String, secondType: String) =
            CppStruct(
                name = name,
                fullyQualifiedName = name,
                fields = listOf(
                    CppField("x", CppComplexTypeRef(firstType)),
                    CppField("y", CppComplexTypeRef(secondType))
                )
            )

        private fun createUsing(name: String, typeRef: CppTypeRef) =
            CppUsing(name = name, fullyQualifiedName = name, definition = typeRef)

        private fun createConstant(typeName: String) =
            CppConstant("fixed", "fixed", CppComplexTypeRef(typeName), CppValue(""))

        private fun createConstantWithUsing(typeName: String) =
            CppConstant(
                "fixed",
                "fixed",
                CppTypeDefRef(
                    typeName,
                    listOf(Include.createInternalInclude("foo")),
                    CppComplexTypeRef("nonsense")
                ),
                CppValue("")
            )
    }
}
