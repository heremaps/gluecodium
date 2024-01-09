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

package com.here.gluecodium.loader

import com.here.gluecodium.antlr.LimeParser
import com.here.gluecodium.model.lime.LimeAmbiguousTypeRef
import com.here.gluecodium.model.lime.LimeBasicType.TypeId
import com.here.gluecodium.model.lime.LimeBasicTypeRef
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeRef

internal class AntlrTypeMapper(
    private val imports: List<LimePath>,
    private val referenceMap: Map<String, LimeElement>,
    private val identifierConverter: (LimeParser.SimpleIdContext) -> String,
) {
    fun mapTypeRef(
        currentPath: LimePath,
        typeRef: LimeParser.TypeRefContext,
    ) = mapSimpleTypeRef(currentPath, typeRef.simpleTypeRef(), typeRef.Quest() != null)

    fun mapSimpleTypeRef(
        currentPath: LimePath,
        typeRef: LimeParser.SimpleTypeRefContext,
        isOptional: Boolean = false,
    ): LimeTypeRef {
        val attributes = AntlrLimeConverter.convertAnnotations(currentPath, typeRef.annotation())
        return when {
            typeRef.predefinedType() != null ->
                LimeBasicTypeRef(
                    mapPredefinedType(typeRef.predefinedType()),
                    isOptional,
                    attributes,
                )
            typeRef.genericType() != null ->
                LimeDirectTypeRef(
                    mapGenericType(currentPath, typeRef.genericType()),
                    isOptional,
                    attributes,
                )
            else ->
                LimeAmbiguousTypeRef(
                    relativePath = typeRef.identifier().simpleId().map { identifierConverter(it) },
                    parentPaths = listOf(currentPath) + currentPath.allParents,
                    imports = imports,
                    referenceMap = referenceMap,
                    isNullable = isOptional,
                    attributes = attributes,
                )
        }
    }

    private fun mapPredefinedType(predefinedType: LimeParser.PredefinedTypeContext): TypeId =
        when {
            predefinedType.VoidType() != null -> TypeId.VOID
            predefinedType.ByteType() != null -> TypeId.INT8
            predefinedType.ShortType() != null -> TypeId.INT16
            predefinedType.IntType() != null -> TypeId.INT32
            predefinedType.LongType() != null -> TypeId.INT64
            predefinedType.UByteType() != null -> TypeId.UINT8
            predefinedType.UShortType() != null -> TypeId.UINT16
            predefinedType.UIntType() != null -> TypeId.UINT32
            predefinedType.ULongType() != null -> TypeId.UINT64
            predefinedType.BoolType() != null -> TypeId.BOOLEAN
            predefinedType.StringType() != null -> TypeId.STRING
            predefinedType.FloatType() != null -> TypeId.FLOAT
            predefinedType.DoubleType() != null -> TypeId.DOUBLE
            predefinedType.BlobType() != null -> TypeId.BLOB
            predefinedType.DateType() != null -> TypeId.DATE
            predefinedType.DurationType() != null -> TypeId.DURATION
            predefinedType.LocaleType() != null -> TypeId.LOCALE
            else -> throw LimeLoadingException("Unrecognized predefined type: $predefinedType")
        }

    private fun mapGenericType(
        currentPath: LimePath,
        genericType: LimeParser.GenericTypeContext,
    ): LimeType =
        when {
            genericType.listType() != null ->
                LimeList(mapTypeRef(currentPath, genericType.listType().typeRef()))
            genericType.setType() != null ->
                LimeSet(mapTypeRef(currentPath, genericType.setType().typeRef()))
            genericType.mapType() != null ->
                LimeMap(
                    mapTypeRef(currentPath, genericType.mapType().typeRef().first()),
                    mapTypeRef(currentPath, genericType.mapType().typeRef().last()),
                )
            else -> throw LimeLoadingException("Unrecognized generic type: $genericType")
        }
}
