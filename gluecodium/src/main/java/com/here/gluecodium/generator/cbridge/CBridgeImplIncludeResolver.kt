/*
 * Copyright (C) 2016-2020 HERE Europe B.V.
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

import com.here.gluecodium.generator.common.CommonGeneratorPredicates
import com.here.gluecodium.generator.common.ImportsResolver
import com.here.gluecodium.generator.common.Include
import com.here.gluecodium.generator.cpp.CppIncludeResolver
import com.here.gluecodium.generator.cpp.CppLibraryIncludes
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeConstant
import com.here.gluecodium.model.lime.LimeContainer
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeGenericType
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeLambdaParameter
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeReturnType
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeRef
import com.here.gluecodium.model.lime.LimeTypedElement
import com.here.gluecodium.model.lime.LimeTypesCollection
import java.io.File

internal class CBridgeImplIncludeResolver(private val cppIncludeResolver: CppIncludeResolver) :
    ImportsResolver<Include> {

    override fun resolveElementImports(limeElement: LimeElement) =
        when (limeElement) {
            is LimeTypesCollection, is LimeConstant -> emptyList()
            is LimeTypeRef -> resolveTypeRefIncludes(limeElement)
            is LimeReturnType -> resolveTypeRefIncludes(limeElement.typeRef)
            is LimeLambdaParameter -> resolveTypeRefIncludes(limeElement.typeRef)
            is LimeTypedElement -> resolveTypeRefIncludes(limeElement.typeRef)
            is LimeLambda -> resolveLambdaIncludes(limeElement)
            is LimeStruct -> resolveStructIncludes(limeElement)
            is LimeContainerWithInheritance -> resolveClassInterfaceIncludes(limeElement)
            is LimeGenericType -> resolveGenericTypeIncludes(limeElement)
            is LimeException -> resolveTypeRefIncludes(limeElement.errorType)
            is LimeType -> cppIncludeResolver.resolveElementImports(limeElement)
            else -> emptyList()
        }

    private fun resolveClassInterfaceIncludes(limeContainer: LimeContainerWithInheritance): List<Include> {
        val containerIncludes = resolveContainerIncludes(limeContainer)
        val ownIncludes = listOfNotNull(
            TYPE_INIT_REPOSITORY_INCLUDE,
            WRAPPER_CACHE_INCLUDE,
            CACHED_PROXY_BASE_INCLUDE.takeIf { limeContainer is LimeInterface },
            cppIncludeResolver.typeRepositoryInclude.takeIf { CommonGeneratorPredicates.hasTypeRepository(limeContainer) }
        )
        val parentIncludes = resolveParentIncludes(limeContainer)
        return containerIncludes + ownIncludes + parentIncludes
    }

    private fun resolveParentIncludes(limeContainer: LimeContainerWithInheritance): List<Include> {
        val limeInterface = limeContainer as? LimeInterface ?: return emptyList()
        return limeInterface.parents.flatMap { cppIncludeResolver.resolveElementImports(it.type.actualType) }
    }

    private fun resolveStructIncludes(limeStruct: LimeStruct) =
        resolveContainerIncludes(limeStruct) + listOf(cppIncludeResolver.optionalInclude)

    private fun resolveContainerIncludes(limeContainer: LimeContainer) =
        cppIncludeResolver.resolveElementImports(limeContainer) +
            listOf(CppLibraryIncludes.MEMORY, CppLibraryIncludes.NEW, BASE_HANDLE_IMPL_INCLUDE)

    private fun resolveTypeRefIncludes(limeTypeRef: LimeTypeRef): List<Include> {
        val actualType = limeTypeRef.type.actualType
        if (actualType is LimeException) return emptyList()
        return cppIncludeResolver.resolveElementImports(limeTypeRef) +
            actualType.let { resolveGenericTypeIncludes(it) + resolveHandleIncludes(it) }
    }

    private fun resolveHandleIncludes(limeType: LimeType): List<Include> {
        val typeId = (limeType as? LimeBasicType)?.typeId ?: return emptyList()
        return when (typeId) {
            LimeBasicType.TypeId.STRING -> listOf(STRING_HANDLE_INCLUDE)
            LimeBasicType.TypeId.BLOB -> listOf(BLOB_HANDLE_INCLUDE)
            else -> emptyList()
        }
    }

    private fun resolveGenericTypeIncludes(limeType: LimeType) =
        when (limeType) {
            is LimeList -> cppIncludeResolver.resolveElementImports(limeType) + resolveTypeRefIncludes(limeType.elementType)
            is LimeSet -> cppIncludeResolver.resolveElementImports(limeType) + resolveTypeRefIncludes(limeType.elementType)
            is LimeMap -> cppIncludeResolver.resolveElementImports(limeType) + resolveTypeRefIncludes(limeType.keyType) +
                resolveTypeRefIncludes(limeType.valueType)
            else -> emptyList()
        }

    private fun resolveLambdaIncludes(limeLambda: LimeLambda) = cppIncludeResolver.resolveElementImports(limeLambda) +
        listOf(
            CppLibraryIncludes.NEW,
            BASE_HANDLE_IMPL_INCLUDE,
            CACHED_PROXY_BASE_INCLUDE,
            cppIncludeResolver.optionalInclude
        )

    companion object {
        val BASE_HANDLE_IMPL_INCLUDE = Include.createInternalInclude(createInternalHeaderPath("BaseHandleImpl.h"))
        private val TYPE_INIT_REPOSITORY_INCLUDE =
            Include.createInternalInclude(createInternalHeaderPath("TypeInitRepository.h"))
        private val WRAPPER_CACHE_INCLUDE = Include.createInternalInclude(createInternalHeaderPath("WrapperCache.h"))
        private val CACHED_PROXY_BASE_INCLUDE =
            Include.createInternalInclude(createInternalHeaderPath("CachedProxyBase.h"))
        private val STRING_HANDLE_INCLUDE = Include.createInternalInclude(createPublicHeaderPath("StringHandle.h"))
        private val BLOB_HANDLE_INCLUDE = Include.createInternalInclude(createPublicHeaderPath("ByteArrayHandle.h"))

        private fun createPublicHeaderPath(fileName: String) =
            listOf(CBridgeNameRules.CBRIDGE_PUBLIC, "include", fileName).joinToString(File.separator)

        private fun createInternalHeaderPath(fileName: String) =
            listOf(CBridgeNameRules.CBRIDGE_INTERNAL, "include", fileName).joinToString(File.separator)
    }
}
