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

package com.here.gluecodium.model.lime

/**
 * This class provides several tools for analysis of method signatures. Since treatment of generic
 * types is different between various target languages, `get*Name()` family of functions here can
 * be overridden if needed (e.g. to account for type-erased generics in Java, etc.).
 */
open class LimeSignatureResolver(private val referenceMap: Map<String, LimeElement>) {

    private val signatureCache = hashMapOf<String, List<String>>()

    fun getSignature(limeFunction: LimeFunction) =
        signatureCache.getOrPut(limeFunction.path.toString()) { computeSignature(limeFunction) }

    fun isOverloaded(limeFunction: LimeFunction) = getAllOverloads(limeFunction).count() > 1

    fun hasSignatureClash(
        limeFunction: LimeFunction,
        functions: List<LimeFunction> = getAllOverloads(limeFunction)
    ): Boolean {
        val signature = getSignature(limeFunction)
        return functions.map { getSignature(it) }.filter { it == signature }.count() > 1
    }

    fun hasConstructorSignatureClash(limeFunction: LimeFunction) =
        hasSignatureClash(limeFunction, getAllConstructorOverloads(limeFunction))

    private fun getAllOverloads(limeFunction: LimeFunction): List<LimeFunction> {
        val parentElement = referenceMap[limeFunction.path.parent.toString()] as? LimeContainer
            ?: return listOf(limeFunction)
        val functionName = getFunctionName(limeFunction)
        return getAllFunctions(parentElement).filter { getFunctionName(it) == functionName }
    }

    private fun getAllConstructorOverloads(limeFunction: LimeFunction): List<LimeFunction> {
        val parentElement = referenceMap[limeFunction.path.parent.toString()]
        return when (parentElement) {
            is LimeContainer -> getAllContainerFunctions(parentElement).filter { it.isConstructor }
            else -> emptyList()
        }
    }

    private fun getAllFunctions(limeContainer: LimeContainer): List<LimeFunction> {
        val parentContainer =
            (limeContainer as? LimeContainerWithInheritance)?.parent?.type as? LimeContainer
        val parentFunctions = parentContainer?.let { getAllFunctions(it) } ?: emptyList()
        return parentFunctions + getAllContainerFunctions(limeContainer)
    }

    protected open fun getAllContainerFunctions(limeContainer: LimeContainer) = limeContainer.functions

    protected open fun getFunctionName(limeFunction: LimeFunction) = limeFunction.name

    protected open fun getArrayName(elementType: LimeTypeRef) = "[${getTypeName(elementType)}]"

    protected open fun getMapName(keyType: LimeTypeRef, valueType: LimeTypeRef) =
        "[${getTypeName(keyType)}:${getTypeName(valueType)}]"

    protected open fun getSetName(elementType: LimeTypeRef) = "[${getTypeName(elementType)}:]"

    private fun computeSignature(limeFunction: LimeFunction) = limeFunction.parameters.map { getTypeName(it.typeRef) }

    protected fun getTypeName(limeTypeRef: LimeTypeRef): String =
        when (val limeType = limeTypeRef.type) {
            is LimeTypeAlias -> getTypeName(limeType.typeRef)
            is LimeList -> getArrayName(limeType.elementType)
            is LimeMap -> getMapName(limeType.keyType, limeType.valueType)
            is LimeSet -> getSetName(limeType.elementType)
            else -> limeType.name
        }
}
