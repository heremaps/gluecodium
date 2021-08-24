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

package com.here.gluecodium.validator

import com.here.gluecodium.model.lime.LimeBasicTypeRef
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeFieldConstructor
import com.here.gluecodium.model.lime.LimeFieldRef
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeModelLoaderException
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimePath.Companion.EMPTY_PATH
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeValue
import io.mockk.mockk
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class LimeFieldConstructorsValidatorTest {

    private val allElements = mutableMapOf<String, LimeElement>()
    private val limeModel = LimeModel(allElements, emptyList())

    private val fooField = LimeField(LimePath(emptyList(), listOf("foo")), typeRef = LimeBasicTypeRef.INT)
    private val barField =
        LimeField(LimePath(emptyList(), listOf("bar")), typeRef = LimeBasicTypeRef.INT, defaultValue = LimeValue.ZERO)
    private val limeStruct = LimeStruct(EMPTY_PATH, fields = listOf(fooField, barField))
    private val structTypeRef = LimeDirectTypeRef(limeStruct)
    private val fooFieldRef = object : LimeFieldRef() { override val field = fooField }

    private val validator = LimeFieldConstructorsValidator(mockk(relaxed = true))

    @Test
    fun validateThrowingFieldRef() {
        val throwingFieldRef = object : LimeFieldRef() {
            override val field
                get() = throw LimeModelLoaderException("")
        }
        allElements[""] = LimeFieldConstructor(EMPTY_PATH, structRef = structTypeRef, fields = listOf(throwingFieldRef))

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateDuplicateEntries() {
        allElements[""] = LimeFieldConstructor(
            EMPTY_PATH,
            structRef = structTypeRef,
            fields = listOf(fooFieldRef, fooFieldRef)
        )

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateDefaultedOmitted() {
        allElements[""] = LimeFieldConstructor(EMPTY_PATH, structRef = structTypeRef, fields = listOf(fooFieldRef))

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateNonDefaultedOmitted() {
        allElements[""] = LimeFieldConstructor(
            EMPTY_PATH,
            structRef = structTypeRef,
            fields = listOf(object : LimeFieldRef() { override val field = barField })
        )

        assertFalse(validator.validate(limeModel))
    }
}
