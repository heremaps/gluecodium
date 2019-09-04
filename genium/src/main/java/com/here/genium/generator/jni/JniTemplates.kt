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

package com.here.genium.generator.jni

import com.here.genium.generator.common.GeneratedFile
import com.here.genium.generator.common.templates.TemplateEngine
import com.here.genium.generator.cpp.CppLibraryIncludes
import com.here.genium.model.common.Include
import com.here.genium.model.jni.JniContainer
import com.here.genium.model.jni.JniContainer.ContainerType
import com.here.genium.model.jni.JniElement
import com.here.genium.model.jni.JniType
import com.here.genium.platform.android.JavaGeneratorSuite

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

        if (jniContainer.containerType !== ContainerType.TYPE_COLLECTION) {
            results += generateFilesForElement(
                JniNameRules.getJniClassFileName(jniContainer),
                jniContainer
            )
        }
        results += jniContainer.structs.filter { it.methods.isNotEmpty() }.flatMap {
                generateFilesForElement(JniNameRules.getJniStructFileName(jniContainer, it), it)
            }

        return results
    }

    private fun generateFilesForElement(
        fileName: String,
        jniElement: JniElement
    ): List<GeneratedFile> {
        val containerData =
            mapOf(CONTAINER_NAME to jniElement, INTERNAL_NAMESPACE_NAME to internalNamespace)

        return listOf(
            generateFile("jni/Header", containerData, jniNameRules.getHeaderFilePath(fileName)),
            generateFile(
                "jni/Implementation",
                containerData,
                jniNameRules.getImplementationFilePath(fileName)
            )
        )
    }

    fun generateConversionFiles(combinedModel: JavaModel): List<GeneratedFile> {
        val results = mutableListOf<GeneratedFile>()
        addStructConversionFiles(combinedModel.jniContainers, results)
        addInstanceConversionFiles(combinedModel.jniContainers, results)
        addEnumConversionFiles(combinedModel.jniContainers, results)
        addCppProxyFiles(combinedModel.jniContainers, results)
        results +=
            generateEnumSetConversionFiles(combinedModel.jniContainers, combinedModel.jniEnumSets)

        return results
    }

    fun generateConversionUtilsHeaderFile(fileName: String) =
        generateFile(
            JNI_UTILS_TEMPLATE_PREFIX + fileName + HEADER_TEMPLATE_SUFFIX,
            mapOf(INTERNAL_NAMESPACE_NAME to internalNamespace),
            jniNameRules.getHeaderFilePath(fileName)
        )

    fun generateConversionUtilsImplementationFile(fileName: String) =
        generateFile(
            JNI_UTILS_TEMPLATE_PREFIX + fileName + IMPL_TEMPLATE_SUFFIX,
            mapOf(INTERNAL_NAMESPACE_NAME to internalNamespace),
            jniNameRules.getImplementationFilePath(fileName)
        )

    private fun addStructConversionFiles(
        jniContainers: List<JniContainer>,
        results: MutableList<GeneratedFile>
    ) {
        val includes =
            jniContainers.filter { it.structs.isNotEmpty() }.flatMap { it.includes }.toSet()
        val structs = jniContainers.flatMap { it.structs }.distinctBy { it.cppFullyQualifiedName }
        val mustacheData = mutableMapOf(
            INCLUDES_NAME to includes.sorted(),
            "structs" to structs.sortedBy { it.cppFullyQualifiedName },
            INTERNAL_NAMESPACE_NAME to internalNamespace
        )

        results.add(
            generateFile(
                "jni/StructConversionHeader",
                mustacheData,
                jniNameRules.getHeaderFilePath(JniNameRules.JNI_STRUCT_CONVERSION_NAME)
            )
        )

        mustacheData[INCLUDES_NAME] = listOf(
            Include.createInternalInclude(
                JniNameRules.getHeaderFileName(JniNameRules.JNI_STRUCT_CONVERSION_NAME)
            ),
            CppLibraryIncludes.INT_TYPES,
            CppLibraryIncludes.VECTOR,
            Include.createInternalInclude(
                JniNameRules.getHeaderFileName(JavaGeneratorSuite.FIELD_ACCESS_UTILS)
            ),
            Include.createInternalInclude(
                JniNameRules.getHeaderFileName(JniNameRules.JNI_ENUM_CONVERSION_NAME)
            )
        )

        results.add(
            generateFile(
                "jni/StructConversionImplementation",
                mustacheData,
                jniNameRules.getImplementationFilePath(JniNameRules.JNI_STRUCT_CONVERSION_NAME)
            )
        )
    }

    private fun addEnumConversionFiles(
        jniContainers: List<JniContainer>,
        results: MutableList<GeneratedFile>
    ) {
        val includes =
            jniContainers.filter { it.enums.isNotEmpty() }.flatMap { it.includes }.toSet()
        val enums = jniContainers.flatMap { it.enums }.distinctBy { it.cppEnumName }
        val mustacheData = mutableMapOf(
            INCLUDES_NAME to includes.sorted(),
            "enums" to enums.sortedBy { it.cppEnumName },
            INTERNAL_NAMESPACE_NAME to internalNamespace
        )

        results.add(
            generateFile(
                "jni/EnumConversionHeader",
                mustacheData,
                jniNameRules.getHeaderFilePath(JniNameRules.JNI_ENUM_CONVERSION_NAME)
            )
        )

        mustacheData[INCLUDES_NAME] = listOf(
            Include.createInternalInclude(
                JniNameRules.getHeaderFileName(JniNameRules.JNI_ENUM_CONVERSION_NAME)
            )
        )

        results.add(
            generateFile(
                "jni/EnumConversionImplementation",
                mustacheData,
                jniNameRules.getImplementationFilePath(JniNameRules.JNI_ENUM_CONVERSION_NAME)
            )
        )
    }

    private fun addInstanceConversionFiles(
        jniContainers: List<JniContainer>,
        results: MutableList<GeneratedFile>
    ) {
        val instanceContainers =
            jniContainers
                .filter { it.containerType != ContainerType.TYPE_COLLECTION }
                .distinctBy { it.cppFullyQualifiedName }

        val instanceIncludes = (setOf(CppLibraryIncludes.MEMORY, CppLibraryIncludes.NEW) +
            instanceContainers.flatMap { it.includes }).sorted().toMutableList()

        val instanceData = mapOf(
            INCLUDES_NAME to instanceIncludes,
            MODELS_NAME to instanceContainers.sortedBy { it.cppFullyQualifiedName },
            BASE_PACKAGES_NAME to basePackages,
            INTERNAL_PACKAGES_NAME to basePackages + internalPackages,
            INTERNAL_NAMESPACE_NAME to internalNamespace
        )

        results.add(
            generateFile(
                "jni/InstanceConversionHeader",
                instanceData,
                jniNameRules.getHeaderFilePath(JniNameRules.JNI_INSTANCE_CONVERSION_NAME)
            )
        )

        instanceIncludes.add(
            Include.createInternalInclude(
                JniNameRules.getHeaderFileName(JniNameRules.JNI_INSTANCE_CONVERSION_NAME)
            )
        )

        results.add(
            generateFile(
                "jni/InstanceConversionImplementation",
                instanceData,
                jniNameRules.getImplementationFilePath(JniNameRules.JNI_INSTANCE_CONVERSION_NAME)
            )
        )
    }

    private fun addCppProxyFiles(
        jniContainers: List<JniContainer>,
        results: MutableList<GeneratedFile>
    ) {
        val listeners = jniContainers.filter { it.containerType === ContainerType.INTERFACE }

        val proxyIncludes = mutableListOf<Include>()

        for (jniContainer in listeners) {
            val containerData = mutableMapOf(
                CONTAINER_NAME to jniContainer,
                INTERNAL_NAMESPACE_NAME to internalNamespace
            )

            val fileName =
                JniNameRules.getJniClassFileName(jniContainer) + JniNameRules.JNI_CPP_PROXY_SUFFIX
            results.add(
                generateFile(
                    "jni/CppProxyHeader", containerData, jniNameRules.getHeaderFilePath(fileName)
                )
            )

            val headerInclude =
                Include.createInternalInclude(JniNameRules.getHeaderFileName(fileName))

            proxyIncludes.add(headerInclude)
            containerData["headerInclude"] = headerInclude

            results.add(
                generateFile(
                    "jni/CppProxyImplementation",
                    containerData,
                    jniNameRules.getImplementationFilePath(fileName)
                )
            )
        }

        val mustacheData = mapOf(
            INCLUDES_NAME to proxyIncludes.sorted(),
            MODELS_NAME to listeners.sortedBy { it.cppFullyQualifiedName },
            INTERNAL_NAMESPACE_NAME to internalNamespace
        )

        results.add(
            generateFile(
                "jni/ProxyGeneratorHeader",
                mustacheData,
                jniNameRules.getHeaderFilePath(JniNameRules.JNI_PROXY_CONVERSION_NAME)
            )
        )
    }

    private fun generateEnumSetConversionFiles(
        jniContainers: List<JniContainer>,
        enumSets: Set<JniType>
    ): List<GeneratedFile> {
        val includes = jniContainers.flatMap { it.includes }.toSet()
        val mustacheData = mutableMapOf(
            INCLUDES_NAME to includes.sorted(),
            MODELS_NAME to enumSets.sortedBy { it.cppFullyQualifiedName },
            INTERNAL_NAMESPACE_NAME to internalNamespace
        )

        val headerFile =
            generateFile(
                "jni/EnumSetConversionHeader",
                mustacheData,
                jniNameRules.getHeaderFilePath(JNI_ENUM_SET_CONVERSION_NAME)
            )

        mustacheData[INCLUDES_NAME] = listOf(
            Include.createInternalInclude(
                JniNameRules.getHeaderFileName(JNI_ENUM_SET_CONVERSION_NAME)
            )
        )

        val implementationFile =
            generateFile(
                "jni/EnumSetConversionImplementation",
                mustacheData,
                jniNameRules.getImplementationFilePath(JNI_ENUM_SET_CONVERSION_NAME)
            )

        return listOf(headerFile, implementationFile)
    }

    companion object {
        private const val INCLUDES_NAME = "includes"
        private const val MODELS_NAME = "models"
        private const val BASE_PACKAGES_NAME = "basePackages"
        private const val INTERNAL_PACKAGES_NAME = "internalPackages"
        private const val CONTAINER_NAME = "container"
        private const val INTERNAL_NAMESPACE_NAME = "internalNamespace"

        private const val JNI_UTILS_TEMPLATE_PREFIX = "jni/utils/"
        private const val HEADER_TEMPLATE_SUFFIX = "Header"
        private const val IMPL_TEMPLATE_SUFFIX = "Implementation"

        private const val JNI_ENUM_SET_CONVERSION_NAME = "EnumSetConversion"

        private fun generateFile(templateName: String, data: Any, fileName: String): GeneratedFile {
            return GeneratedFile(TemplateEngine.render(templateName, data), fileName)
        }
    }
}
