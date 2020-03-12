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

import com.here.gluecodium.generator.common.NameResolver
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
class NameResolverHelperTest {
    private val parameters = mutableListOf<Any>()
    private val options = spyk<Options>()
    private val genericElement = object : Any() {}

    private val helper = NameResolverHelper()

    @Before
    fun setUp() {
        helper.nameResolvers[""] = object : NameResolver {
            override fun resolveName(element: Any) =
                if (element === genericElement) "foo" else "bar"
        }
        every { options.parameters } returns parameters
        every { options.tagInfo.type } returns MustacheTagType.VARIABLE
    }

    @Test
    fun executeNoDefaultResolver() {
        every { options.peek() } returns genericElement
        helper.nameResolvers.clear()

        helper.execute(options)

        verify(exactly = 0) { options.append(any()) }
    }

    @Test
    fun executeNoParameters() {
        every { options.peek() } returns genericElement

        helper.execute(options)

        verify(exactly = 1) { options.append("foo") }
    }

    @Test
    fun executeStringParameter() {
        every { options.peek() } returns genericElement
        parameters.add("nonsense")
        helper.nameResolvers["nonsense"] = object : NameResolver {
            override fun resolveName(element: Any) =
                if (element === genericElement) "baz" else "fizz"
        }

        helper.execute(options)

        verify(exactly = 1) { options.append("baz") }
    }

    @Test
    fun executeStringParameterInvalidResolver() {
        every { options.peek() } returns genericElement
        parameters.add("nonsense")

        helper.execute(options)

        verify(exactly = 0) { options.append(any()) }
    }

    @Test
    fun executeNonStringParameter() {
        parameters.add(genericElement)

        helper.execute(options)

        verify(exactly = 1) { options.append("foo") }
    }

    @Test
    fun executeTwoParameters() {
        parameters.add(genericElement)
        parameters.add("nonsense")
        helper.nameResolvers["nonsense"] = object : NameResolver {
            override fun resolveName(element: Any) =
                if (element === genericElement) "baz" else "fizz"
        }

        helper.execute(options)

        verify(exactly = 1) { options.append("baz") }
    }

    @Test
    fun executeTwoParametersInvalidResolver() {
        parameters.add(genericElement)
        parameters.add("nonsense")

        helper.execute(options)

        verify(exactly = 0) { options.append(any()) }
    }

    @Test
    fun executeThreeParametersInvalidSubKey() {
        parameters.add(genericElement)
        parameters.add("nonsense")
        parameters.add("foo")
        helper.nameResolvers["nonsense"] = object : NameResolver {
            override fun resolveName(element: Any) =
                if (element === genericElement) "baz" else "fizz"
        }

        helper.execute(options)

        verify(exactly = 1) { options.append("baz") }
    }

    @Test
    fun executeThreeParametersGetterSubKey() {
        parameters.add(genericElement)
        parameters.add("nonsense")
        parameters.add("getter")
        helper.nameResolvers["nonsense"] = object : NameResolver {
            override fun resolveName(element: Any) = throw IllegalArgumentException()
            override fun resolveGetterName(element: Any) =
                if (element === genericElement) "baz" else "fizz"
        }

        helper.execute(options)

        verify(exactly = 1) { options.append("baz") }
    }

    @Test
    fun executeThreeParametersSetterSubKey() {
        parameters.add(genericElement)
        parameters.add("nonsense")
        parameters.add("setter")
        helper.nameResolvers["nonsense"] = object : NameResolver {
            override fun resolveName(element: Any) = throw IllegalArgumentException()
            override fun resolveSetterName(element: Any) =
                if (element === genericElement) "baz" else "fizz"
        }

        helper.execute(options)

        verify(exactly = 1) { options.append("baz") }
    }
}
