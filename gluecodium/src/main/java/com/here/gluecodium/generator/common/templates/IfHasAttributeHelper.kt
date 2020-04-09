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
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeElement
import org.trimou.handlebars.BasicSectionHelper
import org.trimou.handlebars.Options

/**
 * ifHasAttribute: Check the presence of the attribute with given type and given value type (if present) on the
 * given LIME element and execute the section if it is there. If LIME element is omitted, `this` is
 * taken instead.<br/>
 * Usage: {{#ifHasAttribute \[limeElement\] "attributeType" \["attributeValueType"\]}}...{{/ifHasAttribute}}<br/>
 * Example: {{#ifHasAttribute "equatable"}}...{{/ifHasAttribute}}<br/>
 * Example: {{#ifHasAttribute type "equatable"}}...{{/ifHasAttribute}}<br/>
 * Example: {{#ifHasAttribute type "cpp" "accessors"}}...{{/ifHasAttribute}}<br/>
 * unlessHasAttribute: same as above, except the the section is executed only if the attribute is
 * not there.
 */
internal class IfHasAttributeHelper(private val equality: Boolean) : BasicSectionHelper() {
    override fun execute(options: Options) {
        val limeElement: LimeElement
        val attributeTypeName: String
        val attributeValueTypeName: String?
        when (val firstParameter = options.parameters.firstOrNull()) {
            is String -> {
                limeElement = options.peek() as? LimeElement ?: return
                attributeTypeName = firstParameter
                attributeValueTypeName = options.parameters.getOrNull(1)?.toString()
            }
            else -> {
                limeElement = firstParameter as? LimeElement ?: return
                attributeTypeName = options.parameters.getOrNull(1)?.toString() ?: return
                attributeValueTypeName = options.parameters.getOrNull(2)?.toString()
            }
        }

        val attributeType = resolveAttributeType(attributeTypeName) ?: return
        if (attributeValueTypeName == null) {
            if (limeElement.attributes.have(attributeType) == equality) {
                options.fn()
            }
        } else {
            val attributeValueType = resolveAttributeValueType(attributeValueTypeName) ?: return
            if (limeElement.attributes.have(attributeType, attributeValueType) == equality) {
                options.fn()
            }
        }
    }

    private fun resolveAttributeType(attributeTypeName: String) =
        LimeAttributeType.values().firstOrNull {
            attributeTypeName.compareTo(it.toString(), ignoreCase = true) == 0
        }

    private fun resolveAttributeValueType(attributeValueTypeName: String) =
        LimeAttributeValueType.values().firstOrNull {
            attributeValueTypeName.compareTo(it.toString(), ignoreCase = true) == 0
        }
}
