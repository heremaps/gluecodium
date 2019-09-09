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

package com.here.genium.validator

import com.here.genium.common.LimeTypeRefsVisitor
import com.here.genium.model.lime.LimeAttributeType
import com.here.genium.model.lime.LimeBasicType
import com.here.genium.model.lime.LimeEnumeration
import com.here.genium.model.lime.LimeList
import com.here.genium.model.lime.LimeMap
import com.here.genium.model.lime.LimeModel
import com.here.genium.model.lime.LimeNamedElement
import com.here.genium.model.lime.LimeSet
import com.here.genium.model.lime.LimeTypeAlias
import com.here.genium.model.lime.LimeTypeRef

/**
 * Validate set element types and map key types to ensure these are hashable types.
 */
internal class LimeGenericTypesValidator(private val logger: LimeLogger)
    : LimeTypeRefsVisitor<Boolean>() {

    fun validate(limeModel: LimeModel) = !traverseModel(limeModel).contains(false)

    override fun visitTypeRef(parentElement: LimeNamedElement, limeTypeRef: LimeTypeRef?) =
        when (val referredType = limeTypeRef?.type) {
            is LimeSet ->
                validateGenericType(parentElement, referredType.elementType, "set element")
            is LimeMap -> validateGenericType(parentElement, referredType.keyType, "map key")
            else -> true
        }

    private fun validateGenericType(
        parentElement: LimeNamedElement,
        elementTypeRef: LimeTypeRef,
        elementDescription: String
    ): Boolean {
        val result = isHashable(elementTypeRef)
        if (!result) {
            logger.error(
                parentElement,
                "$elementDescription type ${elementTypeRef.type.fullName} is not hashable"
            )
        }
        return result
    }

    private fun isHashable(limeTypeRef: LimeTypeRef): Boolean {
        val actualType = limeTypeRef.type
        return when {
            limeTypeRef.isNullable -> false
            actualType is LimeEnumeration -> true
            actualType.attributes.have(LimeAttributeType.EQUATABLE) -> true
            actualType.attributes.have(LimeAttributeType.POINTER_EQUATABLE) -> true
            actualType is LimeBasicType -> actualType.typeId != LimeBasicType.TypeId.BLOB &&
                    actualType.typeId != LimeBasicType.TypeId.DATE
            actualType is LimeTypeAlias -> isHashable(actualType.typeRef)
            actualType is LimeList -> isHashable(actualType.elementType)
            actualType is LimeSet -> isHashable(actualType.elementType)
            actualType is LimeMap ->
                isHashable(actualType.keyType) && isHashable(actualType.valueType)
            else -> false
        }
    }
}
