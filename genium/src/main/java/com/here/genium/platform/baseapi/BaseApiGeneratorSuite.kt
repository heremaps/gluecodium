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
import com.here.genium.generator.common.GeneratedFile
import com.here.genium.generator.common.modelbuilder.FrancaTreeWalker
import com.here.genium.generator.common.modelbuilder.LimeTreeWalker
import com.here.genium.generator.cpp.CppGenerator
import com.here.genium.generator.cpp.CppLibraryIncludes
import com.here.genium.generator.cpp.CppModelBuilder
import com.here.genium.generator.cpp.CppNameResolver
import com.here.genium.generator.cpp.CppTypeMapper
import com.here.genium.generator.cpp.CppNameRules
import com.here.genium.generator.lime.LimeModelBuilder
import com.here.genium.generator.lime.LimeReferenceResolver
import com.here.genium.model.common.Include
import com.here.genium.model.cpp.CppComplexTypeRef
import com.here.genium.model.cpp.CppElement
import com.here.genium.model.cpp.CppElementWithIncludes
import com.here.genium.model.cpp.CppEnum
import com.here.genium.model.cpp.CppFile
import com.here.genium.model.cpp.CppForwardDeclaration
import com.here.genium.generator.cpp.CppIncludeResolver
import com.here.genium.model.franca.FrancaDeploymentModel
import com.here.genium.model.lime.LimeContainer
import com.here.genium.model.lime.LimeMethod
import com.here.genium.platform.common.GeneratorSuite
import org.franca.core.franca.FTypeCollection
import java.io.File
import java.nio.file.Paths
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

    private val internalNamespace = options.cppInternalNamespace ?: listOf("")
    private val rootNamespace = options.cppRootNamespace
    private val exportName = options.cppExport
    private val limeReferenceResolver = LimeReferenceResolver()

    override fun getName() = "com.here.BaseApiGenerator"

    override fun generate(typeCollections: List<FTypeCollection>): List<GeneratedFile> {
        val limeModelBuilder =
            LimeModelBuilder(deploymentModel, limeReferenceResolver)
        val limeModel = typeCollections.map {
            FrancaTreeWalker(listOf(limeModelBuilder)).walkTree(it)
            limeModelBuilder.getFinalResult(LimeContainer::class.java)
        }

        val limeReferenceMap = limeReferenceResolver.referenceMap
        val includeResolver =
            CppIncludeResolver(rootNamespace, limeReferenceMap)
        val nameResolver = CppNameResolver(rootNamespace, limeReferenceMap)
        val typeMapper = CppTypeMapper(nameResolver, includeResolver, internalNamespace)
        val cppModelBuilder = CppModelBuilder(typeMapper, nameResolver)

        val allErrorEnums = limeReferenceMap.values
            .filterIsInstance(LimeMethod::class.java)
            .mapNotNull { it.errorType?.type }
            .map(nameResolver::getFullyQualifiedName)
            .toSet()

        val generator = CppGenerator(BaseApiGeneratorSuite.GENERATOR_NAME, internalNamespace)
        return limeModel.flatMap {
            generator.generateCode(
                mapLimeModelToCppModel(it, cppModelBuilder, allErrorEnums),
                includeResolver.getOutputFilePath(it)
            )
        } + ADDITIONAL_HEADERS.map(generator::generateHelperHeader) +
            generator.generateHelperHeader("Export", exportName)
    }

    private fun mapLimeModelToCppModel(
        limeModel: LimeContainer,
        cppModelBuilder: CppModelBuilder,
        allErrorEnums: Set<String>
    ): CppFile {
        LimeTreeWalker(listOf(cppModelBuilder)).walkTree(limeModel)
        val finalResults = cppModelBuilder.finalResults

        val includes = collectIncludes(finalResults).toMutableList()
        val exportPath = Paths.get(internalNamespace.joinToString(File.separator), "Export" + CppNameRules.HEADER_FILE_SUFFIX).toString()
        includes.add(Include.createInternalInclude(exportPath))

        val errorEnums = collectEnums(finalResults)
            .filter { allErrorEnums.contains(it.fullyQualifiedName) }
            .sortedBy(CppEnum::fullyQualifiedName)
        if (!errorEnums.isEmpty()) {
            includes.add(CppLibraryIncludes.SYSTEM_ERROR)
        }

        return CppFile(
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

        @VisibleForTesting
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
