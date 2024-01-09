/*
 * Copyright (C) 2016-2020 HERE Europe B.V.
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

import com.here.gluecodium.model.lime.LimeBasicTypeRef
import com.here.gluecodium.model.lime.LimeConstant
import com.here.gluecodium.model.lime.LimeConstantRef
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeEnumerator
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeModelLoaderException
import com.here.gluecodium.model.lime.LimePath.Companion.EMPTY_PATH
import com.here.gluecodium.model.lime.LimeValue
import io.mockk.mockk
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class LimeConstantRefsValidatorTest {
    private val allElements = mutableMapOf<String, LimeElement>()
    private val limeModel = LimeModel(allElements, emptyList())
    private val dummyEnumeratorRef =
        object : LimeConstantRef() {
            override val element = LimeEnumerator(EMPTY_PATH)
            override val typeRef = LimeBasicTypeRef.INT
        }
    private val throwingEnumeratorRef =
        object : LimeConstantRef() {
            override val element
                get() = throw LimeModelLoaderException("")
            override val typeRef = LimeBasicTypeRef.INT
        }

    private val validator = LimeConstantRefsValidator(mockk(relaxed = true))

    @Test
    fun validateFieldWithValidRef() {
        allElements[""] =
            LimeField(
                EMPTY_PATH,
                typeRef = LimeBasicTypeRef.INT,
                defaultValue = LimeValue.Constant(LimeBasicTypeRef.INT, dummyEnumeratorRef),
            )

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateFieldWithInvalidRef() {
        allElements[""] =
            LimeField(
                EMPTY_PATH,
                typeRef = LimeBasicTypeRef.INT,
                defaultValue = LimeValue.Constant(LimeBasicTypeRef.INT, throwingEnumeratorRef),
            )

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateConstantWithValidRef() {
        allElements[""] =
            LimeConstant(
                EMPTY_PATH,
                typeRef = LimeBasicTypeRef.INT,
                value = LimeValue.Constant(LimeBasicTypeRef.INT, dummyEnumeratorRef),
            )

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateConstantWithInvalidRef() {
        allElements[""] =
            LimeConstant(
                EMPTY_PATH,
                typeRef = LimeBasicTypeRef.INT,
                value = LimeValue.Constant(LimeBasicTypeRef.INT, throwingEnumeratorRef),
            )

        assertFalse(validator.validate(limeModel))
    }
}
