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

import com.google.common.annotations.VisibleForTesting
import com.here.genium.franca.FrancaDeploymentModel
import com.here.genium.franca.FrancaTypeHelper
import org.franca.core.franca.FInterface
import org.franca.core.franca.FStructType
import org.franca.core.franca.FTypeCollection
import java.util.logging.Logger

/**
 * Check for correctness of names in "Companion" deployment properties.
 */
object CompanionValidator {

    private val LOGGER = Logger.getLogger(CompanionValidator::class.java.name)

    fun validate(
        deploymentModel: FrancaDeploymentModel,
        typeCollections: List<FTypeCollection>
    ): Boolean {
        val allInterfaceNames =
            typeCollections.filterIsInstance<FInterface>().map { FrancaTypeHelper.getFullName(it) }
        val errorMessages = typeCollections
            .flatMap { it.types }
            .filterIsInstance<FStructType>()
            .mapNotNull { validateCompanionName(it, deploymentModel, allInterfaceNames) }
        errorMessages.forEach { LOGGER.severe(it) }

        return errorMessages.isEmpty()
    }

    @VisibleForTesting
    internal fun validateCompanionName(
        francaStruct: FStructType,
        deploymentModel: FrancaDeploymentModel,
        allInterfaceNames: List<String>
    ) =
        deploymentModel.getCompanion(francaStruct)?.let {
            if (allInterfaceNames.contains(it)) {
                null
            } else {
                val structName = FrancaTypeHelper.getFullName(francaStruct)
                "Companion interface '$it' for struct type '$structName' does not exist."
            }
        }
}
