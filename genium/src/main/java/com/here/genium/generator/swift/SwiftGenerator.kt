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
import com.here.genium.model.lime.LimeContainer
import com.here.genium.model.lime.LimeElement
import com.here.genium.model.lime.LimeSignatureResolver
import com.here.genium.model.swift.SwiftFile
import com.here.genium.platform.common.GeneratorSuite

class SwiftGenerator(private val limeReferenceMap: Map<String, LimeElement>) {
    val arrayGenerator = SwiftArrayGenerator()
    val mapGenerator = SwiftMapGenerator()
    val builtinOptionalsGenerator = SwiftBuiltinOptionalsGenerator()
    private val enumsAsErrors = mutableSetOf<String>()
    private val signatureResolver = LimeSignatureResolver(limeReferenceMap)
    private val nameResolver = SwiftNameResolver(limeReferenceMap)
    private val typeMapper = SwiftTypeMapper(nameResolver)

    fun generateModel(limeContainer: LimeContainer): SwiftModel {
        val modelBuilder =
            SwiftModelBuilder(
                limeReferenceMap = limeReferenceMap,
                signatureResolver = signatureResolver,
                nameResolver = nameResolver,
                typeMapper = typeMapper
            )
        val treeWalker = LimeTreeWalker(listOf(modelBuilder))

        treeWalker.walkTree(limeContainer)

        arrayGenerator.collect(modelBuilder.arraysCollector)
        mapGenerator.collect(modelBuilder.mapCollector)
        enumsAsErrors.addAll(modelBuilder.enumsAsErrors)

        return SwiftModel(
            modelBuilder.referenceMap,
            setOf(modelBuilder.getFinalResult(SwiftFile::class.java))
        )
    }

    fun generateErrors() =
        when {
            enumsAsErrors.isEmpty() -> null
            else -> GeneratedFile(
                TemplateEngine.render("swift/Errors", enumsAsErrors.sorted()),
                SwiftNameRules.TARGET_DIRECTORY + "ErrorsExtensions.swift"
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
