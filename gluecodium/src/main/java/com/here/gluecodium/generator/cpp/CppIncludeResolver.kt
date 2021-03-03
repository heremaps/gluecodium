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

package com.here.gluecodium.generator.cpp

import com.here.gluecodium.generator.common.Include
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeBasicType.TypeId
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeGenericType
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeTypeRef
import com.here.gluecodium.model.lime.LimeValue

/**
 * Resolves includes for C++ types. Resolves all types of includes: system includes, Gluecodium
 * helper includes and includes for generated type definitions.
 */
internal class CppIncludeResolver(
    limeReferenceMap: Map<String, LimeElement>,
    nameRules: CppNameRules,
    internalNamespace: List<String>
) {
    private val cppIncludesCache = CppIncludesCache(limeReferenceMap, nameRules, internalNamespace)

    val hashInclude = cppIncludesCache.createInternalNamespaceInclude("Hash.h")
    val typeRepositoryInclude = cppIncludesCache.createInternalNamespaceInclude("TypeRepository.h")
    val optionalInclude = cppIncludesCache.createInternalNamespaceInclude("Optional.h")

    private val returnInclude = cppIncludesCache.createInternalNamespaceInclude("Return.h")
    private val timePointHashInclude = cppIncludesCache.createInternalNamespaceInclude("TimePointHash.h")
    private val vectorHashInclude = cppIncludesCache.createInternalNamespaceInclude("VectorHash.h")
    private val unorderedMapHashInclude = cppIncludesCache.createInternalNamespaceInclude("UnorderedMapHash.h")
    private val unorderedSetHashInclude = cppIncludesCache.createInternalNamespaceInclude("UnorderedSetHash.h")
    private val localeInclude = cppIncludesCache.createInternalNamespaceInclude("Locale.h")

    fun resolveIncludes(limeElement: LimeElement): List<Include> =
        when (limeElement) {
            is LimeValue -> resolveValueIncludes(limeElement)
            is LimeTypeRef -> resolveTypeRefIncludes(limeElement)
            is LimeBasicType -> resolveBasicTypeIncludes(limeElement)
            is LimeGenericType -> resolveGenericTypeIncludes(limeElement)
            is LimeFunction -> resolveExceptionIncludes(limeElement)
            is LimeLambda -> cppIncludesCache.resolveIncludes(limeElement) + CppLibraryIncludes.FUNCTIONAL
            is LimeNamedElement -> cppIncludesCache.resolveIncludes(limeElement)
            else -> emptyList()
        }

    private fun resolveExceptionIncludes(limeFunction: LimeFunction): List<Include> {
        val payloadType = limeFunction.exception?.errorType?.type?.actualType ?: return emptyList()
        return when (payloadType) {
            is LimeEnumeration -> listOf(CppLibraryIncludes.SYSTEM_ERROR)
            else -> cppIncludesCache.resolveIncludes(payloadType) + returnInclude
        } + when {
            limeFunction.returnType.isVoid -> emptyList()
            else -> listOf(returnInclude)
        }
    }

    private fun resolveValueIncludes(limeValue: LimeValue): List<Include> =
        when (limeValue) {
            is LimeValue.Special -> listOf(CppLibraryIncludes.LIMITS)
            is LimeValue.KeyValuePair ->
                resolveValueIncludes(limeValue.key) + resolveValueIncludes(limeValue.value)
            is LimeValue.InitializerList -> limeValue.values.flatMap { resolveValueIncludes(it) }
            else -> emptyList()
        }

    private fun resolveTypeRefIncludes(limeTypeRef: LimeTypeRef) =
        resolveIncludes(limeTypeRef.type) +
            when {
                limeTypeRef.type.actualType is LimeContainerWithInheritance ->
                    listOf(CppLibraryIncludes.MEMORY)
                limeTypeRef.isNullable -> listOf(optionalInclude)
                else -> emptyList()
            }

    private fun resolveBasicTypeIncludes(limeType: LimeBasicType): List<Include> {
        if (limeType.typeId.isIntegerType) return listOf(CppLibraryIncludes.INT_TYPES)
        return when (limeType.typeId) {
            TypeId.STRING -> listOf(CppLibraryIncludes.STRING)
            TypeId.DATE -> listOf(CppLibraryIncludes.CHRONO, timePointHashInclude)
            TypeId.LOCALE -> listOf(localeInclude)
            TypeId.BLOB -> listOf(
                CppLibraryIncludes.MEMORY,
                CppLibraryIncludes.VECTOR,
                CppLibraryIncludes.INT_TYPES
            )
            else -> emptyList()
        }
    }

    private fun resolveGenericTypeIncludes(limeType: LimeGenericType) =
        when (limeType) {
            is LimeList -> resolveIncludes(limeType.elementType) + CppLibraryIncludes.VECTOR +
                vectorHashInclude
            is LimeSet ->
                limeType.elementType.let { resolveIncludes(it) + resolveHashIncludes(it) } +
                    CppLibraryIncludes.SET + unorderedSetHashInclude
            is LimeMap -> resolveIncludes(limeType.valueType) +
                limeType.keyType.let { resolveIncludes(it) + resolveHashIncludes(it) } +
                CppLibraryIncludes.MAP + unorderedMapHashInclude
            else -> emptyList()
        }

    private fun resolveHashIncludes(limeTypeRef: LimeTypeRef) =
        when (limeTypeRef.type.actualType) {
            is LimeBasicType, is LimeGenericType -> emptyList()
            else -> listOf(hashInclude)
        }
}
