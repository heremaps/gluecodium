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

import com.here.gluecodium.model.common.Include
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeNamedElement
import java.io.File

class CppIncludeResolver(
    private val limeReferenceMap: Map<String, LimeElement>,
    private val nameRules: CppNameRules,
    private val internalNamespace: List<String>
) {
    private val resolvedIncludes = mutableMapOf<String, List<Include>>()

    val optionalInclude = createInternalNamespaceInclude("Optional.h")
    val hashInclude = createInternalNamespaceInclude("Hash.h")
    val typeRepositoryInclude = createInternalNamespaceInclude("TypeRepository.h")

    fun createInternalNamespaceInclude(fileName: String) =
        Include.createInternalInclude((internalNamespace + fileName).joinToString(File.separator))

    fun resolveIncludes(limeNamedElement: LimeNamedElement): List<Include> =
        resolvedIncludes.getOrPut(limeNamedElement.fullName) {
            val externalType = inferExternalType(limeNamedElement)
            when {
                externalType is String ->
                    externalType.split(',').map { Include.createInternalInclude(it.trim()) }
                externalType is List<*> ->
                    externalType
                        .filterIsInstance<String>()
                        .map { Include.createInternalInclude(it.trim()) }
                !limeNamedElement.path.hasParent -> listOf(Include.createInternalInclude(
                    nameRules.getOutputFilePath(limeNamedElement) + ".h"
                ))
                else -> {
                    val parentElementKey = limeNamedElement.path.parent.toString()
                    resolveIncludes(limeReferenceMap[parentElementKey] as LimeNamedElement)
                }
            }
        }

    private fun inferExternalType(limeNamedElement: LimeNamedElement): Any? {
        val externalType = limeNamedElement.attributes.get(
            LimeAttributeType.CPP,
            LimeAttributeValueType.EXTERNAL_TYPE,
            Object::class.java
        )
        if (externalType != null) {
            return externalType
        }

        val parentElementKey = limeNamedElement.path.parent.toString()
        val parentElement = limeReferenceMap[parentElementKey]
        return (parentElement as? LimeNamedElement)?.let { inferExternalType(it) }
    }
}
