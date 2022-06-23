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

import com.here.gluecodium.model.lime.LimeBasicTypeRef
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeFunction
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
class LimeStructsValidatorTest {

    private val allElements = mutableMapOf<String, LimeElement>()
    private val limeModel = LimeModel(allElements, emptyList())

    private val validator = LimeStructsValidator(mockk(relaxed = true), strictMode = false)

    @Test
    fun validateEmptyStruct() {
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
