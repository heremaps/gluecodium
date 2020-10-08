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

package com.here.gluecodium.platform.android

import com.here.gluecodium.Gluecodium
import com.here.gluecodium.cli.GluecodiumExecutionException
import com.here.gluecodium.common.LimeLogger
import com.here.gluecodium.generator.androidmanifest.AndroidManifestGenerator
import com.here.gluecodium.generator.common.GeneratedFile
import com.here.gluecodium.generator.common.LimeModelFilter
import com.here.gluecodium.generator.common.nameRuleSetFromConfig
import com.here.gluecodium.generator.cpp.CppNameRules
import com.here.gluecodium.generator.java.JavaNameRules
import com.here.gluecodium.generator.java.JavaTemplates
import com.here.gluecodium.generator.jni.JavaGenerator
import com.here.gluecodium.generator.jni.JavaModel
import com.here.gluecodium.generator.jni.JniTemplates
import com.here.gluecodium.model.common.Comments
import com.here.gluecodium.model.java.JavaClass
import com.here.gluecodium.model.java.JavaCustomTypeRef
import com.here.gluecodium.model.java.JavaElement
import com.here.gluecodium.model.java.JavaMethod
import com.here.gluecodium.model.java.JavaPackage
import com.here.gluecodium.model.java.JavaTopLevelElement
import com.here.gluecodium.model.lime.LimeAttributeType.JAVA
import com.here.gluecodium.model.lime.LimeAttributeValueType.SKIP
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeProperty
import com.here.gluecodium.model.lime.LimeTypeHelper
import com.here.gluecodium.platform.common.GeneratorSuite
import java.util.logging.Logger

/**
 * Combines generators [JavaGenerator], [JniTemplates] and [JavaTemplates] to generate Java code and
 * bindings to BaseAPI layer for Java.
 */
internal class JavaGeneratorSuite(options: Gluecodium.Options) : GeneratorSuite {

    private val rootPackage = options.javaPackages
    private val internalPackage = options.javaInternalPackages
    private val internalNamespace = options.cppInternalNamespace
    private val rootNamespace = options.cppRootNamespace
    private val commentsProcessor =
        JavaDocProcessor(options.werror.contains(Gluecodium.Options.WARNING_DOC_LINKS))
    private val cppNameRules =
        CppNameRules(rootNamespace, nameRuleSetFromConfig(options.cppNameRules))
    private val javaNameRules = JavaNameRules(nameRuleSetFromConfig(options.javaNameRules))
    private val nonNullAnnotation = annotationFromOption(options.javaNonNullAnnotation)
    private val nullableAnnotation = annotationFromOption(options.javaNullableAnnotation)
    private val generateStubs = options.generateStubs

    override fun generate(limeModel: LimeModel): List<GeneratedFile> {
        val javaPackageList =
            if (rootPackage.isNotEmpty()) rootPackage else JavaPackage.DEFAULT_PACKAGE_NAMES
        val internalPackageList = javaPackageList + internalPackage

        val jniGenerator = JavaGenerator(
            limeReferenceMap = limeModel.referenceMap,
            basePackages = javaPackageList,
            internalPackageList = internalPackage,
            nonNullAnnotation = nonNullAnnotation,
            nullableAnnotation = nullableAnnotation,
            javaNameRules = javaNameRules
        )

        val filteredElements =
            LimeModelFilter { it is LimeFunction || it is LimeProperty || !it.attributes.have(JAVA, SKIP) }
                .filter(limeModel.topElements)
        val combinedModel =
            filteredElements.fold(JavaModel()) { model, rootElement ->
                model.merge(jniGenerator.generateModel(rootElement))
            }
        // Build name mapping for auxiliary model
        val auxNameMapping = limeModel.auxiliaryElements.fold(emptyMap<String, JavaElement>()) {
                acc, element -> acc + jniGenerator.generateModel(element).referenceMap
            }

        processCommentLinks(
            combinedModel.javaElements,
            combinedModel.referenceMap + auxNameMapping,
            combinedModel.reverseReferenceMap,
            limeModel
        )

        if (commentsProcessor.hasError) {
            throw GluecodiumExecutionException("Validation errors found, see log for details.")
        }

        val javaTemplates = JavaTemplates(GENERATOR_NAME, generateStubs)
        val nonExternalElements = combinedModel.javaElements.filter {
            it !is JavaTopLevelElement || !it.skipDeclaration
        }
        val javaFiles = javaTemplates.generateFiles(nonExternalElements).toMutableList()

        val nativeBasePath = listOf(GENERATOR_NAME) + internalPackageList + NATIVE_BASE_JAVA
        javaFiles.add(
            JavaTemplates.generateNativeBase(nativeBasePath.joinToString("/"), internalPackageList)
        )

        val headers = mutableListOf<GeneratedFile>()

        // Android manifest generator is special in that it generates only one file.
        val androidManifestGenerator = AndroidManifestGenerator(javaPackageList)
        headers += androidManifestGenerator.generate()

        if (generateStubs) return headers + javaFiles

        val jniTemplates = JniTemplates(
            limeReferenceMap = limeModel.referenceMap,
            javaNameRules = javaNameRules,
            basePackages = javaPackageList,
            internalPackages = internalPackage,
            internalNamespace = internalNamespace,
            cppNameRules = cppNameRules,
            rootNamespace = rootNamespace,
            generatorName = GENERATOR_NAME
        )
        for (fileName in UTILS_FILES) {
            headers += jniTemplates.generateConversionUtilsHeaderFile(fileName)
            headers += jniTemplates.generateConversionUtilsImplementationFile(fileName)
        }
        for (fileName in UTILS_FILES_HEADER_ONLY) {
            headers += jniTemplates.generateConversionUtilsHeaderFile(fileName)
        }

        val allTypes = filteredElements.flatMap { LimeTypeHelper.getAllTypes(it) }
        return headers + javaFiles +
                allTypes.flatMap { jniTemplates.generateFiles(it) } +
                jniTemplates.generateConversionFiles(allTypes)
    }

    private fun processCommentLinks(
        javaModel: List<JavaElement>,
        referenceMap: Map<String, JavaElement>,
        elementToLimeName: Map<JavaElement, String>,
        limeModel: LimeModel
    ) {
        val elementToJavaName = mutableMapOf<JavaElement, String>()
        referenceMap.values.forEach { resolveFullName(it, "", elementToJavaName) }

        val allElements = javaModel.toSet()
        val limeToJavaName = referenceMap.mapValues {
            val javaName = elementToJavaName[it.value] ?: return@mapValues ""
            javaName + getSignatureString(it.value, allElements, elementToLimeName)
        }

        val limeLogger = LimeLogger(logger, limeModel.fileNameMap)
        javaModel
            .flatMap { it.allElementsRecursive.toList() }
            .filterIsInstance<JavaElement>()
            .forEach { processElementsComments(it, elementToLimeName, limeToJavaName, limeLogger) }
    }

    private fun resolveFullName(
        element: JavaElement,
        name: String,
        elementToJavaName: MutableMap<JavaElement, String>
    ) {
        val fullName = when (element) {
            is JavaTopLevelElement ->
                if (name.isEmpty()) (element.javaPackage.packageNames + element.name).joinToString(
                    separator = "."
                )
                else name + "." + element.name
            else -> name + "#" + element.name
        }

        elementToJavaName[element] = fullName
        element.childElements.forEach { resolveFullName(it, fullName, elementToJavaName) }
    }

    private fun processElementsComments(
        element: JavaElement,
        elementToLimeName: Map<JavaElement, String>,
        limeToJavaName: Map<String, String>,
        limeLogger: LimeLogger
    ) {
        val limeName = elementToLimeName[element] ?: return

        val documentation = element.comment.documentation?.let {
            commentsProcessor.process(limeName, it, limeToJavaName, limeLogger)
        }
        val deprecationMessage = element.comment.deprecated?.let {
            commentsProcessor.process(limeName, it, limeToJavaName, limeLogger)
        }
        element.comment = Comments(documentation, deprecationMessage, element.comment.isExcluded)

        if (element is JavaMethod) {
            element.returnComment = element.returnComment?.let {
                commentsProcessor.process(limeName, it, limeToJavaName, limeLogger)
            }
            element.throwsComment = element.throwsComment?.let {
                commentsProcessor.process(limeName, it, limeToJavaName, limeLogger)
            }
        }

        if (element is JavaClass) {
            element.generatedConstructorComment = element.generatedConstructorComment?.let {
                commentsProcessor.process(limeName, it, limeToJavaName, limeLogger)
            }
        }
    }

    private fun getSignatureString(
        javaElement: JavaElement,
        allElements: Set<JavaElement>,
        elementToLimeName: Map<JavaElement, String>
    ): String {
        val javaMethod = javaElement as? JavaMethod ?: return ""
        val allOverloads = allElements
            .filterIsInstance<JavaMethod>()
            .filter { it.name == javaMethod.name }
        val limeName = elementToLimeName[javaMethod]
        val allLimeOverloads = elementToLimeName.values.filter { it == limeName }
        if (allOverloads.size < 2 && allLimeOverloads.size < 2) return ""

        return javaMethod.parameters.joinToString(prefix = "(", postfix = ")") { it.type.name }
    }

    companion object {
        private val logger = Logger.getLogger(JavaGeneratorSuite::class.java.name)
        const val GENERATOR_NAME = "android"

        private const val ARRAY_CONVERSION_UTILS = "ArrayConversionUtils"
        private const val CPP_PROXY_BASE = "CppProxyBase"
        private const val FIELD_ACCESS_UTILS = "FieldAccessMethods"
        private const val BOXING_CONVERSION_UTILS = "BoxingConversionUtils"
        private const val JNI_BASE = "JniBase"
        private const val JNI_CPP_CONVERSION_UTILS = "JniCppConversionUtils"
        private const val JNI_TEMPLATE_METAINFO = "JniTemplateMetainfo"
        private const val JNI_REFERENCE = "JniReference"
        private const val JNI_CALL_JAVA_METHOD = "JniCallJavaMethod"
        private const val JNI_CLASS_CACHE = "JniClassCache"
        private const val JNI_WRAPPER_CACHE = "JniWrapperCache"

        private val UTILS_FILES = listOf(
            CPP_PROXY_BASE,
            FIELD_ACCESS_UTILS,
            JNI_BASE,
            JNI_CPP_CONVERSION_UTILS,
            BOXING_CONVERSION_UTILS,
            JNI_CLASS_CACHE,
            JNI_WRAPPER_CACHE,
            JNI_CALL_JAVA_METHOD
        )
        private val UTILS_FILES_HEADER_ONLY = listOf(
            JNI_TEMPLATE_METAINFO,
            JNI_REFERENCE,
            ARRAY_CONVERSION_UTILS
        )

        private const val NATIVE_BASE_JAVA = "NativeBase.java"

        private fun annotationFromOption(option: Pair<String, List<String>>?) =
            option?.let { JavaCustomTypeRef(option.first, JavaPackage(option.second)) }
    }
}
