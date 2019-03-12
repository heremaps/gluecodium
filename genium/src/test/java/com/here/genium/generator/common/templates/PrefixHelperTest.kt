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

package com.here.genium.generator.common.templates

import io.mockk.every
import io.mockk.spyk
import io.mockk.verify
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4
import org.trimou.handlebars.Options

@RunWith(JUnit4::class)
class PrefixHelperTest {
    private val parameters = mutableListOf<Any>()
    private val options = spyk<Options>()
    private val helper = PrefixHelper()

    @Before
    fun beforeMocks() {
        every { options.parameters } returns parameters
    }

    @Test
    fun executeNoParameters() {
        helper.execute(options)

        verify(exactly = 0) { options.append(any()) }
    }

    @Test
    fun executeSingleLineNoPrefix() {
        parameters.add(FIRST_LINE)

        helper.execute(options)

        verify(exactly = 1) { options.append(FIRST_LINE) }
    }

    @Test
    fun executeSingleLineWithPrefix() {
        parameters.add(FIRST_LINE)
        parameters.add(PREFIX)

        helper.execute(options)

        verify(exactly = 1) { options.append("$PREFIX$FIRST_LINE") }
    }

    @Test
    fun executeMultiLineNoPrefix() {
        parameters.add(MULTI_LINE)

        helper.execute(options)

        verify(exactly = 1) { options.append(MULTI_LINE) }
    }

    @Test
    fun executeMultiLineWithPrefix() {
        parameters.add(MULTI_LINE)
        parameters.add(PREFIX)

        helper.execute(options)

        verify(exactly = 1) { options.append("$PREFIX$FIRST_LINE\n$PREFIX$SECOND_LINE") }
    }

    @Test
    fun executeMultiLineWithTrim() {
        parameters.add("$FIRST_LINE\n\n$SECOND_LINE")
        parameters.add(PREFIX)

        helper.execute(options)

        verify(exactly = 1) { options.append("$PREFIX$FIRST_LINE\n$PREFIX\n$PREFIX$SECOND_LINE") }
    }

    companion object {
        private const val PREFIX = " <!-- "
        private const val FIRST_LINE = "complete"
        private const val SECOND_LINE = "nonsense"
        private const val MULTI_LINE = "$FIRST_LINE\n$SECOND_LINE"
    }
}
