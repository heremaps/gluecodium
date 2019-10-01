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

import org.trimou.handlebars.BasicSectionHelper
import org.trimou.handlebars.Options
import org.trimou.handlebars.SetHelper

/**
 * Works similarly to [SetHelper]. Joins several values into one string with a given delimiter and
 * sets it to variable specified by `key` on the context stack.<br/>
 * Usage: {{#setJoin "key" value1 value2 ... delimiter="delimiterValue"}}...{{/setJoin}}<br/>
 * Example: {{#setJoin "parentName" parentName name delimiter="::"}}...{{/setJoin}}
 */
class SetJoinHelper : BasicSectionHelper() {

    override fun execute(options: Options) {
        val delimiter = convertValue(options.hash[DELIMITER])
        val key = convertValue(options.parameters.first())
        val value =
            options.parameters.drop(1).filterNotNull().joinToString(delimiter) { convertValue(it) }

        options.push(mapOf(key to value))
        options.fn()
        options.pop()
    }

    override fun numberOfRequiredParameters() = 3

    override fun getRequiredHashKeys() = setOf(DELIMITER)

    companion object {
        private const val DELIMITER = "delimiter"
    }
}
