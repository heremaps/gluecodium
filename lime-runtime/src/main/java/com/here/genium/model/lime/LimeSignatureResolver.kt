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

package com.here.genium.model.lime

open class LimeSignatureResolver(private val referenceMap: Map<String, LimeElement>) {

    private val signatureCache = hashMapOf<String, List<String>>()

    open fun getSignature(limeMethod: LimeMethod): List<String> =
        signatureCache.getOrPut(limeMethod.path.toString()) { computeSignature(limeMethod) }

    open fun hasSignatureClash(limeMethod: LimeMethod): Boolean {
        val signature = getSignature(limeMethod)
        return getAllOverloads(limeMethod)
            .map { getSignature(it) }
            .filter { signature == it }
            .count() > 1
    }

    private fun getAllOverloads(limeMethod: LimeMethod): List<LimeMethod> {
        val limeContainer = referenceMap[limeMethod.path.parent.toString()] as LimeContainer
        return getAllMethods(limeContainer).filter { it.name == limeMethod.name }
    }

    private fun getAllMethods(limeContainer: LimeContainer): List<LimeMethod> {
        val parentContainer = limeContainer.parent?.type as? LimeContainer
        val parentMethods = parentContainer?.let { getAllMethods(it) } ?: emptyList()
        return parentMethods + limeContainer.methods
    }

    protected open fun getArrayName(elementType: LimeTypeRef) = "[${getTypeName(elementType)}]"

    protected open fun getMapName(keyType: LimeTypeRef, valueType: LimeTypeRef) =
        "[${getTypeName(keyType)}:${getTypeName(valueType)}]"

    private fun computeSignature(limeMethod: LimeMethod) =
        limeMethod.parameters.map { getTypeName(it.typeRef) }

    private fun getTypeName(limeTypeRef: LimeTypeRef): String {
        val limeType = limeTypeRef.type
        return when (limeType) {
            is LimeTypeDef -> getTypeName(limeType.typeRef)
            is LimeArray -> getArrayName(limeType.elementType)
            is LimeMap -> getMapName(limeType.keyType, limeType.valueType)
            else -> limeType.name
        }
    }
}
