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

import com.here.gluecodium.generator.common.GeneratedFile
import com.here.gluecodium.generator.common.templates.TemplateEngine
import com.here.gluecodium.model.common.Include
import com.here.gluecodium.model.jni.JniContainer
import com.here.gluecodium.model.jni.JniContainer.ContainerType
import com.here.gluecodium.model.jni.JniElement
import com.here.gluecodium.model.jni.JniStruct

class JniTemplates(
    private val basePackages: List<String>,
    private val internalPackages: List<String>,
    private val internalNamespace: List<String>,
    generatorName: String
) {
    private val jniNameRules = JniNameRules(generatorName)

    fun generateFiles(jniContainer: JniContainer?): List<GeneratedFile> {
        val results = mutableListOf<GeneratedFile>()
        if (jniContainer == null) {
            return results
        }

        if (jniContainer.containerType != ContainerType.TYPE_COLLECTION) {
            results += generateFilesForElement(
                jniContainer,
                jniContainer,
                JniNameRules.getJniClassFileName(jniContainer)
            )
        }
        results += jniContainer.structs
            .filter { it.methods.isNotEmpty() }
            .flatMap { generateFilesForElement(
                it,
                jniContainer,
                JniNameRules.getJniStructFileName(it)
            ) }

        return results
    }

    private fun generateFilesForElement(
        jniElement: JniElement,
        jniContainer: JniContainer,
        fileName: String
    ): List<GeneratedFile> {
        val containerData =
            mutableMapOf(
                CONTAINER_NAME to jniElement,
                INCLUDES_NAME to jniContainer.includes,
                INTERNAL_NAMESPACE_NAME to internalNamespace
            )
        val headerFile =
            generateFile("jni/Header", containerData, jniNameRules.getHeaderFilePath(fileName))

        val includes = when (jniElement) {
            is JniContainer -> JniIncludeResolver.collectImplementationIncludes(jniElement)
            is JniStruct -> JniIncludeResolver.collectMethodImplementationIncludes(jniElement)
            else -> emptyList()
        } + Include.createInternalInclude(JniNameRules.getHeaderFileName(fileName))
        containerData[INCLUDES_NAME] = includes.distinct().sorted()

        val implFile = generateFile(
            "jni/Implementation",
            containerData,
            jniNameRules.getImplementationFilePath(fileName)
        )

        return listOf(headerFile, implFile)
    }

    fun generateConversionFiles(combinedModel: JavaModel): List<GeneratedFile> {
        val jniContainers = combinedModel.jniContainers
        return jniContainers.flatMap { generateStructConversionFiles(it) } +
            jniContainers.flatMap { generateEnumConversionFiles(it) } +
            jniContainers
                .filter { it.containerType != ContainerType.TYPE_COLLECTION }
                .flatMap { generateInstanceConversionFiles(it) } +
            jniContainers
                .filter { it.containerType == ContainerType.INTERFACE }
                .flatMap { generateCppProxyFiles(it) }
    }

    fun generateConversionUtilsHeaderFile(fileName: String) =
        generateFile(
            JNI_UTILS_TEMPLATE_PREFIX + fileName + "Header",
            mapOf(INTERNAL_NAMESPACE_NAME to internalNamespace),
            jniNameRules.getHeaderFilePath(fileName)
        )

    fun generateConversionUtilsImplementationFile(fileName: String) =
        generateFile(
            JNI_UTILS_TEMPLATE_PREFIX + fileName + "Implementation",
            mapOf(
                INTERNAL_NAMESPACE_NAME to internalNamespace,
                INTERNAL_PACKAGES_NAME to basePackages + internalPackages
            ),
            jniNameRules.getImplementationFilePath(fileName)
        )

    private fun generateStructConversionFiles(jniContainer: JniContainer) =
        jniContainer.structs.flatMap {
                val mustacheData = mutableMapOf(
                    "struct" to it,
                    INCLUDES_NAME to jniContainer.includes.sorted(),
                    INTERNAL_NAMESPACE_NAME to internalNamespace
                )

                val fileName = JniNameRules.getConversionFileName(it)
                val headerFile = generateFile(
                    "jni/StructConversionHeader",
                    mustacheData,
                    jniNameRules.getHeaderFilePath(fileName)
                )

                mustacheData[INCLUDES_NAME] =
                    JniIncludeResolver.collectConversionImplementationIncludes(it)
                val implFile = generateFile(
                    "jni/StructConversionImplementation",
                    mustacheData,
                    jniNameRules.getImplementationFilePath(fileName)
                )

                listOf(headerFile, implFile)
            }

    private fun generateEnumConversionFiles(jniContainer: JniContainer) =
        jniContainer.enums.flatMap {
                val mustacheData = mutableMapOf(
                    "enum" to it,
                    INCLUDES_NAME to jniContainer.includes.sorted(),
                    INTERNAL_NAMESPACE_NAME to internalNamespace
                )

                val fileName = JniNameRules.getConversionFileName(it)
                val headerFile = generateFile(
                    "jni/EnumConversionHeader",
                    mustacheData,
                    jniNameRules.getHeaderFilePath(fileName)
                )

                mustacheData[INCLUDES_NAME] =
                    listOf(JniIncludeResolver.createConversionSelfInclude(it))
                val implFile = generateFile(
                    "jni/EnumConversionImplementation",
                    mustacheData,
                    jniNameRules.getImplementationFilePath(fileName)
                )

                listOf(headerFile, implFile)
            }

    private fun generateInstanceConversionFiles(jniContainer: JniContainer): List<GeneratedFile> {
        val mustacheData = mutableMapOf(
            "model" to jniContainer,
            INCLUDES_NAME to jniContainer.includes.sorted(),
            "basePackages" to basePackages,
            INTERNAL_PACKAGES_NAME to basePackages + internalPackages,
            INTERNAL_NAMESPACE_NAME to internalNamespace
        )

        val fileName = JniNameRules.getConversionFileName(jniContainer)
        val headerFile = generateFile(
            "jni/InstanceConversionHeader",
            mustacheData,
            jniNameRules.getHeaderFilePath(fileName)
        )

        val includes = mutableListOf(JniIncludeResolver.createConversionSelfInclude(jniContainer))
        if (jniContainer.containerType == ContainerType.INTERFACE) {
            val proxyFileName =
                JniNameRules.getJniClassFileName(jniContainer) + JniNameRules.JNI_CPP_PROXY_SUFFIX
            includes += Include.createInternalInclude(JniNameRules.getHeaderFileName(proxyFileName))
        }
        mustacheData[INCLUDES_NAME] = includes

        val implFile = generateFile(
            "jni/InstanceConversionImplementation",
            mustacheData,
            jniNameRules.getImplementationFilePath(fileName)
        )

        return listOf(headerFile, implFile)
    }

    private fun generateCppProxyFiles(jniContainer: JniContainer): List<GeneratedFile> {
        val mustacheData = mutableMapOf(
            CONTAINER_NAME to jniContainer,
            INTERNAL_NAMESPACE_NAME to internalNamespace
        )

        val fileName =
            JniNameRules.getJniClassFileName(jniContainer) + JniNameRules.JNI_CPP_PROXY_SUFFIX
        val headerFile = generateFile(
            "jni/CppProxyHeader", mustacheData, jniNameRules.getHeaderFilePath(fileName)
        )

        mustacheData[INCLUDES_NAME] =
            JniIncludeResolver.collectImplementationIncludes(jniContainer) +
                    Include.createInternalInclude(JniNameRules.getHeaderFileName(fileName))

        val implFile = generateFile(
            "jni/CppProxyImplementation",
            mustacheData,
            jniNameRules.getImplementationFilePath(fileName)
        )

        return listOf(headerFile, implFile)
    }

    companion object {
        private const val INCLUDES_NAME = "includes"
        private const val INTERNAL_PACKAGES_NAME = "internalPackages"
        private const val CONTAINER_NAME = "container"
        private const val INTERNAL_NAMESPACE_NAME = "internalNamespace"
        private const val JNI_UTILS_TEMPLATE_PREFIX = "jni/utils/"

        private fun generateFile(templateName: String, data: Any, fileName: String) =
            GeneratedFile(TemplateEngine.render(templateName, data), fileName)
    }
}
