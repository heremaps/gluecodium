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
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeFieldConstructor
import com.here.gluecodium.model.lime.LimeFieldRef
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeLazyTypeRef
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimeSignatureResolver
import com.here.gluecodium.model.lime.LimeStruct
import io.mockk.mockk
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class LimeOverloadsValidatorFieldConstructorsTest {
    private val allElements = mutableMapOf<String, LimeElement>()
    private val fooPath = LimePath(emptyList(), listOf("foo"))
    private val fooRef = LimeLazyTypeRef("foo", allElements)
    private val fcPath1 = fooPath.child("", "1")
    private val fcPath2 = fooPath.child("", "2")
    private val weePath = fooPath.child("wee")
    private val limeFieldRef =
        object : LimeFieldRef() {
            override val field = LimeField(fooPath.child("bar"), typeRef = LimeBasicTypeRef.INT)
        }

    private val validatorNoCustomConstructors =
        LimeOverloadsValidator(LimeSignatureResolver(allElements), mockk(relaxed = true), false)
    private val validatorWithCustomConstructors =
        LimeOverloadsValidator(LimeSignatureResolver(allElements), mockk(relaxed = true), true)

    @Test
    fun validateTwoFieldConstructorsValid() {
        val fc1 = LimeFieldConstructor(fcPath1, structRef = fooRef, fieldRefs = listOf(limeFieldRef))
        val fc2 = LimeFieldConstructor(fcPath2, structRef = fooRef, fieldRefs = emptyList())
        allElements[fcPath1.toString()] = fc1
        allElements[fcPath2.toString()] = fc2
        allElements[fooPath.toString()] = LimeStruct(fooPath, fieldConstructors = listOf(fc1, fc2))

        val result1 = validatorNoCustomConstructors.validate(allElements.values)
        val result2 = validatorWithCustomConstructors.validate(allElements.values)

        assertTrue(result1)
        assertTrue(result2)
    }

    @Test
    fun validateTwoFieldConstructorsInvalid() {
        val fc1 = LimeFieldConstructor(fcPath1, structRef = fooRef, fieldRefs = listOf(limeFieldRef))
        val fc2 = LimeFieldConstructor(fcPath2, structRef = fooRef, fieldRefs = listOf(limeFieldRef))
        allElements[fcPath1.toString()] = fc1
        allElements[fcPath2.toString()] = fc2
        allElements[fooPath.toString()] = LimeStruct(fooPath, fieldConstructors = listOf(fc1, fc2))

        val result1 = validatorNoCustomConstructors.validate(allElements.values)
        val result2 = validatorWithCustomConstructors.validate(allElements.values)

        assertFalse(result1)
        assertFalse(result2)
    }

    @Test
    fun validateFieldCustomConstructorsValid() {
        val fieldConstructor = LimeFieldConstructor(fcPath1, structRef = fooRef, fieldRefs = listOf(limeFieldRef))
        val customConstructor = LimeFunction(weePath, isConstructor = true)
        allElements[fcPath1.toString()] = fieldConstructor
        allElements[weePath.toString()] = customConstructor
        allElements[fooPath.toString()] =
            LimeStruct(fooPath, fieldConstructors = listOf(fieldConstructor), functions = listOf(customConstructor))

        val result1 = validatorNoCustomConstructors.validate(allElements.values)
        val result2 = validatorWithCustomConstructors.validate(allElements.values)

        assertTrue(result1)
        assertTrue(result2)
    }

    @Test
    fun validateFieldCustomConstructorsInvalid() {
        val fieldConstructor = LimeFieldConstructor(fcPath1, structRef = fooRef, fieldRefs = listOf(limeFieldRef))
        val customConstructor =
            LimeFunction(
                weePath,
                isConstructor = true,
                parameters = listOf(LimeParameter(weePath.child("baz"), typeRef = LimeBasicTypeRef.INT)),
            )
        allElements[fcPath1.toString()] = fieldConstructor
        allElements[weePath.toString()] = customConstructor
        allElements[fooPath.toString()] =
            LimeStruct(fooPath, fieldConstructors = listOf(fieldConstructor), functions = listOf(customConstructor))

        val result1 = validatorNoCustomConstructors.validate(allElements.values)
        val result2 = validatorWithCustomConstructors.validate(allElements.values)

        assertTrue(result1)
        assertFalse(result2)
    }
}
