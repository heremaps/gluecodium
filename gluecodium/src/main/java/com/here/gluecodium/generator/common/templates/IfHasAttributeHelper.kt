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

import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeNamedElement
import org.trimou.handlebars.BasicSectionHelper
import org.trimou.handlebars.Options

/**
 * Check the presence of the given attribute on the given LIME element and execute the section if it
 * is there. If LIME element is omitted, `this` is taken instead.<br/>
 * Usage: {{#ifHasAttribute \[limeElement\] "attributeName"}}...{{/ifHasAttribute}}<br/>
 * Example: {{#ifHasAttribute "equatable"}}...{{/ifHasAttribute}}<br/>
 * Example: {{#ifHasAttribute type "equatable"}}...{{/ifHasAttribute}}
 */
internal class IfHasAttributeHelper : BasicSectionHelper() {
    override fun execute(options: Options) {
        val limeElement = when {
            options.parameters.size > 1 -> options.parameters.first()
            else -> options.peek()
        } as? LimeNamedElement ?: return
        val attributeName = when {
            options.parameters.size > 1 -> options.parameters[1]
            else -> options.parameters.firstOrNull()
        }?.toString() ?: return

        val attribute = resolveAttributeType(attributeName) ?: return
        if (limeElement.attributes.have(attribute)) {
            options.fn()
        }
    }

    private fun resolveAttributeType(attributeName: String) =
        LimeAttributeType.values().firstOrNull {
            attributeName.compareTo(it.toString(), ignoreCase = true) == 0
        }
}
