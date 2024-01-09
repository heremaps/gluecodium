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

import org.trimou.handlebars.BasicHelper
import org.trimou.handlebars.Options
import org.trimou.util.ImmutableSet

/**
 * Prefix each line of a multi-line value with a prefix. Trim each line at the end to avoid trailing
 * whitespace. If skipFirstLine=true is set, the first line will not be prefixed.<br>
 * Usage: {{prefix value "prefix"}} or {{prefix value "prefix" skipFirstLine=true}}<br>
 * Example: {{prefix comment "// "}}
 */
internal open class PrefixHelper : BasicHelper() {
    override fun execute(options: Options) {
        val parameters = options.parameters
        if (parameters.isEmpty()) return

        val prefix = parameters.getOrNull(1)?.toString() ?: ""
        var skipFirstLine = options.hash["skipFirstLine"]?.toString()?.toBoolean() ?: false
        val value = getValue(options, parameters[0])
        options.append(
            value.lineSequence().joinToString("\n") {
                if (skipFirstLine) {
                    skipFirstLine = false
                    it.trimEnd()
                } else {
                    (prefix + it).trimEnd()
                }
            },
        )
    }

    override fun getSupportedHashKeys(): MutableSet<String> {
        return ImmutableSet.of("skipFirstLine")
    }

    protected open operator fun getValue(
        options: Options,
        dataObject: Any?,
    ) = dataObject?.toString() ?: ""
}
