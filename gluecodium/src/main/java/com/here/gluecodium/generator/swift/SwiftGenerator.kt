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

package com.here.gluecodium.generator.swift

import com.here.gluecodium.cli.GluecodiumExecutionException
import com.here.gluecodium.common.LimeLogger
import com.here.gluecodium.common.LimeModelFilter
import com.here.gluecodium.generator.cbridge.CBridgeGenerator
import com.here.gluecodium.generator.cbridge.CBridgeGenerator.Companion.getAllParentTypes
import com.here.gluecodium.generator.cbridge.CBridgeNameResolver
import com.here.gluecodium.generator.common.CommentsProcessor
import com.here.gluecodium.generator.common.GeneratedFile
import com.here.gluecodium.generator.common.Generator
import com.here.gluecodium.generator.common.GeneratorOptions
import com.here.gluecodium.generator.common.NameResolver
import com.here.gluecodium.generator.common.nameRuleSetFromConfig
import com.here.gluecodium.generator.common.templates.TemplateEngine
import com.here.gluecodium.generator.cpp.CppNameCache
import com.here.gluecodium.generator.cpp.CppNameRules
import com.here.gluecodium.model.lime.LimeAttributeType.SWIFT
import com.here.gluecodium.model.lime.LimeAttributeValueType.SKIP
import com.here.gluecodium.model.lime.LimeBasicType.TypeId
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeGenericType
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeProperty
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeTypeHelper
import com.here.gluecodium.model.lime.LimeTypesCollection
import com.here.gluecodium.validator.LimeOverloadsValidator
import java.util.logging.Logger

/**
 * Generates Swift bindings on top of C++ API.
 */
internal class SwiftGenerator : Generator {

    private lateinit var internalNamespace: List<String>
    private lateinit var rootNamespace: List<String>
    private lateinit var commentsProcessor: CommentsProcessor
    private lateinit var cppNameRules: CppNameRules
    private lateinit var nameRules: SwiftNameRules
    private lateinit var conversionVisibility: String
    private var internalPrefix: String? = null
    private val importsCollector = SwiftImportsCollector(SwiftImportsResolver())

    override val shortName = "swift"

    override fun initialize(options: GeneratorOptions) {
        internalNamespace = options.cppInternalNamespace
        rootNamespace = options.cppRootNamespace
        commentsProcessor = SwiftCommentsProcessor(options.werror.contains(GeneratorOptions.WARNING_DOC_LINKS))
        cppNameRules = CppNameRules(rootNamespace, nameRuleSetFromConfig(options.cppNameRules))
        nameRules = SwiftNameRules(nameRuleSetFromConfig(options.swiftNameRules))
        internalPrefix = options.internalPrefix
        conversionVisibility =
            if (options.swiftExposeInternals) CONVERSION_VISIBILITY_PUBLIC else CONVERSION_VISIBILITY_INTERNAL
    }

    override fun generate(limeModel: LimeModel): List<GeneratedFile> {
        val limeReferenceMap = limeModel.referenceMap
        val filteredElements = LimeModelFilter.filter(limeModel) { shouldRetainElement(it) }.topElements
        val limeLogger = LimeLogger(logger, limeModel.fileNameMap)

        val overloadsValidator = LimeOverloadsValidator(limeModel.referenceMap, SWIFT, nameRules, limeLogger)
        val weakPropertiesValidator = SwiftWeakPropertiesValidator(limeLogger)
        val validationResults =
            listOf(overloadsValidator.validate(filteredElements), weakPropertiesValidator.validate(filteredElements))
        if (validationResults.contains(false)) {
            throw GluecodiumExecutionException("Validation errors found, see log for details.")
        }

        val cbridgeNameResolver = CBridgeNameResolver(limeReferenceMap, nameRules, internalPrefix ?: "")
        val cBridgeGenerator = CBridgeGenerator(
            limeReferenceMap = limeReferenceMap,
            rootNamespace = rootNamespace,
            nameCache = CppNameCache(rootNamespace, limeReferenceMap, cppNameRules),
            internalNamespace = internalNamespace,
            cppNameRules = cppNameRules,
            nameResolver = cbridgeNameResolver
        )

        val swiftNameResolver = SwiftNameResolver(limeReferenceMap, nameRules, limeLogger, commentsProcessor)
        val mangledNameResolver = SwiftMangledNameResolver(swiftNameResolver)
        val nameResolvers =
            mapOf("" to swiftNameResolver, "CBridge" to cbridgeNameResolver, "mangled" to mangledNameResolver)
        val predicates = SwiftGeneratorPredicates(limeReferenceMap, nameRules)
        val swiftFiles = filteredElements.map { generateSwiftFile(it, nameResolvers, predicates) }
        if (commentsProcessor.hasError) {
            throw GluecodiumExecutionException("Validation errors found, see log for details.")
        }

        return swiftFiles + filteredElements.flatMap { cBridgeGenerator.generate(it) } +
            CBridgeGenerator.STATIC_FILES + STATIC_FILES +
            cBridgeGenerator.generateCollections(filteredElements) +
            generateCollections(
                filteredElements,
                cBridgeGenerator.genericTypesCollector,
                swiftNameResolver,
                nameResolvers
            ) +
            generateBuiltinOptionals(nameResolvers + ("C++" to cBridgeGenerator.cppNameResolver)) +
            cBridgeGenerator.generateHelpers() + generateRefHolder()
    }

    private fun generateSwiftFile(
        limeElement: LimeNamedElement,
        nameResolvers: Map<String, NameResolver>,
        predicates: SwiftGeneratorPredicates
    ): GeneratedFile {

        val imports = importsCollector.collectImports(limeElement)
        val allExceptions = LimeTypeHelper.getAllTypes(limeElement).filterIsInstance<LimeException>()
        val templateData = mapOf(
            "model" to limeElement,
            "internalPrefix" to internalPrefix,
            "imports" to imports.distinct().sorted() - FOUNDATION,
            "allExceptions" to allExceptions,
            "definitionTemplate" to selectDefinitionTemplate(limeElement),
            "conversionTemplate" to selectConversionTemplate(limeElement),
            "conversionVisibility" to conversionVisibility
        )
        return GeneratedFile(
            TemplateEngine.render("swift/SwiftFile", templateData, nameResolvers, predicates.predicates),
            nameRules.getImplementationFileName(limeElement)
        )
    }

    private fun generateCollections(
        limeModel: List<LimeNamedElement>,
        genericTypesCollector: CBridgeGenerator.GenericTypesCollector,
        swiftNameResolver: SwiftNameResolver,
        nameResolvers: Map<String, NameResolver>
    ): List<GeneratedFile> {

        val allTypes = limeModel.flatMap { LimeTypeHelper.getAllTypes(it) }
        val allParentTypes = getAllParentTypes(allTypes)
        val genericTypes = genericTypesCollector.getAllGenericTypes(allTypes + allParentTypes)

        val listsFile = generateCollectionsFile(
            genericTypes.filterIsInstance<LimeList>(),
            "swift/SwiftLists",
            "swift/Collections.swift",
            swiftNameResolver,
            nameResolvers
        )
        val mapsFile = generateCollectionsFile(
            genericTypes.filterIsInstance<LimeMap>(),
            "swift/SwiftMaps",
            "swift/Dictionaries.swift",
            swiftNameResolver,
            nameResolvers
        )
        val setsFile = generateCollectionsFile(
            genericTypes.filterIsInstance<LimeSet>(),
            "swift/SwiftSets",
            "swift/Sets.swift",
            swiftNameResolver,
            nameResolvers
        )

        return listOf(listsFile, mapsFile, setsFile)
    }

    private fun generateCollectionsFile(
        collections: List<LimeGenericType>,
        templateName: String,
        fileName: String,
        swiftNameResolver: SwiftNameResolver,
        nameResolvers: Map<String, NameResolver>
    ): GeneratedFile {
        val imports = collections.flatMap { importsCollector.collectImports(it) }
        val templateData = mapOf(
            "imports" to imports.sorted().distinct() - FOUNDATION,
            "internalPrefix" to internalPrefix,
            "collections" to collections.sortedBy { swiftNameResolver.resolveName(it) }
        )
        return GeneratedFile(TemplateEngine.render(templateName, templateData, nameResolvers), fileName)
    }

    private fun generateBuiltinOptionals(nameResolvers: Map<String, NameResolver>): GeneratedFile {
        val types = listOf(
            TypeId.BOOLEAN, TypeId.FLOAT, TypeId.DOUBLE,
            TypeId.INT8, TypeId.UINT8, TypeId.INT16, TypeId.UINT16,
            TypeId.INT32, TypeId.UINT32, TypeId.INT64, TypeId.UINT64
        )

        val content = TemplateEngine.render("swift/BuiltinOptionals", types, nameResolvers)
        return GeneratedFile(content, "swift/BuiltinOptionals.swift", GeneratedFile.SourceSet.COMMON)
    }

    private fun generateRefHolder(): GeneratedFile {
        val content = TemplateEngine.render("swift/RefHolder", mapOf("conversionVisibility" to conversionVisibility))
        return GeneratedFile(content, "swift/RefHolder.swift", GeneratedFile.SourceSet.COMMON)
    }

    private fun selectDefinitionTemplate(limeElement: LimeNamedElement) =
        when (limeElement) {
            is LimeException, is LimeTypeAlias -> "swift/SwiftTypeAlias"
            is LimeLambda -> "swift/SwiftLambdaDefinition"
            is LimeEnumeration -> "swift/SwiftEnumDefinition"
            is LimeStruct -> "swift/SwiftStructDefinition"
            is LimeClass -> "swift/SwiftClassDefinition"
            is LimeInterface -> "swift/SwiftInterfaceDefinition"
            is LimeTypesCollection -> "swift/SwiftTypesDefinition"
            else -> null
        }

    private fun selectConversionTemplate(limeElement: LimeNamedElement) =
        when (limeElement) {
            is LimeException, is LimeTypeAlias -> null
            is LimeLambda -> "swift/SwiftLambdaConversion"
            is LimeEnumeration -> "swift/SwiftEnumConversion"
            is LimeStruct -> "swift/SwiftStructConversion"
            is LimeClass -> "swift/SwiftClassConversion"
            is LimeInterface -> "swift/SwiftClassConversion"
            is LimeTypesCollection -> null
            else -> null
        }

    private fun shouldRetainElement(limeElement: LimeNamedElement) =
        when {
            limeElement is LimeFunction || limeElement is LimeProperty -> true
            limeElement.attributes.have(SWIFT, SKIP) -> false
            else -> true
        }

    companion object {
        private const val FOUNDATION = "Foundation"
        private const val CONVERSION_VISIBILITY_INTERNAL = "internal"
        private const val CONVERSION_VISIBILITY_PUBLIC = "/// :nodoc:\npublic"

        private val logger = Logger.getLogger(SwiftGenerator::class.java.name)
        private val STATIC_FILES by lazy {
            listOf(
                Generator.copyCommonFile("swift/BuiltinConversions.swift", ""),
                Generator.copyCommonFile("swift/CollectionOf.swift", ""),
                Generator.copyCommonFile("swift/NativeBase.swift", "")
            )
        }
    }
}
