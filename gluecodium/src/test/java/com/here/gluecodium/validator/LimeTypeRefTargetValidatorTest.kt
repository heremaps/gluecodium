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
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimePath.Companion.EMPTY_PATH
import com.here.gluecodium.model.lime.LimeReturnType
import com.here.gluecodium.model.lime.LimeThrownType
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeTypesCollection
import io.mockk.mockk
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class LimeTypeRefTargetValidatorTest {

    private val allElements = mutableMapOf<String, LimeElement>()
    private val limeModel = LimeModel(allElements, emptyList())

    private val validator = LimeTypeRefTargetValidator(mockk(relaxed = true))

    @Test
    fun validateClassReference() {
        val limeClass = LimeClass(EMPTY_PATH)
        allElements[""] = LimeField(EMPTY_PATH, typeRef = LimeDirectTypeRef(limeClass))

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateTypesReference() {
        val limeTypesCollection = LimeTypesCollection(EMPTY_PATH)
        allElements[""] = LimeField(EMPTY_PATH, typeRef = LimeDirectTypeRef(limeTypesCollection))

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateExceptionTypeInThrowsClause() {
        val limeException = LimeException(EMPTY_PATH, errorType = LimeBasicTypeRef.INT)
        allElements[""] =
            LimeFunction(EMPTY_PATH, thrownType = LimeThrownType(LimeDirectTypeRef(limeException)))

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateExceptionTypeInReturnType() {
        val limeException = LimeException(EMPTY_PATH, errorType = LimeBasicTypeRef.INT)
        allElements[""] =
            LimeFunction(EMPTY_PATH, returnType = LimeReturnType(LimeDirectTypeRef(limeException)))

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateExceptionTypeInTypeAlias() {
        val limeException = LimeException(EMPTY_PATH, errorType = LimeBasicTypeRef.INT)
        allElements[""] = LimeTypeAlias(EMPTY_PATH, typeRef = LimeDirectTypeRef(limeException))

        assertFalse(validator.validate(limeModel))
    }
}
