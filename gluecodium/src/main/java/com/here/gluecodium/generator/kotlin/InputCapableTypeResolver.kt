/*
 * Copyright (C) 2016-2026 HERE Europe B.V.
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

package com.here.gluecodium.generator.kotlin

import com.here.gluecodium.model.lime.LimeAttributeType.KOTLIN
import com.here.gluecodium.model.lime.LimeAttributeValueType.INTERFACE
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeContainer
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeTypeRef

/**
 * Collects types whose values can flow from application code into native code. Callback parameters
 * flow the opposite direction; callback returns and getters flow in only when the SDK accepts that
 * callback implementation.
 */
internal object InputCapableTypeResolver {
    fun resolve(referenceMap: Map<String, LimeElement>): Set<String> {
        val inputTypes = mutableSetOf<LimeType>()

        referenceMap.values.filterIsInstance<LimeContainer>().forEach { limeContainer ->
            val isImplementableContract = isImplementableContract(limeContainer)
            limeContainer.functions.filter { !isImplementableContract || it.isStatic }
                .flatMap { it.parameters }
                .forEach { inputTypes += leafTypes(it.typeRef) }
            limeContainer.properties.filter { !isImplementableContract || it.isStatic }
                .filter { it.setter != null }
                .forEach { inputTypes += leafTypes(it.typeRef) }
        }

        val result = inputTypes.toMutableSet()
        val pending = inputTypes.toMutableList()
        while (pending.isNotEmpty()) {
            val limeType = pending.removeAt(pending.size - 1)
            val valuesReturnedToNative =
                when {
                    limeType is LimeStruct -> limeType.fields.flatMap { leafTypes(it.typeRef) }
                    limeType is LimeLambda -> leafTypes(limeType.returnType.typeRef)
                    isImplementableContract(limeType) -> {
                        val contract = limeType as LimeContainer
                        contract.functions.filterNot { it.isStatic }.flatMap { leafTypes(it.returnType.typeRef) } +
                            contract.properties.filterNot { it.isStatic }.flatMap { leafTypes(it.typeRef) }
                    }
                    else -> emptyList()
                }
            valuesReturnedToNative.forEach { if (result.add(it)) pending.add(it) }
        }

        return result.mapTo(mutableSetOf()) { it.fullName }
    }

    private fun isImplementableContract(limeType: LimeType) =
        limeType is LimeInterface || (limeType is LimeClass && limeType.attributes.have(KOTLIN, INTERFACE))

    private fun isImplementableContract(limeContainer: LimeContainer) =
        limeContainer is LimeInterface || (limeContainer is LimeClass && limeContainer.attributes.have(KOTLIN, INTERFACE))

    private fun leafTypes(typeRef: LimeTypeRef): List<LimeType> = leafTypes(typeRef.type.actualType)

    private fun leafTypes(limeType: LimeType): List<LimeType> =
        when (limeType) {
            is LimeTypeAlias -> leafTypes(limeType.typeRef)
            is LimeList -> leafTypes(limeType.elementType)
            is LimeSet -> leafTypes(limeType.elementType)
            is LimeMap -> leafTypes(limeType.keyType) + leafTypes(limeType.valueType)
            else -> listOf(limeType)
        }
}
