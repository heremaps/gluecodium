/*
 * Copyright (C) 2016-2022 HERE Europe B.V.
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

import com.here.gluecodium.model.lime.LimeAttributeType.ASYNC
import com.here.gluecodium.model.lime.LimeAttributes
import com.here.gluecodium.model.lime.LimeBasicTypeRef
import com.here.gluecodium.model.lime.LimeContainer
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimePath.Companion.EMPTY_PATH
import com.here.gluecodium.model.lime.LimeProperty
import io.mockk.mockk
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class LimeAsyncValidatorTest {

    private val allElements = mutableMapOf<String, LimeElement>()
    private val limeModel = LimeModel(allElements, emptyList())

    private val asyncAttributes = LimeAttributes.Builder().addAttribute(ASYNC).build()

    private val validator = LimeAsyncValidator(mockk(relaxed = true))

    @Test
    fun validateNoFunctions() {
        allElements[""] = object : LimeContainer(EMPTY_PATH) {}

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateFunction() {
        val syncFunction = LimeFunction(EMPTY_PATH)
        allElements[""] = object : LimeContainer(EMPTY_PATH, functions = listOf(syncFunction)) {}

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateFunctionInInterface() {
        val syncFunction = LimeFunction(EMPTY_PATH)
        allElements[""] = LimeInterface(EMPTY_PATH, functions = listOf(syncFunction))

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateAsyncFunction() {
        val asyncFunction = LimeFunction(EMPTY_PATH, attributes = asyncAttributes)
        allElements[""] = object : LimeContainer(EMPTY_PATH, functions = listOf(asyncFunction)) {}

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateAsyncFunctionInInterface() {
        val asyncFunction = LimeFunction(EMPTY_PATH, attributes = asyncAttributes)
        allElements[""] = LimeInterface(EMPTY_PATH, functions = listOf(asyncFunction))

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateConstructor() {
        val syncConstructor = LimeFunction(EMPTY_PATH, isConstructor = true)
        allElements[""] = object : LimeContainer(EMPTY_PATH, functions = listOf(syncConstructor)) {}

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateAsyncConstructor() {
        val asyncConstructor = LimeFunction(EMPTY_PATH, attributes = asyncAttributes, isConstructor = true)
        allElements[""] = object : LimeContainer(EMPTY_PATH, functions = listOf(asyncConstructor)) {}

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateProperty() {
        allElements[""] = LimeProperty(EMPTY_PATH, typeRef = LimeBasicTypeRef.INT, getter = LimeFunction(EMPTY_PATH))

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateAsyncProperty() {
        allElements[""] = LimeProperty(
            EMPTY_PATH,
            typeRef = LimeBasicTypeRef.INT,
            getter = LimeFunction(EMPTY_PATH),
            attributes = asyncAttributes
        )

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateLambda() {
        allElements[""] = LimeLambda(EMPTY_PATH)

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateAsyncLambda() {
        allElements[""] = LimeLambda(EMPTY_PATH, attributes = asyncAttributes)

        assertFalse(validator.validate(limeModel))
    }
}
