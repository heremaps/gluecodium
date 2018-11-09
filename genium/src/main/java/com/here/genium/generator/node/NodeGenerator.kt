/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
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

package com.here.genium.generator.node

import com.google.common.annotations.VisibleForTesting
import com.here.genium.generator.common.GeneratedFile
import com.here.genium.generator.common.modelbuilder.FrancaTreeWalker
import com.here.genium.generator.common.modelbuilder.ModelBuilder
import com.here.genium.generator.common.templates.TemplateEngine
import com.here.genium.model.franca.FrancaDeploymentModel
import com.here.genium.model.node.NodeFile
import org.franca.core.franca.FTypeCollection

class NodeGenerator(private val deploymentModel: FrancaDeploymentModel) {
    private val enumsAsErrors = hashSetOf<String>()

    fun generate(francaTypeCollection: FTypeCollection): GeneratedFile? {
        val file = buildNodeModel(francaTypeCollection)
        return if (file!!.isEmpty) {
            null
        } else {
            GeneratedFile(
                TemplateEngine.render("node/File", file),
                NodeNameRules.getImplementationFileName(francaTypeCollection)
            )
        }
    }

    @VisibleForTesting
    internal fun buildNodeModel(francaTypeCollection: FTypeCollection): NodeFile? {
        val modelBuilder = NodeModelBuilder(deploymentModel)
        val treeWalker = FrancaTreeWalker(listOf<ModelBuilder>(modelBuilder))

        treeWalker.walkTree(francaTypeCollection)
        enumsAsErrors.addAll(modelBuilder.enumsAsErrors)
        return modelBuilder.getFinalResult(NodeFile::class.java)
    }
}
