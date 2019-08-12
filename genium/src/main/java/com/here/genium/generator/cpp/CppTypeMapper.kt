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

import com.here.genium.cli.GeniumExecutionException
import com.here.genium.model.cpp.CppComplexTypeRef
import com.here.genium.model.cpp.CppPrimitiveTypeRef
import com.here.genium.model.cpp.CppTemplateTypeRef
import com.here.genium.model.cpp.CppTemplateTypeRef.TemplateClass
import com.here.genium.model.cpp.CppTypeDefRef
import com.here.genium.model.cpp.CppTypeRef
import com.here.genium.model.lime.LimeArray
import com.here.genium.model.lime.LimeAttributeType.CPP
import com.here.genium.model.lime.LimeAttributeValueType.EXTERNAL_TYPE
import com.here.genium.model.lime.LimeBasicType
import com.here.genium.model.lime.LimeBasicType.TypeId
import com.here.genium.model.lime.LimeContainer
import com.here.genium.model.lime.LimeEnumeration
import com.here.genium.model.lime.LimeException
import com.here.genium.model.lime.LimeMap
import com.here.genium.model.lime.LimeSet
import com.here.genium.model.lime.LimeStruct
import com.here.genium.model.lime.LimeType
import com.here.genium.model.lime.LimeTypeDef
import com.here.genium.model.lime.LimeTypeHelper
import com.here.genium.model.lime.LimeTypeRef

class CppTypeMapper(
    private val nameResolver: CppNameResolver,
    private val includeResolver: CppIncludeResolver,
    private val internalNamespace: List<String>
) {
    fun getReturnWrapperType(outArgType: CppTypeRef, errorType: CppTypeRef): CppTypeRef =
        CppTemplateTypeRef(
            TemplateClass.RETURN,
            outArgType,
            errorType,
            namespace = CppNameRules.joinFullyQualifiedName(internalNamespace)
        )

    fun mapType(limeTypeRef: LimeTypeRef): CppTypeRef {
        val result = mapType(limeTypeRef.type)
        val needsOptionalType = limeTypeRef.isNullable && limeTypeRef.type !is LimeContainer
        return if (needsOptionalType) createOptionalType(result) else result
    }

    fun mapInstanceType(
        limeContainer: LimeContainer,
        needsForwardDeclaration: Boolean
    ) = CppComplexTypeRef(
        fullyQualifiedName = nameResolver.getFullyQualifiedName(limeContainer),
        includes = includeResolver.resolveIncludes(limeContainer),
        needsForwardDeclaration = needsForwardDeclaration
    )

    private fun createOptionalType(cppTypeRef: CppTypeRef) =
        CppTemplateTypeRef(
            TemplateClass.OPTIONAL,
            cppTypeRef,
            namespace = CppNameRules.joinFullyQualifiedName(internalNamespace)
        )

    private fun mapType(limeType: LimeType): CppTypeRef =
        when (limeType) {
            is LimeBasicType -> mapPredefined(limeType)
            is LimeTypeDef -> CppTypeDefRef(
                nameResolver.getFullyQualifiedName(limeType),
                includeResolver.resolveIncludes(limeType),
                mapType(limeType.typeRef)
            )
            is LimeStruct -> CppComplexTypeRef(
                nameResolver.getFullyQualifiedName(limeType),
                includeResolver.resolveIncludes(limeType)
            )
            is LimeEnumeration -> CppComplexTypeRef(
                nameResolver.getFullyQualifiedName(limeType),
                includeResolver.resolveIncludes(limeType),
                refersToValueType = true
            )
            is LimeArray ->
                CppTemplateTypeRef(TemplateClass.VECTOR, mapType(limeType.elementType))
            is LimeMap -> {
                val keyType = mapType(limeType.keyType)
                if (hasStdHash(limeType.keyType)) {
                    CppTemplateTypeRef(
                        TemplateClass.MAP,
                        keyType,
                        mapType(limeType.valueType)
                    )
                } else {
                    val hashType = CppTemplateTypeRef(
                        TemplateClass.HASH,
                        keyType,
                        namespace = internalNamespace.joinToString("::")
                    )
                    CppTemplateTypeRef(
                        TemplateClass.MAP,
                        keyType,
                        mapType(limeType.valueType),
                        hashType
                    )
                }
            }
            is LimeContainer -> {
                val instanceType =
                    mapInstanceType(limeType, !limeType.attributes.have(CPP, EXTERNAL_TYPE))
                CppTemplateTypeRef(TemplateClass.SHARED_POINTER, instanceType)
            }
            is LimeSet -> {
                val elementType = mapType(limeType.elementType)
                if (hasStdHash(limeType.elementType)) {
                    CppTemplateTypeRef(TemplateClass.SET, elementType)
                } else {
                    val hashType = CppTemplateTypeRef(
                        TemplateClass.HASH,
                        elementType,
                        namespace = internalNamespace.joinToString("::")
                    )
                    CppTemplateTypeRef(TemplateClass.SET, elementType, hashType)
                }
            }
            is LimeException -> STD_ERROR_CODE_TYPE
            else -> throw GeniumExecutionException("Unmapped type: " + limeType.name)
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
            TypeId.DATE -> DATE_TYPE
        }

    companion object {
        val STD_ERROR_CODE_TYPE: CppTypeRef =
            CppComplexTypeRef("::std::error_code", listOf(CppLibraryIncludes.SYSTEM_ERROR))
        private val BASIC_STRING_CHAR_TYPE =
            CppTemplateTypeRef(TemplateClass.BASIC_STRING, CppPrimitiveTypeRef.CHAR)
        internal val STRING_TYPE =
            CppTypeDefRef("::std::string", BASIC_STRING_CHAR_TYPE.includes, BASIC_STRING_CHAR_TYPE)
        private val BYTE_BUFFER_ARRAY_TYPE =
            CppTemplateTypeRef(TemplateClass.VECTOR, CppPrimitiveTypeRef.UINT8)
        val BYTE_BUFFER_POINTER_TYPE =
            CppTemplateTypeRef(TemplateClass.SHARED_POINTER, BYTE_BUFFER_ARRAY_TYPE)
        private val DATE_TYPE =
            CppComplexTypeRef(
                "::std::chrono::system_clock::time_point",
                listOf(CppLibraryIncludes.CHRONO)
            )

        fun hasStdHash(limeType: LimeTypeRef): Boolean {
            val actualType =
                LimeTypeHelper.getActualType(limeType.type) as? LimeBasicType ?: return false
            return actualType.typeId != TypeId.BLOB && actualType.typeId != TypeId.DATE
        }
    }
}
