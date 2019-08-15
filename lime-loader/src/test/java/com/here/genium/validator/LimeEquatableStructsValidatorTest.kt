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
import com.here.genium.model.lime.LimeBasicTypeRef
import com.here.genium.model.lime.LimeContainer
import com.here.genium.model.lime.LimeDirectTypeRef
import com.here.genium.model.lime.LimeElement
import com.here.genium.model.lime.LimeEnumeration
import com.here.genium.model.lime.LimeField
import com.here.genium.model.lime.LimeModel
import com.here.genium.model.lime.LimePath.Companion.EMPTY_PATH
import com.here.genium.model.lime.LimeStruct
import io.mockk.mockk
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class LimeEquatableStructsValidatorTest {

    private val allElements = mutableMapOf<String, LimeElement>()
    private val limeModel = LimeModel(allElements, emptyList())

    private val equatableAttributes =
        LimeAttributes.Builder().addAttribute(LimeAttributeType.EQUATABLE).build()

    private val validator = LimeEquatableStructsValidator(mockk(relaxed = true))

    @Test
    fun validateWithBasicType() {
        val limeField = LimeField(EMPTY_PATH, typeRef = LimeBasicTypeRef.INT)
        allElements[""] =
            LimeStruct(EMPTY_PATH, attributes = equatableAttributes, fields = listOf(limeField))

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateWithEnumType() {
        val limeEnum = LimeEnumeration(EMPTY_PATH)
        val limeField = LimeField(EMPTY_PATH, typeRef = LimeDirectTypeRef(limeEnum))
        allElements[""] =
            LimeStruct(EMPTY_PATH, attributes = equatableAttributes, fields = listOf(limeField))

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateWithArrayType() {
        val limeArray = LimeList(LimeBasicTypeRef.INT)
        val limeField = LimeField(EMPTY_PATH, typeRef = LimeDirectTypeRef(limeArray))
        allElements[""] =
            LimeStruct(EMPTY_PATH, attributes = equatableAttributes, fields = listOf(limeField))

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateWithEquatableStructType() {
        val otherStruct = LimeStruct(EMPTY_PATH, attributes = equatableAttributes)
        val limeField = LimeField(EMPTY_PATH, typeRef = LimeDirectTypeRef(otherStruct))
        allElements[""] =
            LimeStruct(EMPTY_PATH, attributes = equatableAttributes, fields = listOf(limeField))

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateWithNonEquatableStructType() {
        val otherStruct = LimeStruct(EMPTY_PATH)
        val limeField = LimeField(EMPTY_PATH, typeRef = LimeDirectTypeRef(otherStruct))
        allElements[""] =
            LimeStruct(EMPTY_PATH, attributes = equatableAttributes, fields = listOf(limeField))

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateWithNonEquatableContainerType() {
        val limeContainer = LimeContainer(EMPTY_PATH, type = LimeContainer.ContainerType.CLASS)
        val limeField = LimeField(EMPTY_PATH, typeRef = LimeDirectTypeRef(limeContainer))
        allElements[""] =
            LimeStruct(EMPTY_PATH, attributes = equatableAttributes, fields = listOf(limeField))

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateWithEquatableContainerType() {
        val limeContainer = LimeContainer(
            EMPTY_PATH,
            type = LimeContainer.ContainerType.CLASS,
            attributes = equatableAttributes
        )
        val limeField = LimeField(EMPTY_PATH, typeRef = LimeDirectTypeRef(limeContainer))
        allElements[""] =
            LimeStruct(EMPTY_PATH, attributes = equatableAttributes, fields = listOf(limeField))

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateWithPointerEquatableContainerType() {
        val limeContainer = LimeContainer(
            EMPTY_PATH,
            type = LimeContainer.ContainerType.CLASS,
            attributes =
                LimeAttributes.Builder().addAttribute(LimeAttributeType.POINTER_EQUATABLE).build()
        )
        val limeField = LimeField(EMPTY_PATH, typeRef = LimeDirectTypeRef(limeContainer))
        allElements[""] =
            LimeStruct(EMPTY_PATH, attributes = equatableAttributes, fields = listOf(limeField))

        assertTrue(validator.validate(limeModel))
    }
}
