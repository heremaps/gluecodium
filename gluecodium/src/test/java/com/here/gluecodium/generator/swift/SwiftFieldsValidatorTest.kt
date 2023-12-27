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

package com.here.gluecodium.generator.swift

import com.here.gluecodium.model.lime.LimeAttributeType.DEPRECATED
import com.here.gluecodium.model.lime.LimeAttributes
import com.here.gluecodium.model.lime.LimeBasicTypeRef
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimePath.Companion.EMPTY_PATH
import com.here.gluecodium.model.lime.LimeValue
import io.mockk.MockKAnnotations
import io.mockk.mockk
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class SwiftFieldsValidatorTest {
    private lateinit var validator: SwiftFieldsValidator

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)
        validator = SwiftFieldsValidator(mockk(relaxed = true))
    }

    @Test
    fun validateFieldWithNothing() {
        val limeField = LimeField(EMPTY_PATH, typeRef = LimeBasicTypeRef.INT)

        assertTrue(validator.validate(listOf(limeField)))
    }

    @Test
    fun validateFieldWithDeprecatedOnly() {
        val limeField =
            LimeField(
                EMPTY_PATH,
                typeRef = LimeBasicTypeRef.INT,
                attributes = LimeAttributes.Builder().addAttribute(DEPRECATED).build(),
            )

        assertFalse(validator.validate(listOf(limeField)))
    }

    @Test
    fun validateFieldWithDefaultValueOnly() {
        val limeField =
            LimeField(
                EMPTY_PATH,
                typeRef = LimeBasicTypeRef.INT,
                defaultValue = LimeValue.ZERO,
            )

        assertTrue(validator.validate(listOf(limeField)))
    }

    @Test
    fun validateFieldWithDeprecatedAndDefaultValue() {
        val limeField =
            LimeField(
                EMPTY_PATH,
                typeRef = LimeBasicTypeRef.INT,
                attributes = LimeAttributes.Builder().addAttribute(DEPRECATED).build(),
                defaultValue = LimeValue.ZERO,
            )

        assertTrue(validator.validate(listOf(limeField)))
    }
}
