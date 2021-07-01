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
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeExternalDescriptor
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeProperty
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeTypeRef

/**
 * List of predicates used by `ifPredicate`/`unlessPredicate` template helpers in Swift generator.
 */
internal class SwiftGeneratorPredicates(limeReferenceMap: Map<String, LimeElement>, nameRules: SwiftNameRules) {

    private val signatureResolver = SwiftSignatureResolver(limeReferenceMap, nameRules)

    val predicates = mapOf(
        "hasAnyComment" to { limeElement: Any ->
            CommonGeneratorPredicates.hasAnyComment(limeElement, "Swift")
        },
        "hasCppTypeAttribute" to { limeGenericType: Any ->
            when (limeGenericType) {
                is LimeList -> hasCppTypeAttribute(limeGenericType.elementType)
                is LimeSet -> hasCppTypeAttribute(limeGenericType.elementType)
                is LimeMap ->
                    hasCppTypeAttribute(limeGenericType.keyType) || hasCppTypeAttribute(limeGenericType.keyType)
                else -> false
            }
        },
        "hasDeprecatedEnumerators" to { limeEnumeration: Any ->
            limeEnumeration is LimeEnumeration &&
                limeEnumeration.enumerators.any { it.attributes.have(LimeAttributeType.DEPRECATED) }
        },
        "hasTypeRepository" to { CommonGeneratorPredicates.hasTypeRepository(it) },
        "hasWeakSupport" to fun(limeInterface: Any): Boolean {
            if (limeInterface !is LimeInterface) return false
            val interfacePathKey = limeInterface.path.toString()
            return limeReferenceMap.values.filterIsInstance<LimeProperty>()
                .filter { it.attributes.have(LimeAttributeType.SWIFT, LimeAttributeValueType.WEAK) }
                .any { it.typeRef.type.actualType.path.toString() == interfacePathKey }
        },
        "isOverriding" to { limeFunction: Any ->
            limeFunction is LimeFunction && limeFunction.isConstructor &&
                signatureResolver.hasConstructorSignatureClash(limeFunction)
        },
        "isRefEquatable" to { limeField: Any ->
            limeField is LimeField && isRefEquatable(limeField)
        },
        "needsExplicitHashable" to { limeStruct: Any ->
            limeStruct is LimeStruct && limeStruct.attributes.have(LimeAttributeType.EQUATABLE) &&
                limeStruct.fields.any { isRefEquatable(it) }
        },
        "needsReducedConstructor" to { limeStruct: Any ->
            limeStruct is LimeStruct && limeStruct.internalFields.isNotEmpty() &&
                limeStruct.internalFields.all { it.defaultValue != null }
        },
        "parentIsClass" to { limeClass: Any ->
            limeClass is LimeClass && limeClass.parent?.type?.actualType is LimeClass
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
        return limeType is LimeContainerWithInheritance &&
            !limeType.attributes.have(LimeAttributeType.EQUATABLE) &&
            !limeType.attributes.have(LimeAttributeType.POINTER_EQUATABLE)
    }

    private fun hasCppTypeAttribute(limeTypeRef: LimeTypeRef): Boolean {
        val limeType = limeTypeRef.type
        return when {
            limeTypeRef.attributes.have(LimeAttributeType.CPP, LimeAttributeValueType.TYPE) -> true
            limeType is LimeTypeAlias -> hasCppTypeAttribute(limeType.typeRef)
            else -> false
        }
    }
}
