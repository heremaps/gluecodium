/*
 * Copyright (C) 2016-2020 HERE Europe B.V.
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

package com.here.gluecodium.generator.java

import com.here.gluecodium.cli.GluecodiumExecutionException
import com.here.gluecodium.common.LimeLogger
import com.here.gluecodium.common.LimeModelFilter
import com.here.gluecodium.generator.common.CommentsProcessor
import com.here.gluecodium.generator.common.GeneratedFile
import com.here.gluecodium.generator.common.Generator
import com.here.gluecodium.generator.common.GeneratorOptions
import com.here.gluecodium.generator.common.nameRuleSetFromConfig
import com.here.gluecodium.generator.common.templates.TemplateEngine
import com.here.gluecodium.generator.cpp.CppNameCache
import com.here.gluecodium.generator.cpp.CppNameRules
import com.here.gluecodium.generator.jni.JniTemplates
import com.here.gluecodium.model.lime.LimeAttributeType.JAVA
import com.here.gluecodium.model.lime.LimeAttributeValueType.SKIP
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeExternalDescriptor.Companion.CONVERTER_NAME
import com.here.gluecodium.model.lime.LimeExternalDescriptor.Companion.NAME_NAME
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeProperty
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeTypeHelper
import com.here.gluecodium.model.lime.LimeTypesCollection
import com.here.gluecodium.validator.LimeOverloadsValidator
import java.io.File
import java.util.logging.Logger

/**
 * Combines Java and JNI templates to generate Java code and bindings to C++ layer for Java.
 */
internal class JavaGenerator : Generator {

    private lateinit var internalPackage: List<String>
    private lateinit var internalNamespace: List<String>
    private lateinit var rootNamespace: List<String>
    private lateinit var commentsProcessor: CommentsProcessor
    private lateinit var cppNameRules: CppNameRules
    private lateinit var javaNameRules: JavaNameRules
    private lateinit var basePackages: List<String>
    private lateinit var internalPackageList: List<String>
    private var nonNullAnnotation: JavaImport? = null
    private var nullableAnnotation: JavaImport? = null

    override val shortName = GENERATOR_NAME

    override fun initialize(options: GeneratorOptions) {
        internalPackage = options.javaInternalPackages
        internalNamespace = options.cppInternalNamespace
        rootNamespace = options.cppRootNamespace
        commentsProcessor = JavaDocProcessor(options.werror.contains(GeneratorOptions.WARNING_DOC_LINKS))
        cppNameRules = CppNameRules(rootNamespace, nameRuleSetFromConfig(options.cppNameRules))
        javaNameRules = JavaNameRules(nameRuleSetFromConfig(options.javaNameRules))
        nonNullAnnotation = annotationFromOption(options.javaNonNullAnnotation)
        nullableAnnotation = annotationFromOption(options.javaNullableAnnotation)
        basePackages = if (options.javaPackages.isNotEmpty()) options.javaPackages else listOf("com", "example")
        internalPackageList = basePackages + internalPackage
    }

    override fun generate(limeModel: LimeModel): List<GeneratedFile> {
        val cachingNameResolver = CppNameCache(rootNamespace, limeModel.referenceMap, cppNameRules)
        val filteredElements = LimeModelFilter.filter(limeModel) { shouldRetainElement(it) }.topElements
        val limeLogger = LimeLogger(logger, limeModel.fileNameMap)

        val overloadsValidator = LimeOverloadsValidator(limeModel.referenceMap, JAVA, javaNameRules, limeLogger)
        val validationResult = overloadsValidator.validate(filteredElements)
        if (!validationResult) {
            throw GluecodiumExecutionException("Validation errors found, see log for details.")
        }

        val nameResolver = JavaNameResolver(
            limeReferenceMap = limeModel.referenceMap,
            basePackages = basePackages,
            javaNameRules = javaNameRules,
            limeLogger = limeLogger,
            commentsProcessor = commentsProcessor
        )
        val importResolver = JavaImportResolver(
            limeReferenceMap = limeModel.referenceMap,
            nameResolver = nameResolver,
            internalPackages = internalPackageList,
            nonNullAnnotation = nonNullAnnotation,
            nullableAnnotation = nullableAnnotation
        )
        val resultFiles = flattenTypeCollections(filteredElements)
            .flatMap { generateJavaFiles(it, nameResolver, importResolver) }
            .toMutableList()

        val nativeBasePath = listOf(GENERATOR_NAME) + internalPackageList + "NativeBase.java"
        resultFiles += GeneratedFile(
            TemplateEngine.render("java/NativeBase", internalPackageList),
            nativeBasePath.joinToString("/"),
            GeneratedFile.SourceSet.COMMON
        )
        resultFiles += GeneratedFile(
            TemplateEngine.render("android/AndroidManifest", basePackages.joinToString(".")),
            GENERATOR_NAME + File.separator + "AndroidManifest.xml"
        )

        val jniTemplates = JniTemplates(
            limeReferenceMap = limeModel.referenceMap,
            javaNameRules = javaNameRules,
            basePackages = basePackages,
            internalPackages = internalPackage,
            internalNamespace = internalNamespace,
            cppNameRules = cppNameRules,
            generatorName = GENERATOR_NAME,
            nameCache = cachingNameResolver
        )
        for (fileName in UTILS_FILES) {
            resultFiles += jniTemplates.generateConversionUtilsHeaderFile(fileName)
            resultFiles += jniTemplates.generateConversionUtilsImplementationFile(fileName)
        }
        for (fileName in UTILS_FILES_HEADER_ONLY) {
            resultFiles += jniTemplates.generateConversionUtilsHeaderFile(fileName)
        }

        val allTypes = filteredElements.flatMap { LimeTypeHelper.getAllTypes(it) }
        resultFiles += allTypes.flatMap { jniTemplates.generateFiles(it) } +
            jniTemplates.generateConversionFiles(allTypes)

        if (commentsProcessor.hasError) {
            throw GluecodiumExecutionException("Validation errors found, see log for details.")
        }

        return resultFiles
    }

    private fun flattenTypeCollections(limeElements: List<LimeNamedElement>) =
        limeElements.flatMap {
            when (it) {
                is LimeTypesCollection ->
                    it.structs + it.enumerations + it.exceptions +
                        if (it.constants.isNotEmpty()) listOf(it) else emptyList()
                else -> listOf(it)
            }
        }

    private fun shouldRetainElement(limeElement: LimeNamedElement) =
        when {
            limeElement is LimeFunction || limeElement is LimeProperty -> true
            limeElement.attributes.have(JAVA, SKIP) -> false
            else -> true
        }

    private fun generateJavaFiles(
        limeElement: LimeNamedElement,
        nameResolver: JavaNameResolver,
        importResolver: JavaImportResolver
    ): List<GeneratedFile> {
        if (limeElement.external?.java?.get(NAME_NAME) != null &&
            limeElement.external?.java?.get(CONVERTER_NAME) == null
        ) {
            return emptyList()
        }

        val contentTemplateName = selectTemplate(limeElement) ?: return emptyList()
        val packages = (basePackages + limeElement.path.head).map { JavaNameResolver.normalizePackageName(it) }
        val importCollector = JavaImportCollector(importResolver)
        val imports = importCollector.collectImports(limeElement).filterNot { it.packageNames == packages }

        val templateData = mutableMapOf(
            "model" to limeElement,
            "contentTemplate" to contentTemplateName,
            "package" to packages,
            "imports" to imports.distinct().sorted(),
            "nonNullAnnotation" to nonNullAnnotation,
            "nullableAnnotation" to nullableAnnotation
        )

        val mainContent = TemplateEngine.render(
            "java/JavaFile",
            templateData,
            mapOf("" to nameResolver, "empty" to JavaEmptyValueResolver(nameResolver)),
            JavaGeneratorPredicates.predicates
        )
        val name = nameResolver.resolveName(limeElement)
        val mainFileName = (listOf(GENERATOR_NAME) + packages + "$name.java").joinToString(File.separator)
        val mainFile = GeneratedFile(mainContent, mainFileName)

        if (limeElement !is LimeInterface && limeElement !is LimeLambda) {
            return listOf(mainFile)
        }

        val implImports = when (limeElement) {
            is LimeInterface -> importCollector.collectImplImports(limeElement, imports)
            else -> imports
        } + importResolver.nativeBaseImport
        templateData["imports"] = implImports.distinct().sorted()
        templateData["contentTemplate"] = "java/JavaImplClass"

        val implContent = TemplateEngine.render(
            "java/JavaFile",
            templateData,
            mapOf("" to nameResolver, "empty" to JavaEmptyValueResolver(nameResolver)),
            JavaGeneratorPredicates.predicates
        )
        val implFileName = (listOf(GENERATOR_NAME) + packages + "${name}Impl.java").joinToString(File.separator)
        val implFile = GeneratedFile(implContent, implFileName)

        return listOf(mainFile, implFile)
    }

    private fun selectTemplate(limeElement: LimeNamedElement) =
        when (limeElement) {
            is LimeTypesCollection -> "java/JavaConstantsWrapper"
            is LimeClass -> "java/JavaClass"
            is LimeInterface -> "java/JavaInterface"
            is LimeStruct -> "java/JavaStruct"
            is LimeEnumeration -> "java/JavaEnumeration"
            is LimeException -> "java/JavaException"
            is LimeLambda -> "java/JavaLambda"
            is LimeTypeAlias -> null
            else -> throw GluecodiumExecutionException("Unsupported top-level element: " + limeElement::class.java.name)
        }

    companion object {
        private const val GENERATOR_NAME = "android"

        private val logger = Logger.getLogger(JavaGenerator::class.java.name)

        private val UTILS_FILES = listOf(
            "CppProxyBase",
            "FieldAccessMethods",
            "JniBase",
            "JniCppConversionUtils",
            "BoxingConversionUtils",
            "JniClassCache",
            "JniWrapperCache",
            "JniCallJavaMethod"
        )
        private val UTILS_FILES_HEADER_ONLY =
            listOf("ArrayConversionUtils", "JniExceptionThrower", "JniReference", "JniTemplateMetainfo")

        private fun annotationFromOption(option: Pair<String, List<String>>?) =
            option?.let { JavaImport(option.second, option.first) }
    }
}
