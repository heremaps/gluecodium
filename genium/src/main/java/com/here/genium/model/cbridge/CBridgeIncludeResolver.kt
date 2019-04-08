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

package com.here.genium.model.cbridge

import com.here.genium.generator.cbridge.CBridgeNameRules
import com.here.genium.model.common.Include
import com.here.genium.model.franca.DefinedBy
import org.franca.core.franca.FModelElement
import org.franca.core.franca.FTypeCollection
import java.io.File

class CBridgeIncludeResolver(private val rootNamespace: List<String>) {
    private val resolvedIncludes = mutableMapOf<FTypeCollection, Include>()

    fun resolveInclude(modelElement: FModelElement): Include {
        val typeCollection = DefinedBy.findDefiningTypeCollection(modelElement)
        var include = resolvedIncludes[typeCollection]

        if (include == null) {
            val includeName = getHeaderFileNameWithPath(typeCollection)
            include = Include.createInternalInclude(includeName)
            resolvedIncludes[typeCollection] = include
        }

        return include
    }

    fun getHeaderFileNameWithPath(francaTypeCollection: FTypeCollection) =
        getPathComponents(
            francaTypeCollection,
            CBridgeNameRules.INCLUDE_DIR,
            CBridgeNameRules.PUBLIC_HEADER_SUFFIX
        )

    fun getImplementationFileNameWithPath(francaTypeCollection: FTypeCollection) =
        getPathComponents(
            francaTypeCollection,
            CBridgeNameRules.SRC_DIR,
            CBridgeNameRules.IMPL_SUFFIX
        )

    private fun getPathComponents(
        francaTypeCollection: FTypeCollection,
        subfolder: String,
        suffix: String
    ): String {

        val pathComponents = mutableListOf<String>()
        pathComponents.add(CBridgeNameRules.CBRIDGE_PUBLIC)
        pathComponents.add(subfolder)
        pathComponents.addAll(rootNamespace)
        pathComponents.addAll(DefinedBy.getPackages(francaTypeCollection))
        pathComponents.add(
            CBridgeNameRules.CBRIDGE_PREFIX + CBridgeNameRules.getName(francaTypeCollection) +
                suffix
        )

        return pathComponents.joinToString(File.separator)
    }
}
