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

package com.here.gluecodium.generator.jni

import com.here.gluecodium.generator.common.templates.TemplateEngine
import com.here.gluecodium.model.jni.JniContainer
import io.mockk.every
import io.mockk.mockkObject
import io.mockk.unmockkAll
import io.mockk.verify
import org.junit.After
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class JniTemplatesTest {
    private val jniContainer = JniContainer(
        javaNames = listOf("classy"),
        javaInterfaceName = "classy",
        cppName = "classy",
        containerType = JniContainer.ContainerType.CLASS
    )
    private val templates = JniTemplates(emptyList(), emptyList(), emptyList(), "")

    @Before
    fun beforeMocks() {
        mockkObject(TemplateEngine)
        every { TemplateEngine.render(any(), any()) } returns ""
    }

    @Test
    fun isInterfaceProxyIsGenerated() {
        // Arrange
        val instantiableJniContainer = JniContainer(
            javaNames = listOf("classy"),
            javaInterfaceName = "classy",
            cppName = "classy",
            containerType = JniContainer.ContainerType.INTERFACE
        )

        // Act
        val files = templates.generateConversionFiles(
            JavaModel(jniContainers = listOf(instantiableJniContainer))
        )

        // Assert
        assertTrue(
            "Must generate proxy header file",
            files.any { it.targetFile.name == PROXY_HEADER_NAME })
        assertTrue(
            "Must generate proxy implementation file",
            files.any { it.targetFile.name == PROXY_IMPLEMENTATION_NAME })
    }

    @Test
    fun isNoInterfaceProxyIsNotGenerated() {
        // Act
        val files =
            templates.generateConversionFiles(JavaModel(jniContainers = listOf(jniContainer)))

        // Assert
        assertFalse(
            "Must not generate proxy header file",
            files.any { it.targetFile.name == PROXY_HEADER_NAME })
        assertFalse(
            "Must not generate proxy implementation file",
            files.any { it.targetFile.name == PROXY_IMPLEMENTATION_NAME })
    }

    @Test
    fun generateFilesWithNullModel() = assertTrue(templates.generateFiles(null).isEmpty())

    @Test
    fun generateFilesWithNonNullModel() {
        // Arrange, act
        val result = templates.generateFiles(jniContainer)

        // Assert
        assertEquals(MAIN_FILES_COUNT, result.size)
        verify { TemplateEngine.render(eq("jni/Header"), any()) }
        verify { TemplateEngine.render(eq("jni/Implementation"), any()) }
    }

    @Test
    fun generateConversionFiles() {
        // Arrange
        val instantiableJniContainer = JniContainer(
            javaNames = listOf("classy"),
            javaInterfaceName = "classy",
            cppName = "classy",
            containerType = JniContainer.ContainerType.INTERFACE
        )

        // Act
        val result = templates.generateConversionFiles(
            JavaModel(jniContainers = listOf(instantiableJniContainer))
        )

        // Assert
        assertEquals(MAIN_FILES_WITH_INSTANCES_COUNT, result.size)
        verify { TemplateEngine.render(eq("jni/StructConversionHeader"), any()) }
        verify { TemplateEngine.render(eq("jni/StructConversionImplementation"), any()) }
        verify { TemplateEngine.render(eq("jni/InstanceConversionHeader"), any()) }
        verify { TemplateEngine.render(eq("jni/InstanceConversionImplementation"), any()) }
        verify { TemplateEngine.render(eq("jni/CppProxyHeader"), any()) }
        verify { TemplateEngine.render(eq("jni/CppProxyImplementation"), any()) }
        verify { TemplateEngine.render(eq("jni/ProxyGeneratorHeader"), any()) }
        verify { TemplateEngine.render(eq("jni/EnumConversionHeader"), any()) }
        verify { TemplateEngine.render(eq("jni/EnumConversionImplementation"), any()) }
        verify { TemplateEngine.render(eq("jni/EnumSetConversionHeader"), any()) }
        verify { TemplateEngine.render(eq("jni/EnumSetConversionImplementation"), any()) }
    }

    @After
    fun afterMocks() = unmockkAll()

    companion object {
        private const val MAIN_FILES_COUNT = 2
        private const val MAIN_FILES_WITH_INSTANCES_COUNT = 12
        private const val PROXY_HEADER_NAME = "classyCppProxy.h"
        private const val PROXY_IMPLEMENTATION_NAME = "classyCppProxy.cpp"
    }
}
