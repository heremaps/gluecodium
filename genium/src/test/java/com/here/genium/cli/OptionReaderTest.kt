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

package com.here.genium.cli

import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Rule
import org.junit.Test
import org.junit.rules.ExpectedException
import org.junit.rules.TemporaryFolder
import org.junit.runner.RunWith
import org.junit.runners.JUnit4
import java.io.ByteArrayOutputStream
import java.io.IOException
import java.io.PrintStream

@RunWith(JUnit4::class)
class OptionReaderTest {
    @JvmField
    @Rule
    val expectedException: ExpectedException = ExpectedException.none()

    @JvmField
    @Rule
    val temporaryFolder = TemporaryFolder()

    @Test
    @Throws(OptionReaderException::class)
    fun helpOptionIsRecognised() {
        // Arrange, Act
        val options = OptionReader.read(arrayOf("-help"))

        // Assert
        assertNull(options)
    }

    @Test
    @Throws(OptionReaderException::class, IOException::class)
    fun helpOptionCreatesOutput() {
        // Arrange
        val bo = ByteArrayOutputStream()
        System.setOut(PrintStream(bo))

        // Act
        OptionReader.read(arrayOf("-help"))
        bo.flush()
        val consoleOutput = String(bo.toByteArray())

        // Assert
        assertTrue(consoleOutput.contains("Genium - Generate APIs from Franca IDL files"))
    }

    @Test
    @Throws(OptionReaderException::class)
    fun inputOptionSingleFolder() {
        // Arrange, Act
        val options = OptionReader.read(arrayOf("-input", TEST_INPUT_SINGLE_FOLDER[0]))

        // Assert
        assertNotNull(options!!.inputDirs)
        assertEquals(1, options.inputDirs.size)
        assertEquals(TEST_INPUT_SINGLE_FOLDER[0], options.inputDirs[0])
    }

    @Test
    @Throws(OptionReaderException::class)
    fun inputOptionTwoFolders() {
        // Arrange, Act
        val options = OptionReader.read(
            arrayOf("-input", TEST_INPUT_TWO_FOLDERS[0], "-input", TEST_INPUT_TWO_FOLDERS[1])
        )

        // Assert
        assertNotNull(options!!.inputDirs)
        assertEquals(2, options.inputDirs.size)
        assertEquals(TEST_INPUT_TWO_FOLDERS[0], options.inputDirs[0])
        assertEquals(TEST_INPUT_TWO_FOLDERS[1], options.inputDirs[1])
    }

    @Test
    @Throws(OptionReaderException::class)
    fun outputOptionIsRecognised() {
        // Arrange
        val toRead = prepareToRead("-output", TEST_OUTPUT)

        // Act
        val options = OptionReader.read(toRead)

        // Assert
        assertEquals(TEST_OUTPUT, options!!.outputDir)
    }

    @Test
    @Throws(OptionReaderException::class)
    fun generatorsOptionIsRecognised() {
        // Arrange
        val toRead = prepareToRead("-generators", TEST_GENERATORS)

        // Act
        val options = OptionReader.read(toRead)

        // Assert
        val generators = options?.generators
        assertTrue(generators?.contains("cpp") ?: false)
        assertTrue(generators?.contains("java") ?: false)
    }

    @Test
    @Throws(OptionReaderException::class)
    fun javapackageOptionIsRecognised() {
        // Arrange
        val toRead = prepareToRead("-javapackage", TEST_JAVA_PACKAGE_LIST)

        // Act
        val options = OptionReader.read(toRead)

        // Assert
        assertEquals(listOf(TEST_JAVA_PACKAGE_LIST), options!!.javaPackages)
    }

    @Test
    @Throws(OptionReaderException::class)
    fun unknownOptionIsNotRecognised() {
        // Arrange
        val toRead = prepareToRead("-someUnknownOption", "")

        // Act, Assert
        expectedException.expect(OptionReaderException::class.java)
        OptionReader.read(toRead)
    }

    @Test
    @Throws(OptionReaderException::class)
    fun androidMergeManifestPathIsRecognised() {
        // Arrange
        val toRead = prepareToRead("-mergemanifest", TEST_ADDITIONAL_ANDROID_MANIFEST)

        // Act
        val options = OptionReader.read(toRead)

        // Assert
        assertEquals(TEST_ADDITIONAL_ANDROID_MANIFEST, options!!.androidMergeManifestPath)
    }

    @Test
    @Throws(OptionReaderException::class, IOException::class)
    fun copyrightHeaderPathIsRecognised() {
        // Arrange
        temporaryFolder.newFile("Foo.txt")
        val toRead = prepareToRead("-copyright", temporaryFolder.root.absolutePath + "/Foo.txt")

        // Act
        val options = OptionReader.read(toRead)

        // Assert
        assertEquals("", options!!.copyrightHeaderContents)
    }

    private fun prepareToRead(optionName: String, optionValue: String): Array<String> =
        arrayOf("-input", TEST_INPUT_SINGLE_FOLDER[0], optionName, optionValue)

    companion object {
        private val TEST_INPUT_SINGLE_FOLDER = arrayOf("dirA")
        private val TEST_INPUT_TWO_FOLDERS = arrayOf("dirA", "dirB")
        private const val TEST_OUTPUT = "./outputFile"
        private const val TEST_GENERATORS = "java,cpp"
        private const val TEST_JAVA_PACKAGE_LIST = "some_package"
        private const val TEST_ADDITIONAL_ANDROID_MANIFEST = "path/to/additional/AndroidManifest.xml"
    }
}
