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

package com.here.gluecodium.generator.dart

import com.here.gluecodium.generator.dart.DartImport.ImportType
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeExternalDescriptor.Companion.CONVERTER_IMPORT_NAME
import com.here.gluecodium.model.lime.LimeExternalDescriptor.Companion.IMPORT_PATH_NAME
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeStruct

internal class DartDeclarationImportResolver(srcPath: String) : DartImportResolverBase() {

    private val builtInTypesConversionImport = DartImport("$srcPath/${"builtin_types"}__conversion")
    private val typeRepositoryImport = DartImport("$srcPath/_type_repository", "__lib")
    private val tokenCacheImport = DartImport("$srcPath/_token_cache", "__lib")
    private val nativeBaseImport = DartImport("$srcPath/_native_base", "__lib")

    override fun resolveElementImports(limeElement: LimeElement): List<DartImport> =
        when {
            limeElement is LimeLambda -> listOf(tokenCacheImport)
            limeElement is LimeStruct && limeElement.external?.dart == null &&
                limeElement.attributes.have(LimeAttributeType.EQUATABLE) ->
                listOf(collectionSystemImport, collectionPackageImport)
            limeElement is LimeInterface ->
                listOf(builtInTypesConversionImport, typeRepositoryImport, tokenCacheImport, nativeBaseImport)
            limeElement is LimeClass &&
                (limeElement.parent != null || limeElement.visibility.isOpen) ->
                listOf(builtInTypesConversionImport, typeRepositoryImport, tokenCacheImport, nativeBaseImport)
            limeElement is LimeClass -> listOf(tokenCacheImport, nativeBaseImport)
            else -> emptyList()
        } + listOfNotNull(
            resolveExternalImport(limeElement, IMPORT_PATH_NAME, useAlias = true),
            resolveExternalImport(limeElement, CONVERTER_IMPORT_NAME, useAlias = false)
        )

    companion object {
        private val collectionSystemImport = DartImport("collection", importType = ImportType.SYSTEM)
        private val collectionPackageImport = DartImport("collection/collection")
    }
}
