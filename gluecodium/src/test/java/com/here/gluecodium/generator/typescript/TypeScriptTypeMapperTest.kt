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
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeLambdaParameter
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimeReturnType
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeStruct
import org.junit.Assert.assertEquals
import org.junit.Test

class TypeScriptTypeMapperTest {
    private val mapper = TypeScriptTypeMapper()

    @Test
    fun `maps Int to number`() {
        val typeRef = LimeBasicTypeRef(TypeId.INT32)
        assertEquals("number", mapper.mapType(typeRef))
    }

    @Test
    fun `maps Long to number`() {
        val typeRef = LimeBasicTypeRef(TypeId.INT64)
        assertEquals("number", mapper.mapType(typeRef))
    }

    @Test
    fun `maps Short to number`() {
        val typeRef = LimeBasicTypeRef(TypeId.INT16)
        assertEquals("number", mapper.mapType(typeRef))
    }

    @Test
    fun `maps Byte to number`() {
        val typeRef = LimeBasicTypeRef(TypeId.INT8)
        assertEquals("number", mapper.mapType(typeRef))
    }

    @Test
    fun `maps UInt to number`() {
        val typeRef = LimeBasicTypeRef(TypeId.UINT32)
        assertEquals("number", mapper.mapType(typeRef))
    }

    @Test
    fun `maps Float to number`() {
        val typeRef = LimeBasicTypeRef(TypeId.FLOAT)
        assertEquals("number", mapper.mapType(typeRef))
    }

    @Test
    fun `maps Double to number`() {
        val typeRef = LimeBasicTypeRef(TypeId.DOUBLE)
        assertEquals("number", mapper.mapType(typeRef))
    }

    @Test
    fun `maps String to string`() {
        val typeRef = LimeBasicTypeRef(TypeId.STRING)
        assertEquals("string", mapper.mapType(typeRef))
    }

    @Test
    fun `maps Boolean to boolean`() {
        val typeRef = LimeBasicTypeRef(TypeId.BOOLEAN)
        assertEquals("boolean", mapper.mapType(typeRef))
    }

    @Test
    fun `maps Void to void`() {
        val typeRef = LimeBasicTypeRef(TypeId.VOID)
        assertEquals("void", mapper.mapType(typeRef))
    }

    @Test
    fun `maps Blob to Uint8Array`() {
        val typeRef = LimeBasicTypeRef(TypeId.BLOB)
        assertEquals("Uint8Array", mapper.mapType(typeRef))
    }

    @Test
    fun `maps Date to Date`() {
        val typeRef = LimeBasicTypeRef(TypeId.DATE)
        assertEquals("Date", mapper.mapType(typeRef))
    }

    @Test
    fun `maps nullable Int to number or null`() {
        val typeRef = LimeBasicTypeRef(TypeId.INT32, isNullable = true)
        assertEquals("number | null", mapper.mapType(typeRef))
    }

    @Test
    fun `maps nullable String to string or null`() {
        val typeRef = LimeBasicTypeRef(TypeId.STRING, isNullable = true)
        assertEquals("string | null", mapper.mapType(typeRef))
    }

    @Test
    fun `maps List of Int to number array`() {
        val listType = LimeList(LimeBasicTypeRef(TypeId.INT32))
        val typeRef = LimeDirectTypeRef(listType)
        assertEquals("number[]", mapper.mapType(typeRef))
    }

    @Test
    fun `maps Set of String to Set of string`() {
        val setType = LimeSet(LimeBasicTypeRef(TypeId.STRING))
        val typeRef = LimeDirectTypeRef(setType)
        assertEquals("Set<string>", mapper.mapType(typeRef))
    }

    @Test
    fun `maps Map of String to Int`() {
        val mapType = LimeMap(LimeBasicTypeRef(TypeId.STRING), LimeBasicTypeRef(TypeId.INT32))
        val typeRef = LimeDirectTypeRef(mapType)
        assertEquals("Map<string, number>", mapper.mapType(typeRef))
    }

    @Test
    fun `maps nested nullable list`() {
        val listType = LimeList(LimeBasicTypeRef(TypeId.INT32, isNullable = true))
        val typeRef = LimeDirectTypeRef(listType, isNullable = true)
        assertEquals("(number | null)[] | null", mapper.mapType(typeRef))
    }

    @Test
    fun `maps Struct to its name`() {
        val struct = LimeStruct(LimePath(listOf("com", "example"), listOf("MyStruct")))
        val typeRef = LimeDirectTypeRef(struct)
        assertEquals("MyStruct", mapper.mapType(typeRef))
    }

    @Test
    fun `maps Enumeration to its name`() {
        val enumeration =
            LimeEnumeration(
                LimePath(listOf("com", "example"), listOf("MyEnum")),
                enumerators = listOf(LimeEnumerator(LimePath(listOf("com", "example"), listOf("MyEnum", "VALUE_A")))),
            )
        val typeRef = LimeDirectTypeRef(enumeration)
        assertEquals("MyEnum", mapper.mapType(typeRef))
    }

    @Test
    fun `maps Lambda to inline function type`() {
        val lambda =
            LimeLambda(
                LimePath(listOf("com", "example"), listOf("MyCallback")),
                parameters =
                    listOf(
                        LimeLambdaParameter(
                            LimeBasicTypeRef(TypeId.INT32),
                            LimePath(listOf("com", "example"), listOf("MyCallback", "call", "p0")),
                        ),
                    ),
                returnType = LimeReturnType(LimeBasicTypeRef(TypeId.VOID)),
            )
        val typeRef = LimeDirectTypeRef(lambda)
        assertEquals("(p0: number) => void", mapper.mapType(typeRef))
    }

    @Test
    fun `maps Lambda with multiple params`() {
        val lambda =
            LimeLambda(
                LimePath(listOf("com", "example"), listOf("MyCallback")),
                parameters =
                    listOf(
                        LimeLambdaParameter(
                            LimeBasicTypeRef(TypeId.STRING),
                            LimePath(listOf("com", "example"), listOf("MyCallback", "call", "error")),
                        ),
                        LimeLambdaParameter(
                            LimeBasicTypeRef(TypeId.INT32),
                            LimePath(listOf("com", "example"), listOf("MyCallback", "call", "result")),
                        ),
                    ),
                returnType = LimeReturnType(LimeBasicTypeRef(TypeId.VOID)),
            )
        val typeRef = LimeDirectTypeRef(lambda)
        assertEquals("(error: string, result: number) => void", mapper.mapType(typeRef))
    }

    @Test
    fun `maps Lambda with return type`() {
        val lambda =
            LimeLambda(
                LimePath(listOf("com", "example"), listOf("MyCallback")),
                parameters = emptyList(),
                returnType = LimeReturnType(LimeBasicTypeRef(TypeId.BOOLEAN)),
            )
        val typeRef = LimeDirectTypeRef(lambda)
        assertEquals("() => boolean", mapper.mapType(typeRef))
    }

    @Test
    fun `maps Struct fields correctly`() {
        val struct =
            LimeStruct(
                LimePath(listOf("com", "example"), listOf("Point")),
                fields =
                    listOf(
                        LimeField(
                            LimePath(listOf("com", "example"), listOf("Point", "x")),
                            typeRef = LimeBasicTypeRef(TypeId.DOUBLE),
                        ),
                        LimeField(
                            LimePath(listOf("com", "example"), listOf("Point", "y")),
                            typeRef = LimeBasicTypeRef(TypeId.DOUBLE),
                        ),
                    ),
            )
        val fields = mapper.mapStructFields(struct)
        assertEquals(2, fields.size)
        assertEquals("x", fields[0]["name"])
        assertEquals("number", fields[0]["type"])
        assertEquals("y", fields[1]["name"])
        assertEquals("number", fields[1]["type"])
    }

    @Test
    fun `maps Struct field with nullable type`() {
        val struct =
            LimeStruct(
                LimePath(listOf("com", "example"), listOf("Result")),
                fields =
                    listOf(
                        LimeField(
                            LimePath(listOf("com", "example"), listOf("Result", "value")),
                            typeRef = LimeBasicTypeRef(TypeId.INT32, isNullable = true),
                        ),
                    ),
            )
        val fields = mapper.mapStructFields(struct)
        assertEquals("number | null", fields[0]["type"])
        assertEquals(true, fields[0]["isNullable"])
    }

    @Test
    fun `maps all unsigned integer types to number`() {
        val unsignedTypes = listOf(TypeId.UINT8, TypeId.UINT16, TypeId.UINT32, TypeId.UINT64)
        unsignedTypes.forEach { typeId ->
            assertEquals("$typeId should map to number", "number", mapper.mapType(LimeBasicTypeRef(typeId)))
        }
    }

    @Test
    fun `maps Duration to number`() {
        val typeRef = LimeBasicTypeRef(TypeId.DURATION)
        assertEquals("number", mapper.mapType(typeRef))
    }
}
