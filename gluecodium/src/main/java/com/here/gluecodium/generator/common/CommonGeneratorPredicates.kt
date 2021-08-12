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

package com.here.gluecodium.generator.common

import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeContainer
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeAlias

/**
 * Predicates used by `ifPredicate`/`unlessPredicate` template helpers in several generators.
 */
internal object CommonGeneratorPredicates {
    fun hasAnyComment(limeElement: Any, platformTag: String) =
        when (limeElement) {
            is LimeFunction -> limeElement.run {
                comment.getFor(platformTag).isNotBlank() || comment.isExcluded ||
                    returnType.comment.getFor(platformTag).isNotBlank() ||
                    (thrownType?.comment?.getFor(platformTag)?.isEmpty() == false) ||
                    attributes.have(LimeAttributeType.DEPRECATED) ||
                    parameters.any { it.comment.getFor(platformTag).isNotBlank() }
            }
            is LimeNamedElement -> limeElement.run {
                comment.getFor(platformTag).isNotBlank() || comment.isExcluded ||
                    attributes.have(LimeAttributeType.DEPRECATED)
            }
            else -> false
        }

    fun hasImmutableFields(limeStruct: Any) =
        when {
            limeStruct !is LimeStruct -> false
            limeStruct.attributes.have(LimeAttributeType.IMMUTABLE) -> true
            else ->
                limeStruct.fields
                    .flatMap { getAllFieldTypes(it.typeRef.type) }
                    .any { it.attributes.have(LimeAttributeType.IMMUTABLE) }
        }

    fun hasTypeRepository(limeContainer: Any) =
        when {
            limeContainer !is LimeContainerWithInheritance -> false
            limeContainer is LimeInterface -> true
            limeContainer.visibility.isOpen -> true
            else -> limeContainer.parent != null
        }

    fun hasStaticFunctions(limeContainer: Any) =
        when {
            limeContainer !is LimeContainer -> false
            limeContainer.functions.any { it.isStatic } -> true
            limeContainer.properties.any { it.isStatic } -> true
            else -> false
        }

    private fun getAllFieldTypes(limeType: LimeType) = getAllFieldTypesRec(getLeafType(limeType), mutableSetOf())

    private fun getAllFieldTypesRec(leafType: LimeType, visitedTypes: MutableSet<LimeType>): List<LimeType> {
        if (leafType !is LimeStruct) return listOf(leafType)

        visitedTypes += leafType
        val typesToVisit = leafType.fields.map { getLeafType(it.typeRef.type.actualType) }.distinct() - visitedTypes
        return typesToVisit.flatMap { getAllFieldTypesRec(it, visitedTypes) } + leafType
    }

    private fun getLeafType(limeType: LimeType): LimeType =
        when (limeType) {
            is LimeTypeAlias -> getLeafType(limeType.typeRef.type)
            is LimeList -> getLeafType(limeType.elementType.type)
            is LimeSet -> getLeafType(limeType.elementType.type)
            is LimeMap -> getLeafType(limeType.valueType.type)
            else -> limeType
        }
}
