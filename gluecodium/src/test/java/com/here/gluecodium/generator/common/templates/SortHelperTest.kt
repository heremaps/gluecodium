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

import io.mockk.every
import io.mockk.mockk
import io.mockk.spyk
import io.mockk.verify
import io.mockk.verifyOrder
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4
import org.trimou.handlebars.Options

@RunWith(JUnit4::class)
class SortHelperTest {
    private val parameters = mutableListOf<Any>()
    private val hash = mutableMapOf<String, Any>()
    private val options = spyk<Options>()

    private val stringList = listOf("foo", "bar")
    private val sorter = { list: List<Any> -> list.filterIsInstance<String>().sorted() }

    private val helper = SortHelper()

    @Before
    fun setUp() {
        helper.init(mockk(relaxed = true))
        helper.sorters[""] = sorter

        every { options.parameters } returns parameters
        every { options.hash } returns hash
    }

    @Test
    fun executeNoParameters() {
        helper.execute(options)

        verify(exactly = 0) { options.fn() }
    }

    @Test
    fun executeOneParameter() {
        parameters.add(stringList)

        helper.execute(options)

        verifyOrder {
            options.push("bar")
            options.push("foo")
        }
        verify(exactly = 2) { options.fn() }
    }

    @Test
    fun executeTwoParameters() {
        parameters.add(stringList)
        parameters.add(listOf("car"))

        helper.execute(options)

        verifyOrder {
            options.push("bar")
            options.push("car")
            options.push("foo")
        }
        verify(exactly = 3) { options.fn() }
    }

    @Test
    fun executeTwoParametersOneInvalid() {
        parameters.add(stringList)
        parameters.add("jar")

        helper.execute(options)

        verifyOrder {
            options.push("bar")
            options.push("foo")
        }
        verify(exactly = 2) { options.fn() }
    }

    @Test
    fun executeWithInvalidSorter() {
        parameters.add(stringList)
        hash["sorter"] = "wee"

        helper.execute(options)

        verify(exactly = 0) { options.fn() }
    }

    @Test
    fun executeWithValidSorter() {
        parameters.add(stringList)
        hash["sorter"] = "wee"
        helper.sorters["wee"] = sorter
        helper.sorters.remove("")

        helper.execute(options)

        verifyOrder {
            options.push("bar")
            options.push("foo")
        }
        verify(exactly = 2) { options.fn() }
    }
}
