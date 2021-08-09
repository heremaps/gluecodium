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

import com.here.gluecodium.generator.dart.DartImport.ImportType
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeConstant
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeExternalDescriptor.Companion.IMPORT_PATH_NAME
import com.here.gluecodium.model.lime.LimeGenericType
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeTypeRef

internal class DartImportResolver(
    private val limeReferenceMap: Map<String, LimeElement>,
    private val nameResolver: DartNameResolver,
    private val srcPath: String
) : DartImportResolverBase() {
    private val builtInTypesConversionImport = createConversionImport("builtin_types")
    private val lazyListImport = DartImport("$srcPath/_lazy_list", "__lib")

    override fun resolveElementImports(limeElement: LimeElement): List<DartImport> =
        when (limeElement) {
            is LimeTypeAlias -> emptyList()
            is LimeTypeRef -> resolveTypeImports(limeElement.type) + resolveConversionImports(limeElement) +
                listOfNotNull(lazyListImport.takeIf { limeElement.attributes.have(LimeAttributeType.OPTIMIZED) })
            is LimeType -> resolveTypeImports(limeElement) + resolveConversionImports(limeElement)
            is LimeConstant -> resolveTypeImports(limeElement.typeRef.type)
            is LimeNamedElement -> listOf(createImport(limeElement))
            else -> emptyList()
        }

    private fun resolveTypeImports(limeType: LimeType): List<DartImport> =
        when (val actualType = limeType.actualType) {
            is LimeBasicType -> resolveBasicTypeImports(actualType)
            is LimeGenericType -> resolveGenericTypeImports(actualType)
            else -> listOfNotNull(
                createImport(actualType),
                resolveExternalImport(actualType, IMPORT_PATH_NAME, useAlias = true)
            )
        }

    private fun resolveConversionImports(limeType: LimeType): List<DartImport> =
        when (val actualType = limeType.actualType) {
            is LimeBasicType ->
                if (actualType.typeId.isNumericType || actualType.typeId == LimeBasicType.TypeId.VOID) emptyList()
                else listOf(builtInTypesConversionImport)
            is LimeGenericType -> listOf(createConversionImport("generic_types"))
            else -> emptyList()
        }

    private fun resolveConversionImports(limeTypeRef: LimeTypeRef): List<DartImport> =
        resolveConversionImports(limeTypeRef.type) +
            if (limeTypeRef.isNullable && limeTypeRef.type.actualType is LimeBasicType)
                listOf(builtInTypesConversionImport)
            else emptyList()

    private fun createImport(limeElement: LimeNamedElement): DartImport {
        val filePath = limeElement.path.head.joinToString("/")
        val fileName = nameResolver.resolveFileName(getTopElement(limeElement))
        return DartImport("$srcPath/$filePath/$fileName")
    }

    private fun resolveBasicTypeImports(limeType: LimeBasicType) =
        when (limeType.typeId) {
            LimeBasicType.TypeId.BLOB ->
                listOf(DartImport("typed_data", importType = ImportType.SYSTEM))
            LimeBasicType.TypeId.LOCALE -> listOf(DartImport("intl/locale"))
            else -> emptyList()
        }

    private fun resolveGenericTypeImports(limeType: LimeGenericType) =
        when (limeType) {
            is LimeList -> resolveTypeImports(limeType.elementType.type)
            is LimeSet -> resolveTypeImports(limeType.elementType.type)
            is LimeMap -> resolveTypeImports(limeType.keyType.type) + resolveTypeImports(limeType.valueType.type)
            else -> emptyList()
        }

    private fun getTopElement(limeElement: LimeNamedElement) =
        generateSequence(limeElement) {
            limeReferenceMap[it.path.parent.toString()] as? LimeNamedElement
        }.last()

    private fun createConversionImport(filePath: String) =
        DartImport("$srcPath/${filePath}__conversion")
}
