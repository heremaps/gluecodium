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
import com.here.gluecodium.model.lime.LimeAttributeType.KOTLIN
import com.here.gluecodium.model.lime.LimeAttributeType.KMP
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeException
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
 * JNI C++ bindings must be handled by the external Android/Ninja pipeline.
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
    // HELPERS
    // -------------------------------------------------------------------------

    private fun getIndent(s: String) = s.substringBefore(s.trim().ifEmpty { "" })


    private fun processActualContent(input: String): String {
        val lines = input.lines()
        val result = mutableListOf<String>()
        var isInFunction = false
        var topLevel = true
        var insideTopLevelEnum = false
        var fileBraceDepth = 0
        var functionBraceDepth = 0
        var isInsidePrivateClass = false
        var privateClassBraceDepth = 0

        for (line in lines) {
            val rawLine = line
            val l = rawLine.trim()
            val indent = getIndent(rawLine)
            if (topLevel && l.contains("enum class ")) {
                insideTopLevelEnum = true
            }
            if (insideTopLevelEnum) {
                if (l.contains("}")) {
                    insideTopLevelEnum = false
                }
                continue
            }

            if (l.contains("{")) fileBraceDepth += l.count { it == '{' }
            if (l.contains("}")) fileBraceDepth -= l.count { it == '}' }
            if (fileBraceDepth == 0) topLevel = true else topLevel = false

            if (l.isEmpty()) { result.add(""); continue }
            if (l.startsWith("/") || l.startsWith("*") || l.startsWith("//")) {
                result.add(rawLine); continue
            }

            if (isInFunction) {
                result.add(rawLine)
                val opens = l.count { it == '{' }
                val closes = l.count { it == '}' }
                functionBraceDepth += opens
                functionBraceDepth -= closes

                if (isInsidePrivateClass) {
                    privateClassBraceDepth += opens
                    privateClassBraceDepth -= closes
                }

                if (functionBraceDepth <= 0) isInFunction = false

                if (isInsidePrivateClass && privateClassBraceDepth <= 0) {
                    isInsidePrivateClass = false
                }
                continue
            }

            if (l.contains("private class ") || l.contains("private interface ")) {
                isInsidePrivateClass = true
                privateClassBraceDepth = 0 // resetujemy na wszelki wypadek
            }

            if (isInsidePrivateClass) {
                privateClassBraceDepth += l.count { it == '{' }
                privateClassBraceDepth -= l.count { it == '}' }
            }

            val isPrivateLine = l.contains("private ") || l.contains("LIBRARY_LOADER")
            val shouldSkipActual = isPrivateLine || isInsidePrivateClass

            when {
                l.matches(Regex("^[A-Z_0-9]+\\(.*\\)[,;]?$")) -> {
                    result.add(rawLine)
                }

                l.contains("class ") || l.contains("interface ") || l.contains("companion object") ||
                l.contains("constructor(") || l.contains("fun ") || l.contains("val ") || l.contains("var ") -> {

                    var actualLine = rawLine

                    if (!shouldSkipActual && !l.startsWith("actual ") && !l.contains("actual ")) {
                        val content = rawLine.trim()
                        val newContent = when {
                            content.startsWith("protected constructor") -> content
                            content.startsWith("constructor") -> "actual $content"
                            content.startsWith("internal ") -> content.replaceFirst("internal ", "actual internal ")
                            content.startsWith("protected ") -> content.replaceFirst("protected ", "actual protected ")
                            content.startsWith("override ") -> content.replaceFirst("override ", "actual override ")
                            content.startsWith("interface ") -> "actual $content"
                            content.startsWith("class ") -> "actual $content"
                            else -> "actual $content"
                        }
                        actualLine = indent + newContent
                    }

                    result.add(actualLine)

                    if (!l.contains("interface ") && (l.contains("fun ") || l.contains("constructor(")) && l.contains("{") && !l.contains("}")) {
                        isInFunction = true
                        functionBraceDepth = 1
                    }
                }
                else -> result.add(rawLine)
            }

            if (isInsidePrivateClass && privateClassBraceDepth <= 0) {
                isInsidePrivateClass = false
            }
        }
        return result.joinToString("\n")
    }

    private fun processExpectContent(input: String): String {
        val lines = input.lines()
        val result = mutableListOf<String>()
        var isInFunction = false
        var functionBraceDepth = 0
        var headerBuffer = ""
        var isInsidePrivate = false
        var privateBraceCount = 0

        for (line in lines) {
            val rawLine = line
            val l = rawLine.trim()
            val indent = getIndent(rawLine)

            if (l.startsWith("package ") || l.startsWith("import ") || l.startsWith("@Deprecated")) {
                headerBuffer = ""
                result.add(rawLine)
                continue
            }
            if (l.isEmpty() || l.startsWith("/") || l.startsWith("*") || l.startsWith("//")) {
                result.add(rawLine)
                continue
            }

            if (l.contains("private class ") || l.contains("private interface ")) {
                isInsidePrivate = true
                headerBuffer = ""
            }

            if (isInsidePrivate) {
                privateBraceCount += l.count { it == '{' }
                privateBraceCount -= l.count { it == '}' }

                if (privateBraceCount <= 0) {
                    isInsidePrivate = false
                }
                headerBuffer = ""
                continue
            }

            if (isInFunction) {
                functionBraceDepth += l.count { it == '{' }
                functionBraceDepth -= l.count { it == '}' }
                if (functionBraceDepth <= 0) isInFunction = false
                continue
            }

            if (l.startsWith("@file:") || l.contains("@JvmMultifileClass") || l.endsWith(" get") || l.endsWith(" set")) {
                continue
            }
            if (l.contains("private") || l.contains("protected") || l.contains("LIBRARY_LOADER")) {
                headerBuffer = ""
                continue
            }

            if (l.startsWith("@") && !l.contains("class ") && !l.contains("fun ") && !l.contains("val ") && !l.contains("var ")) {
                headerBuffer += l + " "
                continue
            }

            val fullLine = (headerBuffer + " " + l).replace(Regex("\\s+"), " ").trim()
            var cleanLine = fullLine.replace(Regex("@\\w+(\\(.*?\\))?"), "")
                            .replace("external ", "")
                            .replace("actual ", "")
                            .replace("get()", "").replace("set(value)", "")
                            .replace(Regex("\\s+"), " ").trim()

            if (indent.isNotEmpty()) cleanLine = cleanLine.replace("expect ", "")
            if (!cleanLine.contains("val ") && !cleanLine.contains("var ")) cleanLine = cleanLine.replace("final ", "")

            when {
                (l.contains("class ") || l.contains("interface ")) && !l.contains("companion") -> {
                    var postfix = ""
                    var prefix = ""
                    if (indent.isEmpty()) {
                        prefix = "expect "
                    }
                    if (l.contains("{")) {
                        postfix = "{"
                    }
                    if (l.contains("enum class ")) {
                        val header = cleanLine.substringBefore("(").substringBefore("{").trim()
                        result.add("${indent}${header} {")
                    } else if (l.contains(": Exception") || l.contains(": RuntimeException")) {
                        val className = cleanLine.substringBefore("(").trim()
                        val type = if (l.contains("RuntimeException")) "RuntimeException" else "Exception"
                        result.add("$indent$prefix$className : $type $postfix")
                    } else {
                        result.add("$indent$prefix${cleanLine.substringBefore("{").trim()} $postfix")
                    }
                    headerBuffer = ""
                }
                l.contains("constructor(") -> {
                    val header = cleanLine.replace(Regex("\\)\\s*[:{].*"), ")").trim()
                    result.add("$indent$header")
                    if (l.contains("{") && !l.contains("}")) { isInFunction = true; functionBraceDepth = 1 }
                    headerBuffer = ""
                }
                l.contains("companion object") -> {
                    result.add("$indent${cleanLine.substringBefore("{").trim()} {")
                    headerBuffer = ""
                }
                l.matches(Regex("^[A-Z_0-9]+\\(.*\\)[,;]?$")) -> {
                    val name = cleanLine.substringBefore("(").trim()
                    val suffix = if (l.endsWith(";")) ";" else if (l.endsWith(",")) "," else ""
                    result.add("$indent$name$suffix")
                }
                l.contains("fun ") || l.contains("var ") || l.contains("val ") -> {
                    if (l.contains("override ")) {
                        headerBuffer = ""
                        if (l.contains("{") && !l.contains("}")) {
                            isInFunction = true
                            functionBraceDepth = 1
                        }
                    }
                    var member = cleanLine.substringBefore("{").substringBefore("=").trim()
                    result.add("$indent$member")
                    if (l.contains("fun ") && l.contains("{") && !l.contains("}") && !l.contains("external")) {
                        isInFunction = true; functionBraceDepth = 1
                    }
                    headerBuffer = ""
                }
                l == "}" -> {
                    result.add(rawLine)
                }
            }
        }
        return result.joinToString("\n")
    }

    private fun generateRuntimeFiles(limeModel: LimeModel): List<GeneratedFile> {
        val moduleDir = limeModel.topElements.firstOrNull()?.path?.head?.firstOrNull() ?: "sdk_common"
        val runtimePath = (listOf(moduleDir, "commonMain") + internalPackageList).joinToString("/")

        return listOf(
            GeneratedFile(
                TemplateEngine.render("kmp/KmpNativeBase", internalPackageList),
                "$runtimePath/NativeBase.kt",
                GeneratedFile.SourceSet.MAIN,
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

    /**
     *   The core of the generator: produces either "expect" or "actual" files based on the provided Lime element.
     */
    private fun generateKmpFiles(
        limeElement: LimeNamedElement,
        nameResolver: KotlinNameResolver,
        visibilityResolver: KotlinVisibilityResolver,
        importResolver: KotlinImportResolver,
        importCollector: KotlinImportCollector,
        isActual: Boolean,
        ): List<GeneratedFile> {
        // 1. Retrieving content template name
        val contentTemplateName = try {
            selectTemplate(limeElement)
        } catch (e: Exception) {
            return emptyList()
        }

        // 2. Preparing packages
        val packages =
            (basePackages + limeElement.path.head).map { KotlinNameResolver.normalizePackageName(it) }

        // 3. Imports
        var imports =
            importCollector.collectImports(limeElement).filterNot {
                KotlinNameRules.getPackageFromImportString(it) == packages
            }
        if (limeElement is LimeInterface || limeElement is LimeLambda) {
            imports = imports + listOf(importResolver.nativeBaseImport)
        }

        // 4. Data for Mustache
        val templateData =
            mapOf(
                "model" to limeElement,
                "modelName" to limeElement.name,
                "contentTemplate" to contentTemplateName,
                "package" to packages,
                "imports" to imports.distinct().sorted(),
                "optimizedLists" to OptimizedListsCollector().getAllOptimizedLists(limeElement),
                "isActual" to isActual,
            )

        val nameResolvers = mapOf("" to nameResolver, "visibility" to visibilityResolver)

        // 5. RENDERING
        val rawContent = TemplateEngine.render(
            "kmp/KmpFile",
            templateData,
            nameResolvers,
            KotlinGeneratorPredicates.predicates,
        )

        val processedContent = if (isActual) {
            processActualContent(rawContent)
        } else {
            processExpectContent(rawContent)
        }

        // 7. Safety check: now 'processedContent' is visible in this scope
        if (processedContent.length < 10) return emptyList()

        // 8. Writing
        val name = nameResolver.resolveName(limeElement)
        val uniqueSuffix = limeElement.path.toString().replace('.', '_').replace('/', '_')

        val moduleDir = limeElement.path.head.firstOrNull() ?: "sdk_common"
        val sourceSetDir = if (isActual) "jvmMain" else "commonMain"
        val fileName = (listOf(moduleDir, sourceSetDir) + packages + "${name}_$uniqueSuffix.kt")
                .joinToString(File.separator)

        // Using SourceSet.MAIN for Gluecodium to avoid mixing paths
        return listOf(GeneratedFile(processedContent, fileName, GeneratedFile.SourceSet.MAIN))
    }

    // -------------------------------------------------------------------------
    // MAIN GENERATION
    // -------------------------------------------------------------------------
    override fun generate(limeModel: LimeModel): List<GeneratedFile> {

        val limeLogger = LimeLogger(logger, limeModel.fileNameMap)

        // 1. Filtering the model for "expect" and "actual" generation based on KOTLIN and KMP attributes
        val kmpCommonModel = LimeModelFilter.filter(limeModel) {
            LimeModelSkipPredicates.shouldRetainElement(it, activeTags, KOTLIN, retainFunctionsAndFields = false)
        }.let { filtered ->
            LimeModelFilter.filter(filtered) {
                LimeModelSkipPredicates.shouldRetainElement(it, activeTags, KMP, retainFunctionsAndFields = false)
            }
        }

        val kmpJvmModel = LimeModelFilter.filter(limeModel) {
            LimeModelSkipPredicates.shouldRetainElement(it, activeTags, KOTLIN, retainFunctionsAndFields = true)
        }.let { filtered ->
            LimeModelFilter.filter(filtered) {
                LimeModelSkipPredicates.shouldRetainElement(it, activeTags, KMP, retainFunctionsAndFields = true)
            }
        }

        // 2. Resolvers setup
        val signatureResolver = KotlinSignatureResolver(limeModel.referenceMap, kmpNameRules, activeTags)
        val interfacesValidator = KotlinInterfacesValidator(limeLogger)

        if (!interfacesValidator.validate(kmpCommonModel.referenceMap)) {
            // Validation errors are logged, just proceed
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
                // Collect imports for every single element in the model without filtering
                true
            }

        // 3. Generate "expect" files (Common)
        val commonFiles =
            kmpCommonModel.topElements.flatMap {
                generateKmpFiles(it, nameResolver, visibilityResolver, importResolver, importCollector, isActual = false)
            }

        // 4. Generate "actual" files (JVM/Desktop)
        val jvmFiles =
            kmpJvmModel.topElements.flatMap {
                generateKmpFiles(it, nameResolver, visibilityResolver, importResolver, importCollector, isActual = true)
            }

        return commonFiles + jvmFiles + generateRuntimeFiles(limeModel)
    }

}
