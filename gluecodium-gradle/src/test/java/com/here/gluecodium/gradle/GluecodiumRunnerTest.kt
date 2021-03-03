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

package com.here.gluecodium.gradle

import com.here.gluecodium.Gluecodium
import com.here.gluecodium.GluecodiumOptions
import com.here.gluecodium.generator.common.GeneratorOptions
import io.mockk.MockKAnnotations
import io.mockk.every
import io.mockk.impl.annotations.MockK
import org.gradle.api.GradleException
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.rules.ExpectedException
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
internal class GluecodiumRunnerTest {
    @JvmField
    @Rule
    val expectedException: ExpectedException = ExpectedException.none()

    @MockK lateinit var gluecodium: Gluecodium
    private val defaultGluecodiumOptions = GluecodiumOptions()
    private val defaultGeneratorOptions = GeneratorOptions()

    private lateinit var runner: GluecodiumRunner

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)

        runner = GluecodiumRunner { _, _ -> gluecodium }
    }

    @Test
    fun executeReturningTrueDoesNotThrow() {
        every { gluecodium.execute() } returns true

        runner.run(defaultGluecodiumOptions, defaultGeneratorOptions)
    }

    @Test
    fun executeReturningFalseThrows() {
        every { gluecodium.execute() } returns false
        expectedException.expect(GradleException::class.java)

        runner.run(defaultGluecodiumOptions, defaultGeneratorOptions)
    }
}
