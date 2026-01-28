/*
 * Copyright (C) 2016-2026 HERE Europe B.V.
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

package com.here.gluecodium.generator.kotlin

import com.here.gluecodium.cli.GluecodiumExecutionException
import com.here.gluecodium.generator.common.CommonGeneratorPredicates
import com.here.gluecodium.model.lime.LimeAttributeType.KOTLIN
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeType

internal class KotlinInternalVisibilityPredicate(private val referenceMap: Map<String, LimeElement>) {
    // Returns true when the element is conceptually internal.
    // Some elements cannot use internal keyword (e.g. the ones which are children of Kotlin interface).
    // In such cases we still want to have information about 'conceptual' internal visibility of such
    // elements to annotate them with 'JvmSynthetic' --> to hide them when Kotlin is accessed from Java.
    //
    // The children of such interface will not be visible in Kotlin, but without JvmSynthetic they would
    // be visible in Java.
    fun isConceptuallyInternal(element: Any): Boolean {
        if (element !is LimeNamedElement) {
            throw GluecodiumExecutionException("Unsupported element type ${element.javaClass.name}")
        }

        return isInternal(element) || isInInternalTypesHierarchy(element)
    }

    private fun isInternal(element: LimeNamedElement): Boolean {
        var internal = CommonGeneratorPredicates.isInternal(element, KOTLIN)
        if (!internal && element is LimeField) {
            internal = CommonGeneratorPredicates.isInternal(element.typeRef.type, KOTLIN)
        }

        return internal
    }

    private fun isInInternalTypesHierarchy(element: LimeNamedElement): Boolean {
        val parentElement = referenceMap[element.path.parent.toString()] as LimeNamedElement? ?: return false
        if (isInternal(parentElement)) {
            return true
        }

        val isEachParentPublic =
            generateSequence(parentElement) {
                referenceMap[it.path.parent.toString()] as? LimeType
            }.none { isInternal(it) }

        return !isEachParentPublic
    }
}
