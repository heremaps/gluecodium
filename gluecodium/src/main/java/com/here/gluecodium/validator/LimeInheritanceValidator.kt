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

package com.here.gluecodium.validator

import com.here.gluecodium.common.LimeLogger
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimePath

/**
 * Validate inheritance relationships for classes and interfaces. Classes can inherit from open
 * classes and interfaces (but not from other types). Interfaces can inherit only from other
 * interfaces.
 */
internal class LimeInheritanceValidator(private val logger: LimeLogger) {

    fun validate(limeModel: LimeModel): Boolean {
        val allElements = limeModel.referenceMap.values
        val validationResults =
            allElements.filterIsInstance<LimeClass>().map { validateClass(it) } +
            allElements.filterIsInstance<LimeInterface>().map { validateInterface(it) }

        return !validationResults.contains(false)
    }

    private fun validateClass(limeClass: LimeClass): Boolean {
        val parentTypes = limeClass.parents.map { it.type.actualType }
        return when {
            parentTypes.isEmpty() -> true
            hasInheritanceLoop(limeClass) -> {
                logger.error(limeClass, "a class cannot inherit from itself or its own descendants")
                false
            }
            parentTypes.any { it !is LimeClass && it !is LimeInterface } -> {
                logger.error(limeClass, CLASS_INHERITANCE_MESSAGE)
                false
            }
            parentTypes.any { it is LimeClass && !it.visibility.isOpen } -> {
                logger.error(limeClass, CLASS_INHERITANCE_MESSAGE)
                false
            }
            parentTypes.filterIsInstance<LimeClass>().size > 1 -> {
                logger.error(limeClass, "a class can inherit from at most one class")
                false
            }
            else -> true
        }
    }

    private fun validateInterface(limeInterface: LimeInterface): Boolean {
        val parentTypes = limeInterface.parents.map { it.type.actualType }
        return when {
            parentTypes.isEmpty() -> true
            hasInheritanceLoop(limeInterface) -> {
                logger.error(
                    limeInterface,
                    "an interface cannot inherit from itself or its own descendants"
                )
                false
            }
            parentTypes.any { it !is LimeInterface } -> {
                logger.error(limeInterface, "an interface can inherit only from an interface")
                false
            }
            else -> true
        }
    }

    private fun hasInheritanceLoop(
        limeContainer: LimeContainerWithInheritance,
        visitedPaths: Set<LimePath> = emptySet()
    ): Boolean {
        val containerPath = limeContainer.path
        if (visitedPaths.contains(containerPath)) return true

        val parentContainers = limeContainer.parents.mapNotNull { it.type.actualType as? LimeContainerWithInheritance }
        val newVisitedPaths = visitedPaths + containerPath
        return parentContainers.any { hasInheritanceLoop(it, newVisitedPaths) }
    }

    companion object {
        private const val CLASS_INHERITANCE_MESSAGE =
            "a class can inherit only from an interface or from an open class"
    }
}
