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

package com.here.genium.generator.jni

import com.here.genium.generator.common.templates.TemplateEngine
import com.here.genium.model.jni.JniContainer
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.mockito.ArgumentMatchers.any
import org.mockito.ArgumentMatchers.anyString
import org.mockito.ArgumentMatchers.eq
import org.mockito.Mockito.`when`
import org.powermock.api.mockito.PowerMockito
import org.powermock.core.classloader.annotations.PrepareForTest
import org.powermock.modules.junit4.PowerMockRunner

@RunWith(PowerMockRunner::class)
@PrepareForTest(TemplateEngine::class)
class JniTemplatesTest {
    private val jniContainer = JniContainer(
        javaName = "classy",
        javaInterfaceName = "classy",
        cppName = "classy",
        isFrancaInterface = true
    )
    private val templates = JniTemplates(
        null, null, ""
    )

    @Before
    fun setUp() {
        PowerMockito.mockStatic(TemplateEngine::class.java)

        `when`(TemplateEngine.render(anyString(), any())).thenReturn("")
    }

    @Test
    fun isInterfaceProxyIsGenerated() {
        // Arrange
        val instantiableJniContainer = JniContainer(
            javaName = "classy",
            javaInterfaceName = "classy",
            cppName = "classy",
            isFrancaInterface = true,
            isInterface = true
        )

        // Act
        val files = templates.generateConversionFiles(listOf(instantiableJniContainer))

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
        // Arrange
        val instantiableJniContainer = JniContainer(
            javaName = "classy",
            javaInterfaceName = "classy",
            cppName = "classy",
            isFrancaInterface = true,
            isInterface = false
        )

        // Act
        val files = templates.generateConversionFiles(listOf(instantiableJniContainer))

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
        PowerMockito.verifyStatic()
        TemplateEngine.render(eq("jni/Header"), any())
        PowerMockito.verifyStatic()
        TemplateEngine.render(eq("jni/Implementation"), any())
    }

    @Test
    fun generateConversionFiles() {
        // Arrange
        val instantiableJniContainer = JniContainer(
            javaName = "classy",
            javaInterfaceName = "classy",
            cppName = "classy",
            isFrancaInterface = true,
            isInterface = true
        )

        // Act
        val result = templates.generateConversionFiles(listOf(instantiableJniContainer))

        // Assert
        assertEquals(MAIN_FILES_WITH_INSTANCES_COUNT, result.size)
        PowerMockito.verifyStatic()
        TemplateEngine.render(eq("jni/StructConversionHeader"), any())
        PowerMockito.verifyStatic()
        TemplateEngine.render(eq("jni/StructConversionImplementation"), any())
        PowerMockito.verifyStatic()
        TemplateEngine.render(eq("jni/InstanceConversionHeader"), any())
        PowerMockito.verifyStatic()
        TemplateEngine.render(eq("jni/InstanceConversionImplementation"), any())
        PowerMockito.verifyStatic()
        TemplateEngine.render(eq("jni/CppProxyHeader"), any())
        PowerMockito.verifyStatic()
        TemplateEngine.render(eq("jni/CppProxyImplementation"), any())
        PowerMockito.verifyStatic()
        TemplateEngine.render(eq("jni/ProxyGeneratorHeader"), any())
        PowerMockito.verifyStatic()
        TemplateEngine.render(eq("jni/EnumConversionHeader"), any())
        PowerMockito.verifyStatic()
        TemplateEngine.render(eq("jni/EnumConversionImplementation"), any())
    }

    companion object {
        private const val MAIN_FILES_COUNT = 2
        private const val MAIN_FILES_WITH_INSTANCES_COUNT = 9
        private const val PROXY_HEADER_NAME = "classyCppProxy.h"
        private const val PROXY_IMPLEMENTATION_NAME = "classyCppProxy.cpp"
    }
}
