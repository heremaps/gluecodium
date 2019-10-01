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

import com.here.gluecodium.model.lime.LimeAttributeType.CPP
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeAttributes
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimePath.Companion.EMPTY_PATH
import com.here.gluecodium.model.lime.LimeType
import io.mockk.mockk
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

@RunWith(Parameterized::class)
class LimeExternalTypesValidatorTest(private val attributeValueType: LimeAttributeValueType) {

    private val allElements = mutableMapOf<String, LimeElement>()
    private val limeModel = LimeModel(allElements, emptyList())

    private val validator = LimeExternalTypesValidator(mockk(relaxed = true))

    @Test
    fun validateAsExternalType() {
        allElements[""] = object : LimeType(
            EMPTY_PATH,
            attributes = LimeAttributes.Builder()
                .addAttribute(CPP, LimeAttributeValueType.EXTERNAL_TYPE)
                .addAttribute(CPP, attributeValueType)
                .build()
        ) {}

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateInExternalType() {
        allElements[""] = object : LimeType(
            EMPTY_PATH,
            attributes = LimeAttributes.Builder()
                .addAttribute(CPP, LimeAttributeValueType.EXTERNAL_TYPE)
                .build()
        ) {}
        allElements["foo"] = object : LimeNamedElement(
            LimePath(emptyList(), listOf("foo")),
            attributes = LimeAttributes.Builder()
                .addAttribute(CPP, attributeValueType)
                .build()
        ) {}

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateWithoutExternalType() {
        allElements[""] = object : LimeType(EMPTY_PATH) {}
        allElements["foo"] = object : LimeNamedElement(
            LimePath(emptyList(), listOf("foo")),
            attributes = LimeAttributes.Builder()
                .addAttribute(CPP, attributeValueType)
                .build()
        ) {}

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateWithCppName() {
        allElements[""] = object : LimeType(
            EMPTY_PATH,
            attributes = LimeAttributes.Builder()
                .addAttribute(CPP, LimeAttributeValueType.EXTERNAL_TYPE)
                .addAttribute(CPP, LimeAttributeValueType.NAME)
                .addAttribute(CPP, attributeValueType)
                .build()
        ) {}

        assertFalse(validator.validate(limeModel))
    }

    companion object {
        @JvmStatic
        @Parameterized.Parameters
        fun testData() = listOf(
            arrayOf(LimeAttributeValueType.EXTERNAL_NAME),
            arrayOf(LimeAttributeValueType.EXTERNAL_GETTER),
            arrayOf(LimeAttributeValueType.EXTERNAL_SETTER)
        )
    }
}
