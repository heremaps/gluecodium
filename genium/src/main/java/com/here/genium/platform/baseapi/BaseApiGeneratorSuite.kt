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

import com.google.common.annotations.VisibleForTesting
import com.here.genium.Genium
import com.here.genium.common.CollectionsHelper
import com.here.genium.common.FrancaTypeHelper
import com.here.genium.generator.common.GeneratedFile
import com.here.genium.generator.common.modelbuilder.FrancaTreeWalker
import com.here.genium.generator.cpp.CppGenerator
import com.here.genium.generator.cpp.CppLibraryIncludes
import com.here.genium.generator.cpp.CppModelBuilder
import com.here.genium.generator.cpp.CppNameResolver
import com.here.genium.generator.cpp.CppNameRules
import com.here.genium.generator.cpp.CppTypeMapper
import com.here.genium.generator.cpp.CppValueMapper
import com.here.genium.model.common.Include
import com.here.genium.model.cpp.CppComplexTypeRef
import com.here.genium.model.cpp.CppElement
import com.here.genium.model.cpp.CppElementWithIncludes
import com.here.genium.model.cpp.CppEnum
import com.here.genium.model.cpp.CppFile
import com.here.genium.model.cpp.CppForwardDeclaration
import com.here.genium.model.cpp.CppIncludeResolver
import com.here.genium.model.franca.DefinedBy
import com.here.genium.model.franca.FrancaDeploymentModel
import com.here.genium.platform.common.GeneratorSuite
import org.franca.core.franca.FTypeCollection
import java.util.Comparator
import java.util.stream.Collectors

/**
 * This generator will build all the BaseApis that will have to be implemented on the client
 * side @ref CppMapper as well as the data used by @ref TypeCollectionMapper.
 *
 * It is the underlying generator, that all others depend on, as they will invoke the actual
 * implementation through the C++ interfaces.
 */
class BaseApiGeneratorSuite(
    options: Genium.Options,
    private val deploymentModel: FrancaDeploymentModel
) : GeneratorSuite() {

    private val internalNamespace: String? = options.cppInternalNamespace
    private val rootNamespace: List<String> = options.cppRootNamespace
    private val exportName: String? = options.cppExport
    private val includeResolver: CppIncludeResolver =
        CppIncludeResolver(deploymentModel, rootNamespace)
    private val nameResolver: CppNameResolver = CppNameResolver(deploymentModel, rootNamespace)

    override fun getName() = "com.here.BaseApiGenerator"

    override fun generate(typeCollections: List<FTypeCollection>): List<GeneratedFile> {
        val typeMapper =
            CppTypeMapper(includeResolver, nameResolver, internalNamespace, deploymentModel)
        val generator = CppGenerator(BaseApiGeneratorSuite.GENERATOR_NAME, internalNamespace)

        val allErrorEnums = typeCollections
            .stream()
            .flatMap(FrancaTypeHelper::getAllErrorEnums)
            .map(nameResolver::getFullyQualifiedName)
            .collect(Collectors.toSet())

        val generatedFiles = typeCollections.flatMap {
            generator.generateCode(
                mapFrancaTypeCollectionToCppModel(typeMapper, it, allErrorEnums),
                includeResolver.getOutputFilePath(it)
            )
        }.toMutableList()

        generatedFiles += ADDITIONAL_HEADERS.map(generator::generateHelperHeader)
        if (exportName != null) {
            generatedFiles += generator.generateHelperHeader("Export", exportName)
        }

        return generatedFiles
    }

    private fun mapFrancaTypeCollectionToCppModel(
        typeMapper: CppTypeMapper,
        francaTypeCollection: FTypeCollection,
        allErrorEnums: Set<String>
    ): CppFile {

        val builder = CppModelBuilder(
            deploymentModel,
            typeMapper,
            CppValueMapper(deploymentModel, nameResolver),
            nameResolver
        )
        val treeWalker = FrancaTreeWalker(listOf(builder))
        treeWalker.walkTree(francaTypeCollection)

        val finalResults = builder.finalResults
        val includes = collectIncludes(finalResults)
        if (exportName != null) {
            includes.add(
                Include.createInternalInclude("Export" + CppNameRules.HEADER_FILE_SUFFIX)
            )
        }

        val errorEnums = collectEnums(finalResults)
            .stream()
            .filter { allErrorEnums.contains(it.fullyQualifiedName) }
            .sorted(Comparator.comparing<CppEnum, String>(CppEnum::fullyQualifiedName))
            .collect(Collectors.toList())
        if (!errorEnums.isEmpty()) {
            includes.add(CppLibraryIncludes.SYSTEM_ERROR)
        }

        return CppFile(
            rootNamespace + DefinedBy.getPackages(francaTypeCollection),
            finalResults,
            includes,
            collectForwardDeclarations(finalResults),
            errorEnums,
            null,
            exportName
        )
    }

    companion object {
        const val GENERATOR_NAME = "cpp"

        @VisibleForTesting
        internal val ADDITIONAL_HEADERS = listOf("EnumHash", "Return")

        private fun collectIncludes(members: List<CppElement>) =
            CollectionsHelper.getStreamOfType(
                members.stream().flatMap(CppElement::streamRecursive),
                CppElementWithIncludes::class.java
            ).map(CppElementWithIncludes::includes)
                .flatMap(MutableList<Include>::stream)
                .collect(Collectors.toList())

        private fun collectForwardDeclarations(members: List<CppElement>) =
            CollectionsHelper.getStreamOfType(
                members.stream().flatMap(CppElement::streamRecursive),
                CppComplexTypeRef::class.java
            ).filter(CppComplexTypeRef::needsForwardDeclaration)
                .map { CppForwardDeclaration(it.name) }
                .collect(Collectors.toList())

        private fun collectEnums(members: List<CppElement>) =
            CollectionsHelper.getStreamOfType(
                members.stream().flatMap(CppElement::streamRecursive),
                CppEnum::class.java
            ).filter { !it.isExternal }
                .collect(Collectors.toSet())
    }
}
