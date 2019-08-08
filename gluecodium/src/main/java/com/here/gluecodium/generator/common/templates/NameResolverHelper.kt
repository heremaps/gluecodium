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

package com.here.gluecodium.generator.common.templates

import com.here.gluecodium.generator.common.NameResolver
import org.trimou.handlebars.BasicHelper
import org.trimou.handlebars.Options

/**
 * Resolve the platform name for the given element through one of the name resolvers (looked up by a
 * key). If element is not specified, `this` is taken as an element. If resolver key is not
 * specified, a default resolver is used (one with empty key "").<br/>
 * Usage: {{resolveName \[element\] \["resolverKey"\]}}...{{/map}}<br/>
 * Example: {{resolveName}}<br/>
 * Example: {{resolveName visibility}}<br/>
 * Example: {{resolveName "C++"}}<br/>
 * Example: {{resolveName returnType.typeRef "C++"}}
 */
internal class NameResolverHelper : BasicHelper() {
    val nameResolvers = mutableMapOf<String, NameResolver>()

    override fun execute(options: Options) {
        val element: Any
        val key: String
        when (options.parameters.size) {
            0 -> {
                element = options.peek()
                key = ""
            }
            1 -> {
                val parameter = options.parameters.first()
                if (parameter is String) {
                    element = options.peek()
                    key = parameter
                } else {
                    element = parameter
                    key = ""
                }
            }
            else -> {
                element = options.parameters.first()
                key = options.parameters[1] as? String ?: ""
            }
        }

        nameResolvers[key]?.let { options.append(it.resolveName(element)) }
    }

    override fun numberOfRequiredParameters() = 0
}
