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

package com.here.gluecodium.generator.ffi

import com.here.gluecodium.cli.GluecodiumExecutionException
import com.here.gluecodium.generator.common.CommonGeneratorPredicates
import com.here.gluecodium.generator.common.ImportsResolver
import com.here.gluecodium.generator.common.Include
import com.here.gluecodium.generator.cpp.CppIncludesCache
import com.here.gluecodium.generator.cpp.CppLibraryIncludes
import com.here.gluecodium.generator.cpp.CppNameRules
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeBasicType.TypeId
import com.here.gluecodium.model.lime.LimeConstant
import com.here.gluecodium.model.lime.LimeContainer
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeTypeRef

internal class FfiCppIncludeResolver(
    limeReferenceMap: Map<String, LimeElement>,
    nameRules: CppNameRules,
    internalNamespace: List<String>
) : ImportsResolver<Include> {
    private val cppIncludesCache = CppIncludesCache(limeReferenceMap, nameRules, internalNamespace)

    override fun resolveElementImports(limeElement: LimeElement): List<Include> =
        when (limeElement) {
            is LimeTypeRef -> getTypeRefIncludes(limeElement)
            is LimeException, is LimeTypeAlias, is LimeConstant -> emptyList()
            is LimeInterface -> getTypeIncludes(limeElement) + getThrownTypeIncludes(limeElement) +
                getContainerIncludes(limeElement) + proxyIncludes
            is LimeContainer -> getTypeIncludes(limeElement) + getContainerIncludes(limeElement)
            is LimeLambda -> getTypeIncludes(limeElement) + proxyIncludes + isolateContextInclude
            is LimeType -> getTypeIncludes(limeElement)
            is LimeField -> emptyList()
            else ->
                throw GluecodiumExecutionException("Unsupported element type ${limeElement.javaClass.name}")
        }

    private fun getTypeRefIncludes(limeTypeRef: LimeTypeRef): List<Include> =
        getTypeIncludes(limeTypeRef.type.actualType) +
            if (limeTypeRef.isNullable) listOf(CppLibraryIncludes.OPTIONAL) else emptyList()

    private fun getTypeIncludes(limeType: LimeType) =
        when (limeType) {
            is LimeException -> emptyList()
            is LimeBasicType -> getBasicTypeIncludes(limeType)
            is LimeList -> getTypeRefIncludes(limeType.elementType) + listOf(
                CppLibraryIncludes.VECTOR,
                cppIncludesCache.createInternalNamespaceInclude("VectorHash.h")
            )
            is LimeSet -> getTypeRefIncludes(limeType.elementType) + listOf(
                CppLibraryIncludes.SET,
                cppIncludesCache.createInternalNamespaceInclude("UnorderedSetHash.h")
            )
            is LimeMap -> getTypeRefIncludes(limeType.keyType) +
                getTypeRefIncludes(limeType.valueType) + listOf(
                CppLibraryIncludes.MAP,
                cppIncludesCache.createInternalNamespaceInclude("UnorderedMapHash.h")
            )
            is LimeLambda -> cppIncludesCache.resolveIncludes(limeType) +
                getTypeRefIncludes(limeType.returnType.typeRef) +
                limeType.parameters.flatMap { getTypeRefIncludes(it.typeRef) } +
                CppLibraryIncludes.FUNCTIONAL
            is LimeContainerWithInheritance -> cppIncludesCache.resolveIncludes(limeType) +
                CppLibraryIncludes.MEMORY
            else -> cppIncludesCache.resolveIncludes(limeType)
        }

    private fun getBasicTypeIncludes(limeType: LimeBasicType) =
        when (limeType.typeId) {
            TypeId.BOOLEAN -> listOf(BOOL_INCLUDE)
            TypeId.VOID, TypeId.FLOAT, TypeId.DOUBLE -> emptyList()
            TypeId.STRING -> listOf(CppLibraryIncludes.STRING)
            TypeId.BLOB -> listOf(CppLibraryIncludes.MEMORY, CppLibraryIncludes.VECTOR, CppLibraryIncludes.INT_TYPES)
            TypeId.DATE -> listOf(
                CppLibraryIncludes.CHRONO,
                cppIncludesCache.createInternalNamespaceInclude("TimePointHash.h")
            )
            TypeId.DURATION -> listOf(
                CppLibraryIncludes.CHRONO,
                cppIncludesCache.createInternalNamespaceInclude("DurationHash.h")
            )
            TypeId.LOCALE -> listOf(cppIncludesCache.createInternalNamespaceInclude("Locale.h"))
            else -> listOf(CppLibraryIncludes.INT_TYPES)
        }

    private fun getThrownTypeIncludes(limeInterface: LimeInterface): List<Include> {
        val exceptionEnums = limeInterface.functions
            .mapNotNull { it.exception?.errorType?.type?.actualType }
            .filterIsInstance<LimeEnumeration>()
        return when {
            exceptionEnums.isNotEmpty() -> listOf(CppLibraryIncludes.SYSTEM_ERROR)
            else -> emptyList()
        }
    }

    private fun getContainerIncludes(limeContainer: LimeContainer): List<Include> =
        listOfNotNull(
            isolateContextInclude.takeIf { limeContainer.functions.isNotEmpty() || limeContainer.properties.isNotEmpty() },
            cppIncludesCache.typeRepositoryInclude.takeIf { CommonGeneratorPredicates.hasTypeRepository(limeContainer) }
        )

    companion object {
        private val BOOL_INCLUDE = Include.createSystemInclude("stdbool.h")

        private val isolateContextInclude = Include.createInternalInclude("IsolateContext.h")
        private val proxyIncludes = listOf(
            Include.createInternalInclude("CallbacksQueue.h"),
            Include.createInternalInclude("ProxyCache.h")
        )
    }
}
