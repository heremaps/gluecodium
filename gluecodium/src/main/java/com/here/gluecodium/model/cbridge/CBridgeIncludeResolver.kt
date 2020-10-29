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

package com.here.gluecodium.model.cbridge

import com.here.gluecodium.generator.cbridge.CBridgeNameRules
import com.here.gluecodium.model.common.Include
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeNamedElement
import java.io.File
import java.util.HashMap

class CBridgeIncludeResolver(
    private val rootNamespace: List<String>,
    private val limeReferenceMap: Map<String, LimeElement>
) {
    private val resolvedIncludes = HashMap<String, Include>()

    fun resolveInclude(limeElement: LimeNamedElement): Include =
        resolvedIncludes.getOrPut(limeElement.path.toString()) {
            val parentElementKey = limeElement.path.parent.toString()
            val parentElement = limeReferenceMap[parentElementKey] as? LimeNamedElement
            parentElement?.let { resolveInclude(parentElement) }
                ?: Include.createInternalInclude(getHeaderFileNameWithPath(limeElement))
        }

    fun getHeaderFileNameWithPath(limeElement: LimeNamedElement) =
        createPath(limeElement, CBridgeNameRules.INCLUDE_DIR, ".h")

    fun getImplementationFileNameWithPath(limeElement: LimeNamedElement) =
        createPath(limeElement, CBridgeNameRules.SRC_DIR, ".cpp")

    private fun createPath(
        limeElement: LimeNamedElement,
        subfolder: String,
        suffix: String
    ): String {
        val isSwiftExtension =
            limeElement.attributes.have(LimeAttributeType.SWIFT, LimeAttributeValueType.EXTENSION)
        val infix = if (isSwiftExtension) "__extension" else ""
        val fileName =
            CBridgeNameRules.CBRIDGE_PREFIX + CBridgeNameRules.getName(limeElement) + infix + suffix
        return (listOf(CBridgeNameRules.CBRIDGE_PUBLIC, subfolder) + rootNamespace +
                limeElement.path.head + fileName).joinToString(File.separator)
    }
}
