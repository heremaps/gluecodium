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
import com.here.genium.common.FrancaTypeHelper
import com.here.genium.generator.androidmanifest.AndroidManifestGenerator
import com.here.genium.generator.common.GeneratedFile
import com.here.genium.generator.java.JavaTemplates
import com.here.genium.generator.jni.JniGenerator
import com.here.genium.generator.jni.JniNameRules
import com.here.genium.generator.jni.JniTemplates
import com.here.genium.model.franca.FrancaDeploymentModel
import com.here.genium.model.java.JavaElement
import com.here.genium.model.java.JavaPackage
import com.here.genium.model.jni.JniContainer
import com.here.genium.platform.common.GeneratorSuite
import org.franca.core.franca.FTypeCollection

/**
 * Combines generators [JniGenerator] and [JavaTemplates] to generate Java code and
 * bindings to BaseAPI layer for Java.
 */
open class JavaGeneratorSuite protected constructor(
    options: Genium.Options,
    private val enableAndroidFeatures: Boolean,
    private val deploymentModel: FrancaDeploymentModel
) : GeneratorSuite() {

    private val rootPackage = options.javaPackages
    private val internalNamespace = options.cppInternalNamespace
    private val rootNamespace = options.cppRootNamespace

    protected open val generatorName = GENERATOR_NAME

    constructor(
        options: Genium.Options,
        deploymentModel: FrancaDeploymentModel
    ) : this(options, false, deploymentModel)

    override fun getName() = "com.here.JavaGeneratorSuite"

    override fun generate(typeCollections: List<FTypeCollection>): List<GeneratedFile> {
        val javaPackageList =
            if (!rootPackage.isEmpty()) rootPackage else JavaPackage.DEFAULT_PACKAGE_NAMES

        val jniGenerator = JniGenerator(
            deploymentModel,
            javaPackageList,
            UTILS_HEADER_INCLUDES.map(JniNameRules::getHeaderFileName),
            FrancaTypeHelper.getErrorEnumFilter(typeCollections),
            enableAndroidFeatures,
            internalNamespace!!,
            rootNamespace
        )

        val model = typeCollections.map(jniGenerator::generateModel).flatten()
        val javaModel = model.filterIsInstance(JavaElement::class.java)
        val jniModel = model.filterIsInstance(JniContainer::class.java)

        val javaTemplates = JavaTemplates(generatorName)
        val javaFiles = javaTemplates.generateFiles(javaModel)

        val nativeBasePath = listOf(generatorName) + javaPackageList + NATIVE_BASE_JAVA
        javaFiles.add(
            JavaTemplates.generateNativeBase(nativeBasePath.joinToString("/"), javaPackageList)
        )

        val headers = mutableListOf<GeneratedFile>()
        if (enableAndroidFeatures) {
            // This generator is special in that it generates only one file
            // At the moment it does not need to iterate over all interfaces
            val androidManifestGenerator = AndroidManifestGenerator(javaPackageList)
            headers += androidManifestGenerator.generate()
        }

        val jniTemplates = JniTemplates(javaPackageList, internalNamespace, generatorName)
        for (fileName in UTILS_FILES) {
            headers += jniTemplates.generateConversionUtilsHeaderFile(fileName)
            headers += jniTemplates.generateConversionUtilsImplementationFile(fileName)
        }
        for (fileName in UTILS_FILES_HEADER_ONLY) {
            headers += jniTemplates.generateConversionUtilsHeaderFile(fileName)
        }

        return headers + javaFiles + jniModel
            .filter(JniContainer::isFrancaInterface)
            .map(jniTemplates::generateFiles).flatten() +
                jniTemplates.generateConversionFiles(jniModel)
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
