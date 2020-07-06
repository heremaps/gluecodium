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

import com.here.gluecodium.Gluecodium
import com.here.gluecodium.cli.GluecodiumExecutionException
import com.here.gluecodium.common.LimeLogger
import com.here.gluecodium.generator.common.GeneratedFile
import com.here.gluecodium.generator.common.NameResolver
import com.here.gluecodium.generator.common.nameRuleSetFromConfig
import com.here.gluecodium.generator.common.templates.TemplateEngine
import com.here.gluecodium.generator.cpp.CppGeneratorPredicates.predicates
import com.here.gluecodium.model.common.Include
import com.here.gluecodium.model.cpp.CppForwardDeclarationGroup
import com.here.gluecodium.model.lime.LimeAttributeType.EQUATABLE
import com.here.gluecodium.model.lime.LimeConstant
import com.here.gluecodium.model.lime.LimeContainer
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeTypeHelper
import com.here.gluecodium.model.lime.LimeTypeRef
import com.here.gluecodium.model.lime.LimeTypesCollection
import com.here.gluecodium.platform.common.GeneratorSuite
import java.io.File
import java.nio.file.Paths
import java.util.logging.Logger

/**
 * Main class for the C++ generator. Collects the template data from the LIME model, applies the
 * templates to it and returns the list of generated files.
 */
internal class CppGeneratorSuite(options: Gluecodium.Options) : GeneratorSuite {

    private val nameRules =
        CppNameRules(options.cppRootNamespace, nameRuleSetFromConfig(options.cppNameRules))
    private val rootNamespace = options.cppRootNamespace
    private val internalNamespace = options.cppInternalNamespace
    private val commentsProcessor =
        DoxygenCommentsProcessor(options.werror.contains(Gluecodium.Options.WARNING_DOC_LINKS))
    private val exportInclude = Include.createInternalInclude(
        Paths.get(internalNamespace.joinToString(File.separator), "Export.h").toString()
    )
    private val exportName = options.cppExport

    override fun generate(limeModel: LimeModel): List<GeneratedFile> {
        val limeLogger = LimeLogger(logger, limeModel.fileNameMap)
        val cachingNameResolver = CppNameResolver(rootNamespace, limeModel.referenceMap, nameRules)
        val nameResolver = Cpp2NameResolver(
            limeModel.referenceMap,
            internalNamespace,
            limeLogger,
            commentsProcessor,
            cachingNameResolver
        )

        val allErrorEnums = limeModel.topElements
            .filterIsInstance<LimeType>()
            .flatMap { LimeTypeHelper.getAllTypes(it) }
            .asSequence()
            .filterIsInstance<LimeException>()
            .map { it.errorType.type }
            .filterIsInstance<LimeEnumeration>()
            .filter { it.external?.cpp == null }
            .toSet()

        val generatedFiles = limeModel.topElements.flatMap {
            generateCode(
                it,
                nameRules.getOutputFilePath(it),
                Cpp2IncludeResolver(limeModel.referenceMap, nameRules, internalNamespace),
                nameResolver,
                CppFullNameResolver(cachingNameResolver),
                allErrorEnums
            )
        } + COMMON_HEADERS.map { generateHelperFile(it, "include", ".h") } +
            COMMON_IMPLS.map { generateHelperFile(it, "src", ".cpp") }

        if (commentsProcessor.hasError) {
            throw GluecodiumExecutionException("Validation errors found, see log for details.")
        }

        return generatedFiles
    }

    private fun generateCode(
        rootElement: LimeNamedElement,
        fileName: String,
        includeResolver: Cpp2IncludeResolver,
        nameResolver: Cpp2NameResolver,
        fullNameResolver: CppFullNameResolver,
        allErrorEnums: Set<LimeEnumeration>
    ): List<GeneratedFile> {

        val limeElements = when (rootElement) {
            is LimeTypesCollection -> rootElement.structs + rootElement.enumerations +
                rootElement.constants + rootElement.typeAliases
            else -> listOf(rootElement)
        }

        val allTypes = LimeTypeHelper.getAllTypes(rootElement)
        val allValues = LimeTypeHelper.getAllValues(rootElement)
        val equatableTypes = allTypes.filter {
            it.external?.cpp == null && it.attributes.have(EQUATABLE)
        }
        val errorEnums = allTypes.intersect(allErrorEnums)

        val hasConstants = limeElements.any { it is LimeConstant }
        val needsHeader = hasConstants ||
            limeElements.any { it !is LimeException && it.external?.cpp == null }
        val needsImplementation = hasConstants || errorEnums.isNotEmpty() ||
            limeElements.any { it is LimeContainer } || limeElements.any { it is LimeEnumeration }
        if (!needsHeader && !needsImplementation) {
            return emptyList()
        }

        val typeRegisteredClasses =
            allTypes.filterIsInstance<LimeContainerWithInheritance>()
                .filter { it.external?.cpp == null && it.parent == null &&
                    (it is LimeInterface || it.visibility.isOpen) }
        val allTypeRefs = collectTypeRefs(allTypes)
        val forwardDeclaredTypes = allTypeRefs.map { it.type }
            .filterIsInstance<LimeContainerWithInheritance>()
            .filter { !it.path.hasParent && it.external?.cpp == null }
            .toSet()

        val additionalIncludes = collectAdditionalIncludes(
            rootElement, includeResolver, allTypes, equatableTypes, errorEnums, typeRegisteredClasses)
        val headerIncludes = allTypes.filterIsInstance<LimeContainer>()
            .flatMap { it.functions }
            .flatMap { includeResolver.resolveIncludes(it) } +
                allTypeRefs.flatMap { includeResolver.resolveIncludes(it) } +
                allValues.flatMap { includeResolver.resolveIncludes(it) } +
                allTypes.flatMap { includeResolver.resolveIncludes(it) } +
                additionalIncludes - forwardDeclaredTypes.flatMap { includeResolver.resolveIncludes(it) }
        val implementationIncludes = forwardDeclaredTypes
            .flatMap { includeResolver.resolveIncludes(it) }
            .toMutableList()

        val forwardDeclarations =
            createForwardDeclarationGroup("", forwardDeclaredTypes.sortedBy { it.path }, 0, nameResolver).subGroups

        val templateData = mutableMapOf(
            "internalNamespace" to internalNamespace,
            "namespace" to rootNamespace + rootElement.path.head,
            "exportName" to exportName,
            "model" to rootElement,
            "equatables" to equatableTypes,
            "errorEnums" to errorEnums,
            "typeRegisteredClasses" to typeRegisteredClasses,
            "forwardDeclarations" to forwardDeclarations
        )

        val nameResolvers = mapOf("" to nameResolver, "FQN" to fullNameResolver)
        val result = mutableListOf<GeneratedFile>()
        if (needsHeader) {
            result +=
                generateHeader(rootElement, nameResolvers, fileName, templateData, headerIncludes)
            implementationIncludes += Include.createInternalInclude("$fileName.h")
        }
        if (needsImplementation) {
            result += generateImplementation(
                rootElement, nameResolvers, allTypes, implementationIncludes, includeResolver,
                errorEnums, templateData, fileName
            )
        }

        return result
    }

    private fun collectAdditionalIncludes(
        rootElement: LimeNamedElement,
        includeResolver: Cpp2IncludeResolver,
        allTypes: List<LimeType>,
        equatableTypes: List<LimeType>,
        errorEnums: Set<LimeType>,
        typeRegisteredClasses: List<LimeContainerWithInheritance>
    ): List<Include> {
        val parentIncludes = (rootElement as? LimeContainerWithInheritance)?.parent
            ?.let { includeResolver.resolveIncludes(it.type) } ?: emptyList()
        val additionalIncludes = (parentIncludes + exportInclude).toMutableList()
        if (allTypes.any { it is LimeEnumeration }) {
            additionalIncludes += CppLibraryIncludes.INT_TYPES
        }
        if (equatableTypes.isNotEmpty()) {
            additionalIncludes += includeResolver.hashInclude
        }
        if (errorEnums.isNotEmpty()) {
            additionalIncludes += CppLibraryIncludes.SYSTEM_ERROR
        }
        if (typeRegisteredClasses.isNotEmpty()) {
            additionalIncludes += includeResolver.typeRepositoryInclude
        }
        return additionalIncludes
    }

    private fun generateImplementation(
        rootElement: LimeNamedElement,
        nameResolvers: Map<String, NameResolver>,
        allTypes: List<LimeType>,
        implementationIncludes: MutableList<Include>,
        includeResolver: Cpp2IncludeResolver,
        errorEnums: Set<LimeType>,
        generalData: Map<String, Any>,
        fileName: String
    ): GeneratedFile {
        val externalContainers = allTypes.filter { it is LimeContainer && it.external?.cpp != null }
        if (externalContainers.isNotEmpty()) {
            implementationIncludes += CppLibraryIncludes.TYPE_TRAITS
            implementationIncludes +=
                externalContainers.flatMap { includeResolver.resolveIncludes(it) }
        }
        if (allTypes.any { it is LimeStruct }) {
            implementationIncludes += CppLibraryIncludes.UTILITY
        }
        if (errorEnums.isNotEmpty()) {
            implementationIncludes += CppLibraryIncludes.STRING
        }

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
        headerIncludes: List<Include>
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
        val templateData =
            mapOf("internalNamespace" to internalNamespace, "exportName" to exportName)
        val content = TemplateEngine.render("cpp/common/$fileName", templateData)
        val resultFileName = Paths.get(
            GENERATOR_NAME,
            subDir,
            internalNamespace.joinToString("/"),
            fileName
        ).toString() + suffix
        return GeneratedFile(content, resultFileName, GeneratedFile.SourceSet.COMMON)
    }

    private fun selectTemplate(limeElement: LimeNamedElement) =
        when (limeElement) {
            is LimeTypesCollection -> "cpp/CppTypes"
            is LimeContainerWithInheritance -> "cpp/CppClass"
            is LimeStruct -> "cpp/CppStruct"
            is LimeEnumeration -> "cpp/CppEnumeration"
            is LimeException -> null
            is LimeLambda -> "cpp/CppLambda"
            is LimeTypeAlias -> "cpp/CppTypeAlias"
            else -> throw GluecodiumExecutionException("Unsupported top-level element: " +
                    limeElement::class.java.name)
        }

    private fun collectTypeRefs(allTypes: List<LimeType>): List<LimeTypeRef> {
        val containers = allTypes.filterIsInstance<LimeContainer>()
        val classes = containers.filterIsInstance<LimeContainerWithInheritance>()
        val typeRefs = containers.flatMap { it.constants }.map { it.typeRef } +
            containers.filterIsInstance<LimeStruct>().flatMap { it.fields }.map { it.typeRef } +
            containers.flatMap { it.functions }.flatMap { collectTypeRefs(it) } +
            classes.flatMap { it.properties }.map { it.typeRef } +
            allTypes.filterIsInstance<LimeTypeAlias>().map { it.typeRef } +
            allTypes.filterIsInstance<LimeLambda>().flatMap { collectTypeRefs(it.asFunction()) } +
            allTypes.filterIsInstance<LimeException>().map { it.errorType }

        return typeRefs + typeRefs.flatMap { collectTypeRefs(it) }
    }

    private fun collectTypeRefs(limeFunction: LimeFunction) =
        limeFunction.parameters.map { it.typeRef } +
            limeFunction.returnType.typeRef +
            listOfNotNull(
                limeFunction.exception?.errorType?.takeIf { it.type.actualType !is LimeEnumeration }
            )

    private fun collectTypeRefs(limeTypeRef: LimeTypeRef): List<LimeTypeRef> =
        when (val limeType = limeTypeRef.type) {
            is LimeList -> collectTypeRefs(limeType.elementType) + limeType.elementType
            is LimeSet -> collectTypeRefs(limeType.elementType) + limeType.elementType
            is LimeMap -> collectTypeRefs(limeType.keyType) + collectTypeRefs(limeType.valueType) +
                limeType.keyType + limeType.valueType
            else -> emptyList()
        }

    private fun createForwardDeclarationGroup(
        name: String,
        paths: List<LimeNamedElement>,
        level: Int,
        nameResolver: NameResolver
    ): CppForwardDeclarationGroup =
        CppForwardDeclarationGroup(
            name,
            paths.filter { level == it.path.head.size }.map { nameResolver.resolveName(it) },
            paths.filter { level < it.path.head.size }
                .groupBy { it.path.head[level] }
                .map { createForwardDeclarationGroup(it.key, it.value, level + 1, nameResolver) }
        )

    companion object {
        const val GENERATOR_NAME = "cpp"

        private val logger = Logger.getLogger(CppGeneratorSuite::class.java.name)
        private val COMMON_HEADERS = listOf(
            "Export",
            "Hash",
            "Locale",
            "Mutex",
            "Optional",
            "OptionalImpl", // This is a header file, despite the "Impl" suffix.
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
