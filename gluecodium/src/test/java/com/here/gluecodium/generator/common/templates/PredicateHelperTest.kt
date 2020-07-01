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

package com.here.gluecodium.generator.common.templates

import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimePath
import io.mockk.every
import io.mockk.spyk
import io.mockk.verify
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.Parameterized
import org.trimou.handlebars.Options

@RunWith(Parameterized::class)
class PredicateHelperTest(equality: Boolean) {
    private val parameters = mutableListOf<Any>()
    private val options = spyk<Options>()
    private val limeElement = object : LimeNamedElement(LimePath.EMPTY_PATH) {}
    private val otherLimeNamedElement = object : LimeNamedElement(LimePath.EMPTY_PATH) {}

    private val helper = PredicateHelper(equality)
    private val correctElementExpected = if (equality) 1 else 0
    private val incorrectElementExpected = if (equality) 0 else 1

    @Before
    fun setUp() {
        helper.predicates["foo"] = { it === limeElement }
        every { options.parameters } returns parameters
    }

    @Test
    fun executeNoParameters() {
        every { options.peek() } returns limeElement

        helper.execute(options)

        verify(exactly = 0) { options.fn() }
    }

    @Test
    fun executeOneParameterInvalidPredicateName() {
        every { options.peek() } returns limeElement
        parameters.add("foobar")

        helper.execute(options)

        verify(exactly = 0) { options.fn() }
    }

    @Test
    fun executeOneParameterCorrectElement() {
        every { options.peek() } returns limeElement
        parameters.add("foo")

        helper.execute(options)

        verify(exactly = correctElementExpected) { options.fn() }
    }

    @Test
    fun executeOneParameterIncorrectElement() {
        every { options.peek() } returns otherLimeNamedElement
        parameters.add("foo")

        helper.execute(options)

        verify(exactly = incorrectElementExpected) { options.fn() }
    }

    @Test
    fun executeTwoParametersInvalidPredicateName() {
        parameters.add(limeElement)
        parameters.add("foobar")

        helper.execute(options)

        verify(exactly = 0) { options.fn() }
    }

    @Test
    fun executeTwoParametersCorrectElement() {
        parameters.add(limeElement)
        parameters.add("foo")

        helper.execute(options)

        verify(exactly = correctElementExpected) { options.fn() }
    }

    @Test
    fun executeTwoParametersIncorrectElement() {
        parameters.add(otherLimeNamedElement)
        parameters.add("foo")

        helper.execute(options)

        verify(exactly = incorrectElementExpected) { options.fn() }
    }

    companion object {
        @JvmStatic
        @Parameterized.Parameters
        fun testData(): Collection<Array<Any>> = listOf(arrayOf<Any>(false), arrayOf<Any>(true))
    }
}
