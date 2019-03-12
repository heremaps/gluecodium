/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
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
class InstanceOfHelperTest {
    private val parameters = mutableListOf(Any())
    private val options = spyk<Options>()
    private val helper = InstanceOfHelper(true)

    @Before
    fun beforeMocks() {
        every { options.parameters } returns parameters
    }

    @Test
    fun executeNoParameters() {
        // Arrange
        parameters.clear()

        // Act
        helper.execute(options)

        // Assert
        verify(exactly = 0) { options.fn() }
    }

    @Test
    fun executeOneParameter() {
        // Arrange, act
        helper.execute(options)

        // Assert
        verify(exactly = 0) { options.fn() }
    }

    @Test
    fun executeTrue() {
        // Arrange
        parameters.add("Object")

        // Act
        helper.execute(options)

        // Assert
        verify(exactly = 1) { options.fn() }
    }

    @Test
    fun executeFalse() {
        // Arrange
        parameters.add("String")

        // Act
        helper.execute(options)

        // Assert
        verify(exactly = 0) { options.fn() }
    }
}
