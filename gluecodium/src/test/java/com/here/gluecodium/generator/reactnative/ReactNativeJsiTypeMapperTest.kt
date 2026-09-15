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

import com.here.gluecodium.model.lime.LimeBasicType.TypeId
import com.here.gluecodium.model.lime.LimeBasicTypeRef
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeLambdaParameter
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimeReturnType
import com.here.gluecodium.model.lime.LimeStruct
import org.junit.Assert.assertEquals
import org.junit.Test

class ReactNativeJsiTypeMapperTest {
    private val mapper = ReactNativeJsiTypeMapper()

    @Test
    fun `maps all numerics to double`() {
        val numericTypes =
            listOf(
                TypeId.INT8,
                TypeId.INT16,
                TypeId.INT32,
                TypeId.INT64,
                TypeId.UINT8,
                TypeId.UINT16,
                TypeId.UINT32,
                TypeId.UINT64,
                TypeId.FLOAT,
                TypeId.DOUBLE,
            )
        numericTypes.forEach { typeId ->
            assertEquals("$typeId should map to double", "double", mapper.mapType(LimeBasicTypeRef(typeId)))
        }
    }

    @Test
    fun `maps Boolean to bool`() {
        assertEquals("bool", mapper.mapType(LimeBasicTypeRef(TypeId.BOOLEAN)))
    }

    @Test
    fun `maps String to jsi String`() {
        assertEquals("jsi::String", mapper.mapType(LimeBasicTypeRef(TypeId.STRING)))
    }

    @Test
    fun `maps Void to void`() {
        assertEquals("void", mapper.mapType(LimeBasicTypeRef(TypeId.VOID)))
    }

    @Test
    fun `maps Struct to jsi String handle`() {
        val struct = LimeStruct(LimePath(listOf("com"), listOf("Point")))
        assertEquals("jsi::String", mapper.mapType(LimeDirectTypeRef(struct)))
    }

    @Test
    fun `maps Lambda to jsi Function`() {
        val lambda =
            LimeLambda(
                LimePath(listOf("com"), listOf("MyCallback")),
                parameters =
                    listOf(
                        LimeLambdaParameter(
                            LimeBasicTypeRef(TypeId.INT32),
                            LimePath(listOf("com"), listOf("MyCallback", "call", "p0")),
                        ),
                    ),
                returnType = LimeReturnType(LimeBasicTypeRef(TypeId.VOID)),
            )
        assertEquals("jsi::Function", mapper.mapType(LimeDirectTypeRef(lambda)))
    }

    @Test
    fun `maps Interface parameter to jsi Function`() {
        val iface =
            LimeInterface(
                LimePath(listOf("com"), listOf("MyCallback")),
                functions =
                    listOf(
                        LimeFunction(
                            LimePath(listOf("com"), listOf("MyCallback", "onResult")),
                            parameters =
                                listOf(
                                    LimeParameter(
                                        LimePath(listOf("com"), listOf("MyCallback", "onResult", "result")),
                                        typeRef = LimeBasicTypeRef(TypeId.INT32),
                                    ),
                                ),
                            returnType = LimeReturnType(LimeBasicTypeRef(TypeId.VOID)),
                        ),
                    ),
            )
        assertEquals("jsi::Function", mapper.mapType(LimeDirectTypeRef(iface)))
    }

    @Test
    fun `maps nullable numeric to std optional double`() {
        assertEquals(
            "std::optional<double>",
            mapper.mapType(LimeBasicTypeRef(TypeId.INT32, isNullable = true)),
        )
    }

    @Test
    fun `maps nullable String to std optional jsi String`() {
        assertEquals(
            "std::optional<jsi::String>",
            mapper.mapType(LimeBasicTypeRef(TypeId.STRING, isNullable = true)),
        )
    }
}
