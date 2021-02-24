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
import com.here.gluecodium.generator.common.Include
import com.here.gluecodium.generator.cpp.CppIncludeResolver
import com.here.gluecodium.generator.cpp.CppLibraryIncludes
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeContainer
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeGenericType
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeProperty
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeRef
import com.here.gluecodium.model.lime.LimeTypesCollection
import java.io.File

internal class CBridgeImplIncludeResolver(
    private val rootNamespace: List<String>,
    private val cppIncludeResolver: CppIncludeResolver
) {

    fun getImplFilePath(limeElement: LimeNamedElement) =
        CBridgeNameRules.createPath(limeElement, rootNamespace, "src", ".cpp")

    fun resolveIncludes(limeElement: LimeNamedElement): List<Include> =
        when {
            limeElement.attributes.have(LimeAttributeType.SWIFT, LimeAttributeValueType.SKIP) -> emptyList()
            limeElement is LimeTypeRef -> resolveTypeRefIncludes(limeElement)
            limeElement is LimeFunction -> resolveFunctionIncludes(limeElement)
            limeElement is LimeLambda -> resolveLambdaIncludes(limeElement)
            limeElement is LimeProperty -> resolveTypeRefIncludes(limeElement.typeRef)
            limeElement is LimeStruct -> resolveStructIncludes(limeElement)
            limeElement is LimeTypesCollection ->
                (limeElement.structs + limeElement.lambdas).flatMap { resolveIncludes(it) }
            limeElement is LimeContainerWithInheritance -> resolveClassInterfaceIncludes(limeElement)
            limeElement is LimeGenericType -> resolveGenericTypeIncludes(limeElement)
            limeElement is LimeType -> cppIncludeResolver.resolveIncludes(limeElement)
            else -> emptyList()
        }

    private fun resolveClassInterfaceIncludes(limeContainer: LimeContainerWithInheritance): List<Include> =
        resolveContainerIncludes(limeContainer) +
        listOfNotNull(
            TYPE_INIT_REPOSITORY_INCLUDE,
            WRAPPER_CACHE_INCLUDE,
            CACHED_PROXY_BASE_INCLUDE.takeIf { limeContainer is LimeInterface },
            cppIncludeResolver.typeRepositoryInclude.takeIf {
                CommonGeneratorPredicates.hasTypeRepository(limeContainer)
            }
        ) + resolveParentIncludes(limeContainer)

    private fun resolveParentIncludes(limeContainer: LimeContainerWithInheritance) =
        ((limeContainer as? LimeInterface)?.parent?.type?.actualType as? LimeInterface)?.let {
            resolveClassInterfaceIncludes(it)
        } ?: emptyList()

    private fun resolveStructIncludes(limeStruct: LimeStruct) = resolveContainerIncludes(limeStruct) +
        limeStruct.fields.flatMap { resolveTypeRefIncludes(it.typeRef) } + cppIncludeResolver.optionalInclude

    private fun resolveContainerIncludes(limeContainer: LimeContainer) =
        cppIncludeResolver.resolveIncludes(limeContainer) +
        listOf(CppLibraryIncludes.MEMORY, CppLibraryIncludes.NEW, BASE_HANDLE_IMPL_INCLUDE) +
        (limeContainer.functions + limeContainer.properties + limeContainer.classes +
            limeContainer.interfaces + limeContainer.structs + limeContainer.lambdas).flatMap { resolveIncludes(it) }

    private fun resolveTypeRefIncludes(limeTypeRef: LimeTypeRef): List<Include> =
        cppIncludeResolver.resolveIncludes(limeTypeRef) +
        limeTypeRef.type.actualType.let { resolveGenericTypeIncludes(it) + resolveHandleIncludes(it) }

    private fun resolveHandleIncludes(limeType: LimeType): List<Include> {
        val typeId = (limeType as? LimeBasicType)?.typeId ?: return emptyList()
        return when (typeId) {
            LimeBasicType.TypeId.STRING -> listOf(STRING_HANDLE_INCLUDE)
            LimeBasicType.TypeId.BLOB -> listOf(BLOB_HANDLE_INCLUDE)
            LimeBasicType.TypeId.DATE -> listOf(DATE_HANDLE_INCLUDE)
            else -> emptyList()
        }
    }

    private fun resolveGenericTypeIncludes(limeType: LimeType) =
        when (limeType) {
            is LimeList -> cppIncludeResolver.resolveIncludes(limeType) + resolveTypeRefIncludes(limeType.elementType)
            is LimeSet -> cppIncludeResolver.resolveIncludes(limeType) + resolveTypeRefIncludes(limeType.elementType)
            is LimeMap -> cppIncludeResolver.resolveIncludes(limeType) + resolveTypeRefIncludes(limeType.keyType) +
                resolveTypeRefIncludes(limeType.valueType)
            else -> emptyList()
        }

    private fun resolveFunctionIncludes(limeFunction: LimeFunction) =
        (listOfNotNull(limeFunction.returnType.typeRef, limeFunction.exception?.errorType) +
            limeFunction.parameters.map { it.typeRef }).flatMap { resolveTypeRefIncludes(it) }

    private fun resolveLambdaIncludes(limeLambda: LimeLambda) = cppIncludeResolver.resolveIncludes(limeLambda) +
        (limeLambda.parameters.map { it.typeRef } + limeLambda.returnType.typeRef).flatMap { resolveTypeRefIncludes(it) } +
        listOf(CppLibraryIncludes.NEW, BASE_HANDLE_IMPL_INCLUDE, CACHED_PROXY_BASE_INCLUDE, cppIncludeResolver.optionalInclude)

    companion object {
        val BASE_HANDLE_IMPL_INCLUDE = Include.createInternalInclude(createInternalHeaderPath("BaseHandleImpl.h"))
        private val TYPE_INIT_REPOSITORY_INCLUDE =
            Include.createInternalInclude(createInternalHeaderPath("TypeInitRepository.h"))
        private val WRAPPER_CACHE_INCLUDE = Include.createInternalInclude(createInternalHeaderPath("WrapperCache.h"))
        private val CACHED_PROXY_BASE_INCLUDE =
            Include.createInternalInclude(createInternalHeaderPath("CachedProxyBase.h"))
        private val STRING_HANDLE_INCLUDE = Include.createInternalInclude(createPublicHeaderPath("StringHandle.h"))
        private val BLOB_HANDLE_INCLUDE = Include.createInternalInclude(createPublicHeaderPath("ByteArrayHandle.h"))
        private val DATE_HANDLE_INCLUDE = Include.createInternalInclude(createPublicHeaderPath("DateHandle.h"))

        private fun createPublicHeaderPath(fileName: String) =
            listOf(CBridgeNameRules.CBRIDGE_PUBLIC, "include", fileName).joinToString(File.separator)

        private fun createInternalHeaderPath(fileName: String) =
            listOf(CBridgeNameRules.CBRIDGE_INTERNAL, "include", fileName).joinToString(File.separator)
    }
}
