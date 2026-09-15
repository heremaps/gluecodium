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

import com.here.gluecodium.model.lime.LimeBasicType.TypeId
import com.here.gluecodium.model.lime.LimeBasicTypeRef
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeEnumerator
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeLambdaParameter
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimeReturnType
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeStruct
import org.junit.Assert.assertEquals
import org.junit.Test

class TurboModuleTypeMapperTest {
    private val mapper = TurboModuleTypeMapper()

    @Test
    fun `maps Int to number`() {
        assertEquals("number", mapper.mapType(LimeBasicTypeRef(TypeId.INT32)))
    }

    @Test
    fun `maps Boolean to boolean`() {
        assertEquals("boolean", mapper.mapType(LimeBasicTypeRef(TypeId.BOOLEAN)))
    }

    @Test
    fun `maps String to string`() {
        assertEquals("string", mapper.mapType(LimeBasicTypeRef(TypeId.STRING)))
    }

    @Test
    fun `maps Void to void`() {
        assertEquals("void", mapper.mapType(LimeBasicTypeRef(TypeId.VOID)))
    }

    @Test
    fun `maps nullable to T or null not undefined`() {
        assertEquals("number | null", mapper.mapType(LimeBasicTypeRef(TypeId.INT32, isNullable = true)))
    }

    @Test
    fun `maps Blob to string for base64`() {
        assertEquals("string", mapper.mapType(LimeBasicTypeRef(TypeId.BLOB)))
    }

    @Test
    fun `maps Date to number for timestamp`() {
        assertEquals("number", mapper.mapType(LimeBasicTypeRef(TypeId.DATE)))
    }

    @Test
    fun `maps Enum to number`() {
        val enumeration =
            LimeEnumeration(
                LimePath(listOf("com"), listOf("MyEnum")),
                enumerators = listOf(LimeEnumerator(LimePath(listOf("com"), listOf("MyEnum", "A")))),
            )
        assertEquals("number", mapper.mapType(LimeDirectTypeRef(enumeration)))
    }

    @Test
    fun `maps List to a readonly array`() {
        // The RN TurboModule spec carries a list as a typed ReadonlyArray, not an opaque handle
        // string (the generator has emitted arrays since collection marshalling landed).
        val listType = LimeList(LimeBasicTypeRef(TypeId.INT32))
        assertEquals("ReadonlyArray<number>", mapper.mapType(LimeDirectTypeRef(listType)))
    }

    @Test
    fun `maps Set to a readonly array`() {
        val setType = LimeSet(LimeBasicTypeRef(TypeId.STRING))
        assertEquals("ReadonlyArray<string>", mapper.mapType(LimeDirectTypeRef(setType)))
    }

    @Test
    fun `maps Map to a readonly array of key-value tuples`() {
        // Spec task 15.3: a map crosses the TurboModule boundary as an array of [key, value] tuples
        // (RN-Codegen-safe, order-preserving, non-string keys allowed); the wrapper re-exposes Map.
        val mapType = LimeMap(LimeBasicTypeRef(TypeId.STRING), LimeBasicTypeRef(TypeId.INT32))
        assertEquals("ReadonlyArray<[string, number]>", mapper.mapType(LimeDirectTypeRef(mapType)))
    }

    @Test
    fun `maps Struct to string handle`() {
        val struct =
            LimeStruct(
                LimePath(listOf("com"), listOf("Point")),
                fields =
                    listOf(
                        LimeField(
                            LimePath(listOf("com"), listOf("Point", "x")),
                            typeRef = LimeBasicTypeRef(TypeId.DOUBLE),
                        ),
                        LimeField(
                            LimePath(listOf("com"), listOf("Point", "y")),
                            typeRef = LimeBasicTypeRef(TypeId.DOUBLE),
                        ),
                    ),
            )
        assertEquals("string", mapper.mapType(LimeDirectTypeRef(struct)))
    }

    @Test
    fun `maps Struct nullable to string or null`() {
        val struct =
            LimeStruct(
                LimePath(listOf("com"), listOf("Result")),
                fields =
                    listOf(
                        LimeField(
                            LimePath(listOf("com"), listOf("Result", "error")),
                            typeRef = LimeBasicTypeRef(TypeId.INT32, isNullable = true),
                        ),
                        LimeField(
                            LimePath(listOf("com"), listOf("Result", "result")),
                            typeRef = LimeBasicTypeRef(TypeId.DOUBLE, isNullable = true),
                        ),
                    ),
            )
        assertEquals("string | null", mapper.mapType(LimeDirectTypeRef(struct, isNullable = true)))
    }

    @Test
    fun `maps Lambda to inline callback type`() {
        val lambda =
            LimeLambda(
                LimePath(listOf("com"), listOf("MyCallback")),
                parameters =
                    listOf(
                        LimeLambdaParameter(
                            LimeBasicTypeRef(TypeId.INT32, isNullable = true),
                            LimePath(listOf("com"), listOf("MyCallback", "call", "p0")),
                        ),
                        LimeLambdaParameter(
                            LimeBasicTypeRef(TypeId.INT32, isNullable = true),
                            LimePath(listOf("com"), listOf("MyCallback", "call", "p1")),
                        ),
                    ),
                returnType = LimeReturnType(LimeBasicTypeRef(TypeId.VOID)),
            )
        assertEquals(
            "(p0: number | null, p1: number | null) => void",
            mapper.mapType(LimeDirectTypeRef(lambda)),
        )
    }

    @Test
    fun `maps Interface as callback parameter to function type`() {
        val iface =
            LimeInterface(
                LimePath(listOf("com"), listOf("MultiplyCallback")),
                functions =
                    listOf(
                        LimeFunction(
                            LimePath(listOf("com"), listOf("MultiplyCallback", "onError")),
                            parameters =
                                listOf(
                                    LimeParameter(
                                        LimePath(listOf("com"), listOf("MultiplyCallback", "onError", "error")),
                                        typeRef = LimeBasicTypeRef(TypeId.INT32),
                                    ),
                                ),
                            returnType = LimeReturnType(LimeBasicTypeRef(TypeId.VOID)),
                        ),
                        LimeFunction(
                            LimePath(listOf("com"), listOf("MultiplyCallback", "onResult")),
                            parameters =
                                listOf(
                                    LimeParameter(
                                        LimePath(listOf("com"), listOf("MultiplyCallback", "onResult", "result")),
                                        typeRef = LimeBasicTypeRef(TypeId.INT32),
                                    ),
                                ),
                            returnType = LimeReturnType(LimeBasicTypeRef(TypeId.VOID)),
                        ),
                    ),
            )
        // A MULTI-method listener interface (onError + onResult) is passed as an object of optional
        // callbacks — RN Codegen rejects object types with function-typed properties, so the spec
        // param is the generic `Object` (Phase 23.5). The C++ proxy reads each callback by name.
        assertEquals(
            "Object",
            mapper.mapType(LimeDirectTypeRef(iface)),
        )
    }

    @Test
    fun `maps Interface as return type to string handle`() {
        val iface =
            LimeInterface(
                LimePath(listOf("com"), listOf("MinResultRetriever")),
                functions =
                    listOf(
                        LimeFunction(
                            LimePath(listOf("com"), listOf("MinResultRetriever", "get_result")),
                            returnType = LimeReturnType(LimeBasicTypeRef(TypeId.INT32)),
                        ),
                    ),
            )
        assertEquals("string", mapper.mapReturnType(LimeDirectTypeRef(iface)))
    }

    @Test
    fun `formatMethodSignature uses readonly arrow function syntax`() {
        val params = "first: number, second: number"
        val returnType = "number"
        val result = mapper.formatMethodSignature("summarize", params, returnType)
        assertEquals("readonly summarize: (first: number, second: number) => number;", result)
    }

    @Test
    fun `formatMethodSignature with no params`() {
        val result = mapper.formatMethodSignature("getVersion", "", "string")
        assertEquals("readonly getVersion: () => string;", result)
    }
}
