/*
 * Copyright (C) 2016-2025 HERE Europe B.V.
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
import com.here.gluecodium.generator.common.NameResolver
import com.here.gluecodium.model.lime.LimeAttributeType.KOTLIN
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeProperty
import com.here.gluecodium.model.lime.LimeType

internal class KotlinVisibilityResolver(private val referenceMap: Map<String, LimeElement>) : NameResolver {
    override fun resolveName(element: Any): String {
        if (element !is LimeNamedElement) {
            throw GluecodiumExecutionException("Unsupported element type ${element.javaClass.name}")
        }

        return when {
            isDirectKotlinInterfaceChild(element) -> ""
            isInternal(element) -> "internal "
            else -> ""
        }
    }

    private fun isInternal(element: LimeNamedElement): Boolean {
        var internal = CommonGeneratorPredicates.isInternal(element, KOTLIN)
        if (!internal && element is LimeField) {
            internal = CommonGeneratorPredicates.isInternal(element.typeRef.type, KOTLIN)
        }

        return internal
    }

    // Elements which are direct children of 'interface' or 'fun interface' cannot use 'internal' keyword in Kotlin.
    // 'fun interface' is used for LimeLambda
    private fun isDirectKotlinInterfaceChild(element: LimeNamedElement): Boolean {
        val parent: LimeElement? = referenceMap[element.path.parent.toString()]
        return parent != null && (parent is LimeInterface || parent is LimeLambda)
    }

    override fun resolveGetterName(element: Any) = resolveVisibilityForPropertyExtension(element)

    override fun resolveSetterName(element: Any) = resolveVisibilityForPropertyExtension(element)

    // Extension method for static properties require explicit 'internal' keyword even when property is nested
    // inside hierarchy of internal nested types. Therefore, we need to iterate over parent types and check if
    // any of them is internal.
    private fun resolveVisibilityForPropertyExtension(property: Any): String {
        return if ((property is LimeProperty) && (isInternal(property) || isInInternalTypesHierarchy(property))) {
            "internal "
        } else {
            ""
        }
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
