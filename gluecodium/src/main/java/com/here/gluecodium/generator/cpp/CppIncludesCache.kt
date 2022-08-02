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

package com.here.gluecodium.generator.cpp

import com.here.gluecodium.generator.common.Include
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeExternalDescriptor.Companion.INCLUDE_NAME
import com.here.gluecodium.model.lime.LimeNamedElement
import java.io.File

internal class CppIncludesCache(
    private val limeReferenceMap: Map<String, LimeElement>,
    private val nameRules: CppNameRules,
    private val internalNamespace: List<String>
) {
    private val resolvedIncludes = mutableMapOf<String, List<Include>>()

    val typeRepositoryInclude = createInternalNamespaceInclude("TypeRepository.h")

    fun createInternalNamespaceInclude(fileName: String) =
        Include.createInternalInclude((internalNamespace + fileName).joinToString(File.separator))

    fun resolveIncludes(limeNamedElement: LimeNamedElement): List<Include> =
        resolvedIncludes.getOrPut(limeNamedElement.fullName) {
            val externalType = inferExternalType(limeNamedElement)
            when {
                externalType != null ->
                    externalType.split(',').map { Include.createInternalInclude(it.trim()) }
                !limeNamedElement.path.hasParent -> listOf(
                    Include.createInternalInclude(
                        nameRules.getOutputFilePath(limeNamedElement) + ".h"
                    )
                )
                else -> {
                    val parentElementKey = limeNamedElement.path.parent.toString()
                    resolveIncludes(limeReferenceMap[parentElementKey] as LimeNamedElement)
                }
            }
        }

    private fun inferExternalType(limeNamedElement: LimeNamedElement): String? {
        val externalType = limeNamedElement.external?.cpp?.get(INCLUDE_NAME)
        if (externalType != null) {
            return externalType
        }

        val parentElementKey = limeNamedElement.path.parent.toString()
        val parentElement = limeReferenceMap[parentElementKey]
        return (parentElement as? LimeNamedElement)?.let { inferExternalType(it) }
    }
}
