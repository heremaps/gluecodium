/*
 * Copyright (C) 2016-2020 HERE Europe B.V.
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

package com.here.gluecodium.generator.dart

import com.here.gluecodium.common.LimeLogger
import com.here.gluecodium.model.lime.LimeAttributeType.DART
import com.here.gluecodium.model.lime.LimeAttributeValueType.DEFAULT
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeNamedElement

/**
 * Validate functions and constructors against overloading. Dart language does not support this.
 */
internal class DartOverloadsValidator(
    private val nameResolver: DartNameResolver,
    private val logger: LimeLogger,
    private val werror: Boolean
) {
    private val logFunction: LimeLogger.(LimeNamedElement, String) -> Unit =
        if (werror) LimeLogger::error else LimeLogger::warning

    fun validate(limeElements: List<LimeNamedElement>): Boolean {
        val validationResults = limeElements
            .filterIsInstance<LimeContainerWithInheritance>()
            .map { validateContainer(it) }

        return !werror || !validationResults.contains(false)
    }

    private fun validateContainer(limeContainer: LimeContainerWithInheritance): Boolean {
        val allFunctions = limeContainer.functions + limeContainer.inheritedFunctions
        val constructors = allFunctions.filter { it.isConstructor }

        val overloadedFunctions = (allFunctions - constructors)
            .groupBy { nameResolver.resolveName(it) }
            .filter { it.value.size > 1 }
        overloadedFunctions.forEach { entry ->
            val pathsString = entry.value.map { it.path.toString() }.sorted().joinToString()
            logger.logFunction(
                entry.value.first(),
                "there is more than one function with '${entry.key}' name: $pathsString. " +
                    "Dart language does not support function overloading."
            )
        }

        val overloadedConstructors =
            constructors.groupBy { getConstructorName(it) }.filter { it.value.size > 1 }
        overloadedConstructors.forEach { entry ->
            val pathsString = entry.value.map { it.path.toString() }.sorted().joinToString()
            val warningText = if (entry.key.isEmpty()) {
                "there is more than one default constructor: $pathsString. "
            } else {
                "there is more than one constructor with '${entry.key}' name: $pathsString. "
            } + "Dart language does not support constructor overloading."
            logger.logFunction(entry.value.first(), warningText)
        }

        return overloadedFunctions.isEmpty() && overloadedConstructors.isEmpty()
    }

    private fun getConstructorName(constructor: LimeFunction) =
        if (constructor.attributes.have(DART, DEFAULT)) "" else nameResolver.resolveName(constructor)
}
