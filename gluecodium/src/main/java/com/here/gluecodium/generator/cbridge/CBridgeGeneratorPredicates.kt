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

package com.here.gluecodium.generator.cbridge

import com.here.gluecodium.common.LimeModelSkipPredicates
import com.here.gluecodium.generator.common.CommonGeneratorPredicates
import com.here.gluecodium.generator.cpp.CppNameResolver
import com.here.gluecodium.model.lime.LimeAttributeType.SWIFT
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeBasicType.TypeId.BOOLEAN
import com.here.gluecodium.model.lime.LimeBasicType.TypeId.VOID
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeTypeRef

/**
 * List of predicates used by `ifPredicate`/`unlessPredicate` template helpers in CBridge generator.
 */
internal class CBridgeGeneratorPredicates(
    cppNameResolver: CppNameResolver,
    limeReferenceMap: Map<String, LimeElement>,
    activeTags: Set<String>
) {
    val predicates = mapOf(
        "hasCppGetter" to { limeField: Any ->
            limeField is LimeField && cppNameResolver.resolveGetterName(limeField) != null
        },
        "hasCppSetter" to { limeField: Any ->
            limeField is LimeField && cppNameResolver.resolveSetterName(limeField) != null
        },
        "hasImmutableFields" to { CommonGeneratorPredicates.hasImmutableFields(it) },
        "hasTypeRepository" to { CommonGeneratorPredicates.hasTypeRepository(it) },
        "isNonNullableEnum" to { limeTypeRef: Any ->
            limeTypeRef is LimeTypeRef && !limeTypeRef.isNullable && limeTypeRef.type.actualType is LimeEnumeration
        },
        "isComplexType" to fun(limeTypeRef: Any): Boolean {
            if (limeTypeRef !is LimeTypeRef) return false
            val limeType = limeTypeRef.type.actualType
            return when {
                limeTypeRef.isNullable -> true
                limeType is LimeEnumeration -> false
                limeType is LimeBasicType ->
                    !(limeType.typeId.isNumericType || limeType.typeId == BOOLEAN || limeType.typeId == VOID)
                else -> true
            }
        },
        "shouldRetain" to { limeElement: Any ->
            limeElement is LimeNamedElement &&
                LimeModelSkipPredicates.shouldRetainCheckParent(limeElement, activeTags, SWIFT, limeReferenceMap)
        }
    )
}
