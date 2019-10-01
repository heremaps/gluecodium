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

import io.mockk.every
import io.mockk.spyk
import io.mockk.verify
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4
import org.trimou.handlebars.Options

@RunWith(JUnit4::class)
class JoinPartialHelperTest {
    private val iterable = mutableListOf(FIRST_LINE)
    private val parameters = mutableListOf(iterable, TEMPLATE_NAME)
    private val options = spyk<Options>()
    private val helper = JoinPartialHelper()

    @Before
    fun setUp() {
        every { options.parameters } returns parameters
    }

    @Test
    fun executeNoParameters() {
        // Arrange
        parameters.clear()

        // Act
        helper.execute(options)

        // Assert
        verify(exactly = 0) { options.append(any()) }
        verify(exactly = 0) { options.push(any()) }
        verify(exactly = 0) { options.partial(any()) }
        verify(exactly = 0) { options.pop() }
    }

    @Test
    fun executeOneParameter() {
        // Arrange
        parameters.clear()
        parameters.add(iterable)

        // Act
        helper.execute(options)

        // Assert
        verify(exactly = 0) { options.append(any()) }
        verify(exactly = 0) { options.push(any()) }
        verify(exactly = 0) { options.partial(any()) }
        verify(exactly = 0) { options.pop() }
    }

    @Test
    fun executeNotIterableNoSeparator() {
        // Arrange
        parameters[0] = FIRST_LINE

        // Act
        helper.execute(options)

        // Assert
        verify(exactly = 0) { options.append(any()) }
        verify(exactly = 1) { options.push(FIRST_LINE) }
        verify(exactly = 1) { options.partial(TEMPLATE_NAME) }
        verify(exactly = 1) { options.pop() }
    }

    @Test
    fun executeNotIterableWithSeparator() {
        // Arrange
        parameters[0] = FIRST_LINE
        parameters.add(SEPARATOR)

        // Act
        helper.execute(options)

        // Assert
        verify(exactly = 0) { options.append(any()) }
        verify(exactly = 1) { options.push(FIRST_LINE) }
        verify(exactly = 1) { options.partial(TEMPLATE_NAME) }
        verify(exactly = 1) { options.pop() }
    }

    @Test
    fun executeOneValueNoSeparator() {
        // Arrange, act
        helper.execute(options)

        // Assert
        verify(exactly = 0) { options.append(any()) }
        verify(exactly = 1) { options.push(FIRST_LINE) }
        verify(exactly = 1) { options.partial(TEMPLATE_NAME) }
        verify(exactly = 1) { options.pop() }
    }

    @Test
    fun executeOneValueWithSeparator() {
        // Arrange
        parameters.add(SEPARATOR)

        // Act
        helper.execute(options)

        // Assert
        verify(exactly = 0) { options.append(any()) }
        verify(exactly = 1) { options.push(FIRST_LINE) }
        verify(exactly = 1) { options.partial(TEMPLATE_NAME) }
        verify(exactly = 1) { options.pop() }
    }

    @Test
    fun executeTwoValuesNoSeparator() {
        iterable.add(SECOND_LINE)

        // Act
        helper.execute(options)

        // Assert
        verify(exactly = 1) { options.append("") }
        verify(exactly = 1) { options.push(FIRST_LINE) }
        verify(exactly = 1) { options.push(SECOND_LINE) }
        verify(exactly = 2) { options.partial(TEMPLATE_NAME) }
        verify(exactly = 2) { options.pop() }
    }

    @Test
    fun executeTwoValuesWithSeparator() {
        // Arrange
        parameters.add(SEPARATOR)
        iterable.add(SECOND_LINE)

        // Act
        helper.execute(options)

        // Assert
        verify(exactly = 1) { options.append(SEPARATOR) }
        verify(exactly = 1) { options.push(FIRST_LINE) }
        verify(exactly = 1) { options.push(SECOND_LINE) }
        verify(exactly = 2) { options.partial(TEMPLATE_NAME) }
        verify(exactly = 2) { options.pop() }
    }

    companion object {
        private const val TEMPLATE_NAME = "glorious"
        private const val SEPARATOR = " \\o/ "
        private const val FIRST_LINE = "complete"
        private const val SECOND_LINE = "nonsense"
    }
}
