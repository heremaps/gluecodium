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

    fun getSignature(limeMethod: LimeMethod) =
        signatureCache.getOrPut(limeMethod.path.toString()) { computeSignature(limeMethod) }

    fun isOverloaded(limeMethod: LimeMethod) = getAllOverloads(limeMethod).count() > 1

    fun hasSignatureClash(
        limeMethod: LimeMethod,
        methods: List<LimeMethod> = getAllOverloads(limeMethod)
    ): Boolean {
        val signature = getSignature(limeMethod)
        return methods.map { getSignature(it) }.filter { it == signature }.count() > 1
    }

    fun hasConstructorSignatureClash(limeMethod: LimeMethod) =
        hasSignatureClash(limeMethod, getAllConstructorOverloads(limeMethod))

    private fun getAllOverloads(limeMethod: LimeMethod): List<LimeMethod> {
        val parentElement = referenceMap[limeMethod.path.parent.toString()]
        val methodName = getMethodName(limeMethod)
        return when (parentElement) {
            is LimeContainer ->
                getAllMethods(parentElement).filter { getMethodName(it) == methodName }
            is LimeStruct -> parentElement.methods.filter { getMethodName(it) == methodName }
            else -> emptyList()
        }
    }

    private fun getAllConstructorOverloads(limeMethod: LimeMethod): List<LimeMethod> {
        val parentElement = referenceMap[limeMethod.path.parent.toString()]
        return when (parentElement) {
            is LimeContainer -> parentElement.methods.filter { it.isConstructor }
            is LimeStruct -> parentElement.methods.filter { it.isConstructor }
            else -> emptyList()
        }
    }

    private fun getAllMethods(limeContainer: LimeContainer): List<LimeMethod> {
        val parentContainer = limeContainer.parent?.type as? LimeContainer
        val parentMethods = parentContainer?.let { getAllMethods(it) } ?: emptyList()
        return parentMethods + limeContainer.methods
    }

    protected open fun getMethodName(limeMethod: LimeMethod) = limeMethod.name

    protected open fun getArrayName(elementType: LimeTypeRef) = "[${getTypeName(elementType)}]"

    protected open fun getMapName(keyType: LimeTypeRef, valueType: LimeTypeRef) =
        "[${getTypeName(keyType)}:${getTypeName(valueType)}]"

    protected open fun getSetName(elementType: LimeTypeRef) = "[${getTypeName(elementType)}:]"

    private fun computeSignature(limeMethod: LimeMethod) =
        limeMethod.parameters.map { getTypeName(it.typeRef) }

    private fun getTypeName(limeTypeRef: LimeTypeRef): String =
        when (val limeType = limeTypeRef.type) {
            is LimeTypeDef -> getTypeName(limeType.typeRef)
            is LimeList -> getArrayName(limeType.elementType)
            is LimeMap -> getMapName(limeType.keyType, limeType.valueType)
            is LimeSet -> getSetName(limeType.elementType)
            else -> limeType.name
        }
}
