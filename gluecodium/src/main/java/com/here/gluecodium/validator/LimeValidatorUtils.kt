/*
 * Copyright (C) 2016-2024 HERE Europe B.V.
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

package com.here.gluecodium.validator

import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeType.DART
import com.here.gluecodium.model.lime.LimeAttributeType.JAVA
import com.here.gluecodium.model.lime.LimeAttributeType.KOTLIN
import com.here.gluecodium.model.lime.LimeAttributeType.SWIFT
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeType

internal object LimeValidatorUtils {
    const val LIME_MARKDOWN_DOCS = "https://github.com/heremaps/gluecodium/blob/master/docs/lime_markdown.md"

    // Documentation comments are required for the given element when one of the following occurs:
    // 1. The element is not internal and all of its parents are not internal.
    // 2. The element is not internal for all platforms (JAVA, SWIFT, DART, KOTLIN) and its parents too.
    fun needsDocumentationComment(
        limeNamedElement: LimeNamedElement,
        referenceMap: Map<String, LimeElement>,
    ): Boolean {
        if (canSkipDocumentation(limeNamedElement)) {
            return false
        }

        val parentElement = referenceMap[limeNamedElement.path.parent.toString()] as LimeNamedElement? ?: return true
        if (canSkipDocumentation(parentElement)) {
            return false
        }

        return generateSequence(parentElement) {
            referenceMap[it.path.parent.toString()] as? LimeType
        }.none { canSkipDocumentation(it) }
    }

    private fun canSkipDocumentation(element: LimeNamedElement): Boolean {
        // Trivial case: the element uses 'global internal' attribute.
        if (element.attributes.have(LimeAttributeType.INTERNAL)) {
            return true
        }

        // Non-trivial case: all platforms are internal.
        return listOf(JAVA, SWIFT, DART, KOTLIN).all {
            element.attributes.have(it, LimeAttributeValueType.INTERNAL)
        }
    }
}
