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

package com.here.genium.platform.baseapi

import com.here.genium.Genium
import com.here.genium.generator.common.GeneratedFile
import com.here.genium.generator.common.modelbuilder.LimeTreeWalker
import com.here.genium.generator.common.nameRuleSetFromConfig
import com.here.genium.generator.cpp.CppGenerator
import com.here.genium.generator.cpp.CppIncludeResolver
import com.here.genium.generator.cpp.CppLibraryIncludes
import com.here.genium.generator.cpp.CppModelBuilder
import com.here.genium.generator.cpp.CppNameResolver
import com.here.genium.generator.cpp.CppNameRules
import com.here.genium.generator.cpp.CppTypeMapper
import com.here.genium.model.common.Comments
import com.here.genium.model.common.Include
import com.here.genium.model.cpp.CppComplexTypeRef
import com.here.genium.model.cpp.CppElement
import com.here.genium.model.cpp.CppElementWithComment
import com.here.genium.model.cpp.CppElementWithIncludes
import com.here.genium.model.cpp.CppEnum
import com.here.genium.model.cpp.CppFile
import com.here.genium.model.cpp.CppForwardDeclarationGroup
import com.here.genium.model.cpp.CppMethod
import com.here.genium.model.cpp.CppStruct
import com.here.genium.model.lime.LimeException
import com.here.genium.model.lime.LimeModel
import com.here.genium.model.lime.LimeNamedElement
import com.here.genium.platform.common.GeneratorSuite
import java.io.File
import java.nio.file.Paths
import java.util.stream.Collectors
import kotlin.streams.toList

/**
 * This generator will build all the BaseApis that will have to be implemented on the client
 * side @ref CppMapper as well as the data used by @ref TypeCollectionMapper.
 *
 * It is the underlying generator, that all others depend on, as they will invoke the actual
 * implementation through the C++ interfaces.
 */
class BaseApiGeneratorSuite(options: Genium.Options) : GeneratorSuite() {

    private val internalNamespace = options.cppInternalNamespace ?: listOf("")
    private val rootNamespace = options.cppRootNamespace
    private val exportName = options.cppExport
    private val commentsProcessor = DoxygenCommentsProcessor()
    private val nameRules = CppNameRules(rootNamespace, nameRuleSetFromConfig(options.cppNameRules))

    override fun getName() = "com.here.BaseApiGenerator"

    override fun generate(limeModel: LimeModel): List<GeneratedFile> {
        val limeReferenceMap = limeModel.referenceMap
        val includeResolver =
            CppIncludeResolver(limeReferenceMap, nameRules)
        val nameResolver = CppNameResolver(rootNamespace, limeReferenceMap, nameRules)
        val typeMapper = CppTypeMapper(nameResolver, includeResolver, internalNamespace)
        val cppModelBuilder = CppModelBuilder(
            typeMapper = typeMapper,
            nameResolver = nameResolver,
            includeResolver = includeResolver,
            limeReferenceMap = limeReferenceMap
        )

        val allErrorEnums = limeReferenceMap.values
            .filterIsInstance<LimeException>()
            .map { it.errorEnum.type }
            .map { nameResolver.getFullyQualifiedName(it) }
            .toSet()

        val generator = CppGenerator(GENERATOR_NAME, internalNamespace)

        val cppReferenceMap = mutableMapOf<String, CppElement>()
        val cppModel = limeModel.topElements.map {
            mapLimeModelToCppModel(
                it,
                nameRules.getOutputFilePath(it),
                cppModelBuilder,
                allErrorEnums,
                cppReferenceMap
            )
        }
        val cppToLimeName = cppReferenceMap.entries.associate { it.value to it.key }

        val limeToCppName = cppReferenceMap.mapValues { it.value.fullyQualifiedName }

        cppModel.flatMap { it.members }.flatMap { it.streamRecursive().toList() }
            .filterIsInstance<CppElementWithComment>()
            .forEach { processElementComments(it, cppToLimeName, limeToCppName) }

        val helperModel = mapOf("internalNamespace" to internalNamespace, "exportName" to exportName)
        return cppModel.flatMap { generator.generateCode(it) } +
                ADDITIONAL_HEADERS.map { generator.generateHelperHeader(it, helperModel) } +
                generator.generateHelperImpl("TypeRepositoryImpl", helperModel) +
                generator.generateHelperHeader("Export", helperModel)
    }

    private fun mapLimeModelToCppModel(
        limeModel: LimeNamedElement,
        filename: String,
        cppModelBuilder: CppModelBuilder,
        allErrorEnums: Set<String>,
        mapping: MutableMap<String, CppElement>
    ): CppFile {
        LimeTreeWalker(listOf(cppModelBuilder)).walkTree(limeModel)
        val finalResults = cppModelBuilder.finalResults
        mapping.putAll(cppModelBuilder.referenceMap)

        val includes = collectIncludes(finalResults).toMutableList()
        val exportPath = Paths.get(
            internalNamespace.joinToString(File.separator),
            "Export" + CppGenerator.HEADER_FILE_SUFFIX
        ).toString()
        includes.add(Include.createInternalInclude(exportPath))

        val enums = collectEnums(finalResults)
        if (enums.isNotEmpty()) {
            includes.add(CppLibraryIncludes.HASH)
            includes.add(CppLibraryIncludes.INT_TYPES)
        }
        val errorEnums = enums
            .filter { allErrorEnums.contains(it.fullyQualifiedName) }
            .sortedBy(CppEnum::fullyQualifiedName)
        if (errorEnums.isNotEmpty()) {
            includes.add(CppLibraryIncludes.SYSTEM_ERROR)
        }

        return CppFile(
            filename = filename,
            namespace = rootNamespace + limeModel.path.head,
            members = finalResults,
            includes = includes,
            forwardDeclarations = collectForwardDeclarations(finalResults),
            errorEnums = errorEnums,
            exportName = exportName,
            internalNamespace = internalNamespace
        )
    }

    private fun processElementComments(
        element: CppElementWithComment,
        cppToLimeName: Map<CppElement, String>,
        limeToCppName: Map<String, String>
    ) {
        val limeName = cppToLimeName[element] ?: return
        val documentation = element.comment.documentation?.let {
            commentsProcessor.process(limeName, it, limeToCppName)
        }
        val deprecationMessage = element.comment.deprecated?.let {
            commentsProcessor.process(limeName, it, limeToCppName)
        }
        element.comment = Comments(documentation, deprecationMessage)

        if (element is CppMethod) {
            element.returnComment = element.returnComment?.let {
                commentsProcessor.process(limeName, it, limeToCppName)
            }
            element.errorComment = element.errorComment?.let {
                commentsProcessor.process(limeName, it, limeToCppName)
            }
        }

        if (element is CppStruct) {
            element.constructorComment = element.constructorComment?.let {
                commentsProcessor.process(limeName, it, limeToCppName)
            }
        }
    }

    companion object {
        const val GENERATOR_NAME = "cpp"

        internal val ADDITIONAL_HEADERS = listOf(
            "Hash",
            "Mutex",
            "Optional",
            "OptionalImpl",
            "Return",
            "TypeRepository",
            "UnorderedMapHash",
            "UnorderedSetHash",
            "VectorHash"
        )

        private fun flattenCppModel(members: List<CppElement>) =
            members.stream().flatMap(CppElement::streamRecursive).collect(Collectors.toList())

        private fun collectIncludes(members: List<CppElement>) =
            flattenCppModel(members)
                .filterIsInstance(CppElementWithIncludes::class.java)
                .flatMap(CppElementWithIncludes::includes)

        private fun collectEnums(members: List<CppElement>) =
            flattenCppModel(members).filterIsInstance(CppEnum::class.java).filter { !it.isExternal }

        private fun collectForwardDeclarations(
            members: List<CppElement>
        ): List<CppForwardDeclarationGroup> {
            val forwardDeclarations = flattenCppModel(members)
                .asSequence()
                .filterIsInstance<CppComplexTypeRef>()
                .filter { it.needsForwardDeclaration }
                .map { it.name }
                .distinct()
                .sorted()
                .map { splitForwardDeclaration(it) }
                .toList()

            return createForwardDeclarationGroup("", forwardDeclarations, 0).subGroups
        }

        private fun splitForwardDeclaration(declaration: String): Pair<List<String>, String> {
            val namespaceTypeSplit = Regex("((?>[^:<]+::)*)([^:<].*)$")
            val nameComponents = namespaceTypeSplit.find(declaration, 0)
            return Pair(
                nameComponents!!.groupValues[1].split("::".toRegex()).filter { it.isNotEmpty() },
                nameComponents.groupValues[2]
            )
        }

        private fun createForwardDeclarationGroup(
            name: String,
            declarations: List<Pair<List<String>, String>>,
            level: Int
        ): CppForwardDeclarationGroup =
            CppForwardDeclarationGroup(
                name,
                declarations.filter { level == it.first.size }.map { it.second },
                declarations.filter { level < it.first.size }
                    .groupBy { it.first[level] }
                    .map { createForwardDeclarationGroup(it.key, it.value, level + 1) }
            )
    }
}
