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

package com.here.gluecodium.generator.cpp

import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeRef

/**
 * List of predicates used by `ifPredicate`/`unlessPredicate` template helpers in C++ generator.
 */
internal object CppGeneratorPredicates {
    val predicates = mapOf(
        "needsRefSuffix" to { limeTypeRef: Any ->
            limeTypeRef is LimeTypeRef && CppNameResolver.needsRefSuffix(limeTypeRef)
        },
        "needsNotNullComment" to { limeTypeRef: Any ->
            limeTypeRef is LimeTypeRef && needsNotNullComment(limeTypeRef)
        },
        "hasAnyComment" to { limeElement: Any ->
            when (limeElement) {
                is LimeFunction -> limeElement.run {
                    comment.getFor("Cpp").isNotBlank() || comment.isExcluded ||
                        returnType.comment.getFor("Cpp").isNotBlank() ||
                        needsNotNullComment(returnType.typeRef) ||
                        (thrownType?.comment?.getFor("Cpp")?.isBlank() == false) ||
                        attributes.have(LimeAttributeType.DEPRECATED) ||
                        parameters.any { it.comment.getFor("Cpp").isNotBlank() || needsNotNullComment(it.typeRef) }
                }
                is LimeNamedElement -> limeElement.run {
                    comment.getFor("Cpp").isNotBlank() || comment.isExcluded ||
                        attributes.have(LimeAttributeType.DEPRECATED)
                }
                else -> false
            }
        },
        "hasDefaultConstructor" to { limeStruct: Any ->
            when {
                limeStruct !is LimeStruct -> false
                limeStruct.uninitializedFields.isEmpty() -> true
                limeStruct.uninitializedFields
                    .flatMap { getAllFieldTypes(it.typeRef.type) }
                    .any { it.attributes.have(LimeAttributeType.IMMUTABLE) } -> false
                !limeStruct.attributes.have(LimeAttributeType.IMMUTABLE) -> true
                else -> false
            }
        },
        "hasPartialDefaults" to { limeStruct: Any ->
            when {
                limeStruct !is LimeStruct -> false
                limeStruct.uninitializedFields.isEmpty() -> false
                else -> limeStruct.uninitializedFields.size < limeStruct.fields.size
            }
        },
        "hasCstringParameters" to { limeFunction: Any ->
            limeFunction is LimeFunction && limeFunction.parameters.any {
                val actualType = it.typeRef.type.actualType
                actualType is LimeBasicType &&
                    actualType.typeId == LimeBasicType.TypeId.STRING &&
                    it.attributes.have(LimeAttributeType.CPP, LimeAttributeValueType.CSTRING)
            }
        },
        "needsPointerValueEqual" to fun(limeField: Any): Boolean {
            if (limeField !is LimeField) return false
            val limeType = limeField.typeRef.type.actualType
            return when {
                limeType is LimeContainerWithInheritance &&
                        limeType.attributes.have(LimeAttributeType.EQUATABLE) -> true
                !limeField.typeRef.isNullable -> false
                limeType is LimeContainerWithInheritance &&
                        limeType.attributes.have(LimeAttributeType.POINTER_EQUATABLE) -> false
                else -> true
            }
        },
        "needsRawPointerEqual" to fun(limeField: Any): Boolean {
            if (limeField !is LimeField) return false
            val limeType = limeField.typeRef.type.actualType
            return when {
                !limeField.typeRef.isNullable -> false
                limeType !is LimeContainerWithInheritance -> false
                limeType.attributes.have(LimeAttributeType.EQUATABLE) -> false
                limeType.attributes.have(LimeAttributeType.POINTER_EQUATABLE) -> false
                else -> true
            }
        }
    )

    private fun needsNotNullComment(limeTypeRef: LimeTypeRef) =
        !limeTypeRef.isNullable && limeTypeRef.type.actualType is LimeContainerWithInheritance

    private fun getAllFieldTypes(limeType: LimeType) = getAllFieldTypesRec(limeType.actualType, mutableSetOf())

    private fun getAllFieldTypesRec(leafType: LimeType, visitedTypes: MutableSet<LimeType>): List<LimeType> {
        if (leafType !is LimeStruct) return listOf(leafType)

        visitedTypes += leafType
        val typesToVisit = leafType.fields.map { it.typeRef.type.actualType }.distinct() - visitedTypes
        return typesToVisit.flatMap { getAllFieldTypesRec(it, visitedTypes) } + leafType
    }
}
