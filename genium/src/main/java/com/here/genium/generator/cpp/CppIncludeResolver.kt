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

package com.here.genium.generator.cpp

import com.here.genium.model.common.Include
import com.here.genium.model.lime.LimeAttributeType
import com.here.genium.model.lime.LimeElement
import com.here.genium.model.lime.LimeNamedElement
import java.io.File

class CppIncludeResolver(
    private val rootNamespace: List<String>,
    private val limeReferenceMap: Map<String, LimeElement>
) {
    private val resolvedIncludes = mutableMapOf<String, List<Include>>()

    fun resolveIncludes(limeNamedElement: LimeNamedElement): List<Include> {
        return resolvedIncludes.getOrPut(limeNamedElement.fullName) {
            val externalType = inferExternalType(limeNamedElement)
            if (externalType != null) {
                externalType.split(',').map { Include.createInternalInclude(it.trim()) }
            } else {
                listOf(Include.createInternalInclude(
                    getOutputFilePath(limeNamedElement) + CppNameRules.HEADER_FILE_SUFFIX)
                )
            }
        }
    }

    private fun inferExternalType(limeNamedElement: LimeNamedElement): String? {
        val externalType =
            limeNamedElement.attributes.get(LimeAttributeType.EXTERNAL_TYPE, String::class.java)
        if (externalType != null) {
            return externalType
        }

        val parentElementKey = limeNamedElement.path.parent.toString()
        val parentElement = limeReferenceMap[parentElementKey]
        return (parentElement as? LimeNamedElement)?.let { inferExternalType(it) }
    }

    fun getOutputFilePath(limeNamedElement: LimeNamedElement) =
        (rootNamespace +
                limeNamedElement.path.head +
                CppNameRules.INSTANCE.getTypeName(limeNamedElement.path.container)
        ).joinToString(separator = File.separator)
}
