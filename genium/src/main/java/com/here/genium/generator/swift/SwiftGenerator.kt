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

package com.here.genium.generator.swift

import com.here.genium.generator.common.GeneratedFile
import com.here.genium.generator.common.modelbuilder.LimeTreeWalker
import com.here.genium.generator.common.templates.TemplateEngine
import com.here.genium.model.lime.LimeElement
import com.here.genium.model.lime.LimeNamedElement
import com.here.genium.model.lime.LimeSignatureResolver
import com.here.genium.model.swift.SwiftEnum
import com.here.genium.model.swift.SwiftFile
import com.here.genium.model.swift.SwiftModelElement
import com.here.genium.model.swift.SwiftSet
import com.here.genium.model.swift.SwiftStruct
import com.here.genium.model.swift.SwiftTypeDef
import com.here.genium.platform.common.GeneratorSuite

class SwiftGenerator(
    private val limeReferenceMap: Map<String, LimeElement>,
    private val nameRules: SwiftNameRules
) {
    val arrayGenerator = SwiftArrayGenerator()
    val mapGenerator = SwiftMapGenerator()
    val builtinOptionalsGenerator = SwiftBuiltinOptionalsGenerator()
    private val signatureResolver = LimeSignatureResolver(limeReferenceMap)
    private val nameResolver = SwiftNameResolver(limeReferenceMap, nameRules)
    private val typeMapper = SwiftTypeMapper(nameResolver)

    fun generateModel(rootElement: LimeNamedElement): SwiftModel {
        val modelBuilder =
            SwiftModelBuilder(
                limeReferenceMap = limeReferenceMap,
                signatureResolver = signatureResolver,
                nameResolver = nameResolver,
                typeMapper = typeMapper,
                nameRules = nameRules
            )
        val treeWalker = LimeTreeWalker(listOf(modelBuilder))

        treeWalker.walkTree(rootElement)

        arrayGenerator.collect(modelBuilder.arraysCollector)
        mapGenerator.collect(modelBuilder.mapCollector)

        return SwiftModel(
            modelBuilder.referenceMap,
            modelBuilder.finalResults.mapNotNull { wrapInFile(it, rootElement) }
        )
    }

    private fun wrapInFile(swiftElement: SwiftModelElement, limeElement: LimeNamedElement) =
        when (swiftElement) {
            is SwiftFile -> swiftElement
            is SwiftStruct, is SwiftEnum, is SwiftTypeDef -> {
                val result = SwiftFile(nameRules.getImplementationFileName(limeElement))
                when (swiftElement) {
                    is SwiftStruct -> result.structs += swiftElement
                    is SwiftEnum -> result.enums += swiftElement
                    is SwiftTypeDef -> result.typeDefs += swiftElement
                }
                result
            }
            else -> null
        }

    fun generateSets(swiftModel: List<SwiftFile>): GeneratedFile? {
        val allSets = (swiftModel.flatMap { it.typeDefs } +
            swiftModel.flatMap { it.classes }.flatMap { it.typedefs })
                .map { it.type }
                .filterIsInstance<SwiftSet>()
                .associateBy { it.elementType.name }
                .values
        if (allSets.isEmpty()) {
            return null
        }
        return GeneratedFile(
            TemplateEngine.render("swift/Set", mapOf("sets" to allSets)),
            SwiftNameRules.TARGET_DIRECTORY + "Sets.swift"
        )
    }

    companion object {
        val STATIC_FILES = listOf(
            GeneratorSuite.copyTarget("swift/RefHolder.swift", ""),
            GeneratorSuite.copyTarget("swift/BuiltinConversions.swift", ""),
            GeneratorSuite.copyTarget("swift/NativeBase.swift", "")
        )
    }
}
