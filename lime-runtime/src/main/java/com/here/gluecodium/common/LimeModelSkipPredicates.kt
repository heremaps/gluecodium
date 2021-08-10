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
import com.here.gluecodium.model.lime.LimeAttributeValueType.ENABLE_IF
import com.here.gluecodium.model.lime.LimeAttributeValueType.SKIP
import com.here.gluecodium.model.lime.LimeAttributeValueType.TAG
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeProperty

object LimeModelSkipPredicates {
    fun shouldRetainElement(
        limeElement: LimeNamedElement,
        activeTags: Set<String>,
        platformAttribute: LimeAttributeType? = null,
        retainFunctions: Boolean = false
    ) = when {
        isSkippedByTags(limeElement, activeTags) -> false
        retainFunctions && (limeElement is LimeFunction || limeElement is LimeProperty) -> true
        platformAttribute == null -> true
        isSkippedByTagsOnPlatform(limeElement, activeTags, platformAttribute) -> false
        else -> true
    }

    fun shouldRetainCheckParent(
        limeElement: LimeNamedElement,
        activeTags: Set<String>,
        platformAttribute: LimeAttributeType,
        limeReferenceMap: Map<String, LimeElement>
    ) = when {
        !shouldRetainElement(limeElement, activeTags, platformAttribute) -> false
        !limeElement.path.hasParent -> true
        else -> {
            val parentElement = limeReferenceMap[limeElement.path.parent.toString()] as LimeNamedElement
            shouldRetainElement(parentElement, activeTags, platformAttribute)
        }
    }

    private fun isSkippedByTags(limeElement: LimeNamedElement, activeTags: Set<String>): Boolean {
        val isEnabled = hasTagsMatch(limeElement, LimeAttributeType.ENABLE_IF, TAG, activeTags)
        if (isEnabled == false) return true

        val isSkipped = hasTagsMatch(limeElement, LimeAttributeType.SKIP, TAG, activeTags)
        return isSkipped ?: false
    }

    private fun isSkippedByTagsOnPlatform(
        limeElement: LimeNamedElement,
        activeTags: Set<String>,
        platformAttribute: LimeAttributeType
    ): Boolean {
        val isEnabled = hasTagsMatch(limeElement, platformAttribute, ENABLE_IF, activeTags)
        if (isEnabled == false) return true

        val isSkipped = hasTagsMatch(limeElement, platformAttribute, SKIP, activeTags)
        return isSkipped ?: false
    }

    private fun hasTagsMatch(
        limeElement: LimeNamedElement,
        attributeType: LimeAttributeType,
        attributeValueType: LimeAttributeValueType,
        activeTags: Set<String>
    ): Boolean? =
        when (val attributeTags = limeElement.attributes.get(attributeType, attributeValueType, Any::class.java)) {
            true -> true
            is String -> activeTags.contains(attributeTags)
            is List<*> -> attributeTags.filterIsInstance<String>().intersect(activeTags).isNotEmpty()
            else -> null
        }
}
