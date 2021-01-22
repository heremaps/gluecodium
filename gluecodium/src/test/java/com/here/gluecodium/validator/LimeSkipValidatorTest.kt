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

import com.here.gluecodium.model.lime.LimeAttributeType.DART
import com.here.gluecodium.model.lime.LimeAttributeType.JAVA
import com.here.gluecodium.model.lime.LimeAttributeType.SWIFT
import com.here.gluecodium.model.lime.LimeAttributeValueType.SKIP
import com.here.gluecodium.model.lime.LimeAttributes
import com.here.gluecodium.model.lime.LimeBasicTypeRef
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeEnumerator
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimePath.Companion.EMPTY_PATH
import io.mockk.mockk
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class LimeSkipValidatorTest {
    private val allElements = mutableMapOf<String, LimeElement>()
    private val limeModel = LimeModel(allElements, emptyList())

    private val validator = LimeSkipValidator(mockk(relaxed = true))

    @Test
    fun validateFieldWithNoAttributes() {
        allElements[""] = LimeField(EMPTY_PATH, typeRef = LimeBasicTypeRef.INT)

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateFieldWithJavaSkipAttribute() {
        allElements[""] = LimeField(
            EMPTY_PATH,
            typeRef = LimeBasicTypeRef.INT,
            attributes = LimeAttributes.Builder().addAttribute(JAVA, SKIP).build()
        )

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateFieldWithSwiftSkipAttribute() {
        allElements[""] = LimeField(
            EMPTY_PATH,
            typeRef = LimeBasicTypeRef.INT,
            attributes = LimeAttributes.Builder().addAttribute(SWIFT, SKIP).build()
        )

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateFieldWithDartSkipAttribute() {
        allElements[""] = LimeField(
            EMPTY_PATH,
            typeRef = LimeBasicTypeRef.INT,
            attributes = LimeAttributes.Builder().addAttribute(DART, SKIP).build()
        )

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateEnumeratorWithNoAttributes() {
        allElements[""] = LimeEnumerator(EMPTY_PATH)

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateEnumeratorWithJavaSkipAttribute() {
        allElements[""] = LimeEnumerator(
            EMPTY_PATH,
            attributes = LimeAttributes.Builder().addAttribute(JAVA, SKIP).build()
        )

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateEnumeratorWithSwiftSkipAttribute() {
        allElements[""] = LimeEnumerator(
            EMPTY_PATH,
            attributes = LimeAttributes.Builder().addAttribute(SWIFT, SKIP).build()
        )

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateEnumeratorWithDartSkipAttribute() {
        allElements[""] = LimeEnumerator(
            EMPTY_PATH,
            attributes = LimeAttributes.Builder().addAttribute(DART, SKIP).build()
        )

        assertFalse(validator.validate(limeModel))
    }
}
