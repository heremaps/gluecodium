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

package com.here.gluecodium.generator.jni

import com.here.gluecodium.model.common.Include
import com.here.gluecodium.model.lime.LimeAttributeType.JAVA
import com.here.gluecodium.model.lime.LimeAttributeValueType.SKIP
import com.here.gluecodium.model.lime.LimeContainer
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeRef

internal class JniIncludeResolver(private val fileNameRules: JniFileNameRules) {

    private fun getConversionIncludes(limeTypeRef: LimeTypeRef): List<Include> =
        when (val limeType = limeTypeRef.type.actualType) {
            is LimeStruct, is LimeEnumeration, is LimeContainerWithInheritance, is LimeLambda ->
                listOf(createConversionInclude(limeType))
            is LimeList -> getConversionIncludes(limeType.elementType)
            is LimeSet -> getConversionIncludes(limeType.elementType)
            is LimeMap -> getConversionIncludes(limeType.keyType) + getConversionIncludes(limeType.valueType)
            else -> emptyList()
        }

    private fun createConversionInclude(limeType: LimeType): Include {
        val fileName = fileNameRules.getConversionFileName(limeType)
        return Include.createInternalInclude("$fileName.h")
    }

    private fun collectFunctionTypes(limeFunction: LimeFunction) =
        limeFunction.parameters.map { it.typeRef } + limeFunction.returnType.typeRef +
                listOfNotNull(limeFunction.exception?.errorType)

    fun collectImplementationIncludes(limeElement: LimeNamedElement): List<Include> {
        if (limeElement is LimeLambda) {
            return collectFunctionTypes(limeElement.asFunction()).flatMap { getConversionIncludes(it) } +
                createConversionInclude(limeElement)
        }
        val limeContainer = limeElement as? LimeContainer ?: return emptyList()

        val properties = limeContainer.properties +
            ((limeContainer as? LimeContainerWithInheritance)?.inheritedProperties ?: emptyList())
        val functions = limeContainer.functions +
            ((limeContainer as? LimeContainerWithInheritance)?.inheritedFunctions ?: emptyList())
        val allFunctions = properties
            .filterNot { it.attributes.have(JAVA, SKIP) }
            .flatMap { listOfNotNull(it.getter, it.setter) } + functions +
            limeContainer.structs.flatMap { it.functions }
        val types = limeContainer.structs.flatMap { it.fields }.map { it.typeRef } +
            allFunctions.filterNot { it.attributes.have(JAVA, SKIP) }.flatMap { collectFunctionTypes(it) }
        return types.flatMap { getConversionIncludes(it) } + createConversionInclude(limeContainer)
    }

    fun collectFunctionImplementationIncludes(limeStruct: LimeStruct): List<Include> {
        val types =
            limeStruct.functions.filterNot { it.attributes.have(JAVA, SKIP) }.flatMap { collectFunctionTypes(it) }
        return types.flatMap { getConversionIncludes(it) } + createConversionInclude(limeStruct)
    }

    fun collectConversionIncludes(limeStruct: LimeStruct) =
        limeStruct.fields.flatMap { getConversionIncludes(it.typeRef) }

    fun collectExceptionIncludes(limeElement: LimeNamedElement): List<Include> {
        val limeContainer = limeElement as? LimeContainer ?: return emptyList()
        val allFunctions = limeContainer.functions +
            ((limeContainer as? LimeContainerWithInheritance)?.inheritedFunctions ?: emptyList())
        return listOfNotNull(exceptionThrowerInclude.takeIf { allFunctions.any { it.thrownType != null } })
    }

    companion object {
        private val exceptionThrowerInclude = Include.createInternalInclude("JniExceptionThrower.h")
    }
}
