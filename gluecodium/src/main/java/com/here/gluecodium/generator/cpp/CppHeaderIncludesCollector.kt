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

import com.here.gluecodium.generator.common.Include
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeContainer
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeHelper

internal class CppHeaderIncludesCollector(
    private val includesResolver: CppIncludeResolver,
    private val allErrorEnums: Set<String>
) : CppImportsCollector<Include>() {

    override fun collectImports(limeElement: LimeNamedElement): List<Include> {
        val allTypes = LimeTypeHelper.getAllTypes(limeElement)
        val errorEnums = allTypes.filter { allErrorEnums.contains(it.fullName) }.toSet()

        val typeRegisteredClasses = allTypes.filterIsInstance<LimeContainerWithInheritance>()
            .filter {
                it.external?.cpp == null && it.parents.isEmpty() && (it is LimeInterface || it.visibility.isOpen)
            }
        val allTypeRefs = collectTypeRefs(allTypes)
        val forwardDeclaredTypes = collectForwardDeclaredTypes(limeElement, allTypeRefs)

        val allValues = LimeTypeHelper.getAllValues(limeElement)
        val equatableTypes = allTypes.filter { it.external?.cpp == null && it.attributes.have(LimeAttributeType.EQUATABLE) }
        val additionalIncludes =
            collectAdditionalIncludes(limeElement, allTypes, equatableTypes, errorEnums, typeRegisteredClasses)
        return allTypes.filterIsInstance<LimeContainer>()
            .flatMap { it.functions }
            .flatMap { includesResolver.resolveElementImports(it) } +
            allTypeRefs.flatMap { includesResolver.resolveElementImports(it) } +
            allValues.flatMap { includesResolver.resolveElementImports(it) } +
            allTypes.flatMap { includesResolver.resolveElementImports(it) } +
            additionalIncludes - forwardDeclaredTypes.flatMap { includesResolver.resolveElementImports(it) }.toSet()
    }

    private fun collectAdditionalIncludes(
        limeElement: LimeNamedElement,
        allTypes: List<LimeType>,
        equatableTypes: List<LimeType>,
        errorEnums: Set<LimeType>,
        typeRegisteredClasses: List<LimeContainerWithInheritance>
    ): List<Include> {
        val parentIncludes = when (limeElement) {
            is LimeContainerWithInheritance ->
                limeElement.parents.flatMap { includesResolver.resolveElementImports(it.type) }
            else -> emptyList()
        }
        val additionalIncludes = parentIncludes.toMutableList()
        if (allTypes.any { it is LimeEnumeration }) {
            additionalIncludes += CppLibraryIncludes.INT_TYPES
        }
        if (equatableTypes.isNotEmpty()) {
            additionalIncludes += includesResolver.hashInclude
        }
        if (errorEnums.isNotEmpty()) {
            additionalIncludes += CppLibraryIncludes.SYSTEM_ERROR
        }
        if (typeRegisteredClasses.isNotEmpty()) {
            additionalIncludes += includesResolver.typeRepositoryInclude
        }
        return additionalIncludes
    }
}
