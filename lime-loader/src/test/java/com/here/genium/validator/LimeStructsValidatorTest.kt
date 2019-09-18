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

import com.here.genium.model.lime.LimeAttributeType
import com.here.genium.model.lime.LimeAttributes
import com.here.genium.model.lime.LimeBasicTypeRef
import com.here.genium.model.lime.LimeClass
import com.here.genium.model.lime.LimeDirectTypeRef
import com.here.genium.model.lime.LimeElement
import com.here.genium.model.lime.LimeEnumeration
import com.here.genium.model.lime.LimeField
import com.here.genium.model.lime.LimeFunction
import com.here.genium.model.lime.LimeList
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
class LimeStructsValidatorTest {

    private val allElements = mutableMapOf<String, LimeElement>()
    private val limeModel = LimeModel(allElements, emptyList())

    private val equatableAttributes =
        LimeAttributes.Builder().addAttribute(LimeAttributeType.EQUATABLE).build()

    private val validator = LimeStructsValidator(mockk(relaxed = true))

    @Test
    fun validateEquatableWithBasicType() {
        val limeField = LimeField(EMPTY_PATH, typeRef = LimeBasicTypeRef.INT)
        allElements[""] =
            LimeStruct(EMPTY_PATH, attributes = equatableAttributes, fields = listOf(limeField))

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateEquatableWithEnumType() {
        val limeEnum = LimeEnumeration(EMPTY_PATH)
        val limeField = LimeField(EMPTY_PATH, typeRef = LimeDirectTypeRef(limeEnum))
        allElements[""] =
            LimeStruct(EMPTY_PATH, attributes = equatableAttributes, fields = listOf(limeField))

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateEquatableWithArrayType() {
        val limeArray = LimeList(LimeBasicTypeRef.INT)
        val limeField = LimeField(EMPTY_PATH, typeRef = LimeDirectTypeRef(limeArray))
        allElements[""] =
            LimeStruct(EMPTY_PATH, attributes = equatableAttributes, fields = listOf(limeField))

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateEquatableWithEquatableStructType() {
        val otherStruct = LimeStruct(EMPTY_PATH, attributes = equatableAttributes)
        val limeField = LimeField(EMPTY_PATH, typeRef = LimeDirectTypeRef(otherStruct))
        allElements[""] =
            LimeStruct(EMPTY_PATH, attributes = equatableAttributes, fields = listOf(limeField))

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateEquatableWithNonEquatableStructType() {
        val otherStruct = LimeStruct(EMPTY_PATH)
        val limeField = LimeField(EMPTY_PATH, typeRef = LimeDirectTypeRef(otherStruct))
        allElements[""] =
            LimeStruct(EMPTY_PATH, attributes = equatableAttributes, fields = listOf(limeField))

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateEquatableWithNonEquatableContainerType() {
        val limeContainer = LimeClass(EMPTY_PATH)
        val limeField = LimeField(EMPTY_PATH, typeRef = LimeDirectTypeRef(limeContainer))
        allElements[""] =
            LimeStruct(EMPTY_PATH, attributes = equatableAttributes, fields = listOf(limeField))

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateEquatableWithEquatableContainerType() {
        val limeContainer = LimeClass(EMPTY_PATH, attributes = equatableAttributes)
        val limeField = LimeField(EMPTY_PATH, typeRef = LimeDirectTypeRef(limeContainer))
        allElements[""] =
            LimeStruct(EMPTY_PATH, attributes = equatableAttributes, fields = listOf(limeField))

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateEquatableWithPointerEquatableContainerType() {
        val limeContainer = LimeClass(
            EMPTY_PATH,
            attributes =
                LimeAttributes.Builder().addAttribute(LimeAttributeType.POINTER_EQUATABLE).build()
        )
        val limeField = LimeField(EMPTY_PATH, typeRef = LimeDirectTypeRef(limeContainer))
        allElements[""] =
            LimeStruct(EMPTY_PATH, attributes = equatableAttributes, fields = listOf(limeField))

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateEquatableWithNoFields() {
        allElements[""] = LimeStruct(EMPTY_PATH, attributes = equatableAttributes)

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateConstructabilityWithNothing() {
        allElements[""] = LimeStruct(EMPTY_PATH)

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateConstructabilityWithFields() {
        val limeField = LimeField(EMPTY_PATH, typeRef = LimeBasicTypeRef.INT)
        allElements[""] = LimeStruct(EMPTY_PATH, fields = listOf(limeField))

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateConstructabilityWithInstanceFunctions() {
        val limeFunction = LimeFunction(EMPTY_PATH)
        allElements[""] = LimeStruct(EMPTY_PATH, functions = listOf(limeFunction))

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateConstructabilityWithStaticFunctions() {
        val limeFunction = LimeFunction(EMPTY_PATH, isStatic = true)
        allElements[""] = LimeStruct(EMPTY_PATH, functions = listOf(limeFunction))

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateConstructabilityWithInstanceFunctionsAndFields() {
        val limeField = LimeField(EMPTY_PATH, typeRef = LimeBasicTypeRef.INT)
        val limeFunction = LimeFunction(EMPTY_PATH)
        allElements[""] =
            LimeStruct(EMPTY_PATH, fields = listOf(limeField), functions = listOf(limeFunction))

        assertTrue(validator.validate(limeModel))
    }
}
