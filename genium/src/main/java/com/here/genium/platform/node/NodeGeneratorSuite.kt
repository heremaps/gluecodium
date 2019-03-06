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

package com.here.genium.platform.node

import com.here.genium.Genium
import com.here.genium.generator.node.NodeGenerator
import com.here.genium.model.franca.FrancaDeploymentModel
import com.here.genium.platform.common.GeneratorSuite
import org.franca.core.franca.FTypeCollection

/**
 * Uses a [NodeGenerator] to generate Node.js bindings written in C++ on top of BaseAPI.
 *
 * The bindings are used to build a .node module that can run on IOT and server platforms.
 */
class NodeGeneratorSuite(
    options: Genium.Options,
    deploymentModel: FrancaDeploymentModel
) : GeneratorSuite() {
    //private val internalNamespace = options.cppInternalNamespace
    private val rootNamespace = options.cppRootNamespace
    //private val cppNameResolver = CppNameResolver(deploymentModel, rootNamespace)
    private val generator = NodeGenerator(deploymentModel)

    override fun generate(typeCollections: List<FTypeCollection>) =
        typeCollections.mapNotNull { generator.generate(it) }

    override fun getName() = "com.here.NodeGenerator"

    companion object {
        const val GENERATOR_NAME = "nodejs"
    }
}
