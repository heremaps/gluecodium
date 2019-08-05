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

import com.here.genium.model.lime.LimeContainer
import com.here.genium.model.lime.LimeModel
import com.here.genium.model.lime.LimePath

/* Validate inheritance relationships for classes and interfaces. Classes can inherit from classes
 * and interfaces (but not from other types). Interfaces can inherit only from other interfaces.
 */
internal class LimeInheritanceValidator(private val logger: LimeLogger) {

    fun validate(limeModel: LimeModel): Boolean {
        val allContainers = limeModel.referenceMap.values.filterIsInstance<LimeContainer>()
        val validationResults = allContainers
            .filter { it.type == LimeContainer.ContainerType.CLASS }
            .map { validateClass(it) } + allContainers
            .filter { it.type == LimeContainer.ContainerType.INTERFACE }
            .map { validateInterface(it) }

        return !validationResults.contains(false)
    }

    private fun validateClass(limeClass: LimeContainer): Boolean {
        val parentType = limeClass.parent?.type
        return when {
            parentType == null -> true
            hasInheritanceLoop(limeClass) -> {
                logger.error(limeClass, "a class cannot inherit from itself or its own descendants")
                false
            }
            parentType is LimeContainer &&
                parentType.type != LimeContainer.ContainerType.TYPE_COLLECTION -> true
            else -> {
                logger.error(limeClass, "a class can inherit only from a class or an interface")
                false
            }
        }
    }

    private fun validateInterface(limeInterface: LimeContainer): Boolean {
        val parentType = limeInterface.parent?.type
        return when {
            parentType == null -> true
            hasInheritanceLoop(limeInterface) -> {
                logger.error(
                    limeInterface,
                    "an interface cannot inherit from itself or its own descendants"
                )
                false
            }
            parentType is LimeContainer &&
                parentType.type == LimeContainer.ContainerType.INTERFACE -> true
            else -> {
                logger.error(limeInterface, "an interface can inherit only from an interface")
                false
            }
        }
    }

    private fun hasInheritanceLoop(limeContainer: LimeContainer): Boolean {
        val visitedContainers = mutableSetOf<LimePath>()
        val inheritanceIterator =
            generateSequence(limeContainer) { it.parent?.type as? LimeContainer }.iterator()
        while (inheritanceIterator.hasNext()) {
            if (!visitedContainers.add(inheritanceIterator.next().path)) {
                return true
            }
        }
        return false
    }
}
