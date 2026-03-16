/*
 * Copyright (C) 2016-2026 HERE Europe B.V.
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

package com.here.gluecodium.generator.kmp

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
import com.here.gluecodium.generator.kotlin.KotlinCommentsProcessor
import com.here.gluecodium.generator.kotlin.KotlinGeneratorPredicates
import com.here.gluecodium.generator.kotlin.KotlinImportCollector
import com.here.gluecodium.generator.kotlin.KotlinImportResolver
import com.here.gluecodium.generator.kotlin.KotlinInterfacesValidator
import com.here.gluecodium.generator.kotlin.KotlinNameResolver
import com.here.gluecodium.generator.kotlin.KotlinNameRules
import com.here.gluecodium.generator.kotlin.KotlinSignatureResolver
import com.here.gluecodium.generator.kotlin.KotlinVisibilityResolver
import com.here.gluecodium.model.lime.LimeAttributeType.KMP
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
import com.here.gluecodium.model.lime.LimeTypeRef
import java.io.File
import java.util.logging.Logger

/**
 * KmpGenerator focuses on generating Kotlin Multiplatform code.
 * - SourceSet.COMMON: "expect" declarations
 * - SourceSet.MAIN: "actual" implementations for JVM/Desktop
 * JNI C++ bindings are now handled by the external Android/Ninja pipeline.
 */
internal class KmpGenerator : Generator {
    private lateinit var basePackages: List<String>
    private lateinit var internalPackageList: List<String>
    private lateinit var kmpNameRules: KotlinNameRules
    private lateinit var activeTags: Set<String>
    private lateinit var werror: Set<String>

    override val shortName = GENERATOR_NAME

    override fun initialize(options: GeneratorOptions) {
        basePackages =
            options.kmpPackages.ifEmpty {
                options.kotlinPackages.ifEmpty { listOf("com", "example") }
            }

        val internalPackageSuffix = options.kmpInternalPackages.ifEmpty { options.kotlinInternalPackages }
        internalPackageList = basePackages + internalPackageSuffix

        kmpNameRules = KotlinNameRules(nameRuleSetFromConfig(options.kmpNameRules))
        activeTags = options.tags
        werror = options.werror
    }

    // -------------------------------------------------------------------------
    // HELPERS: Filter elements that shouldn't be in the Common SourceSet
    // -------------------------------------------------------------------------

    private fun isAndroidTypeRef(typeRef: LimeTypeRef?): Boolean {
        val typeString = typeRef?.toString() ?: return false
        return typeString.contains("AndroidContext") || typeString.contains("android.")
    }

    private fun isAndroidElement(elem: LimeNamedElement): Boolean =
        when (elem) {
            is LimeFunction -> elem.parameters.any { isAndroidTypeRef(it.typeRef) }
            is LimeProperty -> {
                val getterRef = elem.getter.returnType.typeRef
                val setterRefs = elem.setter?.parameters?.map { it.typeRef } ?: emptyList()
                isAndroidTypeRef(getterRef) || setterRefs.any { isAndroidTypeRef(it) }
            }
            else -> false
        }

    // -------------------------------------------------------------------------
    // MAIN GENERATION
    // -------------------------------------------------------------------------

    override fun generate(limeModel: LimeModel): List<GeneratedFile> {
        val limeLogger = LimeLogger(logger, limeModel.fileNameMap)

        // 1. Filter model for KMP Common (expect)
        val kmpCommonRaw =
            LimeModelFilter.filter(limeModel) {
                LimeModelSkipPredicates.shouldRetainElement(it, activeTags, KMP, false)
            }
        val kmpCommonModel = LimeModelFilter.filter(kmpCommonRaw) { elem -> !isAndroidElement(elem) }

        // 2. Filter model for KMP JVM/Desktop (actual)
        val kmpJvmRaw =
            LimeModelFilter.filter(limeModel) {
                LimeModelSkipPredicates.shouldRetainElement(it, activeTags, KMP, true)
            }
        val kmpJvmModel = LimeModelFilter.filter(kmpJvmRaw) { elem -> !isAndroidElement(elem) }

        // 3. Resolvers setup
        val signatureResolver = KotlinSignatureResolver(limeModel.referenceMap, kmpNameRules, activeTags)
        val interfacesValidator = KotlinInterfacesValidator(limeLogger)

        if (!interfacesValidator.validate(kmpCommonModel.referenceMap)) {
            // Validation errors are logged, but we proceed if possible
        }

        val commentsProcessor =
            KotlinCommentsProcessor(
                limeModel.referenceMap,
                werror.contains(GeneratorOptions.WARNING_DOC_LINKS),
            )

        val nameResolver =
            KotlinNameResolver(
                limeModel.referenceMap,
                kmpNameRules,
                limeLogger,
                commentsProcessor,
                signatureResolver,
                basePackages,
            )

        val visibilityResolver = KotlinVisibilityResolver(limeModel.referenceMap)
        val importResolver = KotlinImportResolver(limeModel.referenceMap, nameResolver, internalPackageList, null)
        val importCollector =
            KotlinImportCollector(importResolver) {
                LimeModelSkipPredicates.shouldRetainCheckParent(it, activeTags, KMP, limeModel.referenceMap)
            }

        // 4. Generate "expect" files (Common)
        val commonFiles =
            kmpCommonModel.topElements.flatMap {
                generateKmpFiles(it, nameResolver, visibilityResolver, importResolver, importCollector, isActual = false)
            }

        // 5. Generate "actual" files (JVM/Desktop)
        val jvmFiles =
            kmpJvmModel.topElements.flatMap {
                generateKmpFiles(it, nameResolver, visibilityResolver, importResolver, importCollector, isActual = true)
            }

        return commonFiles + jvmFiles + generateRuntimeFiles()
    }

    private fun generateKmpFiles(
        limeElement: LimeNamedElement,
        nameResolver: KotlinNameResolver,
        visibilityResolver: KotlinVisibilityResolver,
        importResolver: KotlinImportResolver,
        importCollector: KotlinImportCollector,
        isActual: Boolean,
    ): List<GeneratedFile> {
        // 1. External types checking
        if (limeElement.external?.kotlin?.get(NAME_NAME) != null &&
            limeElement.external?.kotlin?.get(CONVERTER_NAME) == null
        ) {
            return emptyList()
        }

        // 2. Retrieving content template name (e.g., "kmp/KmpClass")
        val contentTemplateName = selectTemplate(limeElement)

        // 3. Preparing packages
        val packages =
            (basePackages + limeElement.path.head).map { KotlinNameResolver.normalizePackageName(it) }

        // 4. Imports
        var imports =
            importCollector.collectImports(limeElement).filterNot {
                KotlinNameRules.getPackageFromImportString(it) == packages
            }
        if (limeElement is LimeInterface || limeElement is LimeLambda) {
            imports = imports + listOf(importResolver.nativeBaseImport)
        }

        // 5. Data for Mustache
        val templateData =
            mapOf(
                "model" to limeElement,
                "modelName" to limeElement.name,
                // This will be used by {{include contentTemplate}} in KmpFile
                "contentTemplate" to contentTemplateName,
                "package" to packages,
                "imports" to imports.distinct().sorted(),
                "optimizedLists" to OptimizedListsCollector().getAllOptimizedLists(limeElement),
                // We pass the flag, even if the template doesn't use it yet
                "isActual" to isActual,
            )

        val nameResolvers = mapOf("" to nameResolver, "visibility" to visibilityResolver)

        // 6. RENDERING - We use ONLY KmpFile
        val rawContent =
            TemplateEngine.render(
                "kmp/KmpFile",
                templateData,
                nameResolvers,
                KotlinGeneratorPredicates.predicates,
            )

        // Post-processor (adding actual/expect and cleaning method bodies)
        val processedContent =
            if (isActual) {
                rawContent
                    .replace("class ", "actual class ")
                    .replace("interface ", "actual interface ")
                    .replace("enum class ", "actual enum class ")
                    .replace("typealias ", "actual typealias ")
                    .replace("fun ", "actual fun ")
                    .replace("val ", "actual val ")
                    .replace("var ", "actual var ")
            } else {
                rawContent
                    .replace("class ", "expect class ")
                    .replace("interface ", "expect interface ")
                    .replace("enum class ", "expect enum class ")
                    .replace("typealias ", "expect typealias ")
                    .replace("fun ", "expect fun ")
                    .replace("val ", "expect val ")
                    .replace("var ", "expect var ")
                    // We remove everything from the first brace to the end for the expect version
                    .replace(Regex("(?s)\\{.*}"), "")
            }

        // 8. Writing
        val sourceSetDir = if (isActual) "jvm" else "common"
        val name = nameResolver.resolveName(limeElement)
        val uniqueSuffix = limeElement.path.toString().replace('.', '_').replace('/', '_')

        val fileName =
            (listOf(sourceSetDir) + packages + "${name}_$uniqueSuffix.kt")
                .joinToString(File.separator)

        // SourceSet informs the system whether it's production or test code,
        // but the fileName determines uniqueness on disk.
        val sourceSet = if (isActual) GeneratedFile.SourceSet.MAIN else GeneratedFile.SourceSet.COMMON

        return listOf(GeneratedFile(processedContent, fileName, sourceSet))
    }

    private fun generateRuntimeFiles(): List<GeneratedFile> {
        val runtimePath = (listOf(GENERATOR_NAME) + internalPackageList).joinToString("/")

        return listOf(
            GeneratedFile(
                TemplateEngine.render("kmp/KmpNativeBase", internalPackageList),
                "$runtimePath/NativeBase.kt",
                GeneratedFile.SourceSet.COMMON,
            ),
            GeneratedFile(
                TemplateEngine.render("kmp/KmpAbstractNativeList", internalPackageList),
                "$runtimePath/AbstractNativeList.kt",
                GeneratedFile.SourceSet.COMMON,
            ),
            GeneratedFile(
                TemplateEngine.render("kmp/KmpDuration", internalPackageList),
                "$runtimePath/time/Duration.kt",
                GeneratedFile.SourceSet.COMMON,
            ),
        )
    }

    private fun selectTemplate(elem: LimeNamedElement): String =
        when (elem) {
            is LimeClass -> "kmp/KmpClass"
            is LimeInterface -> "kmp/KmpInterface"
            is LimeStruct -> "kmp/KmpStruct"
            is LimeEnumeration -> "kmp/KmpEnumeration"
            is LimeException -> "kmp/KmpException"
            is LimeLambda -> "kmp/KmpLambda"
            is LimeTypeAlias -> "kmp/KmpTypeAlias"
            else -> throw GluecodiumExecutionException("Unsupported element type: ${elem::class.java.name}")
        }

    companion object {
        internal const val GENERATOR_NAME = "kmp"
        private val logger = Logger.getLogger(KmpGenerator::class.java.name)
    }
}
