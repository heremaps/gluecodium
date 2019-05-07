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

package com.here.genium.loader

import com.here.genium.franca.FrancaDeploymentModel
import com.here.genium.franca.FrancaTypeHelper
import org.franca.core.franca.FInterface
import org.franca.core.franca.FStructType
import org.franca.core.franca.FTypeCollection

class FrancaCompanionHelper(
    typeCollections: List<FTypeCollection>,
    deploymentModel: FrancaDeploymentModel
) {
    private val structKeyToCompanionMap: Map<String, FInterface>
    private val companionKeyToStructMap: Map<String, FStructType>

    init {
        val companionMap = mutableMapOf<String, FInterface>()
        val structMap = mutableMapOf<String, FStructType>()

        val interfaceKeyToInterface = typeCollections
            .filterIsInstance<FInterface>()
            .associateBy { FrancaTypeHelper.getFullName(it) }
        val allStructs = typeCollections.flatMap { it.types }.filterIsInstance<FStructType>()
        for (francaStruct in allStructs) {
            val companionKey = deploymentModel.getCompanion(francaStruct)
            if (companionKey != null) {
                val companion = interfaceKeyToInterface[companionKey]
                if (companion != null) {
                    val structKey = FrancaTypeHelper.getFullName(francaStruct)
                    companionMap[structKey] = companion
                    structMap[companionKey] = francaStruct
                }
            }
        }

        structKeyToCompanionMap = companionMap
        companionKeyToStructMap = structMap
    }

    fun getCompanion(francaStruct: FStructType) =
        structKeyToCompanionMap[FrancaTypeHelper.getFullName(francaStruct)]

    fun getAllCompanions() = structKeyToCompanionMap.values

    fun getStructForCompanion(companionInterface: FInterface) =
        companionKeyToStructMap[FrancaTypeHelper.getFullName(companionInterface)]
}
