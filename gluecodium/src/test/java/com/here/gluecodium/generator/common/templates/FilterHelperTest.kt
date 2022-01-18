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

package com.here.gluecodium.generator.common.templates

import io.mockk.every
import io.mockk.mockk
import io.mockk.spyk
import io.mockk.verify
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4
import org.trimou.handlebars.Options

@RunWith(JUnit4::class)
class FilterHelperTest {
    private val parameters = mutableListOf<Any>()
    private val hash = mutableMapOf<String, Any>()
    private val options = spyk<Options>()

    private val stringList = listOf("bar", "baz")
    private val helper = FilterHelper(mapOf("foo" to { it != "bar" }))

    @Before
    fun setUp() {
        helper.init(mockk(relaxed = true))
        every { options.parameters } returns parameters
        every { options.hash } returns hash
    }

    @Test
    fun executeNoParameters() {
        helper.execute(options)

        verify(exactly = 0) { options.fn() }
    }

    @Test
    fun executeOneParameterNoPredicate() {
        parameters.add(stringList)

        helper.execute(options)

        verify(exactly = 0) { options.fn() }
    }

    @Test
    fun executeOneParameter() {
        parameters.add(stringList)
        hash["predicate"] = "foo"

        helper.execute(options)

        verify { options.push(listOf("baz")) }
        verify(exactly = 1) { options.fn() }
    }

    @Test
    fun executeTwoParameters() {
        parameters.add(stringList)
        parameters.add(listOf("car"))
        hash["predicate"] = "foo"

        helper.execute(options)

        verify { options.push(listOf("baz", "car")) }
        verify(exactly = 1) { options.fn() }
    }

    @Test
    fun executeTwoParametersOneInvalid() {
        parameters.add(stringList)
        parameters.add("jar")
        hash["predicate"] = "foo"

        helper.execute(options)

        verify { options.push(listOf("baz")) }
        verify(exactly = 1) { options.fn() }
    }

    @Test
    fun executeWithInvalidPredicate() {
        parameters.add(stringList)
        hash["predicate"] = "wee"

        helper.execute(options)

        verify(exactly = 0) { options.fn() }
    }
}
