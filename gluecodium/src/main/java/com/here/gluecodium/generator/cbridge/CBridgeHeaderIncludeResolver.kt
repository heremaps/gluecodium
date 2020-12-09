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

import com.here.gluecodium.generator.common.Include
import com.here.gluecodium.generator.common.ReferenceMapBasedResolver
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeType.EQUATABLE
import com.here.gluecodium.model.lime.LimeAttributeType.POINTER_EQUATABLE
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeContainer
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeProperty
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeRef

internal class CBridgeHeaderIncludeResolver(
    limeReferenceMap: Map<String, LimeElement>,
    private val rootNamespace: List<String>
) : ReferenceMapBasedResolver(limeReferenceMap) {

    fun getHeaderFilePath(limeElement: LimeNamedElement) =
        CBridgeNameRules.createPath(limeElement, rootNamespace, "include", ".h")

    fun resolveIncludes(limeElement: LimeNamedElement): List<Include> =
        when {
            limeElement.attributes.have(LimeAttributeType.SWIFT, LimeAttributeValueType.SKIP) -> emptyList()
            limeElement is LimeTypeRef -> resolveTypeRefIncludes(limeElement)
            limeElement is LimeFunction -> resolveFunctionIncludes(limeElement)
            limeElement is LimeLambda -> resolveLambdaIncludes(limeElement)
            limeElement is LimeProperty -> resolveTypeRefIncludes(limeElement.typeRef)
            limeElement is LimeStruct -> resolveContainerIncludes(limeElement) +
                limeElement.fields.flatMap { resolveTypeRefIncludes(it.typeRef) }
            limeElement is LimeContainer -> resolveContainerIncludes(limeElement)
            limeElement is LimeEnumeration -> listOf(createHeaderInclude(limeElement), INT_INCLUDE)
            limeElement is LimeList -> resolveTypeRefIncludes(limeElement.elementType)
            limeElement is LimeSet -> resolveTypeRefIncludes(limeElement.elementType)
            limeElement is LimeMap ->
                resolveTypeRefIncludes(limeElement.keyType) + resolveTypeRefIncludes(limeElement.valueType)
            else -> emptyList()
        }

    private fun resolveContainerIncludes(limeContainer: LimeContainer) =
        (limeContainer.functions + limeContainer.properties + limeContainer.classes + limeContainer.interfaces +
                limeContainer.structs + limeContainer.enumerations +
                limeContainer.lambdas).flatMap { resolveIncludes(it) } +
            listOfNotNull(BOOL_INCLUDE.takeIf {
                limeContainer.attributes.have(EQUATABLE) || limeContainer.attributes.have(POINTER_EQUATABLE)
            })

    private fun resolveTypeRefIncludes(limeTypeRef: LimeTypeRef): List<Include> {
        if (limeTypeRef.isNullable) return emptyList()
        return when (val limeType = limeTypeRef.type.actualType) {
            is LimeBasicType -> resolveBasicTypeInclude(limeType.typeId)
            is LimeEnumeration -> listOf(createHeaderInclude(limeType))
            else -> emptyList()
        }
    }

    private fun resolveBasicTypeInclude(typeId: LimeBasicType.TypeId) =
        when {
            typeId == LimeBasicType.TypeId.BOOLEAN -> listOf(BOOL_INCLUDE)
            typeId.isIntegerType -> listOf(INT_INCLUDE)
            else -> emptyList()
        }

    private fun resolveFunctionIncludes(limeFunction: LimeFunction) =
        (limeFunction.parameters.map { it.typeRef } + limeFunction.returnType.typeRef).flatMap { resolveTypeRefIncludes(it) } +
            (limeFunction.exception?.let {
                listOf(createHeaderInclude(it.errorType.type.actualType), BOOL_INCLUDE)
            } ?: emptyList())

    private fun resolveLambdaIncludes(limeLambda: LimeLambda) =
        (limeLambda.parameters.map { it.typeRef } + limeLambda.returnType.typeRef).flatMap { resolveTypeRefIncludes(it) }

    private fun createHeaderInclude(limeType: LimeType) =
        Include.createInternalInclude(getHeaderFilePath(getTopElement(limeType)))

    companion object {
        private val BOOL_INCLUDE = Include.createSystemInclude("stdbool.h")
        private val INT_INCLUDE = Include.createSystemInclude("stdint.h")
    }
}
