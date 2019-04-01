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

package com.here.genium.platform.swift

import com.here.genium.Genium
import com.here.genium.generator.cbridge.CBridgeGenerator
import com.here.genium.generator.common.GeneratedFile
import com.here.genium.generator.common.modelbuilder.FrancaTreeWalker
import com.here.genium.generator.cpp.CppLimeBasedIncludeResolver
import com.here.genium.generator.cpp.CppLimeBasedNameResolver
import com.here.genium.generator.lime.LimeModelBuilder
import com.here.genium.generator.lime.LimeReferenceResolver
import com.here.genium.generator.swift.SwiftGenerator
import com.here.genium.model.cbridge.CBridgeIncludeResolver
import com.here.genium.model.franca.FrancaDeploymentModel
import com.here.genium.model.lime.LimeContainer
import com.here.genium.platform.common.GeneratorSuite
import org.franca.core.franca.FTypeCollection

/**
 * Combines [SwiftGenerator] and [CBridgeGenerator] to generate Swift bindings on top of
 * BaseAPI.
 *
 * The bindings are used to build a framework for iOS, Mac and a Swift module for Linux.
 */
class SwiftGeneratorSuite(
    options: Genium.Options,
    private val deploymentModel: FrancaDeploymentModel
) : GeneratorSuite() {

    private val internalNamespace = options.cppInternalNamespace ?: emptyList()
    private val rootNamespace = options.cppRootNamespace
    private val limeReferenceResolver = LimeReferenceResolver()

    override fun generate(typeCollections: List<FTypeCollection>): List<GeneratedFile> {
        val limeModel = typeCollections.map { generateLimeModel(it) }

        val limeReferenceMap = limeReferenceResolver.referenceMap
        val swiftGenerator = SwiftGenerator(limeReferenceMap)
        val cBridgeGenerator = CBridgeGenerator(
            limeReferenceMap,
            CppLimeBasedIncludeResolver(rootNamespace, limeReferenceMap),
            CBridgeIncludeResolver(rootNamespace, limeReferenceMap),
            CppLimeBasedNameResolver(rootNamespace, limeReferenceMap),
            internalNamespace
        )

        val result = limeModel.map { swiftGenerator.generate(it) } +
            limeModel.flatMap { cBridgeGenerator.generate(it) } +
            CBridgeGenerator.STATIC_FILES + SwiftGenerator.STATIC_FILES +
            cBridgeGenerator.arrayGenerator.generate() + swiftGenerator.arrayGenerator.generate() +
            swiftGenerator.mapGenerator.generate() +
            swiftGenerator.builtinOptionalsGenerator.generate() + swiftGenerator.generateErrors() +
            cBridgeGenerator.generateHelpers()

        return result.filterNotNull()
    }

    private fun generateLimeModel(francaTypeCollection: FTypeCollection): LimeContainer {
        val limeModelBuilder = LimeModelBuilder(deploymentModel, limeReferenceResolver)
        FrancaTreeWalker(listOf(limeModelBuilder)).walkTree(francaTypeCollection)
        return limeModelBuilder.getFinalResult(LimeContainer::class.java)
    }

    override fun getName() = "com.here.SwiftGenerator"

    companion object {
        const val GENERATOR_NAME = "swift"
    }
}
