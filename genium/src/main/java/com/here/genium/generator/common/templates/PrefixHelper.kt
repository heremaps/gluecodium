/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
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
 * Prefix each line of a multi-line value with a prefix. Trim each line at the end to avoid trailing
 * whitespace.<br>
 * Usage: {{prefix value "prefix"}}<br>
 * Example: {{prefix comment "// "}}
 */
internal open class PrefixHelper : BasicHelper() {
    override fun execute(options: Options) {
        val parameters = options.parameters
        if (parameters.isNotEmpty()) {
            val prefix = if (parameters.size > 1) parameters[1].toString() else ""
            val value = getValue(options, parameters[0])
            options.append(value.split("\n").joinToString(separator = "\n") { prefix + it.trimEnd() })
        }
    }

    protected open operator fun getValue(options: Options, dataObject: Any?) =
        dataObject?.toString() ?: ""
}
