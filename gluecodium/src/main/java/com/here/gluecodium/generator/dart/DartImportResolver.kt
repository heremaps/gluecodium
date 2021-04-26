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

import com.here.gluecodium.generator.common.NameHelper
import com.here.gluecodium.generator.dart.DartImport.ImportType
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeExternalDescriptor.Companion.CONVERTER_IMPORT_NAME
import com.here.gluecodium.model.lime.LimeExternalDescriptor.Companion.IMPORT_PATH_NAME
import com.here.gluecodium.model.lime.LimeGenericType
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
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
    private val builtInTypesConversionImport = createConversionImport("builtin_types")
    private val typeRepositoryImport = DartImport("$srcPath/_type_repository", "__lib")
    private val tokenCacheImport = DartImport("$srcPath/_token_cache", "__lib")
    private val lazyListImport = DartImport("$srcPath/_lazy_list", "__lib")

    fun resolveDeclarationImports(limeElement: LimeElement): List<DartImport> =
        when {
            limeElement is LimeLambda -> listOf(tokenCacheImport)
            limeElement is LimeStruct && limeElement.external?.dart == null &&
                limeElement.attributes.have(LimeAttributeType.EQUATABLE) ->
                listOf(collectionSystemImport, collectionPackageImport)
            limeElement is LimeInterface ->
                listOf(builtInTypesConversionImport, typeRepositoryImport, tokenCacheImport)
            limeElement is LimeClass &&
                (limeElement.parent != null || limeElement.visibility.isOpen) ->
                listOf(builtInTypesConversionImport, typeRepositoryImport, tokenCacheImport)
            limeElement is LimeClass -> listOf(tokenCacheImport)
            else -> emptyList()
        } + listOfNotNull(
            resolveExternalImport(limeElement, IMPORT_PATH_NAME, useAlias = true),
            resolveExternalImport(limeElement, CONVERTER_IMPORT_NAME, useAlias = false)
        )

    fun resolveImports(limeElement: LimeElement): List<DartImport> =
        when (limeElement) {
            is LimeTypeRef -> resolveTypeImports(limeElement.type) +
                listOfNotNull(lazyListImport.takeIf { limeElement.attributes.have(LimeAttributeType.OPTIMIZED) })
            is LimeType -> resolveTypeImports(limeElement)
            is LimeNamedElement -> listOf(createImport(limeElement))
            else -> emptyList()
        }

    fun resolveFileName(limeElement: LimeNamedElement) =
        NameHelper.toLowerSnakeCase(nameResolver.resolveName(limeElement))
            .replace('<', '_').replace('>', '_')

    private fun resolveTypeImports(limeType: LimeType) =
        when (val actualType = limeType.actualType) {
            is LimeBasicType -> resolveBasicTypeImports(actualType)
            is LimeGenericType -> resolveGenericTypeImports(actualType)
            else -> listOfNotNull(
                createImport(actualType),
                resolveExternalImport(actualType, IMPORT_PATH_NAME, useAlias = true)
            )
        }

    private fun createImport(limeElement: LimeNamedElement): DartImport {
        val filePath = limeElement.path.head.joinToString("/")
        val fileName = resolveFileName(getTopElement(limeElement))
        return DartImport("$srcPath/$filePath/$fileName")
    }

    private fun resolveBasicTypeImports(limeType: LimeBasicType) =
        listOf(builtInTypesConversionImport) +
            when (limeType.typeId) {
                LimeBasicType.TypeId.BLOB ->
                    listOf(DartImport("typed_data", importType = ImportType.SYSTEM))
                LimeBasicType.TypeId.LOCALE -> listOf(DartImport("intl/locale"))
                else -> emptyList()
            }

    private fun resolveGenericTypeImports(limeType: LimeGenericType) =
        when (limeType) {
            is LimeList -> resolveImports(limeType.elementType)
            is LimeSet -> resolveImports(limeType.elementType)
            is LimeMap -> resolveImports(limeType.keyType) + resolveImports(limeType.valueType)
            else -> emptyList()
        } + createConversionImport("generic_types")

    private fun getTopElement(limeElement: LimeNamedElement) =
        generateSequence(limeElement) {
            limeReferenceMap[it.path.parent.toString()] as? LimeNamedElement
        }.last()

    private fun createConversionImport(filePath: String) =
        DartImport("$srcPath/${filePath}__conversion")

    private fun resolveExternalImport(
        limeElement: LimeElement,
        key: String,
        useAlias: Boolean
    ): DartImport? {
        val importPath = (limeElement as? LimeNamedElement)?.external?.dart?.get(key) ?: return null
        val components = importPath.split(':')
        val alias = if (useAlias) computeAlias(importPath) else null
        return when (components.first()) {
            "dart" -> DartImport(components.last(), importType = ImportType.SYSTEM, asAlias = alias)
            "package" -> DartImport(components.last().removeSuffix(".dart"), asAlias = alias)
            else -> DartImport(
                components.last().removeSuffix(".dart"),
                importType = ImportType.RELATIVE,
                asAlias = alias
            )
        }
    }

    companion object {
        private val collectionSystemImport = DartImport("collection", importType = ImportType.SYSTEM)
        private val collectionPackageImport = DartImport("collection/collection")

        fun computeAlias(importPath: String) =
            importPath.split(':').last().split('/').last().split('.').first()
    }
}
