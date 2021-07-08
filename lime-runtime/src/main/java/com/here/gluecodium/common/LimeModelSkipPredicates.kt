/*
 * Copyright (C) 2016-2021 HERE Europe B.V.
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

package com.here.gluecodium.common

import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeAttributeValueType.TAG
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeProperty

object LimeModelSkipPredicates {
    fun shouldRetainElement(
        limeElement: LimeNamedElement,
        platformAttribute: LimeAttributeType?,
        activeTags: Set<String>
    ) =
        when {
            isSkippedByTags(limeElement, activeTags) -> false
            platformAttribute == null -> true
            limeElement is LimeFunction || limeElement is LimeProperty -> true
            limeElement.attributes.have(platformAttribute, LimeAttributeValueType.SKIP) -> false
            else -> true
        }

    fun isSkippedByTags(limeElement: LimeNamedElement, activeTags: Set<String>): Boolean {
        val isEnabled = hasTagsMatch(limeElement, LimeAttributeType.ENABLE_IF, activeTags)
        if (isEnabled == false) return true

        val isSkipped = hasTagsMatch(limeElement, LimeAttributeType.SKIP, activeTags)
        return isSkipped ?: false
    }

    private fun hasTagsMatch(
        limeElement: LimeNamedElement,
        attributeType: LimeAttributeType,
        activeTags: Set<String>
    ): Boolean? =
        when (val attributeTags = limeElement.attributes.get(attributeType, TAG, Any::class.java)) {
            is String -> activeTags.contains(attributeTags)
            is List<*> -> attributeTags.filterIsInstance<String>().intersect(activeTags).isNotEmpty()
            else -> null
        }
}
