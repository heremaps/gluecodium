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

package com.here.gluecodium.generator.swift

import com.here.gluecodium.generator.common.CommonGeneratorPredicates
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeType.SWIFT
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeExternalDescriptor
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeTypeRef

/**
 * List of predicates used by `ifPredicate`/`unlessPredicate` template helpers in Swift generator.
 */
internal class SwiftGeneratorPredicates(
    nameRules: SwiftNameRules,
    private val signatureResolver: SwiftSignatureResolver
) {
    val predicates = mapOf(
        "hasAnyComment" to { limeElement: Any ->
            CommonGeneratorPredicates.hasAnyComment(limeElement, "Swift")
        },
        "hasCppTypeAttribute" to { limeGenericType: Any ->
            when (limeGenericType) {
                is LimeList -> hasCppTypeAttribute(limeGenericType.elementType)
                is LimeSet -> hasCppTypeAttribute(limeGenericType.elementType)
                is LimeMap ->
                    hasCppTypeAttribute(limeGenericType.keyType) || hasCppTypeAttribute(limeGenericType.valueType)
                else -> false
            }
        },
        "hasDeprecatedEnumerators" to { limeEnumeration: Any ->
            limeEnumeration is LimeEnumeration &&
                limeEnumeration.enumerators.any { it.attributes.have(LimeAttributeType.DEPRECATED) }
        },
        "hasDurationType" to { limeGenericType: Any ->
            when (limeGenericType) {
                is LimeList -> hasDurationType(limeGenericType.elementType)
                is LimeSet -> hasDurationType(limeGenericType.elementType)
                is LimeMap -> hasDurationType(limeGenericType.keyType) || hasDurationType(limeGenericType.valueType)
                else -> false
            }
        },
        "hasInternalAvailableFields" to { limeStruct: Any ->
            limeStruct is LimeStruct && limeStruct.availableFields.isNotEmpty() &&
                limeStruct.availableFields.any { CommonGeneratorPredicates.isInternal(it, SWIFT) }
        },
        "hasInternalFields" to { limeStruct: Any ->
            limeStruct is LimeStruct && limeStruct.fields.isNotEmpty() &&
                limeStruct.fields.any { CommonGeneratorPredicates.isInternal(it, SWIFT) }
        },
        "hasTypeRepository" to { CommonGeneratorPredicates.hasTypeRepository(it) },
        "isInternal" to { it is LimeNamedElement && CommonGeneratorPredicates.isInternal(it, SWIFT) },
        "isOverriding" to { limeFunction: Any ->
            limeFunction is LimeFunction && limeFunction.isConstructor &&
                signatureResolver.isOverloadingConstructor(limeFunction)
        },
        "isPublic" to { it is LimeNamedElement && !CommonGeneratorPredicates.isInternal(it, SWIFT) },
        "isRefEquatable" to { limeField: Any ->
            limeField is LimeField && isRefEquatable(limeField)
        },
        "needsAllFieldsConstructor" to { limeStruct: Any ->
            when {
                limeStruct !is LimeStruct -> false
                limeStruct.fieldConstructors.isEmpty() -> true
                limeStruct.attributes.have(LimeAttributeType.IMMUTABLE) -> limeStruct.allFieldsConstructor == null
                else -> false
            }
        },
        "needsExplicitHashable" to { limeStruct: Any ->
            limeStruct is LimeStruct && limeStruct.attributes.have(LimeAttributeType.EQUATABLE) &&
                limeStruct.fields.any { isRefEquatable(it) }
        },
        "needsReducedConstructor" to fun(limeStruct: Any): Boolean {
            if (limeStruct !is LimeStruct) return false
            val internalFields = limeStruct.fields.filter { CommonGeneratorPredicates.isInternal(it, SWIFT) }
            return internalFields.isNotEmpty() && internalFields.all { it.defaultValue != null }
        },
        "skipDeclaration" to fun(limeType: Any): Boolean {
            if (limeType !is LimeType) return false
            val externalDescriptor = limeType.external?.swift
            return externalDescriptor != null && externalDescriptor[LimeExternalDescriptor.CONVERTER_NAME] == null
        },
        "skipTypeAlias" to { limeException: Any ->
            limeException is LimeException &&
                nameRules.getName(limeException) == nameRules.getName(limeException.errorType.type)
        }
    )

    private fun isRefEquatable(limeField: LimeField): Boolean {
        val limeType = limeField.typeRef.type.actualType
        return limeType is LimeContainerWithInheritance && !limeType.attributes.have(LimeAttributeType.EQUATABLE)
    }

    private fun hasCppTypeAttribute(limeTypeRef: LimeTypeRef): Boolean {
        val limeType = limeTypeRef.type
        return when {
            limeTypeRef.attributes.have(LimeAttributeType.CPP, LimeAttributeValueType.TYPE) -> true
            limeType is LimeTypeAlias -> hasCppTypeAttribute(limeType.typeRef)
            else -> false
        }
    }

    private fun hasDurationType(limeTypeRef: LimeTypeRef): Boolean {
        val actualType = limeTypeRef.type.actualType
        return actualType is LimeBasicType && actualType.typeId == LimeBasicType.TypeId.DURATION
    }
}
