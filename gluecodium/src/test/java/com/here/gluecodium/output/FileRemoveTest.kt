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

import io.mockk.Runs
import io.mockk.every
import io.mockk.just
import io.mockk.mockkStatic
import io.mockk.verify
import junit.framework.TestCase.assertTrue
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.rules.ExpectedException
import org.junit.runner.RunWith
import org.junit.runners.JUnit4
import org.mockito.Mock
import org.mockito.Mockito.`when`
import org.mockito.MockitoAnnotations
import java.io.File
import java.io.FileNotFoundException
import java.io.IOException
import java.nio.file.Files
import java.nio.file.Paths

@RunWith(JUnit4::class)
class FileRemoveTest {
    @JvmField
    @Rule
    var exception: ExpectedException = ExpectedException.none()

    @Mock
    private lateinit var rootFile: File

    @Before
    fun setUp() {
        MockitoAnnotations.initMocks(this)
        mockkStatic(Files::class)

        every { Files.delete(any()) } just Runs
    }

    @Test
    @Throws(FileNotFoundException::class)
    fun removeFilesNonExisting() {
        // Arrange
        `when`(rootFile.exists()).thenReturn(false)
        `when`(rootFile.isDirectory).thenReturn(true)

        exception.expect(FileNotFoundException::class.java)

        // Act
        FileRemove(rootFile).removeFiles(emptyList())
    }

    @Test
    @Throws(FileNotFoundException::class)
    fun removeFilesNoDirectory() {
        // Arrange
        `when`(rootFile.exists()).thenReturn(true)
        `when`(rootFile.isDirectory).thenReturn(false)

        exception.expect(FileNotFoundException::class.java)

        // Act
        FileRemove(rootFile).removeFiles(emptyList())
    }

    @Test
    @Throws(IOException::class)
    fun removeFilesSuccess() {
        // Arrange
        `when`(rootFile.exists()).thenReturn(true)
        `when`(rootFile.isDirectory).thenReturn(true)
        `when`(rootFile.canonicalPath).thenReturn(ROOT_DIR)

        val regularFile = Paths.get(ROOT_DIR, "fileOne")
        val foreignFile = Paths.get(ROOT_DIR + "x", "fileThree")
        val nonRegularFile = Paths.get(ROOT_DIR, "nonRegular")
        val filesToRemove = listOf(regularFile, foreignFile, nonRegularFile)

        every { Files.isRegularFile(regularFile) } returns true
        every { Files.isRegularFile(foreignFile) } returns true
        every { Files.isRegularFile(nonRegularFile) } returns false

        val remover = FileRemove(rootFile)

        // Act
        val success = remover.removeFiles(filesToRemove)

        // Assert
        assertTrue(success)

        verify { Files.delete(regularFile) }
        verify(exactly = 0) { Files.delete(foreignFile) }
        verify(exactly = 0) { Files.delete(nonRegularFile) }
    }

    companion object {
        private const val ROOT_DIR = "/myPath"
    }
}
