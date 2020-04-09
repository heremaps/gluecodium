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
import org.trimou.handlebars.BasicHelper
import org.trimou.handlebars.Options

/**
 * getAttribute: Get the value of the attribute with given type and given value type (if present) on the
 * given LIME element.<br/>
 * Usage: {{getAttribute \[limeElement\] "attributeType" \["attributeValueType"\]}}<br/>
 * Example: {{getAttribute "equatable"}}<br/>
 * Example: {{getAttribute type "equatable"}}<br/>
 * Example: {{getAttribute type "cpp" "accessors"}}
 */
internal class GetAttributeHelper : BasicHelper() {
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
        val attributeValueType = attributeValueTypeName?.let { resolveAttributeValueType(it) }
            ?: attributeType.defaultValueType
            ?: return
        limeElement.attributes.get(attributeType, attributeValueType)?.let { options.append(it) }
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
