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

package com.here.gluecodium.generator.common.templates

import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeAttributes
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimePath
import io.mockk.every
import io.mockk.spyk
import io.mockk.verify
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4
import org.trimou.engine.MustacheTagType
import org.trimou.handlebars.Options

@RunWith(JUnit4::class)
class GetAttributeHelperTest {
    private val parameters = mutableListOf<Any>()
    private val options = spyk<Options>()
    private val limeElement = object : LimeNamedElement(LimePath.EMPTY_PATH) {}
    private val limeElementWithAttribute = object : LimeNamedElement(
        LimePath.EMPTY_PATH,
        attributes = LimeAttributes.Builder()
            .addAttribute(LimeAttributeType.DEPRECATED, LimeAttributeValueType.MESSAGE, "foobar")
            .build()
    ) {}

    private val helper = GetAttributeHelper()

    @Before
    fun beforeMocks() {
        every { options.parameters } returns parameters
        every { options.tagInfo.type } returns MustacheTagType.VARIABLE
    }

    @Test
    fun executeInvalidContext() {
        every { options.peek() } returns ""

        helper.execute(options)

        verify(exactly = 0) { options.append(any()) }
    }

    @Test
    fun executeNoParameters() {
        every { options.peek() } returns limeElement

        helper.execute(options)

        verify(exactly = 0) { options.append(any()) }
    }

    @Test
    fun executeOneParameterInvalidAttributeName() {
        every { options.peek() } returns limeElement
        parameters.add("foobar")

        helper.execute(options)

        verify(exactly = 0) { options.append(any()) }
    }

    @Test
    fun executeOneParameterNoAttribute() {
        every { options.peek() } returns limeElement
        parameters.add("deprecated")

        helper.execute(options)

        verify(exactly = 0) { options.append(any()) }
    }

    @Test
    fun executeOneParameterWithAttribute() {
        every { options.peek() } returns limeElementWithAttribute
        parameters.add("deprecated")

        helper.execute(options)

        verify(exactly = 1) { options.append("foobar") }
    }

    @Test
    fun executeTwoParametersInvalidElement() {
        parameters.add(2)
        parameters.add("deprecated")

        helper.execute(options)

        verify(exactly = 0) { options.append(any()) }
    }

    @Test
    fun executeTwoParametersNoAttribute() {
        parameters.add(limeElement)
        parameters.add("deprecated")

        helper.execute(options)

        verify(exactly = 0) { options.append(any()) }
    }

    @Test
    fun executeTwoParametersWithAttribute() {
        parameters.add(limeElementWithAttribute)
        parameters.add("deprecated")

        helper.execute(options)

        verify(exactly = 1) { options.append("foobar") }
    }

    @Test
    fun executeTwoParametersValueTypeNoAttribute() {
        every { options.peek() } returns limeElement
        parameters.add("cpp")
        parameters.add("name")

        helper.execute(options)

        verify(exactly = 0) { options.append(any()) }
    }

    @Test
    fun executeTwoParametersValueTypeWithAttribute() {
        every { options.peek() } returns limeElementWithAttribute
        parameters.add("deprecated")
        parameters.add("message")

        helper.execute(options)

        verify(exactly = 1) { options.append("foobar") }
    }

    @Test
    fun executeThreeParametersNoAttribute() {
        parameters.add(limeElement)
        parameters.add("cpp")
        parameters.add("name")

        helper.execute(options)

        verify(exactly = 0) { options.append(any()) }
    }

    @Test
    fun executeThreeParametersWithAttribute() {
        parameters.add(limeElementWithAttribute)
        parameters.add("deprecated")
        parameters.add("message")

        helper.execute(options)

        verify(exactly = 1) { options.append("foobar") }
    }
}
