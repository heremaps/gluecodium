/*
 * Copyright (C) 2016-2025 HERE Europe B.V.
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

package com.here.gluecodium.generator.kotlin

import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeContainer
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda

internal object KotlinGeneratorPredicates {
    val predicates =
        mapOf(
            "hasStaticFunctions" to this::hasStaticFunctions,
            "needsDisposer" to this::needsDisposer,
            "needsCompanionObject" to this::needsCompanionObject,
            "hasConstants" to this::hasConstants,
            "hasStaticProperties" to this::hasStaticProperties,
        )

    private fun hasStaticFunctions(element: Any) =
        when (element) {
            is LimeContainer -> element.functions.any { it.isStatic }
            else -> false
        }

    private fun hasConstants(element: Any) =
        when (element) {
            is LimeContainer -> element.constants.isNotEmpty()
            else -> false
        }

    private fun needsDisposer(element: Any) =
        when (element) {
            is LimeClass -> element.parentClass == null
            is LimeInterface -> true
            is LimeLambda -> true
            else -> false
        }

    private fun hasStaticProperties(element: Any) =
        when (element) {
            is LimeContainerWithInheritance -> element.properties.any { it.isStatic }
            else -> false
        }

    private fun needsCompanionObject(element: Any) =
        hasStaticFunctions(element) || hasConstants(element) || needsDisposer(element) || hasStaticProperties(element)
}
