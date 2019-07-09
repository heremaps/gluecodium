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

import org.trimou.handlebars.BasicSectionHelper
import org.trimou.handlebars.Options

/**
 * Execute a block if the given string is contained in the given collection.<br>
 * Usage: {{#contains collection "value"}}...{{/contains}}<br>
 * Example: {{#contains names "someName"}}...{{/contains}}<br>
 */
internal class ContainsHelper : BasicSectionHelper() {
    override fun execute(options: Options) {
        val parameters = options.parameters
        if (parameters.size < 2) {
            return
        }
        val value = parameters[1].toString()
        @Suppress("UNCHECKED_CAST")
        if ((parameters[0] as? Collection<String>)?.contains(value) == true) {
            options.fn()
        }
    }
}
