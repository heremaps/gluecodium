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
import com.here.gluecodium.model.lime.LimeContainer
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeTypeHelper

internal class CppImplIncludesCollector(
    private val includesResolver: CppIncludeResolver,
    private val allErrorEnums: Set<String>
) : CppImportsCollector<Include>() {

    override fun collectImports(limeElement: LimeNamedElement): List<Include> {
        val allTypes = LimeTypeHelper.getAllTypes(limeElement)

        val result = collectTypeRefs(allTypes).map { it.type }
            .filterIsInstance<LimeContainerWithInheritance>()
            .filter { !it.path.hasParent && it.external?.cpp == null }
            .flatMap { includesResolver.resolveElementImports(it) }
            .toMutableList()

        val externalContainers = allTypes.filter { it is LimeContainer && it.external?.cpp != null }
        if (externalContainers.isNotEmpty()) {
            result += listOf(CppLibraryIncludes.TYPE_TRAITS, CppLibraryIncludes.UTILITY)
            result += externalContainers.flatMap { includesResolver.resolveElementImports(it) }
        }
        if (allTypes.any { it is LimeStruct }) {
            result += CppLibraryIncludes.UTILITY
        }
        val errorEnums = allTypes.filter { allErrorEnums.contains(it.fullName) }
        if (errorEnums.isNotEmpty()) {
            result += CppLibraryIncludes.STRING
        }

        return result
    }
}
