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

package com.here.genium.platform.android

import com.here.genium.Genium
import com.here.genium.generator.androidmanifest.AndroidManifestGenerator
import com.here.genium.generator.common.GeneratedFile
import com.here.genium.generator.java.JavaTemplates
import com.here.genium.generator.jni.JavaModel
import com.here.genium.generator.jni.JniGenerator
import com.here.genium.generator.jni.JniNameRules
import com.here.genium.generator.jni.JniTemplates
import com.here.genium.model.java.JavaElement
import com.here.genium.model.java.JavaPackage
import com.here.genium.model.java.JavaTopLevelElement
import com.here.genium.model.jni.JniContainer
import com.here.genium.model.lime.LimeModel
import com.here.genium.platform.common.GeneratorSuite

/**
 * Combines generators [JniGenerator], [JniTemplates] and [JavaTemplates] to generate Java code and
 * bindings to BaseAPI layer for Java.
 */
open class JavaGeneratorSuite protected constructor(
    options: Genium.Options,
    private val enableAndroidFeatures: Boolean
) : GeneratorSuite() {

    private val rootPackage = options.javaPackages
    private val internalPackage = options.javaInternalPackages
    private val internalNamespace = options.cppInternalNamespace ?: listOf()
    private val rootNamespace = options.cppRootNamespace
    private val commentsProcessor = JavaDocProcessor()

    protected open val generatorName = GENERATOR_NAME

    constructor(options: Genium.Options) : this(options, false)

    override fun getName() = "com.here.JavaGeneratorSuite"

    override fun generate(limeModel: LimeModel): List<GeneratedFile> {
        val javaPackageList =
            if (!rootPackage.isEmpty()) rootPackage else JavaPackage.DEFAULT_PACKAGE_NAMES
        val internalPackageList = javaPackageList + internalPackage

        val jniGenerator = JniGenerator(
            limeModel.referenceMap,
            javaPackageList,
            internalPackage,
            UTILS_HEADER_INCLUDES.map { JniNameRules.getHeaderFileName(it) },
            enableAndroidFeatures,
            internalNamespace,
            rootNamespace
        )

        val combinedModel =
            limeModel.containers.fold(JavaModel(emptyMap(), emptyList())) { model, limeContainer ->
                model.merge(jniGenerator.generateModel(limeContainer))
            }
        val javaModel = combinedModel.containers.filterIsInstance<JavaElement>()
        val jniModel = combinedModel.containers.filterIsInstance<JniContainer>()

        processCommentLinks(javaModel, combinedModel.referenceMap)

        val javaTemplates = JavaTemplates(generatorName)
        val javaFiles = javaTemplates.generateFiles(javaModel)

        val nativeBasePath = listOf(generatorName) + internalPackageList + NATIVE_BASE_JAVA
        javaFiles.add(
            JavaTemplates.generateNativeBase(nativeBasePath.joinToString("/"), internalPackageList)
        )

        val headers = mutableListOf<GeneratedFile>()
        if (enableAndroidFeatures) {
            // This generator is special in that it generates only one file
            // At the moment it does not need to iterate over all interfaces
            val androidManifestGenerator = AndroidManifestGenerator(javaPackageList)
            headers += androidManifestGenerator.generate()
        }

        val jniTemplates =
            JniTemplates(javaPackageList, internalPackage, internalNamespace, generatorName)
        for (fileName in UTILS_FILES) {
            headers += jniTemplates.generateConversionUtilsHeaderFile(fileName)
            headers += jniTemplates.generateConversionUtilsImplementationFile(fileName)
        }
        for (fileName in UTILS_FILES_HEADER_ONLY) {
            headers += jniTemplates.generateConversionUtilsHeaderFile(fileName)
        }

        return headers + javaFiles + jniModel.map { jniTemplates.generateFiles(it) }.flatten() +
            jniTemplates.generateConversionFiles(jniModel)
    }

    private fun processCommentLinks(
        javaModel: List<JavaElement>,
        referenceMap: Map<String, JavaElement>
    ) {
        val elementToJavaName = mutableMapOf<JavaElement, String>()

        javaModel.forEach { resolveFullName(it, "", elementToJavaName) }

        val limeToJavaName = referenceMap.mapValues { elementToJavaName[it.value] ?: "" }
        val elementToLimeName = referenceMap.entries.associate { it.value to it.key }

        javaModel.stream().flatMap { it.streamRecursive() }.forEach { element ->
            if (element !is JavaElement) {
                return@forEach
            }
            val fullLimeName = elementToLimeName[element]
            if (fullLimeName != null) {
                element.comment = commentsProcessor.processLinks(
                    fullLimeName,
                    element.comment,
                    limeToJavaName
                )
            }
        }
    }

    private fun resolveFullName(
        element: JavaElement,
        name: String,
        elementToJavaName: MutableMap<JavaElement, String>
    ) {
        val fullName = when (element) {
            is JavaTopLevelElement ->
                if (name.isEmpty()) (element.javaPackage.packageNames + element.name).joinToString(separator = ".")
                else name + "." + element.name
            else -> name + "#" + element.name
        }

        elementToJavaName[element] = fullName
        element.stream().forEach { resolveFullName(it, fullName, elementToJavaName) }
    }

    companion object {
        const val GENERATOR_NAME = "java"

        private const val ARRAY_CONVERSION_UTILS = "ArrayConversionUtils"
        private const val CPP_PROXY_BASE = "CppProxyBase"
        const val FIELD_ACCESS_UTILS = "FieldAccessMethods"
        private const val BOXING_CONVERSION_UTILS = "BoxingConversionUtils"
        private const val JNI_BASE = "JniBase"
        private const val JNI_CPP_CONVERSION_UTILS = "JniCppConversionUtils"
        private const val JNI_TEMPLATE_METAINFO = "JniTemplateMetainfo"
        private const val JNI_REFERENCE = "JniReference"
        private const val JNI_CALL_JAVA_METHOD = "JniCallJavaMethod"
        private const val JNI_CLASS_CACHE = "JniClassCache"

        private val UTILS_FILES = listOf(
            CPP_PROXY_BASE,
            FIELD_ACCESS_UTILS,
            JNI_BASE,
            JNI_CPP_CONVERSION_UTILS,
            BOXING_CONVERSION_UTILS,
            JNI_CLASS_CACHE
        )
        private val UTILS_FILES_HEADER_ONLY = listOf(
            JNI_TEMPLATE_METAINFO, JNI_REFERENCE, JNI_CALL_JAVA_METHOD, ARRAY_CONVERSION_UTILS
        )
        private val UTILS_HEADER_INCLUDES =
            listOf(CPP_PROXY_BASE, FIELD_ACCESS_UTILS, JNI_BASE, JNI_CPP_CONVERSION_UTILS)

        private const val NATIVE_BASE_JAVA = "NativeBase.java"
    }
}
