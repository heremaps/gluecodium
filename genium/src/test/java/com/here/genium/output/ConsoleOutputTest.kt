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

package com.here.genium.output

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Rule
import org.junit.Test
import org.junit.contrib.java.lang.system.SystemOutRule
import org.junit.runner.RunWith
import org.junit.runners.JUnit4
import java.io.IOException

@RunWith(JUnit4::class)
class ConsoleOutputTest {
    @JvmField
    @Rule
    val systemOutRule: SystemOutRule = SystemOutRule().enableLog()

    @Test
    @Throws(IOException::class)
    fun verifyExpectedConsoleOutputFormatting() {
        // Arrange
        assertFalse(TestFiles.FILES.isEmpty())

        // Act
        ConsoleOutput().output(TestFiles.FILES)

        // Assert
        assertEquals(EXPECTED, systemOutRule.log)
    }

    companion object {
        private const val EXPECTED =
            "Generated ${TestFiles.PATH1}:\n\n" +
                    "        ${TestFiles.CONTENT1}\n\n" +
                    "Generated ${TestFiles.PATH2}:\n\n\n" +
                    "Generated ${TestFiles.PATH3}:\n\n" +
                    "        ${TestFiles.CONTENT3}\n\n" +
                    "Done.\n"
    }
}
