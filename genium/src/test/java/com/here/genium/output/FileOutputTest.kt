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

package com.here.gluecodium.output

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import org.junit.runner.RunWith
import org.junit.runners.JUnit4
import java.io.IOException
import java.nio.charset.Charset
import java.nio.file.Files
import java.nio.file.Paths

@RunWith(JUnit4::class)
class FileOutputTest {
    @JvmField
    @Rule
    var testFolder = TemporaryFolder()

    @Test
    @Throws(IOException::class)
    fun testFileOutput() {
        // Arrange
        assertFalse(TestFiles.FILES.isEmpty())

        // Act
        FileOutput(testFolder.root).output(TestFiles.FILES)

        // Assert
        TestFiles.FILES.forEach {
            val path = Paths.get(testFolder.root.path, it.targetFile.path)
            val lines = Files.readAllLines(path, Charset.defaultCharset())
            if (it.content.isNotEmpty()) {
                assertEquals(1, lines.size.toLong())
                assertEquals(it.content, lines[0])
            } else {
                assertTrue(lines.isEmpty())
            }
        }
    }
}
