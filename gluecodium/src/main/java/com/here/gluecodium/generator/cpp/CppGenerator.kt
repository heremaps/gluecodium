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

package com.here.gluecodium.generator.cpp

import com.here.gluecodium.cli.GluecodiumExecutionException
import com.here.gluecodium.common.LimeLogger
import com.here.gluecodium.common.LimeModelFilter
import com.here.gluecodium.common.LimeModelSkipPredicates
import com.here.gluecodium.generator.common.CommentsProcessor
import com.here.gluecodium.generator.common.GeneratedFile
import com.here.gluecodium.generator.common.Generator
import com.here.gluecodium.generator.common.GeneratorOptions
import com.here.gluecodium.generator.common.Include
import com.here.gluecodium.generator.common.NameHelper
import com.here.gluecodium.generator.common.NameResolver
import com.here.gluecodium.generator.common.nameRuleSetFromConfig
import com.here.gluecodium.generator.common.templates.TemplateEngine
import com.here.gluecodium.model.lime.LimeAttributeType.CPP
import com.here.gluecodium.model.lime.LimeAttributeType.EQUATABLE
import com.here.gluecodium.model.lime.LimeConstant
import com.here.gluecodium.model.lime.LimeContainer
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeExternalDescriptor
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeTypeHelper
import com.here.gluecodium.validator.LimeOverloadsValidator
import java.io.File
import java.nio.file.Paths
import java.util.logging.Logger

/**
 * Main class for the C++ generator. Collects the template data from the LIME model, applies the
 * templates to it and returns the list of generated files.
 */
internal class CppGenerator : Generator {

    private lateinit var nameRules: CppNameRules
    private lateinit var rootNamespace: List<String>
    private lateinit var internalNamespace: List<String>
    private lateinit var commentsProcessor: CommentsProcessor
    private lateinit var exportName: String
    private lateinit var exportCommonName: String
    private lateinit var exportInclude: Include
    private lateinit var activeTags: Set<String>

    override val shortName = GENERATOR_NAME

    override fun initialize(options: GeneratorOptions) {
        nameRules = CppNameRules(options.cppRootNamespace, nameRuleSetFromConfig(options.cppNameRules))
        rootNamespace = options.cppRootNamespace
        internalNamespace = options.cppInternalNamespace
        commentsProcessor = DoxygenCommentsProcessor(options.werror.contains(GeneratorOptions.WARNING_DOC_LINKS))
        exportName = options.cppExport
        exportCommonName = options.cppExportCommon ?: options.cppExport
        exportInclude = Include.createInternalInclude(
            Paths.get(
                internalNamespace.joinToString(File.separator),
                getExportFileName(exportName) + ".h"
            ).toString()
        )
        activeTags = options.tags
    }

    override fun generate(limeModel: LimeModel): List<GeneratedFile> {
        val limeLogger = LimeLogger(logger, limeModel.fileNameMap)
        val skipAttributesValidator = CppSkipAttributesValidator(limeLogger)
        val skipValidationResult = skipAttributesValidator.validate(limeModel)
        if (!skipValidationResult) {
            throw GluecodiumExecutionException("Validation errors found, see log for details.")
        }

        val filteredModel =
            LimeModelFilter.filter(limeModel) { LimeModelSkipPredicates.shouldRetainElement(it, activeTags, CPP) }

        val signatureResolver = CppSignatureResolver(filteredModel.referenceMap, nameRules)
        val overloadsValidator = LimeOverloadsValidator(signatureResolver, limeLogger)
        val validationResult = overloadsValidator.validate(filteredModel.referenceMap.values)
        if (!validationResult) {
            throw GluecodiumExecutionException("Validation errors found, see log for details.")
        }

        val includeResolver = CppIncludeResolver(filteredModel.referenceMap, nameRules, internalNamespace)
        val cachingNameResolver = CppNameCache(rootNamespace, filteredModel.referenceMap, nameRules)
        val nameResolver = CppNameResolver(
            filteredModel.referenceMap,
            internalNamespace,
            cachingNameResolver,
            limeLogger,
            commentsProcessor
        )
        val fullNameResolver = CppFullNameResolver(cachingNameResolver)

        val allErrorEnums = filteredModel.topElements
            .flatMap { LimeTypeHelper.getAllTypes(it) }
            .asSequence()
            .filterIsInstance<LimeException>()
            .map { it.errorType.type }
            .filterIsInstance<LimeEnumeration>()
            .filter { it.external?.cpp == null }
            .map { it.fullName }
            .toSet()
        val predicates = CppGeneratorPredicates(filteredModel.referenceMap).predicates

        val generatedFiles = filteredModel.topElements.flatMap {
            val fileName = nameRules.getOutputFilePath(it)
            generateCode(it, fileName, includeResolver, nameResolver, fullNameResolver, signatureResolver, allErrorEnums, predicates)
        } + COMMON_HEADERS.map { generateHelperFile(it, "include", ".h") } +
            COMMON_IMPLS.map { generateHelperFile(it, "src", ".cpp") } +
            generateExportHelperFile(exportCommonName, "Common", GeneratedFile.SourceSet.COMMON) +
            generateExportHelperFile(exportName, "", GeneratedFile.SourceSet.MAIN)

        if (commentsProcessor.hasError) {
            throw GluecodiumExecutionException("Validation errors found, see log for details.")
        }

        return generatedFiles
    }

    private fun generateCode(
        rootElement: LimeNamedElement,
        fileName: String,
        includeResolver: CppIncludeResolver,
        nameResolver: CppNameResolver,
        fullNameResolver: CppFullNameResolver,
        signatureResolver: CppSignatureResolver,
        allErrorEnums: Set<String>,
        predicates: Map<String, (Any)-> Boolean>
    ): List<GeneratedFile> {

        val allTypes = LimeTypeHelper.getAllTypes(rootElement)
        val errorEnums = allTypes.filter { allErrorEnums.contains(it.fullName) }.toSet()

        val limeElements = listOf(rootElement) // TODO
        val hasConstants = limeElements.any { it is LimeConstant }
        val needsHeader = hasConstants || limeElements.any { it !is LimeException && it.external?.cpp == null }
        val needsImplementation = hasConstants || errorEnums.isNotEmpty() ||
            limeElements.any { it is LimeContainer } || limeElements.any { it is LimeEnumeration }
        if (!needsHeader && !needsImplementation) {
            return emptyList()
        }

        val equatableTypes = allTypes.filter { it.external?.cpp == null && it.attributes.have(EQUATABLE) }
        val forwardDeclarations = CppForwardDeclarationsCollector(nameResolver).collectImports(rootElement)
        val templateData = mutableMapOf(
            "internalNamespace" to internalNamespace,
            "namespace" to rootNamespace + rootElement.path.head,
            "rootNamespace" to rootNamespace,
            "exportName" to exportName,
            "model" to rootElement,
            "equatables" to equatableTypes,
            "errorEnums" to errorEnums,
            "forwardDeclarations" to forwardDeclarations
        )

        val nameResolvers = mapOf("" to nameResolver, "FQN" to fullNameResolver, "C++" to nameResolver)
        val result = mutableListOf<GeneratedFile>()
        if (needsHeader) {
            val headerIncludesCollector = CppHeaderIncludesCollector(includeResolver, allErrorEnums)
            val headerIncludes = headerIncludesCollector.collectImports(rootElement) + exportInclude
            templateData["functionUsings"] = collectFunctionUsings(rootElement, signatureResolver)
            result += generateHeader(rootElement, nameResolvers, fileName, templateData, headerIncludes, predicates)
        }
        if (needsImplementation) {
            val implIncludesCollector = CppImplIncludesCollector(includeResolver, allErrorEnums)
            val implementationIncludes = implIncludesCollector.collectImports(rootElement) +
                createSelfInclude(rootElement, needsHeader, fileName)
            result += generateImplementation(rootElement, nameResolvers, implementationIncludes, templateData, fileName, predicates)
        }

        return result
    }

    private fun collectFunctionUsings(rootElement: LimeNamedElement, signatureResolver: CppSignatureResolver) =
        LimeTypeHelper.getAllTypes(rootElement)
            .filterIsInstance<LimeContainerWithInheritance>()
            .filter { it.parents.isNotEmpty() }
            .associateBy({ it.fullName }, { getFunctionUsing(it, signatureResolver) })

    private fun getFunctionUsing(limeContainer: LimeContainerWithInheritance, signatureResolver: CppSignatureResolver) =
        limeContainer.functions.mapNotNull { signatureResolver.getInheritedOverloads(it).firstOrNull() }

    private fun generateImplementation(
        rootElement: LimeNamedElement,
        nameResolvers: Map<String, NameResolver>,
        implementationIncludes: List<Include>,
        generalData: Map<String, Any>,
        fileName: String,
        predicates: Map<String, (Any)-> Boolean>
    ): GeneratedFile {
        val templateData = generalData + mapOf(
            "includes" to implementationIncludes.distinct().sorted(),
            "contentTemplate" to selectTemplate(rootElement) + "Impl"
        )
        val implementationContent =
            TemplateEngine.render("cpp/CppImplementation", templateData, nameResolvers, predicates)
        val absolutePath = Paths.get(GENERATOR_NAME, "src", fileName)
        return GeneratedFile(implementationContent, "$absolutePath.cpp")
    }

    private fun generateHeader(
        rootElement: LimeNamedElement,
        nameResolvers: Map<String, NameResolver>,
        fileName: String,
        generalData: Map<String, Any>,
        headerIncludes: List<Include>,
        predicates: Map<String, (Any)-> Boolean>
    ): GeneratedFile {
        val absolutePath = Paths.get(GENERATOR_NAME, "include", fileName)
        val headerFileName = "$absolutePath.h"

        val sortedIncludes =
            headerIncludes.distinct().sorted().filterNot { headerFileName.endsWith(it.fileName) }
        val templateData = generalData +
            mapOf("includes" to sortedIncludes, "contentTemplate" to selectTemplate(rootElement))
        val headerContent =
            TemplateEngine.render("cpp/CppHeader", templateData, nameResolvers, predicates, sorters)
        return GeneratedFile(headerContent, headerFileName)
    }

    private fun generateHelperFile(fileName: String, subDir: String, suffix: String): GeneratedFile {
        val templateData = mapOf(
            "internalNamespace" to internalNamespace,
            "exportName" to exportCommonName,
            "exportFileName" to getExportFileName(exportCommonName, "Common")
        )
        val content = TemplateEngine.render("cpp/common/$fileName", templateData)

        val namePrefix = Paths.get(GENERATOR_NAME, subDir, internalNamespace.joinToString("/"), fileName).toString()
        return GeneratedFile(content, namePrefix + suffix, GeneratedFile.SourceSet.COMMON)
    }

    private fun generateExportHelperFile(
        exportName: String,
        infix: String,
        sourceSet: GeneratedFile.SourceSet
    ): GeneratedFile {
        val templateData = mapOf("internalNamespace" to internalNamespace, "exportName" to exportName)
        val content = TemplateEngine.render("cpp/common/Export", templateData)

        val fileName = getExportFileName(exportName, infix)
        val namePrefix = Paths.get(GENERATOR_NAME, "include", internalNamespace.joinToString("/"), fileName).toString()
        return GeneratedFile(content, "$namePrefix.h", sourceSet)
    }

    private fun getExportFileName(exportName: String, infix: String = "") =
        "Export" + infix + NameHelper.toUpperCamelCase(exportName)

    private fun selectTemplate(limeElement: LimeNamedElement) =
        when (limeElement) {
            is LimeContainerWithInheritance -> "cpp/CppClass"
            is LimeStruct -> "cpp/CppStruct"
            is LimeEnumeration -> "cpp/CppEnumeration"
            is LimeException -> null
            is LimeLambda -> "cpp/CppLambda"
            is LimeTypeAlias -> "cpp/CppTypeAlias"
            else -> throw GluecodiumExecutionException("Unsupported top-level element: " + limeElement::class.java.name)
        }

    private fun createSelfInclude(
        rootElement: LimeNamedElement,
        needsHeader: Boolean,
        fileName: String
    ): List<Include> {
        if (needsHeader) return listOf(Include.createInternalInclude("$fileName.h"))
        val externalInclude = rootElement.external?.cpp?.get(LimeExternalDescriptor.INCLUDE_NAME) ?: return emptyList()
        return externalInclude.split(',').map { Include.createInternalInclude(it.trim()) }
    }

    companion object {
        private const val GENERATOR_NAME = "cpp"

        private val logger = Logger.getLogger(CppGenerator::class.java.name)
        private val COMMON_HEADERS = listOf(
            "DurationHash",
            "Hash",
            "Locale",
            "Return",
            "TimePointHash",
            "TypeRepository",
            "UnorderedMapHash",
            "UnorderedSetHash",
            "VectorHash"
        )
        private val COMMON_IMPLS = listOf("LocaleImpl", "TypeRepositoryImpl")

        private val sorters = mapOf(
            "" to { elements: List<Any> ->
                TopologicalSort(elements.filterIsInstance<LimeNamedElement>()).sort()
            }
        )
    }
}
