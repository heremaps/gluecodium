/*
 * Copyright (C) 2016-2026 HERE Europe B.V.
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

package com.here.gluecodium.generator.reactnative

import com.here.gluecodium.generator.common.NameHelper
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeNamedElement

/**
 * Resolves LIME element names to C++/React Native naming conventions.
 * - Module name: "Native" + ClassName + "Module"
 * - Methods: camelCase (snake_case converted)
 *
 * [collisionNames] is the set of tail-joined names that appear in multiple packages.
 * For those, the last package segment is prepended to disambiguate
 * (e.g. sdk.core.Color → "CoreColor", sdk.routing.Color → "RoutingColor").
 */
internal class ReactNativeNameResolver(private val collisionNames: Set<String> = emptySet()) {
    fun resolveModuleName(className: String): String = "Native${className}Module"

    fun resolveName(element: LimeNamedElement): String =
        when (element) {
            is LimeFunction ->
                if (element.isConstructor) {
                    "make"
                } else {
                    snakeToCamelCase(element.path.name)
                }
            // For nested types (e.g. TextQuery.Area), join all tail segments to get a unique name
            // e.g. path.tail = ["TextQuery", "Area"] → "TextQueryArea"
            else -> {
                val tailName =
                    element.path.tail.joinToString("") { part ->
                        part.replaceFirstChar { it.uppercase() }
                    }
                if (tailName in collisionNames) {
                    val pkg =
                        element.path.head.lastOrNull()
                            ?.replaceFirstChar { it.uppercase() } ?: ""
                    "$pkg$tailName"
                } else {
                    tailName
                }
            }
        }

    private fun snakeToCamelCase(name: String): String = NameHelper.toLowerCamelCase(name)
}
