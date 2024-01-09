/*
 * Copyright (C) 2016-2021 HERE Europe B.V.
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

package com.here.gluecodium.generator.cpp

import com.here.gluecodium.generator.common.ImportsCollector
import com.here.gluecodium.model.lime.LimeContainer
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeTypeRef

internal abstract class CppImportsCollector<T> : ImportsCollector<T> {
    protected fun collectForwardDeclaredTypes(
        limeElement: LimeNamedElement,
        allTypeRefs: List<LimeTypeRef>,
    ): List<LimeContainerWithInheritance> {
        val parentPaths =
            if (limeElement is LimeContainerWithInheritance) limeElement.parents.map { it.type.path } else emptyList()
        val filteredPaths = setOf(limeElement.path) + parentPaths
        return allTypeRefs.map { it.type }
            .filterIsInstance<LimeContainerWithInheritance>()
            .filter { !it.path.hasParent && it.external?.cpp == null && !filteredPaths.contains(it.path) }
    }

    protected fun collectTypeRefs(allTypes: List<LimeType>): List<LimeTypeRef> {
        val containers = allTypes.filterIsInstance<LimeContainer>()
        val classes = containers.filterIsInstance<LimeContainerWithInheritance>()
        val typeRefs =
            containers.flatMap { it.constants }.map { it.typeRef } +
                containers.filterIsInstance<LimeStruct>().flatMap { it.fields }.map { it.typeRef } +
                containers.flatMap { it.functions }.flatMap { collectTypeRefs(it) } +
                classes.flatMap { it.properties }.map { it.typeRef } +
                allTypes.filterIsInstance<LimeTypeAlias>().map { it.typeRef } +
                allTypes.filterIsInstance<LimeLambda>().flatMap { collectTypeRefs(it.asFunction()) } +
                allTypes.filterIsInstance<LimeException>().map { it.errorType }

        return typeRefs + typeRefs.flatMap { collectTypeRefs(it) }
    }

    private fun collectTypeRefs(limeFunction: LimeFunction) =
        limeFunction.parameters.map { it.typeRef } +
            limeFunction.returnType.typeRef +
            listOfNotNull(
                limeFunction.exception?.errorType?.takeIf { it.type.actualType !is LimeEnumeration },
            )

    private fun collectTypeRefs(limeTypeRef: LimeTypeRef): List<LimeTypeRef> =
        when (val limeType = limeTypeRef.type) {
            is LimeList -> collectTypeRefs(limeType.elementType) + limeType.elementType
            is LimeSet -> collectTypeRefs(limeType.elementType) + limeType.elementType
            is LimeMap ->
                collectTypeRefs(limeType.keyType) + collectTypeRefs(limeType.valueType) +
                    limeType.keyType + limeType.valueType
            else -> emptyList()
        }
}
