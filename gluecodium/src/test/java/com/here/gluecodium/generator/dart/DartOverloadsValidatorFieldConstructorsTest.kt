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

package com.here.gluecodium.generator.dart

import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeFieldConstructor
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeLazyTypeRef
import com.here.gluecodium.model.lime.LimePath.Companion.EMPTY_PATH
import com.here.gluecodium.model.lime.LimeStruct
import io.mockk.MockKAnnotations
import io.mockk.every
import io.mockk.impl.annotations.MockK
import io.mockk.mockk
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class DartOverloadsValidatorFieldConstructorsTest {
    private val allElements = mutableMapOf<String, LimeElement>()
    private val fc1 = LimeFieldConstructor(EMPTY_PATH, structRef = LimeLazyTypeRef("", allElements))
    private val fc2 = LimeFieldConstructor(EMPTY_PATH, structRef = LimeLazyTypeRef("", allElements))
    private val constructor = LimeFunction(EMPTY_PATH, isConstructor = true)
    private val limeStruct =
        LimeStruct(EMPTY_PATH, functions = listOf(constructor), fieldConstructors = listOf(fc1, fc2))

    @MockK private lateinit var nameResolver: DartNameResolver

    private lateinit var validator: DartOverloadsValidator

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)
        validator = DartOverloadsValidator(nameResolver, mockk(relaxed = true), true)
        allElements[""] = limeStruct
    }

    @Test
    fun validateTwoFieldConstructorsValid() {
        every { nameResolver.resolveName(fc1) } returns "foo"
        every { nameResolver.resolveName(fc2) } returns "bar"

        val result = validator.validate(allElements.values)

        assertTrue(result)
    }

    @Test
    fun validateTwoFieldConstructorsInvalid() {
        every { nameResolver.resolveName(fc1) } returns "foo"
        every { nameResolver.resolveName(fc2) } returns "foo"

        val result = validator.validate(allElements.values)

        assertFalse(result)
    }

    @Test
    fun validateFieldCustomConstructorsValid() {
        every { nameResolver.resolveName(fc1) } returns "foo"
        every { nameResolver.resolveName(constructor) } returns "bar"

        val result = validator.validate(allElements.values)

        assertTrue(result)
    }

    @Test
    fun validateFieldCustomConstructorsInvalid() {
        every { nameResolver.resolveName(fc1) } returns "foo"
        every { nameResolver.resolveName(constructor) } returns "foo"

        val result = validator.validate(allElements.values)

        assertFalse(result)
    }
}
