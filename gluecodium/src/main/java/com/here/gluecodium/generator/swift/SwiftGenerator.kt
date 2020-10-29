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

import com.here.gluecodium.generator.cbridge.CBridgeCollectionNameResolver
import com.here.gluecodium.generator.common.modelbuilder.LimeTreeWalker
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeSignatureResolver
import com.here.gluecodium.model.swift.SwiftClosure
import com.here.gluecodium.model.swift.SwiftEnum
import com.here.gluecodium.model.swift.SwiftFile
import com.here.gluecodium.model.swift.SwiftModelElement
import com.here.gluecodium.model.swift.SwiftStruct
import com.here.gluecodium.model.swift.SwiftTypeDef
import com.here.gluecodium.platform.common.GeneratorSuite

class SwiftGenerator(
    private val limeReferenceMap: Map<String, LimeElement>,
    private val nameRules: SwiftNameRules,
    internalPrefix: String?
) {
    val genericsGenerator = SwiftGenericsGenerator(internalPrefix)
    val builtinOptionalsGenerator = SwiftBuiltinOptionalsGenerator()
    private val signatureResolver = LimeSignatureResolver(limeReferenceMap)
    private val nameResolver = SwiftNameResolver(limeReferenceMap, nameRules)
    private val cBridgeNameResolver = CBridgeCollectionNameResolver(internalPrefix ?: "")

    fun generateModel(rootElement: LimeNamedElement): SwiftModel {
        val typeMapper = SwiftTypeMapper(nameResolver, cBridgeNameResolver)
        val modelBuilder =
            SwiftModelBuilder(
                limeReferenceMap = limeReferenceMap,
                signatureResolver = signatureResolver,
                nameResolver = nameResolver,
                typeMapper = typeMapper,
                nameRules = nameRules,
                buildTransientModel = { generateModel(it).containers }
            )
        val treeWalker = LimeTreeWalker(listOf(modelBuilder))

        treeWalker.walkTree(rootElement)

        genericsGenerator.collect(typeMapper.generics)

        return SwiftModel(
            modelBuilder.referenceMap,
            modelBuilder.reverseReferenceMap,
            modelBuilder.finalResults.mapNotNull { wrapInFile(it, rootElement) }
        )
    }

    private fun wrapInFile(swiftElement: SwiftModelElement, limeElement: LimeNamedElement): SwiftFile? {
        val fileName = nameRules.getImplementationFileName(limeElement)
        return when (swiftElement) {
            is SwiftFile -> swiftElement
            is SwiftStruct -> SwiftFile(fileName).also { it.structs += swiftElement }
            is SwiftEnum -> SwiftFile(fileName).also { it.enums += swiftElement }
            is SwiftTypeDef -> SwiftFile(fileName).also { it.typeDefs += swiftElement }
            is SwiftClosure -> SwiftFile(fileName).also { it.closures += swiftElement }
            else -> null
        }
    }

    companion object {
        val STATIC_FILES = listOf(
            GeneratorSuite.copyCommonFile("swift/RefHolder.swift", ""),
            GeneratorSuite.copyCommonFile("swift/BuiltinConversions.swift", ""),
            GeneratorSuite.copyCommonFile("swift/NativeBase.swift", "")
        )
    }
}
