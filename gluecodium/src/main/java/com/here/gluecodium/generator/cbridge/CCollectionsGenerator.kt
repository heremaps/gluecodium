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

package com.here.gluecodium.generator.cbridge

import com.here.gluecodium.generator.common.GeneratedFile
import com.here.gluecodium.generator.common.templates.TemplateEngine
import com.here.gluecodium.generator.cpp.CppLibraryIncludes
import com.here.gluecodium.model.cbridge.CArray
import com.here.gluecodium.model.cbridge.CCollectionType
import com.here.gluecodium.model.cbridge.CMap
import com.here.gluecodium.model.cbridge.CSet
import com.here.gluecodium.model.cbridge.CType
import com.here.gluecodium.model.common.Include
import java.nio.file.Paths
import java.util.TreeMap
import java.util.TreeSet

class CCollectionsGenerator(private val internalNamespace: List<String>) {

    private val typesCollector = mutableMapOf<String, CCollectionType>()

    fun collect(types: Map<String, CCollectionType>) {
        typesCollector += types
    }

    fun generate(): List<GeneratedFile> {
        val sortedTypes = TreeMap(typesCollector).values
        val arrays = sortedTypes.filterIsInstance<CArray>()
        val maps = sortedTypes.filterIsInstance<CMap>()
        val sets = sortedTypes.filterIsInstance<CSet>()

        val headerIncludes = TreeSet(sortedTypes.flatMap { it.returnTypeIncludes })
        headerIncludes.add(CType.BOOL_INCLUDE)
        headerIncludes.add(CType.FIXED_WIDTH_INTEGERS_INCLUDE)

        val headerData =
            mapOf("includes" to headerIncludes, "arrays" to arrays, "maps" to maps, "sets" to sets)
        val headerFile = GeneratedFile(
            TemplateEngine.render("cbridge/CollectionsHeader", headerData),
            CBRIDGE_COLLECTIONS_HEADER
        )

        val implementationIncludes = TreeSet(sortedTypes.flatMap { it.includes })
        implementationIncludes.add(Include.createInternalInclude(CBRIDGE_COLLECTIONS_HEADER))
        CppLibraryIncludes.filterIncludes(implementationIncludes, internalNamespace)

        val implementationData =
            mapOf(
                "includes" to implementationIncludes,
                "internalNamespace" to internalNamespace,
                "arrays" to arrays,
                "maps" to maps,
                "sets" to sets
            )
        val implementationFile = GeneratedFile(
            TemplateEngine.render("cbridge/CollectionsImpl", implementationData),
            CBRIDGE_COLLECTIONS_IMPL
        )

        return listOf(headerFile, implementationFile)
    }

    companion object {
        private const val COLLECTIONS_FILE = "GenericCollections"
        private val CBRIDGE_COLLECTIONS_HEADER =
            Paths.get(
                CBridgeNameRules.CBRIDGE_PUBLIC,
                CBridgeNameRules.INCLUDE_DIR,
                "$COLLECTIONS_FILE.h"
            ).toString()
        private val CBRIDGE_COLLECTIONS_IMPL =
            Paths.get(
                CBridgeNameRules.CBRIDGE_PUBLIC,
                CBridgeNameRules.SRC_DIR,
                "$COLLECTIONS_FILE.cpp"
            ).toString()
    }
}
