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

package com.here.genium.generator.cpp

import com.android.annotations.VisibleForTesting
import com.here.genium.cli.GeniumExecutionException
import com.here.genium.model.cpp.CppComplexTypeRef
import com.here.genium.model.cpp.CppPrimitiveTypeRef
import com.here.genium.model.cpp.CppTemplateTypeRef
import com.here.genium.model.cpp.CppTemplateTypeRef.TemplateClass
import com.here.genium.model.cpp.CppTypeDefRef
import com.here.genium.model.cpp.CppTypeRef
import com.here.genium.model.lime.LimeArray
import com.here.genium.model.lime.LimeAttributeType
import com.here.genium.model.lime.LimeBasicType
import com.here.genium.model.lime.LimeBasicType.TypeId
import com.here.genium.model.lime.LimeContainer
import com.here.genium.model.lime.LimeEnumeration
import com.here.genium.model.lime.LimeMap
import com.here.genium.model.lime.LimeStruct
import com.here.genium.model.lime.LimeType
import com.here.genium.model.lime.LimeTypeDef
import com.here.genium.model.lime.LimeTypeRef

class CppLimeBasedTypeMapper(
    private val nameResolver: CppLimeBasedNameResolver,
    private val includeResolver: CppLimeBasedIncludeResolver,
    private val internalNamespace: String
) {
    @VisibleForTesting
    internal val enumHashType =
        CppComplexTypeRef(
            CppNameRules.joinFullyQualifiedName(internalNamespace, "EnumHash"),
            listOf(CppLibraryIncludes.ENUM_HASH)
        )

    fun getReturnWrapperType(outArgType: CppTypeRef, errorType: CppTypeRef): CppTypeRef =
        CppTemplateTypeRef.create(internalNamespace, TemplateClass.RETURN, outArgType, errorType)

    fun mapType(limeTypeRef: LimeTypeRef): CppTypeRef = mapType(limeTypeRef.type)

    fun mapInstanceType(
        limeContainer: LimeContainer,
        needsForwardDeclaration: Boolean
    ) = CppComplexTypeRef(
        fullyQualifiedName = nameResolver.getFullyQualifiedName(limeContainer),
        includes = includeResolver.resolveIncludes(limeContainer),
        needsForwardDeclaration = needsForwardDeclaration
    )

    fun createOptionalType(cppTypeRef: CppTypeRef): CppTemplateTypeRef {
        return CppTemplateTypeRef.create(
            internalNamespace,
            TemplateClass.OPTIONAL, cppTypeRef
        )
    }

    private fun mapType(limeType: LimeType): CppTypeRef =
        when (limeType) {
            is LimeBasicType -> mapPredefined(limeType)
            is LimeTypeDef -> CppTypeDefRef(
                nameResolver.getFullyQualifiedName(limeType),
                includeResolver.resolveIncludes(limeType),
                mapType(limeType.typeRef)
            )
            is LimeStruct, is LimeEnumeration -> CppComplexTypeRef(
                nameResolver.getFullyQualifiedName(limeType),
                includeResolver.resolveIncludes(limeType),
                limeType is LimeEnumeration
            )
            is LimeArray ->
                CppTemplateTypeRef.create(TemplateClass.VECTOR, mapType(limeType.elementType))
            is LimeMap -> wrapMap(mapType(limeType.keyType), mapType(limeType.valueType))
            is LimeContainer -> {
                val instanceType = mapInstanceType(
                    limeType,
                    !limeType.attributes.have(LimeAttributeType.EXTERNAL_TYPE)
                )
                CppTemplateTypeRef.create(TemplateClass.SHARED_POINTER, instanceType)
            }
            else -> throw GeniumExecutionException("Unmapped type: " + limeType.name)
        }

    private fun wrapMap(key: CppTypeRef, value: CppTypeRef) =
        when {
            key.refersToEnumType ->
                CppTemplateTypeRef.create(TemplateClass.MAP, key, value, enumHashType)
            else -> CppTemplateTypeRef.create(TemplateClass.MAP, key, value)
        }

    private fun mapPredefined(limeBasicType: LimeBasicType) =
        when (limeBasicType.typeId) {
            TypeId.VOID -> CppPrimitiveTypeRef.VOID
            TypeId.INT8 -> CppPrimitiveTypeRef.INT8
            TypeId.UINT8 -> CppPrimitiveTypeRef.UINT8
            TypeId.INT16 -> CppPrimitiveTypeRef.INT16
            TypeId.UINT16 -> CppPrimitiveTypeRef.UINT16
            TypeId.INT32 -> CppPrimitiveTypeRef.INT32
            TypeId.UINT32 -> CppPrimitiveTypeRef.UINT32
            TypeId.INT64 -> CppPrimitiveTypeRef.INT64
            TypeId.UINT64 -> CppPrimitiveTypeRef.UINT64
            TypeId.BOOLEAN -> CppPrimitiveTypeRef.BOOL
            TypeId.FLOAT -> CppPrimitiveTypeRef.FLOAT
            TypeId.DOUBLE -> CppPrimitiveTypeRef.DOUBLE
            TypeId.STRING -> STRING_TYPE
            TypeId.BLOB -> BYTE_BUFFER_POINTER_TYPE
        }

    companion object {
        val STD_ERROR_CODE_TYPE: CppTypeRef =
            CppComplexTypeRef("::std::error_code", listOf(CppLibraryIncludes.SYSTEM_ERROR))
        private val BASIC_STRING_CHAR_TYPE =
            CppTemplateTypeRef.create(TemplateClass.BASIC_STRING, CppPrimitiveTypeRef.CHAR)
        @VisibleForTesting
        internal val STRING_TYPE =
            CppTypeDefRef("::std::string", BASIC_STRING_CHAR_TYPE.includes, BASIC_STRING_CHAR_TYPE)
        private val BYTE_BUFFER_ARRAY_TYPE =
            CppTemplateTypeRef.create(TemplateClass.VECTOR, CppPrimitiveTypeRef.UINT8)
        @VisibleForTesting
        internal val BYTE_BUFFER_POINTER_TYPE =
            CppTemplateTypeRef.create(TemplateClass.SHARED_POINTER, BYTE_BUFFER_ARRAY_TYPE)
    }
}
