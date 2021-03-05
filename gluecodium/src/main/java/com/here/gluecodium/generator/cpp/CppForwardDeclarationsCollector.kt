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

import com.here.gluecodium.generator.common.NameResolver
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeTypeHelper

internal class CppForwardDeclarationsCollector(private val nameResolver: CppNameResolver) :
    CppImportsCollector<CppForwardDeclarationGroup>() {

    override fun collectImports(limeElement: LimeNamedElement): List<CppForwardDeclarationGroup> {
        val allTypeRefs = collectTypeRefs(LimeTypeHelper.getAllTypes(limeElement))
        val forwardDeclaredTypes = collectForwardDeclaredTypes(allTypeRefs).distinctBy { it.path }.sortedBy { it.path }
        return createForwardDeclarationGroup("", forwardDeclaredTypes, 0, nameResolver).subGroups
    }

    private fun createForwardDeclarationGroup(
        name: String,
        paths: List<LimeNamedElement>,
        level: Int,
        nameResolver: NameResolver
    ): CppForwardDeclarationGroup =
        CppForwardDeclarationGroup(
            name,
            paths.filter { level == it.path.head.size }.map { nameResolver.resolveName(it) },
            paths.filter { level < it.path.head.size }
                .groupBy { it.path.head[level] }
                .map { createForwardDeclarationGroup(it.key, it.value, level + 1, nameResolver) }
        )
}
