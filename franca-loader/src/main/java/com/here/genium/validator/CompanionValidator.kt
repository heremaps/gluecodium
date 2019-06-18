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

package com.here.genium.validator

import com.here.genium.franca.FrancaDeploymentModel
import com.here.genium.franca.FrancaTypeHelper
import org.franca.core.franca.FInterface
import org.franca.core.franca.FStructType
import org.franca.core.franca.FTypeCollection
import java.util.logging.Logger

/**
 * Check for correctness of names and flags related to "Companion" deployment property.
 */
object CompanionValidator {

    private val LOGGER = Logger.getLogger(CompanionValidator::class.java.name)

    fun validate(
        deploymentModel: FrancaDeploymentModel,
        typeCollections: List<FTypeCollection>
    ): Boolean {
        val allInterfaces =
            typeCollections
                .filterIsInstance<FInterface>()
                .associateBy { FrancaTypeHelper.getFullName(it) }
        val errorMessages = typeCollections
            .flatMap { it.types }
            .filterIsInstance<FStructType>()
            .flatMap { validateCompanion(it, deploymentModel, allInterfaces) }
        errorMessages.forEach { LOGGER.severe(it) }

        return errorMessages.isEmpty()
    }

    internal fun validateCompanion(
        francaStruct: FStructType,
        deploymentModel: FrancaDeploymentModel,
        allInterfaces: Map<String, FInterface>
    ): List<String> {
        val structName = FrancaTypeHelper.getFullName(francaStruct)
        val companionKey = deploymentModel.getCompanion(francaStruct) ?: return emptyList()
        val companion = allInterfaces[companionKey] ?: return listOf(
            "Companion interface '$companionKey' for struct type '$structName' does not exist."
        )

        val errorMessages = mutableListOf<String>()

        val hasConstructor = companion.methods.any { deploymentModel.isConstructor(it) }
        if (hasConstructor && deploymentModel.hasJavaBuilder(francaStruct)) {
            errorMessages += "'JavaBuilder' flag for struct type '$structName' is not " +
                "compatible with having a custom constructor in the companion interface."
        }

        val structFieldNames = francaStruct.elements.map { it.name }.toSet()
        val companionConstNames = companion.constants.map { it.name }.toSet()
        val clashingNames = structFieldNames intersect companionConstNames
        if (clashingNames.isNotEmpty()) {
            val namesString = clashingNames.joinToString("', '")
            errorMessages += "Names of constants '$namesString' in companion interface" +
                " '$companionKey' clash with names of fields in struct type '$structName'."
        }

        return errorMessages
    }
}
