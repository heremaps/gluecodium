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
        val parentType = limeClass.parent?.type
        return when {
            parentType == null -> true
            hasInheritanceLoop(limeClass) -> {
                logger.error(limeClass, "a class cannot inherit from itself or its own descendants")
                false
            }
            parentType !is LimeClass && parentType !is LimeInterface -> {
                logger.error(limeClass, CLASS_INHERITANCE_MESSAGE)
                false
            }
            parentType is LimeClass && !parentType.visibility.isOpen -> {
                logger.error(limeClass, CLASS_INHERITANCE_MESSAGE)
                false
            }
            else -> true
        }
    }

    private fun validateInterface(limeInterface: LimeInterface): Boolean {
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
            parentType !is LimeInterface -> {
                logger.error(limeInterface, "an interface can inherit only from an interface")
                false
            }
            else -> true
        }
    }

    private fun hasInheritanceLoop(limeContainer: LimeContainerWithInheritance): Boolean {
        val visitedContainers = mutableSetOf<LimePath>()
        val inheritanceIterator = generateSequence(limeContainer) {
            it.parent?.type as? LimeContainerWithInheritance
        }.iterator()
        while (inheritanceIterator.hasNext()) {
            if (!visitedContainers.add(inheritanceIterator.next().path)) {
                return true
            }
        }
        return false
    }

    companion object {
        private const val CLASS_INHERITANCE_MESSAGE =
            "a class can inherit only from an interface or from an open class"
    }
}
