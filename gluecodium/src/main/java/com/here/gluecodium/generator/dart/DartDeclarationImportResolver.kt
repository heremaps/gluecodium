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

import com.here.gluecodium.generator.common.CommonGeneratorPredicates.hasStaticFunctions
import com.here.gluecodium.generator.dart.DartImport.ImportType
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeConstant
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeExternalDescriptor.Companion.CONVERTER_IMPORT_NAME
import com.here.gluecodium.model.lime.LimeExternalDescriptor.Companion.IMPORT_PATH_NAME
import com.here.gluecodium.model.lime.LimeGenericType
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeTypesCollection

internal class DartDeclarationImportResolver(
    limeReferenceMap: Map<String, LimeElement>,
    nameResolver: DartNameResolver,
    srcPath: String,
    private val descendantInterfaces: Map<String, List<LimeInterface>>
) : DartImportResolverBase(limeReferenceMap, nameResolver, srcPath) {

    private val builtInTypesConversionImport = DartImport("$srcPath/${"builtin_types"}__conversion")
    private val typeRepositoryImport = DartImport("$srcPath/_type_repository", "__lib")
    private val tokenCacheImport = DartImport("$srcPath/_token_cache", "__lib")
    private val nativeBaseImport = DartImport("$srcPath/_native_base", "__lib")
    private val libraryContextImport = DartImport("$srcPath/_library_context", "__lib")

    private val classInterfaceImports =
        listOf(builtInTypesConversionImport, typeRepositoryImport, tokenCacheImport, nativeBaseImport)

    override fun resolveElementImports(limeElement: LimeElement): List<DartImport> {
        if (limeElement !is LimeNamedElement) return emptyList()

        if (limeElement is LimeTypesCollection || limeElement is LimeException || limeElement is LimeTypeAlias ||
            limeElement is LimeConstant
        ) return emptyList()

        return when {
            limeElement is LimeLambda -> listOf(tokenCacheImport)
            limeElement is LimeStruct && !DartGeneratorPredicates.skipDeclaration(limeElement) ->
                resolveStructImports(limeElement)
            limeElement is LimeInterface -> resolveInterfaceImports(limeElement)
            limeElement is LimeClass -> resolveClassImports(limeElement)
            else -> emptyList()
        } + listOfNotNull(
            resolveExternalImport(limeElement, IMPORT_PATH_NAME, useAlias = true),
            resolveExternalImport(limeElement, CONVERTER_IMPORT_NAME, useAlias = false)
        ) + listOf(ffiSystemImport, libraryContextImport) +
            if (limeElement.visibility.isInternal) listOf(metaPackageImport) else emptyList()
    }

    private fun resolveStructImports(limeStruct: LimeStruct): List<DartImport> {
        val result = mutableListOf<DartImport>()
        if (limeStruct.attributes.have(LimeAttributeType.EQUATABLE) &&
            limeStruct.fields.any { it.typeRef.type.actualType is LimeGenericType }
        ) {
            result += collectionPackageImport
        }
        if (limeStruct.attributes.have(LimeAttributeType.IMMUTABLE) || limeStruct.functions.isNotEmpty() ||
            (limeStruct.fields + limeStruct.fieldConstructors).any { it.visibility.isInternal }
        ) {
            result += metaPackageImport
        }
        if (limeStruct.functions.any { it.attributes.have(LimeAttributeType.ASYNC) }) {
            result += listOf(asyncImport, tokenCacheImport)
        }
        return result
    }

    private fun resolveInterfaceImports(limeInterface: LimeInterface): List<DartImport> {
        val result = classInterfaceImports.toMutableList()
        if (hasStaticFunctions(limeInterface) || limeInterface.properties.any { it.visibility.isInternal }) {
            result += metaPackageImport
        }
        if (!limeInterface.isNarrow) {
            val descendants = descendantInterfaces[limeInterface.fullName]
            if (descendants != null) {
                result += descendants.map { createImport(it) }
            }
        }
        return result
    }

    private fun resolveClassImports(limeClass: LimeClass): List<DartImport> {
        val result = when {
            limeClass.parents.isNotEmpty() || limeClass.isOpen -> classInterfaceImports
            else -> listOf(tokenCacheImport, nativeBaseImport)
        }.toMutableList()
        if (hasStaticFunctions(limeClass) || limeClass.properties.any { it.visibility.isInternal }) {
            result += listOf(metaPackageImport)
        }
        if (limeClass.attributes.have(LimeAttributeType.NO_CACHE)) {
            result.remove(tokenCacheImport)
        }
        if (limeClass.functions.any { it.attributes.have(LimeAttributeType.ASYNC) }) {
            result += listOf(asyncImport, tokenCacheImport)
        }
        return result
    }

    companion object {
        private val asyncImport = DartImport("async", importType = ImportType.SYSTEM)
        private val collectionPackageImport = DartImport("collection/collection")
        private val ffiSystemImport = DartImport("ffi", importType = ImportType.SYSTEM)
        private val metaPackageImport = DartImport("meta/meta")
    }
}
