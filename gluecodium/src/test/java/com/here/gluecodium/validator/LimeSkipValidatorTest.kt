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

package com.here.gluecodium.validator

import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeType.DART
import com.here.gluecodium.model.lime.LimeAttributeType.IMMUTABLE
import com.here.gluecodium.model.lime.LimeAttributeType.JAVA
import com.here.gluecodium.model.lime.LimeAttributeType.SWIFT
import com.here.gluecodium.model.lime.LimeAttributeValueType.SKIP
import com.here.gluecodium.model.lime.LimeAttributes
import com.here.gluecodium.model.lime.LimeBasicTypeRef
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeEnumerator
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimePath.Companion.EMPTY_PATH
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeValue
import io.mockk.mockk
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

@RunWith(Parameterized::class)
class LimeSkipValidatorTest(private val platformAttribute: LimeAttributeType?) {

    private val allElements = mutableMapOf<String, LimeElement>()
    private val limeModel = LimeModel(allElements, emptyList())

    private val validator = LimeSkipValidator(mockk(relaxed = true))

    @Test
    fun validateMutableStruct() {
        val attributesBuilder = LimeAttributes.Builder()
        if (platformAttribute != null) attributesBuilder.addAttribute(platformAttribute, SKIP)
        val limeField = LimeField(EMPTY_PATH, typeRef = LimeBasicTypeRef.INT, attributes = attributesBuilder.build())
        allElements[""] = LimeStruct(EMPTY_PATH, fields = listOf(limeField))

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateImmutableStruct() {
        val attributesBuilder = LimeAttributes.Builder()
        if (platformAttribute != null) attributesBuilder.addAttribute(platformAttribute, SKIP)
        val limeField = LimeField(EMPTY_PATH, typeRef = LimeBasicTypeRef.INT, attributes = attributesBuilder.build())
        allElements[""] = LimeStruct(
            EMPTY_PATH,
            fields = listOf(limeField),
            attributes = LimeAttributes.Builder().addAttribute(IMMUTABLE).build()
        )

        val expectedResult = platformAttribute == null
        assertEquals(expectedResult, validator.validate(limeModel))
    }

    @Test
    fun validateStructWithImmutableFields() {
        val immutableStruct = LimeStruct(
            EMPTY_PATH,
            attributes = LimeAttributes.Builder().addAttribute(IMMUTABLE).build()
        )
        val attributesBuilder = LimeAttributes.Builder()
        if (platformAttribute != null) attributesBuilder.addAttribute(platformAttribute, SKIP)
        val limeField =
            LimeField(EMPTY_PATH, typeRef = LimeDirectTypeRef(immutableStruct), attributes = attributesBuilder.build())
        allElements[""] = LimeStruct(EMPTY_PATH, fields = listOf(limeField))

        val expectedResult = platformAttribute == null
        assertEquals(expectedResult, validator.validate(limeModel))
    }

    @Test
    fun validateImmutableStructWithDefaultValue() {
        val attributesBuilder = LimeAttributes.Builder()
        if (platformAttribute != null) attributesBuilder.addAttribute(platformAttribute, SKIP)
        val limeField = LimeField(
            EMPTY_PATH,
            typeRef = LimeBasicTypeRef.INT,
            attributes = attributesBuilder.build(),
            defaultValue = LimeValue.ZERO
        )
        allElements[""] = LimeStruct(
            EMPTY_PATH,
            fields = listOf(limeField),
            attributes = LimeAttributes.Builder().addAttribute(IMMUTABLE).build()
        )

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateStructWithImmutableFieldsWithDefaultValue() {
        val immutableStruct = LimeStruct(
            EMPTY_PATH,
            attributes = LimeAttributes.Builder().addAttribute(IMMUTABLE).build()
        )
        val attributesBuilder = LimeAttributes.Builder()
        if (platformAttribute != null) attributesBuilder.addAttribute(platformAttribute, SKIP)
        val limeField = LimeField(
            EMPTY_PATH,
            typeRef = LimeDirectTypeRef(immutableStruct),
            attributes = attributesBuilder.build(),
            defaultValue = LimeValue.ZERO
        )
        allElements[""] = LimeStruct(EMPTY_PATH, fields = listOf(limeField))

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateEnumerator() {
        val attributesBuilder = LimeAttributes.Builder()
        if (platformAttribute != null) attributesBuilder.addAttribute(platformAttribute, SKIP)
        allElements[""] = LimeEnumerator(EMPTY_PATH, attributes = attributesBuilder.build())

        val expectedResult = platformAttribute == null
        assertEquals(expectedResult, validator.validate(limeModel))
    }

    companion object {
        @JvmStatic
        @Parameterized.Parameters
        fun testData() = listOf(arrayOf<LimeAttributeType?>(null), arrayOf(JAVA), arrayOf(SWIFT), arrayOf(DART))
    }
}
