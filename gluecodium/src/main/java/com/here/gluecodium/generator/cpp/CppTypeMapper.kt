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

package com.here.gluecodium.generator.cpp

import com.here.gluecodium.cli.GluecodiumExecutionException
import com.here.gluecodium.model.cpp.CppComplexTypeRef
import com.here.gluecodium.model.cpp.CppFunctionTypeRef
import com.here.gluecodium.model.cpp.CppPrimitiveTypeRef
import com.here.gluecodium.model.cpp.CppTemplateTypeRef
import com.here.gluecodium.model.cpp.CppTemplateTypeRef.TemplateClass
import com.here.gluecodium.model.cpp.CppTypeDefRef
import com.here.gluecodium.model.cpp.CppTypeRef
import com.here.gluecodium.model.lime.LimeAttributeType.CPP
import com.here.gluecodium.model.lime.LimeAttributeValueType.EXTERNAL_TYPE
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeBasicType.TypeId
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeReturnType
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeTypeRef

class CppTypeMapper(
    private val nameResolver: CppNameResolver,
    private val includeResolver: CppIncludeResolver,
    private val internalNamespace: List<String>
) {
    private val basicStringCharType =
        createTemplateTypeRef(TemplateClass.BASIC_STRING, CppPrimitiveTypeRef.CHAR)
    private val stringType =
        CppTypeDefRef("::std::string", basicStringCharType.includes, basicStringCharType)
    private val blobArrayType =
        createTemplateTypeRef(TemplateClass.VECTOR, CppPrimitiveTypeRef.UINT8)
    private val blobPointerType =
        createTemplateTypeRef(TemplateClass.SHARED_POINTER, blobArrayType)
    private val dateType = CppComplexTypeRef(
        "::std::chrono::system_clock::time_point",
        listOf(
            CppLibraryIncludes.CHRONO,
            includeResolver.createInternalNamespaceInclude("TimePointHash.h")
        )
    )

    private fun getReturnWrapperType(outArgType: CppTypeRef, errorType: CppTypeRef): CppTypeRef =
        createTemplateTypeRef(
            TemplateClass.RETURN,
            outArgType,
            errorType,
            namespace = CppNameRules.joinFullyQualifiedName(internalNamespace)
        )

    fun mapType(limeTypeRef: LimeTypeRef): CppTypeRef {
        val result = mapType(limeTypeRef.type)
        val needsOptionalType =
            limeTypeRef.isNullable && limeTypeRef.type !is LimeContainerWithInheritance
        return if (needsOptionalType) createOptionalType(result) else result
    }

    fun mapInstanceType(
        limeContainer: LimeContainerWithInheritance,
        needsForwardDeclaration: Boolean
    ) = CppComplexTypeRef(
        fullyQualifiedName = nameResolver.getFullyQualifiedName(limeContainer),
        includes = includeResolver.resolveIncludes(limeContainer),
        needsForwardDeclaration = needsForwardDeclaration
    )

    fun mapLambda(limeLambda: LimeLambda): CppTypeRef =
        CppFunctionTypeRef(
            limeLambda.parameters.map { mapType(it.typeRef) },
            mapType(limeLambda.returnType.typeRef)
        )

    fun mapReturnType(returnType: LimeReturnType, exceptionType: LimeException?): CppTypeRef {
        val cppReturnType = mapType(returnType.typeRef)
        val errorTypeIsEnum = exceptionType?.errorType?.type?.actualType is LimeEnumeration
        return when {
            exceptionType == null -> cppReturnType
            errorTypeIsEnum && cppReturnType == CppPrimitiveTypeRef.VOID -> STD_ERROR_CODE_TYPE
            errorTypeIsEnum -> getReturnWrapperType(cppReturnType, STD_ERROR_CODE_TYPE)
            else -> getReturnWrapperType(cppReturnType, mapType(exceptionType.errorType))
        }
    }

    private fun createOptionalType(cppTypeRef: CppTypeRef) =
        createTemplateTypeRef(
            TemplateClass.OPTIONAL,
            cppTypeRef,
            namespace = CppNameRules.joinFullyQualifiedName(internalNamespace)
        )

    private fun mapType(limeType: LimeType): CppTypeRef =
        when (limeType) {
            is LimeBasicType -> mapPredefined(limeType)
            is LimeTypeAlias -> CppTypeDefRef(
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
            is LimeList ->
                createTemplateTypeRef(TemplateClass.VECTOR, mapType(limeType.elementType))
            is LimeMap -> {
                val keyType = mapType(limeType.keyType)
                if (CppLibraryIncludes.hasStdHash(limeType.keyType)) {
                    createTemplateTypeRef(
                        TemplateClass.MAP,
                        keyType,
                        mapType(limeType.valueType)
                    )
                } else {
                    val hashType = createTemplateTypeRef(
                        TemplateClass.HASH,
                        keyType,
                        namespace = internalNamespace.joinToString("::")
                    )
                    createTemplateTypeRef(
                        TemplateClass.MAP,
                        keyType,
                        mapType(limeType.valueType),
                        hashType
                    )
                }
            }
            is LimeContainerWithInheritance -> {
                val isTopLevel = !limeType.path.hasParent
                val isExternal = limeType.attributes.have(CPP, EXTERNAL_TYPE)
                val instanceType = mapInstanceType(
                    limeContainer = limeType,
                    // C++ does not allow forward declarations for nested classes, so only top-level
                    // classes are considered here.
                    needsForwardDeclaration = isTopLevel && !isExternal
                )
                createTemplateTypeRef(TemplateClass.SHARED_POINTER, instanceType)
            }
            is LimeSet -> {
                val elementType = mapType(limeType.elementType)
                if (CppLibraryIncludes.hasStdHash(limeType.elementType)) {
                    createTemplateTypeRef(TemplateClass.SET, elementType)
                } else {
                    val hashType = createTemplateTypeRef(
                        TemplateClass.HASH,
                        elementType,
                        namespace = internalNamespace.joinToString("::")
                    )
                    createTemplateTypeRef(TemplateClass.SET, elementType, hashType)
                }
            }
            is LimeLambda -> CppTypeDefRef(
                nameResolver.getFullyQualifiedName(limeType),
                includeResolver.resolveIncludes(limeType),
                mapLambda(limeType)
            )
            else -> throw GluecodiumExecutionException("Unmapped type: " + limeType.name)
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
            TypeId.STRING -> stringType
            TypeId.BLOB -> blobPointerType
            TypeId.DATE -> dateType
            TypeId.LOCALE -> TODO()
        }

    private fun createTemplateTypeRef(
        templateClass: TemplateClass,
        vararg parameters: CppTypeRef,
        namespace: String? = templateClass.namespace
    ): CppTemplateTypeRef {
        val includes = when (templateClass) {
            TemplateClass.SHARED_POINTER -> listOf(CppLibraryIncludes.MEMORY)
            TemplateClass.MAP -> listOf(
                CppLibraryIncludes.MAP,
                includeResolver.createInternalNamespaceInclude("UnorderedMapHash.h")
            )
            TemplateClass.VECTOR -> listOf(
                CppLibraryIncludes.VECTOR,
                includeResolver.createInternalNamespaceInclude("VectorHash.h")
            )
            TemplateClass.BASIC_STRING -> listOf(CppLibraryIncludes.STRING)
            TemplateClass.RETURN ->
                listOf(includeResolver.createInternalNamespaceInclude("Return.h"))
            TemplateClass.OPTIONAL ->
                listOf(includeResolver.createInternalNamespaceInclude("Optional.h"))
            TemplateClass.SET -> listOf(
                CppLibraryIncludes.SET,
                includeResolver.createInternalNamespaceInclude("UnorderedSetHash.h")
            )
            TemplateClass.HASH -> listOf(includeResolver.hashInclude)
        }
        return CppTemplateTypeRef(templateClass, includes, *parameters, namespace = namespace)
    }

    companion object {
        val STD_ERROR_CODE_TYPE: CppTypeRef =
            CppComplexTypeRef("::std::error_code", listOf(CppLibraryIncludes.SYSTEM_ERROR))
    }
}
