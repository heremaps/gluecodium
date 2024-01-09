/*
 * Copyright (C) 2016-2021 HERE Europe B.V.
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

package com.here.gluecodium.validator

import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributes
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeBasicTypeRef
import com.here.gluecodium.model.lime.LimeConstant
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeLambdaParameter
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimePath.Companion.EMPTY_PATH
import com.here.gluecodium.model.lime.LimeProperty
import com.here.gluecodium.model.lime.LimeReturnType
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeThrownType
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeValue
import io.mockk.mockk
import org.junit.Assert.assertEquals
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

@RunWith(Parameterized::class)
class LimeOptimizedListsValidatorTest(private val limeElement: LimeNamedElement, private val expectedResult: Boolean) {
    private val allElements = mutableMapOf<String, LimeElement>()
    private val limeModel = LimeModel(allElements, emptyList())

    private val validator = LimeOptimizedListsValidator(mockk(relaxed = true))

    @Test
    fun validateWithElement() {
        allElements[""] = limeElement

        assertEquals(expectedResult, validator.validate(limeModel))
    }

    companion object {
        private val optimizedAttributes = LimeAttributes.Builder().addAttribute(LimeAttributeType.OPTIMIZED).build()
        private val immutableAttributes = LimeAttributes.Builder().addAttribute(LimeAttributeType.IMMUTABLE).build()
        private val typeRef = LimeBasicTypeRef(LimeBasicType.TypeId.STRING)
        private val optimizedTypeRef = LimeBasicTypeRef(LimeBasicType.TypeId.STRING, attributes = optimizedAttributes)
        private val optimizedListTypeRef = LimeDirectTypeRef(LimeList(typeRef), attributes = optimizedAttributes)

        @JvmStatic
        @Parameterized.Parameters
        fun testData() =
            listOf(
                arrayOf(LimeConstant(EMPTY_PATH, typeRef = typeRef, value = LimeValue.ZERO), true),
                arrayOf(LimeConstant(EMPTY_PATH, typeRef = optimizedListTypeRef, value = LimeValue.ZERO), false),
                arrayOf(LimeTypeAlias(EMPTY_PATH, typeRef = typeRef), true),
                arrayOf(LimeTypeAlias(EMPTY_PATH, typeRef = optimizedListTypeRef), false),
                arrayOf(LimeException(EMPTY_PATH, errorType = typeRef), true),
                arrayOf(LimeException(EMPTY_PATH, errorType = optimizedListTypeRef), false),
                arrayOf(object : LimeContainerWithInheritance(EMPTY_PATH) {}, true),
                arrayOf(object : LimeContainerWithInheritance(EMPTY_PATH, parents = listOf(typeRef)) {}, true),
                arrayOf(object : LimeContainerWithInheritance(EMPTY_PATH, parents = listOf(optimizedListTypeRef)) {}, false),
                arrayOf(LimeLambda(EMPTY_PATH), true),
                arrayOf(LimeLambda(EMPTY_PATH, returnType = LimeReturnType(typeRef)), true),
                arrayOf(LimeLambda(EMPTY_PATH, returnType = LimeReturnType(optimizedListTypeRef)), false),
                arrayOf(LimeLambda(EMPTY_PATH, parameters = listOf(LimeLambdaParameter(typeRef, EMPTY_PATH))), true),
                arrayOf(LimeLambda(EMPTY_PATH, parameters = listOf(LimeLambdaParameter(optimizedListTypeRef, EMPTY_PATH))), false),
                arrayOf(LimeFunction(EMPTY_PATH), true),
                arrayOf(LimeFunction(EMPTY_PATH, parameters = listOf(LimeParameter(EMPTY_PATH, typeRef = typeRef))), true),
                arrayOf(
                    LimeFunction(
                        EMPTY_PATH,
                        parameters = listOf(LimeParameter(EMPTY_PATH, typeRef = optimizedListTypeRef)),
                    ),
                    false,
                ),
                arrayOf(LimeFunction(EMPTY_PATH, thrownType = LimeThrownType(typeRef)), true),
                arrayOf(LimeFunction(EMPTY_PATH, thrownType = LimeThrownType(optimizedListTypeRef)), false),
                arrayOf(LimeFunction(EMPTY_PATH, returnType = LimeReturnType(typeRef)), true),
                arrayOf(LimeFunction(EMPTY_PATH, returnType = LimeReturnType(optimizedTypeRef)), false),
                arrayOf(LimeFunction(EMPTY_PATH, returnType = LimeReturnType(optimizedListTypeRef)), true),
                arrayOf(LimeProperty(EMPTY_PATH, typeRef = typeRef, getter = LimeFunction(EMPTY_PATH)), true),
                arrayOf(LimeProperty(EMPTY_PATH, typeRef = optimizedTypeRef, getter = LimeFunction(EMPTY_PATH)), false),
                arrayOf(LimeProperty(EMPTY_PATH, typeRef = optimizedListTypeRef, getter = LimeFunction(EMPTY_PATH)), true),
                arrayOf(
                    LimeProperty(
                        EMPTY_PATH,
                        typeRef = optimizedListTypeRef,
                        getter = LimeFunction(EMPTY_PATH),
                        setter = LimeFunction(EMPTY_PATH),
                    ),
                    false,
                ),
                arrayOf(LimeStruct(EMPTY_PATH), true),
                arrayOf(LimeStruct(EMPTY_PATH, fields = listOf(LimeField(EMPTY_PATH, typeRef = typeRef))), true),
                arrayOf(LimeStruct(EMPTY_PATH, fields = listOf(LimeField(EMPTY_PATH, typeRef = optimizedListTypeRef))), false),
                arrayOf(
                    LimeStruct(
                        EMPTY_PATH,
                        fields = listOf(LimeField(EMPTY_PATH, typeRef = optimizedTypeRef)),
                        attributes = immutableAttributes,
                    ),
                    false,
                ),
                arrayOf(
                    LimeStruct(
                        EMPTY_PATH,
                        fields = listOf(LimeField(EMPTY_PATH, typeRef = optimizedListTypeRef)),
                        attributes = immutableAttributes,
                    ),
                    true,
                ),
            )
    }
}
