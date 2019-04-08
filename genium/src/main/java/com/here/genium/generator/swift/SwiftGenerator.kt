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

import com.google.common.annotations.VisibleForTesting
import com.here.genium.common.FrancaSignatureResolver
import com.here.genium.generator.common.GeneratedFile
import com.here.genium.generator.common.modelbuilder.FrancaTreeWalker
import com.here.genium.generator.common.templates.TemplateEngine
import com.here.genium.model.franca.FrancaDeploymentModel
import com.here.genium.model.swift.SwiftFile
import com.here.genium.platform.common.GeneratorSuite
import org.franca.core.franca.FTypeCollection
import java.util.HashSet

class SwiftGenerator(private val deploymentModel: FrancaDeploymentModel) {
    val arrayGenerator = SwiftArrayGenerator()
    val mapGenerator = SwiftMapGenerator()
    val builtinOptionalsGenerator = SwiftBuiltinOptionalsGenerator()
    val enumsAsErrors: MutableSet<String> = HashSet()
    private val signatureResolver: FrancaSignatureResolver = FrancaSignatureResolver()
    private val typeMapper: SwiftTypeMapper = SwiftTypeMapper(deploymentModel)

    fun generate(francaTypeCollection: FTypeCollection): GeneratedFile? {
        val file = buildSwiftModel(francaTypeCollection)
        return if (file.isEmpty) {
            null
        } else {
            GeneratedFile(
                TemplateEngine.render("swift/File", file),
                SwiftNameRules.getImplementationFileName(francaTypeCollection)
            )
        }
    }

    fun generateErrors() =
        if (enumsAsErrors.isEmpty()) {
            null
        } else {
            GeneratedFile(
                TemplateEngine.render("swift/Errors", enumsAsErrors.sorted()),
                SwiftNameRules.TARGET_DIRECTORY + "ErrorsExtensions.swift"
            )
        }

    @VisibleForTesting
    internal fun buildSwiftModel(francaTypeCollection: FTypeCollection): SwiftFile {
        val modelBuilder = SwiftModelBuilder(deploymentModel, signatureResolver, typeMapper)
        val treeWalker = FrancaTreeWalker(listOf(modelBuilder))

        treeWalker.walkTree(francaTypeCollection)
        arrayGenerator.collect(modelBuilder.arraysCollector)
        mapGenerator.collect(modelBuilder.mapCollector)
        enumsAsErrors.addAll(modelBuilder.enumsAsErrors)
        return modelBuilder.getFinalResult(SwiftFile::class.java)
    }

    companion object {
        val STATIC_FILES = listOf(
            GeneratorSuite.copyTarget("swift/RefHolder.swift", ""),
            GeneratorSuite.copyTarget("swift/BuiltinConversions.swift", ""),
            GeneratorSuite.copyTarget("swift/NativeBase.swift", "")
        )
    }
}
