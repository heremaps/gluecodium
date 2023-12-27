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

package com.here.gluecodium.generator.dart

import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeAttributes
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeContainer
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimeStruct
import io.mockk.MockKAnnotations
import io.mockk.every
import io.mockk.impl.annotations.MockK
import io.mockk.mockk
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Assume.assumeTrue
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

@RunWith(Parameterized::class)
class DartOverloadsValidatorTest(factory: (List<LimeFunction>) -> LimeContainer, private val hasConstructors: Boolean) {
    private val fooFunction = LimeFunction(LimePath.EMPTY_PATH)
    private val barFunction = LimeFunction(LimePath.EMPTY_PATH)
    private val fooConstructor = LimeFunction(LimePath.EMPTY_PATH, isConstructor = true)
    private val barConstructor = LimeFunction(LimePath.EMPTY_PATH, isConstructor = true)
    private val functions = mutableListOf<LimeFunction>()
    private val dartDefaultAttributes =
        LimeAttributes.Builder()
            .addAttribute(LimeAttributeType.DART, LimeAttributeValueType.DEFAULT)
            .build()

    private val allElements = listOf(factory(functions))

    @MockK private lateinit var nameResolver: DartNameResolver

    private lateinit var validator: DartOverloadsValidator

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)
        validator = DartOverloadsValidator(nameResolver, mockk(relaxed = true), true)
    }

    @Test
    fun validateFunctionsNoOverloads() {
        every { nameResolver.resolveName(fooFunction) } returns "foo"
        every { nameResolver.resolveName(barFunction) } returns "bar"
        functions += fooFunction
        functions += barFunction

        assertTrue(validator.validate(allElements))
    }

    @Test
    fun validateFunctionsWithOverloads() {
        every { nameResolver.resolveName(fooFunction) } returns "foo"
        every { nameResolver.resolveName(barFunction) } returns "foo"
        functions += fooFunction
        functions += barFunction

        assertFalse(validator.validate(allElements))
    }

    @Test
    fun validateConstructorsNoOverloads() {
        assumeTrue(hasConstructors)

        every { nameResolver.resolveName(fooConstructor) } returns "foo"
        every { nameResolver.resolveName(barConstructor) } returns "bar"
        functions += fooConstructor
        functions += barConstructor

        assertTrue(validator.validate(allElements))
    }

    @Test
    fun validateConstructorsWithOverloads() {
        assumeTrue(hasConstructors)

        every { nameResolver.resolveName(fooConstructor) } returns "foo"
        every { nameResolver.resolveName(barConstructor) } returns "foo"
        functions += fooConstructor
        functions += barConstructor

        assertFalse(validator.validate(allElements))
    }

    @Test
    fun validateDefaultConstructorsNoOverloads() {
        assumeTrue(hasConstructors)

        val fooDefaultConstructor =
            LimeFunction(
                LimePath.EMPTY_PATH,
                isConstructor = true,
                attributes = dartDefaultAttributes,
            )
        every { nameResolver.resolveName(fooDefaultConstructor) } returns "foo"
        every { nameResolver.resolveName(barConstructor) } returns "foo"
        functions += fooDefaultConstructor
        functions += barConstructor

        assertTrue(validator.validate(allElements))
    }

    @Test
    fun validateDefaultConstructorsWithOverloads() {
        assumeTrue(hasConstructors)

        val fooDefaultConstructor =
            LimeFunction(
                LimePath.EMPTY_PATH,
                isConstructor = true,
                attributes = dartDefaultAttributes,
            )
        val barDefaultConstructor =
            LimeFunction(
                LimePath.EMPTY_PATH,
                isConstructor = true,
                attributes = dartDefaultAttributes,
            )
        every { nameResolver.resolveName(fooDefaultConstructor) } returns "foo"
        every { nameResolver.resolveName(barDefaultConstructor) } returns "bar"
        functions += fooDefaultConstructor
        functions += barDefaultConstructor

        assertFalse(validator.validate(allElements))
    }

    companion object {
        @JvmStatic
        @Parameterized.Parameters(name = "{0}")
        fun testData(): Collection<Array<Any>> =
            listOf(
                arrayOf({ functions: List<LimeFunction> -> LimeClass(LimePath.EMPTY_PATH, functions = functions) }, true),
                arrayOf({ functions: List<LimeFunction> -> LimeInterface(LimePath.EMPTY_PATH, functions = functions) }, false),
                arrayOf({ functions: List<LimeFunction> -> LimeStruct(LimePath.EMPTY_PATH, functions = functions) }, true),
            )
    }
}
