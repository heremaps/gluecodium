/*
 * Copyright (C) 2016-2025 HERE Europe B.V.
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
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeAttributes
import com.here.gluecodium.model.lime.LimeBasicTypeRef
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeFieldConstructor
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimePath.Companion.EMPTY_PATH
import com.here.gluecodium.model.lime.LimeStruct
import io.mockk.mockk
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class LimeKotlinDataClassValidatorTest {
    private val allElements = mutableMapOf<String, LimeElement>()
    private val limeModel = LimeModel(allElements, emptyList())

    private val dataClassOnlyAttributes =
        LimeAttributes.Builder()
            .addAttribute(LimeAttributeType.KOTLIN, LimeAttributeValueType.DATA_CLASS)
            .build()

    private val dataClassAttributes =
        LimeAttributes.Builder()
            .addAttribute(LimeAttributeType.KOTLIN, LimeAttributeValueType.DATA_CLASS)
            .addAttribute(LimeAttributeType.IMMUTABLE)
            .build()

    private val validator = LimeKotlinDataClassValidator(mockk(relaxed = true))

    @Test
    fun validateStructWithDataClassAndImmutableAttributesSucceeds() {
        allElements[""] = LimeStruct(EMPTY_PATH, attributes = dataClassAttributes)

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateStructWithDataClassAttributeButWithoutImmutableFails() {
        allElements[""] = LimeStruct(EMPTY_PATH, attributes = dataClassOnlyAttributes)

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateClassWithDataClassAttributeFails() {
        allElements[""] = LimeClass(EMPTY_PATH, attributes = dataClassAttributes)

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateInterfaceWithDataClassAttributeFails() {
        allElements[""] = LimeInterface(EMPTY_PATH, attributes = dataClassAttributes)

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateClassWithoutDataClassAttributeSucceeds() {
        allElements[""] = LimeClass(EMPTY_PATH)

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateClassWithOtherKotlinAttributeSucceeds() {
        val otherAttributes =
            LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.KOTLIN, LimeAttributeValueType.CONST)
                .build()
        allElements[""] = LimeClass(EMPTY_PATH, attributes = otherAttributes)

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateMultipleClassesWithDataClassAttributeAllFail() {
        val limeField = LimeField(EMPTY_PATH, typeRef = LimeBasicTypeRef.INT)
        allElements["a"] = LimeClass(EMPTY_PATH, attributes = dataClassAttributes)
        allElements["b"] =
            LimeStruct(EMPTY_PATH, attributes = dataClassAttributes, fields = listOf(limeField))

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateStructWithDataClassAttributeAndExplicitConstructorFails() {
        val explicitConstructor = LimeFunction(EMPTY_PATH, isConstructor = true)
        allElements[""] =
            LimeStruct(EMPTY_PATH, attributes = dataClassAttributes, functions = listOf(explicitConstructor))

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateStructWithDataClassAttributeAndFieldConstructorFails() {
        val fieldConstructor = LimeFieldConstructor(EMPTY_PATH, structRef = LimeBasicTypeRef.INT)
        allElements[""] =
            LimeStruct(EMPTY_PATH, attributes = dataClassAttributes, fieldConstructors = listOf(fieldConstructor))

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateStructWithDataClassAttributeAndNoConstructorsSucceeds() {
        allElements[""] = LimeStruct(EMPTY_PATH, attributes = dataClassAttributes, fieldConstructors = emptyList())

        assertTrue(validator.validate(limeModel))
    }
}
