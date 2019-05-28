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
import com.here.genium.generator.cpp.CppGenerator
import com.here.genium.generator.cpp.CppIncludeResolver
import com.here.genium.generator.cpp.CppLibraryIncludes
import com.here.genium.generator.cpp.CppModelBuilder
import com.here.genium.generator.cpp.CppNameResolver
import com.here.genium.generator.cpp.CppTypeMapper
import com.here.genium.model.common.Include
import com.here.genium.model.cpp.CppComplexTypeRef
import com.here.genium.model.cpp.CppElement
import com.here.genium.model.cpp.CppElementWithComment
import com.here.genium.model.cpp.CppElementWithIncludes
import com.here.genium.model.cpp.CppEnum
import com.here.genium.model.cpp.CppFile
import com.here.genium.model.cpp.CppForwardDeclaration
import com.here.genium.model.lime.LimeContainer
import com.here.genium.model.lime.LimeMethod
import com.here.genium.model.lime.LimeModel
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

    override fun getName() = "com.here.BaseApiGenerator"

    override fun generate(limeModel: LimeModel): List<GeneratedFile> {
        val limeReferenceMap = limeModel.referenceMap
        val includeResolver =
            CppIncludeResolver(rootNamespace, limeReferenceMap)
        val nameResolver = CppNameResolver(rootNamespace, limeReferenceMap)
        val typeMapper = CppTypeMapper(nameResolver, includeResolver, internalNamespace)
        val cppModelBuilder = CppModelBuilder(typeMapper = typeMapper, nameResolver = nameResolver)

        val allErrorEnums = limeReferenceMap.values
            .filterIsInstance(LimeMethod::class.java)
            .mapNotNull { it.errorType?.type }
            .map(nameResolver::getFullyQualifiedName)
            .toSet()

        val generator = CppGenerator(GENERATOR_NAME, internalNamespace)

        val cppReferenceMap = mutableMapOf<String, CppElement>()
        val cppModel = limeModel.containers.map {
            mapLimeModelToCppModel(
                it,
                includeResolver.getOutputFilePath(it),
                cppModelBuilder,
                allErrorEnums,
                cppReferenceMap
            )
        }
        val cppToLimeName = cppReferenceMap.entries.associate { it.value to it.key }

        val limeToCppName = cppReferenceMap.mapValues { it.value.fullyQualifiedName }

        cppModel.flatMap { it.members }.flatMap { it.streamRecursive().toList() }
            .filterIsInstance<CppElementWithComment>().forEach { element ->
            val limeName = cppToLimeName[element]
            if (limeName != null) {
                element.comment =
                    commentsProcessor.process(limeName, element.comment, limeToCppName)
            }
        }

        return cppModel.flatMap {
            generator.generateCode(it)
        } + ADDITIONAL_HEADERS.map(generator::generateHelperHeader) + generator.generateHelperHeader(
            "Export",
            exportName
        )
    }

    private fun mapLimeModelToCppModel(
        limeModel: LimeContainer,
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

        val errorEnums = collectEnums(finalResults)
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

    companion object {
        const val GENERATOR_NAME = "cpp"

        internal val ADDITIONAL_HEADERS = listOf("EnumHash", "Return", "Optional", "OptionalImpl")

        private fun flattenCppModel(members: List<CppElement>) =
            members.stream().flatMap(CppElement::streamRecursive).collect(Collectors.toList())

        private fun collectIncludes(members: List<CppElement>) =
            flattenCppModel(members)
                .filterIsInstance(CppElementWithIncludes::class.java)
                .flatMap(CppElementWithIncludes::includes)

        private fun collectForwardDeclarations(members: List<CppElement>) =
            flattenCppModel(members)
                .filterIsInstance(CppComplexTypeRef::class.java)
                .filter { it.needsForwardDeclaration }
                .map { CppForwardDeclaration(it.name) }

        private fun collectEnums(members: List<CppElement>) =
            flattenCppModel(members).filterIsInstance(CppEnum::class.java).filter { !it.isExternal }
    }
}
