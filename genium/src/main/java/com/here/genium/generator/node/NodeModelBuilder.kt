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

package com.here.genium.generator.node

import com.google.common.annotations.VisibleForTesting
import com.here.genium.generator.common.modelbuilder.AbstractModelBuilder
import com.here.genium.generator.common.modelbuilder.ModelBuilderContextStack
import com.here.genium.model.franca.FrancaDeploymentModel
import com.here.genium.model.node.NodeArray
import com.here.genium.model.node.NodeElement
import java.util.HashMap
import java.util.HashSet

class NodeModelBuilder @VisibleForTesting
internal constructor(
    contextStack: ModelBuilderContextStack<NodeElement>,
    private val deploymentModel: FrancaDeploymentModel
) : AbstractModelBuilder<NodeElement>(contextStack) {

    val arraysCollector: Map<String, NodeArray> = HashMap()
    val enumsAsErrors: Set<String> = HashSet()

    constructor(deploymentModel: FrancaDeploymentModel) : this(
        ModelBuilderContextStack<NodeElement>(),
        deploymentModel
    )
}
