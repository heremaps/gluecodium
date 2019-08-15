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

package com.here.genium.validator

import com.here.genium.model.lime.LimeList
import com.here.genium.model.lime.LimeAttributeType
import com.here.genium.model.lime.LimeAttributes
import com.here.genium.model.lime.LimeBasicType
import com.here.genium.model.lime.LimeBasicTypeRef
import com.here.genium.model.lime.LimeContainer
import com.here.genium.model.lime.LimeDirectTypeRef
import com.here.genium.model.lime.LimeElement
import com.here.genium.model.lime.LimeEnumeration
import com.here.genium.model.lime.LimeField
import com.here.genium.model.lime.LimeMap
import com.here.genium.model.lime.LimeModel
import com.here.genium.model.lime.LimePath.Companion.EMPTY_PATH
import com.here.genium.model.lime.LimeSet
import com.here.genium.model.lime.LimeStruct
import com.here.genium.model.lime.LimeType
import com.here.genium.model.lime.LimeTypeDef
import io.mockk.mockk
import org.junit.Assert.assertEquals
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

@RunWith(Parameterized::class)
class LimeGenericTypesValidatorTest(
    private val limeType: LimeType,
    private val expectedResult: Boolean
) {

    private val allElements = mutableMapOf<String, LimeElement>()
    private val limeModel = LimeModel(allElements, emptyList())

    private val validator = LimeGenericTypesValidator(mockk(relaxed = true))

    @Test
    fun validateSetElementType() {
        val limeSet = LimeSet(LimeDirectTypeRef(limeType))
        allElements[""] = LimeField(EMPTY_PATH, typeRef = LimeDirectTypeRef(limeSet))

        assertEquals(expectedResult, validator.validate(limeModel))
    }

    @Test
    fun validateMapKeyType() {
        val limeMap =
            LimeMap(LimeDirectTypeRef(limeType), LimeBasicTypeRef(LimeBasicType.TypeId.VOID))
        allElements[""] = LimeField(EMPTY_PATH, typeRef = LimeDirectTypeRef(limeMap))

        assertEquals(expectedResult, validator.validate(limeModel))
    }

    companion object {
        @JvmStatic
        @Parameterized.Parameters
        fun testData() = listOf(
            arrayOf(LimeBasicType(LimeBasicType.TypeId.FLOAT), true),
            arrayOf(LimeBasicType(LimeBasicType.TypeId.BLOB), false),
            arrayOf(LimeBasicType(LimeBasicType.TypeId.DATE), false),
            arrayOf(LimeEnumeration(EMPTY_PATH), true),
            arrayOf(LimeList(LimeBasicTypeRef.INT), true),
            arrayOf(LimeSet(LimeBasicTypeRef.INT), true),
            arrayOf(LimeMap(LimeBasicTypeRef.INT, LimeBasicTypeRef.INT), true),
            arrayOf(LimeStruct(
                EMPTY_PATH,
                attributes =
                    LimeAttributes.Builder().addAttribute(LimeAttributeType.EQUATABLE).build()
            ), true),
            arrayOf(LimeContainer(
                EMPTY_PATH,
                type = LimeContainer.ContainerType.CLASS,
                attributes = LimeAttributes.Builder()
                    .addAttribute(LimeAttributeType.POINTER_EQUATABLE).build()
            ), true),
            arrayOf(LimeTypeDef(EMPTY_PATH, typeRef = LimeBasicTypeRef.INT), true)
        )
    }
}
