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

import com.here.genium.model.lime.LimeBasicTypeRef
import com.here.genium.model.lime.LimeClass
import com.here.genium.model.lime.LimeDirectTypeRef
import com.here.genium.model.lime.LimeElement
import com.here.genium.model.lime.LimeEnumeration
import com.here.genium.model.lime.LimeException
import com.here.genium.model.lime.LimeFunction
import com.here.genium.model.lime.LimeModel
import com.here.genium.model.lime.LimePath
import com.here.genium.model.lime.LimePath.Companion.EMPTY_PATH
import com.here.genium.model.lime.LimeThrownType
import com.here.genium.model.lime.LimeTypeAlias
import io.mockk.mockk
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class LimeFunctionsValidatorThrowsTest {

    private val fooPath = LimePath(emptyList(), listOf("foo"))
    private val barPath = fooPath.child("bar")

    private val allElements =
        mutableMapOf<String, LimeElement>(fooPath.toString() to LimeClass(fooPath))
    private val limeModel = LimeModel(allElements, emptyList())

    private val validator = LimeFunctionsValidator(mockk(relaxed = true))

    @Test
    fun validateWithExceptionType() {
        val limeException =
            LimeException(EMPTY_PATH, errorEnum = LimeDirectTypeRef(LimeEnumeration(EMPTY_PATH)))
        allElements[""] =
            LimeFunction(barPath, thrownType = LimeThrownType(LimeDirectTypeRef(limeException)))

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateWithAliasedExceptionType() {
        val limeException =
            LimeException(EMPTY_PATH, errorEnum = LimeDirectTypeRef(LimeEnumeration(EMPTY_PATH)))
        val limeTypeAlias = LimeTypeAlias(EMPTY_PATH, typeRef = LimeDirectTypeRef(limeException))
        allElements[""] =
            LimeFunction(barPath, thrownType = LimeThrownType(LimeDirectTypeRef(limeTypeAlias)))

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateWithInvalidType() {
        allElements[""] =
            LimeFunction(barPath, thrownType = LimeThrownType(LimeBasicTypeRef.INT))

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateWithAliasedInvalidType() {
        val limeTypeAlias = LimeTypeAlias(EMPTY_PATH, typeRef = LimeBasicTypeRef.INT)
        allElements[""] =
            LimeFunction(barPath, thrownType = LimeThrownType(LimeDirectTypeRef(limeTypeAlias)))

        assertFalse(validator.validate(limeModel))
    }
}
