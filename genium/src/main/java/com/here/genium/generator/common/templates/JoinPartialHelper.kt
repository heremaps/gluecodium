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

package com.here.genium.generator.common.templates

import org.trimou.handlebars.BasicHelper
import org.trimou.handlebars.Options

/**
 * Apply a partial to each value in an Iterable and join the results with a separator.<br></br>
 * Usage: {{joinPartial iterable "partial-name" "separator"}}<br></br>
 * Example: {{joinPartial parameters "cpp/CppMethodParameter" ", "}}
 */
internal class JoinPartialHelper : BasicHelper() {
    override fun execute(options: Options) {
        val parameters = options.parameters
        if (parameters.size < 2) {
            return
        }

        val value = parameters[0]
        val partialName = parameters[1].toString()
        val separator = if (parameters.size > 2) parameters[2].toString() else ""

        when (value) {
            is Iterable<*> -> {
                val iterator = value.iterator()
                while (iterator.hasNext()) {
                    applyPartial(options, partialName, iterator.next()!!)
                    if (iterator.hasNext()) {
                        options.append(separator)
                    }
                }
            }
            else -> applyPartial(options, partialName, value)
        }
    }

    private fun applyPartial(options: Options, partialName: String, dataObject: Any) =
        options.apply {
            push(dataObject)
            partial(partialName)
            pop()
        }
}
