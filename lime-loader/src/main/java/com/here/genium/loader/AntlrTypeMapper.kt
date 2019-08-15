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

package com.here.genium.loader

import com.here.genium.antlr.LimeParser
import com.here.genium.model.lime.LimeList
import com.here.genium.model.lime.LimeBasicType.TypeId
import com.here.genium.model.lime.LimeBasicTypeRef
import com.here.genium.model.lime.LimeDirectTypeRef
import com.here.genium.model.lime.LimeElement
import com.here.genium.model.lime.LimeAmbiguousTypeRef
import com.here.genium.model.lime.LimeMap
import com.here.genium.model.lime.LimePath
import com.here.genium.model.lime.LimeSet
import com.here.genium.model.lime.LimeType
import com.here.genium.model.lime.LimeTypeRef

internal class AntlrTypeMapper(
    private val imports: List<LimePath>,
    private val referenceMap: Map<String, LimeElement>,
    private val identifierConverter: (LimeParser.SimpleIdContext) -> String
) {

    fun mapTypeRef(currentPath: LimePath, typeRef: LimeParser.TypeRefContext): LimeTypeRef {
        val isOptional = typeRef.QUEST() != null
        return when {
            typeRef.predefinedType() != null ->
                LimeBasicTypeRef(mapPredefinedType(typeRef.predefinedType()), isOptional)
            typeRef.genericType() != null ->
                LimeDirectTypeRef(mapGenericType(currentPath, typeRef.genericType()), isOptional)
            else -> mapExplicitTypeRef(currentPath, typeRef.identifier(), isOptional)
        }
    }

    fun mapExplicitTypeRef(
        currentPath: LimePath,
        identifierContext: LimeParser.IdentifierContext,
        isOptional: Boolean = false
    ) = LimeAmbiguousTypeRef(
        relativePath = identifierContext.simpleId().map { identifierConverter(it) },
        parentPaths = listOf(currentPath) + currentPath.allParents,
        imports = imports,
        referenceMap = referenceMap,
        isNullable = isOptional
    )

    private fun mapPredefinedType(
        predefinedType: LimeParser.PredefinedTypeContext
    ): TypeId =
        when {
            predefinedType.BYTE_TYPE() != null -> TypeId.INT8
            predefinedType.SHORT_TYPE() != null -> TypeId.INT16
            predefinedType.INT_TYPE() != null -> TypeId.INT32
            predefinedType.LONG_TYPE() != null -> TypeId.INT64
            predefinedType.UBYTE_TYPE() != null -> TypeId.UINT8
            predefinedType.USHORT_TYPE() != null -> TypeId.UINT16
            predefinedType.UINT_TYPE() != null -> TypeId.UINT32
            predefinedType.ULONG_TYPE() != null -> TypeId.UINT64
            predefinedType.BOOL_TYPE() != null -> TypeId.BOOLEAN
            predefinedType.STRING_TYPE() != null -> TypeId.STRING
            predefinedType.FLOAT_TYPE() != null -> TypeId.FLOAT
            predefinedType.DOUBLE_TYPE() != null -> TypeId.DOUBLE
            predefinedType.BLOB_TYPE() != null -> TypeId.BLOB
            predefinedType.DATE_TYPE() != null -> TypeId.DATE
            else -> throw LimeLoadingException("Unrecognized predefined type: $predefinedType")
        }

    private fun mapGenericType(
        currentPath: LimePath,
        genericType: LimeParser.GenericTypeContext
    ): LimeType =
        when {
            genericType.listType() != null ->
                LimeList(mapTypeRef(currentPath, genericType.listType().typeRef()))
            genericType.setType() != null ->
                LimeSet(mapTypeRef(currentPath, genericType.setType().typeRef()))
            genericType.mapType() != null ->
                LimeMap(
                    mapTypeRef(currentPath, genericType.mapType().typeRef().first()),
                    mapTypeRef(currentPath, genericType.mapType().typeRef().last())
                )
            else -> throw LimeLoadingException("Unrecognized generic type: $genericType")
        }
}
