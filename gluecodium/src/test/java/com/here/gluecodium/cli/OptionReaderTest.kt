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

package com.here.gluecodium.cli

import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Rule
import org.junit.Test
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
        assertTrue(consoleOutput.contains("Gluecodium - Generate APIs from LimeIDL files"))
    }

    @Test
    @Throws(OptionReaderException::class)
    fun inputOptionSingleFolder() {
        // Arrange, Act
        val options = OptionReader.read(arrayOf("-input", TEST_INPUT_SINGLE_FOLDER[0]))

        // Assert
        assertNotNull(options!!.first.idlSources)
        assertEquals(1, options.first.idlSources.size)
        assertEquals(TEST_INPUT_SINGLE_FOLDER[0], options.first.idlSources[0])
    }

    @Test
    @Throws(OptionReaderException::class)
    fun inputOptionTwoFolders() {
        // Arrange, Act
        val options =
            OptionReader.read(
                arrayOf("-input", TEST_INPUT_TWO_FOLDERS[0], "-input", TEST_INPUT_TWO_FOLDERS[1]),
            )

        // Assert
        assertNotNull(options!!.first.idlSources)
        assertEquals(2, options.first.idlSources.size)
        assertEquals(TEST_INPUT_TWO_FOLDERS[0], options.first.idlSources[0])
        assertEquals(TEST_INPUT_TWO_FOLDERS[1], options.first.idlSources[1])
    }

    @Test
    @Throws(OptionReaderException::class)
    fun outputOptionIsRecognised() {
        // Arrange
        val toRead = prepareToRead("-output", TEST_OUTPUT)

        // Act
        val options = OptionReader.read(toRead)

        // Assert
        assertEquals(TEST_OUTPUT, options!!.first.outputDir)
    }

    @Test
    @Throws(OptionReaderException::class)
    fun generatorsOptionIsRecognised() {
        // Arrange
        val toRead = prepareToRead("-generators", TEST_GENERATORS)

        // Act
        val options = OptionReader.read(toRead)

        // Assert
        val generators = options?.first?.generators
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
        assertEquals(listOf(TEST_JAVA_PACKAGE_LIST), options!!.second.javaPackages)
    }

    @Test
    @Throws(OptionReaderException::class)
    fun unknownOptionIsNotRecognised() {
        // Arrange
        val toRead = prepareToRead("-someUnknownOption", "")

        // Act, Assert
        assertThrows(OptionReaderException::class.java) { OptionReader.read(toRead) }
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
        assertEquals("", options!!.second.copyrightHeaderContents)
    }

    @Test
    fun dartdisablefinalizablemarkerFlagIsProperlyRead() {
        // Arrange
        val commandLineParameters = arrayOf("-dartdisablefinalizablemarker")

        // Act
        val options = OptionReader.read(commandLineParameters)

        // Assert
        assertTrue(options!!.second.dartDisableFinalizableMarker)
    }

    @Test
    @Throws(OptionReaderException::class)
    fun kotlinpackageOptionIsRecognised() {
        // Arrange
        val toRead = prepareToRead("-kotlinpackage", TEST_KOTLIN_PACKAGE_LIST)

        // Act
        val options = OptionReader.read(toRead)

        // Assert
        assertEquals(listOf(TEST_KOTLIN_PACKAGE_LIST), options!!.second.kotlinPackages)
    }

    @Test
    @Throws(OptionReaderException::class)
    fun kotlinintpackageOptionIsRecognised() {
        // Arrange
        val toRead = prepareToRead("-kotlinintpackage", TEST_KOTLIN_PACKAGE_LIST)

        // Act
        val options = OptionReader.read(toRead)

        // Assert
        assertEquals(listOf(TEST_KOTLIN_PACKAGE_LIST), options!!.second.kotlinInternalPackages)
    }

    @Test
    fun docsplaceholderslistMissingFile() {
        // Arrange, Act
        val path = "someFileThatDoesNotExists.properties"
        val exception =
            assertThrows(OptionReaderException::class.java, {
                OptionReader.read(arrayOf("-docsplaceholderslist", path))
            })

        // Assert
        assertTrue(exception.message!!.startsWith("File $path does not exist"))
    }

    @Test
    fun docsValidationRulesMissingFile() {
        // Arrange, Act
        val path = "rulesFileThatDoesNotExist.json"
        val exception =
            assertThrows(OptionReaderException::class.java, {
                OptionReader.read(arrayOf("-docsvalidationrules", path))
            })

        // Assert
        assertTrue(exception.message!!.startsWith("Rules file $path does not exist"))
    }

    private fun prepareToRead(
        optionName: String,
        optionValue: String,
    ): Array<String> = arrayOf("-input", TEST_INPUT_SINGLE_FOLDER[0], optionName, optionValue)

    companion object {
        private val TEST_INPUT_SINGLE_FOLDER = arrayOf("dirA")
        private val TEST_INPUT_TWO_FOLDERS = arrayOf("dirA", "dirB")
        private const val TEST_OUTPUT = "./outputFile"
        private const val TEST_GENERATORS = "java,cpp"
        private const val TEST_JAVA_PACKAGE_LIST = "some_package"
        private const val TEST_KOTLIN_PACKAGE_LIST = "another_package"
    }
}
