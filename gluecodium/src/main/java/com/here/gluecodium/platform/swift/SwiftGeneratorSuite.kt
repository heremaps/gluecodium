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

package com.here.gluecodium.platform.swift

import com.here.gluecodium.Gluecodium
import com.here.gluecodium.cli.GluecodiumExecutionException
import com.here.gluecodium.common.LimeLogger
import com.here.gluecodium.generator.cbridge.CBridgeGenerator
import com.here.gluecodium.generator.common.GeneratedFile
import com.here.gluecodium.generator.common.LimeModelFilter
import com.here.gluecodium.generator.common.nameRuleSetFromConfig
import com.here.gluecodium.generator.common.templates.TemplateEngine
import com.here.gluecodium.generator.cpp.CppIncludeResolver
import com.here.gluecodium.generator.cpp.CppNameResolver
import com.here.gluecodium.generator.cpp.CppNameRules
import com.here.gluecodium.generator.swift.SwiftGenerator
import com.here.gluecodium.generator.swift.SwiftModel
import com.here.gluecodium.generator.swift.SwiftNameRules
import com.here.gluecodium.model.cbridge.CBridgeIncludeResolver
import com.here.gluecodium.model.common.Comments
import com.here.gluecodium.model.lime.LimeAttributeType.SWIFT
import com.here.gluecodium.model.lime.LimeAttributeValueType.SKIP
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.swift.SwiftMethod
import com.here.gluecodium.model.swift.SwiftModelElement
import com.here.gluecodium.model.swift.SwiftStruct
import com.here.gluecodium.platform.common.GeneratorSuite
import java.util.logging.Logger

/**
 * Combines [SwiftGenerator] and [CBridgeGenerator] to generate Swift bindings on top of
 * BaseAPI.
 *
 * The bindings are used to build a framework for iOS, Mac and a Swift module for Linux.
 */
class SwiftGeneratorSuite(options: Gluecodium.Options) : GeneratorSuite() {
    private val internalNamespace = options.cppInternalNamespace
    private val rootNamespace = options.cppRootNamespace
    private val commentsProcessor =
        SwiftCommentsProcessor(options.werror.contains(Gluecodium.Options.WARNING_DOC_LINKS))
    private val cppNameRules = CppNameRules(rootNamespace, nameRuleSetFromConfig(options.cppNameRules))
    private val swiftNameRules = SwiftNameRules(nameRuleSetFromConfig(options.swiftNameRules))
    private val internalPrefix = options.internalPrefix

    override fun generate(limeModel: LimeModel): List<GeneratedFile> {
        val limeReferenceMap = limeModel.referenceMap
        val swiftGenerator = SwiftGenerator(limeReferenceMap, swiftNameRules, internalPrefix)
        val cBridgeGenerator = CBridgeGenerator(
            limeReferenceMap = limeReferenceMap,
            cppIncludeResolver =
                CppIncludeResolver(limeReferenceMap, cppNameRules, internalNamespace),
            includeResolver = CBridgeIncludeResolver(rootNamespace, limeReferenceMap),
            cppNameResolver = CppNameResolver(rootNamespace, limeReferenceMap, cppNameRules),
            internalNamespace = internalNamespace,
            swiftNameRules = swiftNameRules,
            internalPrefix = internalPrefix
        )
        val filteredElements =
            LimeModelFilter { !it.attributes.have(SWIFT, SKIP) }.filter(limeModel.topElements)
        val swiftModel =
            filteredElements.fold(SwiftModel()) { model, rootElement ->
                model.merge(swiftGenerator.generateModel(rootElement))
            }
        // Build name mapping for auxiliary model
        val auxGenerator = SwiftGenerator(limeReferenceMap, swiftNameRules, internalPrefix)
        val auxModel =
            limeModel.auxiliaryElements.fold(SwiftModel()) { model, rootElement ->
                model.merge(auxGenerator.generateModel(rootElement))
            }

        val elementToSwiftName = mutableMapOf<SwiftModelElement, String>()
        swiftModel.containers.forEach { resolveFullName(it, elementToSwiftName) }
        auxModel.containers.forEach { resolveFullName(it, elementToSwiftName) }

        val limeToSwiftName = (swiftModel.referenceMap + auxModel.referenceMap)
            .mapValues { elementToSwiftName[it.value] ?: "" }

        val limeLogger = LimeLogger(logger, limeModel.fileNameMap)
        swiftModel.containers.flatMap { it.allElementsRecursive }
            .filterIsInstance<SwiftModelElement>()
            .forEach { processElementComments(it, swiftModel.reverseReferenceMap, limeToSwiftName, limeLogger) }

        if (commentsProcessor.hasError) {
            throw GluecodiumExecutionException("Validation errors found, see log for details.")
        }

        return swiftModel.containers.filter { it.childElements.isNotEmpty() }.map {
            GeneratedFile(
                TemplateEngine.render(
                    "swift/File",
                    mapOf("model" to it, "internalPrefix" to internalPrefix)
                ),
                it.fileName
            )
        } +
            filteredElements.flatMap { cBridgeGenerator.generate(it) } +
            CBridgeGenerator.STATIC_FILES + SwiftGenerator.STATIC_FILES +
            cBridgeGenerator.collectionsGenerator.generate() +
            swiftGenerator.genericsGenerator.generate() +
            swiftGenerator.builtinOptionalsGenerator.generate() + cBridgeGenerator.generateHelpers()
    }

    private fun resolveFullName(
        element: SwiftModelElement,
        elementToSwiftName: MutableMap<SwiftModelElement, String>,
        name: String = "",
        siblings: Set<SwiftModelElement> = emptySet()
    ) {
        var elementName = element.simpleName
        if (element is SwiftMethod) {
            val overloadedMethods =
                siblings.filterIsInstance<SwiftMethod>().filter { it.simpleName == elementName }
            elementName += when {
                overloadedMethods.size < 2 -> "(...)"
                else ->
                    element.parameters.joinToString(prefix = "(", postfix = ")") { it.type.name }
            }
        }
        val fullName = if (name.isEmpty()) elementName else "$name.$elementName"
        val childElements = element.childElements.toSet()
        childElements.forEach { resolveFullName(it, elementToSwiftName, fullName, childElements) }
        elementToSwiftName[element] = fullName
    }

    private fun processElementComments(
        element: SwiftModelElement,
        elementToLimeName: Map<SwiftModelElement, String>,
        limeToSwiftName: Map<String, String>,
        limeLogger: LimeLogger
    ) {
        val limeName = elementToLimeName[element] ?: return

        val documentation = element.comment.documentation?.let {
            commentsProcessor.process(limeName, it, limeToSwiftName, limeLogger)
        }
        val deprecationMessage = element.comment.deprecated?.let {
            commentsProcessor.process(limeName, it, limeToSwiftName, limeLogger)
        }
        element.comment = Comments(documentation, deprecationMessage)

        if (element is SwiftMethod) {
            element.returnComment = element.returnComment?.let {
                commentsProcessor.process(limeName, it, limeToSwiftName, limeLogger)
            }
            element.error?.let {
                it.comment = commentsProcessor.process(
                    limeName,
                    it.comment,
                    limeToSwiftName,
                    limeLogger
                )
            }
        }

        if (element is SwiftStruct) {
            element.generatedConstructorComment = element.generatedConstructorComment?.let {
                commentsProcessor.process(limeName, it, limeToSwiftName, limeLogger)
            }
        }
    }

    override val name = "com.here.SwiftGenerator"

    companion object {
        private val logger = Logger.getLogger(SwiftGeneratorSuite::class.java.name)
        const val GENERATOR_NAME = "swift"
    }
}
