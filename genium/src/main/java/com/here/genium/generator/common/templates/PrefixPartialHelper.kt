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

import org.trimou.handlebars.Options

/**
 * Prefix each line of a multi-line partial with a prefix. Trim each line at the end to avoid
 * trailing whitespace.<br></br>
 * Usage: {{prefixPartial "partial-name" "prefix"}}<br></br>
 * Example: {{prefixPartial "common/CopyrightNotice" "// "}}
 */
internal class PrefixPartialHelper : PrefixHelper() {
    override fun getValue(options: Options, dataObject: Any?): String {
        val builder = StringBuilder()
        options.partial(dataObject.toString(), builder)
        return builder.toString()
    }
}
