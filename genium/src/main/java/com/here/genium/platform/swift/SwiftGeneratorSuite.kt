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
import com.here.genium.generator.cpp.CppIncludeResolver
import com.here.genium.generator.cpp.CppNameResolver
import com.here.genium.generator.swift.SwiftGenerator
import com.here.genium.model.cbridge.CBridgeIncludeResolver
import com.here.genium.model.lime.LimeModel
import com.here.genium.platform.common.GeneratorSuite

/**
 * Combines [SwiftGenerator] and [CBridgeGenerator] to generate Swift bindings on top of
 * BaseAPI.
 *
 * The bindings are used to build a framework for iOS, Mac and a Swift module for Linux.
 */
class SwiftGeneratorSuite(options: Genium.Options) : GeneratorSuite() {
    private val internalNamespace = options.cppInternalNamespace ?: emptyList()
    private val rootNamespace = options.cppRootNamespace

    override fun generate(limeModel: LimeModel): List<GeneratedFile> {
        val limeReferenceMap = limeModel.referenceMap
        val swiftGenerator = SwiftGenerator(limeReferenceMap)
        val cBridgeGenerator = CBridgeGenerator(
            limeReferenceMap,
            CppIncludeResolver(rootNamespace, limeReferenceMap),
            CBridgeIncludeResolver(rootNamespace, limeReferenceMap),
            CppNameResolver(rootNamespace, limeReferenceMap),
            internalNamespace
        )

        val result = limeModel.containers.map { swiftGenerator.generate(it) } +
                limeModel.containers.flatMap { cBridgeGenerator.generate(it) } +
            CBridgeGenerator.STATIC_FILES + SwiftGenerator.STATIC_FILES +
            cBridgeGenerator.arrayGenerator.generate() + swiftGenerator.arrayGenerator.generate() +
            swiftGenerator.mapGenerator.generate() +
            swiftGenerator.builtinOptionalsGenerator.generate() + swiftGenerator.generateErrors() +
            cBridgeGenerator.generateHelpers()

        return result.filterNotNull()
    }

    override fun getName() = "com.here.SwiftGenerator"

    companion object {
        const val GENERATOR_NAME = "swift"
    }
}
