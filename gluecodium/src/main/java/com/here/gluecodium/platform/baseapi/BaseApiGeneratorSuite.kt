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

package com.here.gluecodium.platform.baseapi

import com.here.gluecodium.Gluecodium
import com.here.gluecodium.cli.GluecodiumExecutionException
import com.here.gluecodium.common.LimeLogger
import com.here.gluecodium.generator.common.GeneratedFile
import com.here.gluecodium.generator.common.modelbuilder.LimeTreeWalker
import com.here.gluecodium.generator.common.nameRuleSetFromConfig
import com.here.gluecodium.generator.cpp.CppGenerator
import com.here.gluecodium.generator.cpp.CppIncludeResolver
import com.here.gluecodium.generator.cpp.CppLibraryIncludes
import com.here.gluecodium.generator.cpp.CppModelBuilder
import com.here.gluecodium.generator.cpp.CppNameResolver
import com.here.gluecodium.generator.cpp.CppNameRules
import com.here.gluecodium.generator.cpp.CppTypeMapper
import com.here.gluecodium.model.common.Comments
import com.here.gluecodium.model.common.Include
import com.here.gluecodium.model.cpp.CppComplexTypeRef
import com.here.gluecodium.model.cpp.CppElement
import com.here.gluecodium.model.cpp.CppElementWithComment
import com.here.gluecodium.model.cpp.CppElementWithIncludes
import com.here.gluecodium.model.cpp.CppEnum
import com.here.gluecodium.model.cpp.CppFile
import com.here.gluecodium.model.cpp.CppForwardDeclarationGroup
import com.here.gluecodium.model.cpp.CppMethod
import com.here.gluecodium.model.cpp.CppStruct
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeHelper
import com.here.gluecodium.platform.common.GeneratorSuite
import java.io.File
import java.nio.file.Paths
import java.util.logging.Logger

/**
 * This generator will build all the BaseApis that will have to be implemented on the client
 * side @ref CppMapper as well as the data used by @ref TypeCollectionMapper.
 *
 * It is the underlying generator, that all others depend on, as they will invoke the actual
 * implementation through the C++ interfaces.
 */
class BaseApiGeneratorSuite(options: Gluecodium.Options) : GeneratorSuite() {

    private val internalNamespace = options.cppInternalNamespace
    private val rootNamespace = options.cppRootNamespace
    private val exportName = options.cppExport
    private val commentsProcessor =
        DoxygenCommentsProcessor(options.werror.contains(Gluecodium.Options.WARNING_DOC_LINKS))
    private val nameRules = CppNameRules(rootNamespace, nameRuleSetFromConfig(options.cppNameRules))

    override val name = "com.here.BaseApiGenerator"

    override fun generate(limeModel: LimeModel): List<GeneratedFile> {
        val limeReferenceMap = limeModel.referenceMap
        val includeResolver = CppIncludeResolver(limeReferenceMap, nameRules, internalNamespace)
        val nameResolver = CppNameResolver(rootNamespace, limeReferenceMap, nameRules)
        val typeMapper = CppTypeMapper(nameResolver, includeResolver, internalNamespace)
        val cppModelBuilder = CppModelBuilder(
            typeMapper = typeMapper,
            nameResolver = nameResolver,
            includeResolver = includeResolver,
            limeReferenceMap = limeReferenceMap
        )

        val allErrorEnums = limeModel.topElements
            .filterIsInstance<LimeType>()
            .flatMap { LimeTypeHelper.getAllTypes(it) }
            .asSequence()
            .filterIsInstance<LimeException>()
            .map { it.errorType.type }
            .filterIsInstance<LimeEnumeration>()
            .map { nameResolver.getFullyQualifiedName(it) }
            .toSet()

        val generator = CppGenerator(GENERATOR_NAME, internalNamespace)

        val cppReferenceMap = mutableMapOf<String, CppElement>()
        val cppReverseReferenceMap = mutableMapOf<CppElement, String>()
        val cppFiles = limeModel.topElements.map {
            val cppModel = buildCppModel(cppModelBuilder, it, cppReferenceMap, cppReverseReferenceMap)
            wrapModelInCppFile(it, nameRules.getOutputFilePath(it), cppModel, allErrorEnums)
        }
        // Build name mapping for auxiliary model
        limeModel.auxiliaryElements
            .forEach { buildCppModel(cppModelBuilder, it, cppReferenceMap, cppReverseReferenceMap) }

        val allElements = cppReferenceMap.values.toSet()
        val limeToCppName = cppReferenceMap.mapValues {
            it.value.fullyQualifiedName + getSignatureString(it.value, allElements)
        }
        val limeLogger = LimeLogger(logger, limeModel.fileNameMap)
        cppFiles.flatMap { it.members }.flatMap { it.allElementsRecursive.toList() }
            .filterIsInstance<CppElementWithComment>()
            .forEach { processElementComments(it, cppReverseReferenceMap, limeToCppName, limeLogger) }

        if (commentsProcessor.hasError) {
            throw GluecodiumExecutionException("Validation errors found, see log for details.")
        }

        val helperModel = mapOf("internalNamespace" to internalNamespace, "exportName" to exportName)
        return cppFiles.flatMap { generator.generateCode(it) } +
                ADDITIONAL_HEADERS.map { generator.generateHelperHeader(it, helperModel) } +
                generator.generateHelperImpl("TypeRepositoryImpl", helperModel) +
                generator.generateHelperHeader("Export", helperModel)
    }

    private fun wrapModelInCppFile(
        limeModel: LimeNamedElement,
        filename: String,
        finalResults: List<CppElement>,
        allErrorEnums: Set<String>
    ): CppFile {
        val elementsWithIncludes =
            flattenCppModel(finalResults).filterIsInstance<CppElementWithIncludes>()
        val implIncludesFilter: (CppElement) -> Boolean =
            { it is CppComplexTypeRef && it.needsForwardDeclaration }

        val includes =
            elementsWithIncludes.filterNot(implIncludesFilter).flatMap { it.includes }.toMutableList()
        val exportPath = Paths.get(
            internalNamespace.joinToString(File.separator),
            "Export" + CppGenerator.HEADER_FILE_SUFFIX
        ).toString()
        includes.add(Include.createInternalInclude(exportPath))

        val enums =
            flattenCppModel(finalResults).filterIsInstance<CppEnum>().filterNot { it.isExternal }
        if (enums.isNotEmpty()) {
            includes.add(CppLibraryIncludes.INT_TYPES)
        }
        val errorEnums = enums
            .filter { allErrorEnums.contains(it.fullyQualifiedName) }
            .sortedBy { it.fullyQualifiedName }
        if (errorEnums.isNotEmpty()) {
            includes.add(CppLibraryIncludes.SYSTEM_ERROR)
        }

        val implementationIncludes =
            elementsWithIncludes.filter(implIncludesFilter).flatMap { it.includes }

        return CppFile(
            filename = filename,
            namespace = rootNamespace + limeModel.path.head,
            members = finalResults,
            includes = includes,
            implementationIncludes = implementationIncludes,
            forwardDeclarations = collectForwardDeclarations(finalResults),
            errorEnums = errorEnums,
            exportName = exportName,
            internalNamespace = internalNamespace
        )
    }

    private fun buildCppModel(
        cppModelBuilder: CppModelBuilder,
        limeModel: LimeNamedElement,
        mappingCollector: MutableMap<String, CppElement>,
        reverseMappingCollector: MutableMap<CppElement, String>
    ): List<CppElement> {
        LimeTreeWalker(listOf(cppModelBuilder)).walkTree(limeModel)
        mappingCollector += cppModelBuilder.referenceMap
        reverseMappingCollector += cppModelBuilder.reverseReferenceMap
        return cppModelBuilder.finalResults
    }

    private fun processElementComments(
        element: CppElementWithComment,
        cppToLimeName: Map<CppElement, String>,
        limeToCppName: Map<String, String>,
        limeLogger: LimeLogger
    ) {
        val limeName = cppToLimeName[element] ?: return

        val documentation = element.comment.documentation?.let {
            commentsProcessor.process(limeName, it, limeToCppName, limeLogger)
        }
        val deprecationMessage = element.comment.deprecated?.let {
            commentsProcessor.process(limeName, it, limeToCppName, limeLogger)
        }
        element.comment = Comments(documentation, deprecationMessage)

        if (element is CppMethod) {
            element.returnComment = element.returnComment?.let {
                commentsProcessor.process(limeName, it, limeToCppName, limeLogger)
            }
            element.errorComment = element.errorComment?.let {
                commentsProcessor.process(limeName, it, limeToCppName, limeLogger)
            }
        }

        if (element is CppStruct) {
            element.constructorComment = element.constructorComment?.let {
                commentsProcessor.process(limeName, it, limeToCppName, limeLogger)
            }
        }
    }

    private fun getSignatureString(
        cppElement: CppElement,
        allElements: Set<CppElement>
    ): String {
        val cppMethod = cppElement as? CppMethod ?: return ""
        val allOverloads = allElements
            .filterIsInstance<CppMethod>()
            .filter { it.fullyQualifiedName == cppMethod.fullyQualifiedName }
        if (allOverloads.size < 2) return ""

        return cppMethod.parameters.joinToString(prefix = "(", postfix = ")") {
            val suffix = if (it.type.actualType.refersToValueType) "" else "&"
            "const ${it.type.fullyQualifiedName}$suffix"
        }
    }

    companion object {
        private val logger = Logger.getLogger(BaseApiGeneratorSuite::class.java.name)
        const val GENERATOR_NAME = "cpp"

        internal val ADDITIONAL_HEADERS = listOf(
            "Hash",
            "Mutex",
            "Optional",
            "OptionalImpl",
            "Return",
            "TimePointHash",
            "TypeRepository",
            "UnorderedMapHash",
            "UnorderedSetHash",
            "VectorHash"
        )

        private fun flattenCppModel(members: List<CppElement>) =
            members.flatMap { it.allElementsRecursive }

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
