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

package com.here.gluecodium.generator.dart

import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeGenericType
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeRef

internal class DartImportResolver(
    private val limeReferenceMap: Map<String, LimeElement>,
    private val nameResolver: DartNameResolver,
    private val srcPath: String
) {
    private val builtInTypesConversionImport = createConversionImport("BuiltInTypes")
    private val typeRepositoryImport = DartImport("$srcPath/_type_repository", "__lib")

    fun resolveImports(limeElement: LimeElement): List<DartImport> =
        when (limeElement) {
            is LimeTypeRef -> resolveTypeImports(limeElement.type)
            is LimeType -> resolveTypeImports(limeElement)
            is LimeNamedElement -> resolveImports(limeElement)
            else -> emptyList()
        }

    private fun resolveTypeImports(limeType: LimeType) =
        when (val actualType = limeType.actualType) {
            is LimeBasicType -> resolveBasicTypeImports(actualType)
            is LimeGenericType -> resolveGenericTypeImports(actualType)
            else -> resolveImports(limeType)
        }

    private fun resolveImports(limeElement: LimeNamedElement): List<DartImport> {
        val filePath = limeElement.path.head.joinToString("/")
        val fileName = nameResolver.resolveName(getTopElement(limeElement))
        val additionalImports = when {
            limeElement is LimeStruct && limeElement.attributes.have(LimeAttributeType.EQUATABLE) ->
                listOf(collectionSystemImport, collectionPackageImport)
            limeElement is LimeInterface ->
                listOf(builtInTypesConversionImport, typeRepositoryImport)
            limeElement is LimeClass &&
                    (limeElement.parent != null || limeElement.visibility.isOpen) ->
                listOf(builtInTypesConversionImport, typeRepositoryImport)
            else -> emptyList()
        }
        return listOfNotNull(DartImport("$srcPath/$filePath/$fileName")) + additionalImports
    }

    private fun resolveBasicTypeImports(limeType: LimeBasicType) =
        listOf(builtInTypesConversionImport) +
            when (limeType.typeId) {
                LimeBasicType.TypeId.BLOB -> listOf(DartImport("typed_data", isSystem = true))
                else -> emptyList()
            }

    private fun resolveGenericTypeImports(limeType: LimeGenericType) =
        when (limeType) {
            is LimeList -> resolveImports(limeType.elementType)
            is LimeSet -> resolveImports(limeType.elementType)
            is LimeMap -> resolveImports(limeType.keyType) + resolveImports(limeType.valueType)
            else -> emptyList()
        } + createConversionImport("GenericTypes")

    private fun getTopElement(limeElement: LimeNamedElement) =
        generateSequence(limeElement) {
            limeReferenceMap[it.path.parent.toString()] as? LimeNamedElement
        }.last()

    private fun createConversionImport(filePath: String) =
        DartImport("$srcPath/${filePath}__conversion")

    companion object {
        private val collectionSystemImport = DartImport("collection", isSystem = true)
        private val collectionPackageImport = DartImport("collection/collection")
    }
}
