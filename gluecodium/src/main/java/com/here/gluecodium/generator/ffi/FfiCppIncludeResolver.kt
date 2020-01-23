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
import com.here.gluecodium.generator.cpp.CppIncludeResolver
import com.here.gluecodium.generator.cpp.CppLibraryIncludes
import com.here.gluecodium.generator.cpp.CppNameRules
import com.here.gluecodium.model.common.Include
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeBasicType.TypeId
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeRef
import com.here.gluecodium.model.lime.LimeTypesCollection

internal class FfiCppIncludeResolver(
    limeReferenceMap: Map<String, LimeElement>,
    nameRules: CppNameRules,
    internalNamespace: List<String>
) {
    private val cppIncludeResolver =
        CppIncludeResolver(limeReferenceMap, nameRules, internalNamespace)

    fun resolveIncludes(limeElement: LimeElement): List<Include> =
        when (limeElement) {
            is LimeTypeRef -> getTypeRefIncludes(limeElement)
            is LimeTypesCollection -> emptyList()
            is LimeType -> getTypeIncludes(limeElement.actualType)
            else ->
                throw GluecodiumExecutionException("Unsupported element type ${limeElement.javaClass.name}")
        }

    private fun getTypeRefIncludes(limeTypeRef: LimeTypeRef): List<Include> =
        getTypeIncludes(limeTypeRef.type) +
            if (limeTypeRef.isNullable) listOf(cppIncludeResolver.optionalInclude) else emptyList()

    private fun getTypeIncludes(limeType: LimeType) =
        when (limeType) {
            is LimeBasicType -> getBasicTypeIncludes(limeType)
            is LimeList -> getTypeRefIncludes(limeType.elementType) + listOf(
                CppLibraryIncludes.VECTOR,
                cppIncludeResolver.createInternalNamespaceInclude("VectorHash.h")
            )
            is LimeSet -> getTypeRefIncludes(limeType.elementType) + listOf(
                CppLibraryIncludes.SET,
                cppIncludeResolver.createInternalNamespaceInclude("UnorderedSetHash.h")
            )
            is LimeMap -> getTypeRefIncludes(limeType.keyType) +
                getTypeRefIncludes(limeType.valueType) + listOf(
                CppLibraryIncludes.MAP,
                cppIncludeResolver.createInternalNamespaceInclude("UnorderedMapHash.h")
            )
            is LimeLambda -> getTypeRefIncludes(limeType.returnType) +
                limeType.parameters.flatMap { getTypeRefIncludes(it.typeRef) } +
                CppLibraryIncludes.FUNCTIONAL
            is LimeContainerWithInheritance -> cppIncludeResolver.resolveIncludes(limeType) +
                CppLibraryIncludes.MEMORY
            else -> cppIncludeResolver.resolveIncludes(limeType)
        }

    private fun getBasicTypeIncludes(limeType: LimeBasicType) =
        when (limeType.typeId) {
            TypeId.VOID, TypeId.BOOLEAN, TypeId.FLOAT, TypeId.DOUBLE -> emptyList()
            TypeId.STRING -> listOf(CppLibraryIncludes.STRING)
            TypeId.BLOB -> listOf(
                CppLibraryIncludes.MEMORY,
                CppLibraryIncludes.VECTOR,
                CppLibraryIncludes.INT_TYPES
            )
            TypeId.DATE -> listOf(
                CppLibraryIncludes.CHRONO,
                cppIncludeResolver.createInternalNamespaceInclude("TimePointHash.h")
            )
            else -> listOf(CppLibraryIncludes.INT_TYPES)
        }
}
