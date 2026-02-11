/*
 * Copyright (C) 2016-2025 HERE Europe B.V.
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

package com.here.gluecodium.generator.kotlin

import com.here.gluecodium.cli.GluecodiumExecutionException
import com.here.gluecodium.common.LimeLogger
import com.here.gluecodium.common.LimeModelFilter
import com.here.gluecodium.common.LimeModelSkipPredicates
import com.here.gluecodium.generator.common.GeneratedFile
import com.here.gluecodium.generator.common.Generator
import com.here.gluecodium.generator.common.GeneratorOptions
import com.here.gluecodium.generator.common.OptimizedListsCollector
import com.here.gluecodium.generator.common.nameRuleSetFromConfig
import com.here.gluecodium.generator.common.templates.TemplateEngine
import com.here.gluecodium.generator.cpp.CppNameCache
import com.here.gluecodium.generator.cpp.CppNameRules
import com.here.gluecodium.generator.jni.JniTemplates
import com.here.gluecodium.model.lime.LimeAttributeType.KOTLIN
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeExternalDescriptor.Companion.CONVERTER_NAME
import com.here.gluecodium.model.lime.LimeExternalDescriptor.Companion.NAME_NAME
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeTypeHelper
import com.here.gluecodium.validator.LimeOverloadsValidator
import java.io.File
import java.util.logging.Logger

internal class KotlinGenerator : Generator {
    private lateinit var basePackages: List<String>
    private lateinit var internalPackage: List<String>
    private lateinit var internalPackageList: List<String>
    private lateinit var internalNamespace: List<String>
    private lateinit var rootNamespace: List<String>
    private lateinit var cppNameRules: CppNameRules
    private lateinit var kotlinNameRules: KotlinNameRules
    private lateinit var activeTags: Set<String>
    private lateinit var werror: Set<String>
    private var internalApiAnnotationName: String? = null
    private var requireOptInAnnotation: List<String>? = null
    private var optInAnnotation: List<String>? = null

    override val shortName = GENERATOR_NAME

    override fun initialize(options: GeneratorOptions) {
        basePackages = options.kotlinPackages.ifEmpty { listOf("com", "example") }
        internalPackage = options.kotlinInternalPackages
        internalPackageList = basePackages + internalPackage
        internalNamespace = options.cppInternalNamespace
        rootNamespace = options.cppRootNamespace
        cppNameRules = CppNameRules(rootNamespace, nameRuleSetFromConfig(options.cppNameRules))
        kotlinNameRules = KotlinNameRules(nameRuleSetFromConfig(options.kotlinNameRules))
        activeTags = options.tags
        werror = options.werror
        requireOptInAnnotation = options.androidRequiresOptInAnnotation
        internalApiAnnotationName = options.androidInternalApiAnnotationName
        optInAnnotation = options.androidOptInAnnotation

        if (!preservesOptInAnnotationConsistency()) {
            throw GluecodiumExecutionException(
                "Kotlin generator requires either both annotations specified ('RequiresOptIn' and 'OptIn') or none of them!",
            )
        }
    }

    private fun preservesOptInAnnotationConsistency(): Boolean {
        val bothSpecified = requireOptInAnnotation != null && optInAnnotation != null
        val noneSpecified = requireOptInAnnotation == null && optInAnnotation == null

        return bothSpecified || noneSpecified
    }

    override fun generate(limeModel: LimeModel): List<GeneratedFile> {
        val limeLogger = LimeLogger(logger, limeModel.fileNameMap)
        val cachingNameResolver = CppNameCache(rootNamespace, limeModel.referenceMap, cppNameRules)

        val jniFilteredModel =
            LimeModelFilter
                .filter(limeModel) { LimeModelSkipPredicates.shouldRetainElement(it, activeTags, KOTLIN, retainFunctionsAndFields = true) }

        val kotlinFilteredModel =
            LimeModelFilter
                .filter(limeModel) { LimeModelSkipPredicates.shouldRetainElement(it, activeTags, KOTLIN, retainFunctionsAndFields = false) }

        val signatureResolver = KotlinSignatureResolver(limeModel.referenceMap, kotlinNameRules, activeTags)
        val overloadsValidator = LimeOverloadsValidator(signatureResolver, limeLogger, validateCustomConstructors = true)
        val interfacesValidator = KotlinInterfacesValidator(limeLogger)

        val validationResult =
            overloadsValidator.validate(jniFilteredModel.referenceMap.values) &&
                interfacesValidator.validate(kotlinFilteredModel.referenceMap)
        if (!validationResult) {
            throw GluecodiumExecutionException("Validation errors found, see log for details.")
        }

        val commentsProcessor =
            KotlinCommentsProcessor(kotlinFilteredModel.referenceMap, werror.contains(GeneratorOptions.WARNING_DOC_LINKS))

        val nameResolver =
            KotlinNameResolver(
                limeReferenceMap = limeModel.referenceMap,
                kotlinNameRules = kotlinNameRules,
                limeLogger = limeLogger,
                commentsProcessor = commentsProcessor,
                signatureResolver = signatureResolver,
                basePackages = basePackages,
            )

        val visibilityResolver = KotlinVisibilityResolver(limeModel.referenceMap)

        val internalApiAnnotation = if (requireOptInAnnotation != null) internalApiAnnotationName!! else null
        val importResolver =
            KotlinImportResolver(
                limeReferenceMap = limeModel.referenceMap,
                nameResolver = nameResolver,
                internalPackage = internalPackageList,
                internalApiAnnotation = internalApiAnnotation,
            )

        val importCollector =
            KotlinImportCollector(importResolver) {
                LimeModelSkipPredicates.shouldRetainCheckParent(it, activeTags, KOTLIN, limeModel.referenceMap)
            }

        val resultFiles =
            kotlinFilteredModel.topElements
                .flatMap {
                    generateKotlinFiles(
                        it,
                        nameResolver,
                        visibilityResolver,
                        importResolver,
                        importCollector,
                        internalApiAnnotation,
                    )
                }
                .toMutableList()

        val nativeBasePath = (listOf(GENERATOR_NAME) + internalPackageList).joinToString("/")
        resultFiles +=
            GeneratedFile(
                TemplateEngine.render("kotlin/KotlinNativeBase", internalPackageList),
                "$nativeBasePath/NativeBase.kt",
                GeneratedFile.SourceSet.COMMON,
            )
        resultFiles +=
            GeneratedFile(
                TemplateEngine.render("kotlin/KotlinAbstractNativeList", internalPackageList),
                "$nativeBasePath/AbstractNativeList.kt",
                GeneratedFile.SourceSet.COMMON,
            )
        resultFiles +=
            GeneratedFile(
                TemplateEngine.render("kotlin/KotlinDuration", internalPackageList),
                "$nativeBasePath/time/Duration.kt",
                GeneratedFile.SourceSet.COMMON,
            )

        if (requireOptInAnnotation != null) {
            val modelData =
                mapOf(
                    "internalPackageList" to internalPackageList,
                    "requireOptInAnnotation" to requireOptInAnnotation,
                    "internalApiAnnotationName" to internalApiAnnotationName,
                )
            resultFiles +=
                GeneratedFile(
                    TemplateEngine.render("kotlin/KotlinInternalApiAnnotation", modelData),
                    "$nativeBasePath/${internalApiAnnotationName!!}.kt",
                    GeneratedFile.SourceSet.COMMON,
                )
        }

        val descendantInterfaces = LimeTypeHelper.collectDescendantInterfaces(jniFilteredModel.topElements)
        val jniTemplates =
            JniTemplates(
                generatorName = GENERATOR_NAME,
                platformAttribute = KOTLIN,
                limeReferenceMap = jniFilteredModel.referenceMap,
                nameRules = kotlinNameRules,
                externalNameRules =
                    mapOf(
                        "getPackageFromImportString" to KotlinNameRules.Companion::getPackageFromImportString,
                        "getClassNamesFromImportString" to KotlinNameRules.Companion::getClassNamesFromImportString,
                    ),
                signatureResolver = signatureResolver,
                basePackages = basePackages,
                internalPackages = internalPackage,
                internalNamespace = internalNamespace,
                cppNameRules = cppNameRules,
                nameCache = cachingNameResolver,
                activeTags = activeTags,
                descendantInterfaces = descendantInterfaces,
            )
        for (fileName in UTILS_FILES) {
            resultFiles += jniTemplates.generateConversionUtilsHeaderFile(fileName)
            resultFiles += jniTemplates.generateConversionUtilsImplementationFile(fileName)
        }
        for (fileName in UTILS_FILES_HEADER_ONLY) {
            resultFiles += jniTemplates.generateConversionUtilsHeaderFile(fileName)
        }

        val allTypes = jniFilteredModel.topElements.flatMap { LimeTypeHelper.getAllTypes(it) }
        resultFiles += allTypes.flatMap { jniTemplates.generateFiles(it) } +
            jniTemplates.generateConversionFiles(allTypes)

        if (commentsProcessor.hasError) {
            throw GluecodiumExecutionException("Validation errors found, see log for details.")
        }

        return resultFiles
    }

    private fun generateKotlinFiles(
        limeElement: LimeNamedElement,
        nameResolver: KotlinNameResolver,
        visibilityResolver: KotlinVisibilityResolver,
        importResolver: KotlinImportResolver,
        importCollector: KotlinImportCollector,
        internalApiAnnotation: String?,
    ): List<GeneratedFile> {
        if (limeElement.external?.kotlin?.get(NAME_NAME) != null &&
            limeElement.external?.kotlin?.get(CONVERTER_NAME) == null
        ) {
            return emptyList()
        }

        val contentTemplateName = selectTemplate(limeElement)
        val packages = (basePackages + limeElement.path.head).map { KotlinNameResolver.normalizePackageName(it) }

        var imports = importCollector.collectImports(limeElement).filterNot { KotlinNameRules.getPackageFromImportString(it) == packages }
        if (limeElement is LimeInterface || limeElement is LimeLambda) {
            imports = (imports + listOf(importResolver.nativeBaseImport))
        }

        val optimizedLists = OptimizedListsCollector().getAllOptimizedLists(limeElement)
        val optInAnnotationString = optInAnnotation?.joinToString(".")
        val internalApiAnnotationClassPath =
            if (optInAnnotationString != null) internalPackageList.joinToString(".") + "." + internalApiAnnotation else null

        val templateData =
            mutableMapOf(
                "model" to limeElement,
                "modelName" to limeElement.name,
                "contentTemplate" to contentTemplateName,
                "package" to packages,
                "imports" to imports.distinct().sorted(),
                "optimizedLists" to optimizedLists,
                "optInAnnotationString" to optInAnnotationString,
                "internalApiAnnotation" to internalApiAnnotation,
                "internalApiAnnotationClassPath" to internalApiAnnotationClassPath,
            )

        val nameResolvers = mapOf("" to nameResolver, "visibility" to visibilityResolver)

        val mainContent =
            TemplateEngine.render("kotlin/KotlinFile", templateData, nameResolvers, KotlinGeneratorPredicates.predicates)
        val name = nameResolver.resolveName(limeElement)
        val mainFileName = (listOf(GENERATOR_NAME) + packages + "$name.kt").joinToString(File.separator)
        val mainFile = GeneratedFile(mainContent, mainFileName)

        return listOf(mainFile)
    }

    private fun selectTemplate(limeElement: LimeNamedElement) =
        when (limeElement) {
            is LimeClass -> "kotlin/KotlinClass"
            is LimeInterface -> "kotlin/KotlinInterface"
            is LimeStruct -> "kotlin/KotlinStruct"
            is LimeEnumeration -> "kotlin/KotlinEnumeration"
            is LimeException -> "kotlin/KotlinException"
            is LimeLambda -> "kotlin/KotlinLambda"
            is LimeTypeAlias -> "kotlin/KotlinTypeAlias"
            else -> throw GluecodiumExecutionException("Unsupported top-level element: " + limeElement::class.java.name)
        }

    companion object {
        internal const val GENERATOR_NAME = "android-kotlin"

        private val logger = Logger.getLogger(KotlinGenerator::class.java.name)

        private val UTILS_FILES =
            listOf(
                "CppProxyBase",
                "FieldAccessMethods",
                "JniBase",
                "JniCallbackErrorChecking",
                "JniCppConversionUtils",
                "JniJavaContainers",
                "BoxingConversionUtils",
                "JniClassCache",
                "JniNativeHandle",
                "JniWrapperCache",
                "JniExceptionThrower",
                "JniReference",
                "JniThrowNewException",
            )
        private val UTILS_FILES_HEADER_ONLY =
            listOf("JniCallJavaMethod", "ArrayConversionUtils", "JniTemplateMetainfo", "JniTypeId")
    }
}
