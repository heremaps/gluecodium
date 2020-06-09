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

package com.here.gluecodium.generator.common.templates

import com.here.gluecodium.common.StringHelper
import org.trimou.handlebars.BasicHelper
import org.trimou.handlebars.Options

/**
 * Escape value of a given String.<br></br>
 * Example: {{escape "someString\n"}}
 */
internal class EscapeHelper : BasicHelper() {
    override fun execute(options: Options) {
        if (options.parameters.isNotEmpty()) {
            options.append(StringHelper.escapeString((options.parameters[0].toString())))
        }
    }

    override fun numberOfRequiredParameters() = 0
}
