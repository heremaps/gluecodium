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

package com.here.gluecodium.generator.common

import com.here.gluecodium.model.lime.LimeContainer
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeTypeHelper
import com.here.gluecodium.model.lime.LimeTypeRef

internal open class GenericImportsCollector<T>(
    private val importsResolver: ImportsResolver<T>,
    private val retainPredicate: ((LimeNamedElement) -> Boolean)? = null,
    private val collectTypeRefImports: Boolean = false,
    private val collectOwnImports: Boolean = false,
    private val parentTypeFilter: (LimeContainerWithInheritance) -> Boolean = { false },
    private val collectTypeAliasImports: Boolean = false,
    private val collectFunctionErrorType: Boolean = true
) : ImportsCollector<T> {

    override fun collectImports(limeElement: LimeNamedElement): List<T> {
        val allTypes = LimeTypeHelper.getAllTypes(limeElement)
        val typeRefImports =
            if (collectTypeRefImports) collectTypeRefs(allTypes).flatMap { importsResolver.resolveElementImports(it) }
            else emptyList()
        val ownImports =
            if (collectOwnImports) allTypes.flatMap { collectOwnImports(it) } else emptyList()
        val parentImports =
            allTypes.filterIsInstance<LimeContainerWithInheritance>()
                .filter(parentTypeFilter)
                .flatMap { collectParentTypeRefs(it) }
                .flatMap { importsResolver.resolveElementImports(it) }
        val typeAliasImports =
            if (collectTypeAliasImports)
                allTypes.filterIsInstance<LimeTypeAlias>().flatMap { importsResolver.resolveElementImports(it.typeRef) }
            else emptyList()
        val constantImports = allTypes.filterIsInstance<LimeContainer>().flatMap { it.constants }
            .flatMap { importsResolver.resolveElementImports(it) }

        return typeRefImports + ownImports + parentImports + typeAliasImports + constantImports
    }

    private fun collectOwnImports(limeType: LimeType): List<T> {
        val elements = listOf(limeType) + if (limeType is LimeStruct) limeType.fields else emptyList()
        return elements.flatMap { importsResolver.resolveElementImports(it) }
    }

    private fun shouldRetain(limeElement: LimeNamedElement) =
        retainPredicate == null || retainPredicate.invoke(limeElement)

    private fun collectTypeRefs(allTypes: List<LimeType>): List<LimeTypeRef> {
        val containers = allTypes.filterIsInstance<LimeContainer>()
        val functions = containers.flatMap { it.functions }.filter { shouldRetain(it) }
        val properties = containers.flatMap { it.properties }.filter { shouldRetain(it) }
        val lambdas = allTypes.filterIsInstance<LimeLambda>()
        val exceptions = allTypes.filterIsInstance<LimeException>()
        val structs = allTypes.filterIsInstance<LimeStruct>()
        return structs.flatMap { it.fields }.map { it.typeRef } +
            functions.flatMap { collectTypeRefs(it) } + properties.map { it.typeRef } +
            lambdas.flatMap { collectTypeRefs(it.asFunction()) } +
            exceptions.map { it.errorType }
    }

    protected fun collectTypeRefs(limeFunction: LimeFunction) =
        limeFunction.parameters.map { it.typeRef } +
            limeFunction.returnType.typeRef +
            listOfNotNull(limeFunction.thrownType?.typeRef) +
            if (collectFunctionErrorType) listOfNotNull(limeFunction.exception?.errorType) else emptyList()

    protected open fun collectParentTypeRefs(limeContainer: LimeContainerWithInheritance) =
        limeContainer.inheritedFunctions.flatMap { collectTypeRefs(it) } +
            limeContainer.inheritedProperties.map { it.typeRef } + limeContainer.parents
}
