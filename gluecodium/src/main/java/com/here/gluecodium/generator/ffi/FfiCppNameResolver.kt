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
import com.here.gluecodium.generator.common.NameResolver
import com.here.gluecodium.generator.common.ReferenceMapBasedResolver
import com.here.gluecodium.generator.cpp.CppLibraryIncludes
import com.here.gluecodium.generator.cpp.CppNameCache
import com.here.gluecodium.generator.cpp.CppNameRules
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeType.CPP
import com.here.gluecodium.model.lime.LimeAttributeValueType.ACCESSORS
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeBasicType.TypeId
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeExternalDescriptor.Companion.GETTER_NAME_NAME
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeGenericType
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeProperty
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeRef

internal class FfiCppNameResolver(
    limeReferenceMap: Map<String, LimeElement>,
    nameRules: CppNameRules,
    rootNamespace: List<String>,
    internalNamespace: List<String>
) : ReferenceMapBasedResolver(limeReferenceMap), NameResolver {

    private val cppNameResolver = CppNameCache(rootNamespace, limeReferenceMap, nameRules)
    private val internalNamespace = internalNamespace.joinToString("::")

    override fun resolveName(element: Any): String =
        when (element) {
            is TypeId -> getBasicTypeName(element)
            is LimeTypeRef -> getTypeRefName(element)
            is LimeField -> getFieldName(element)
            is LimeException -> getExceptionTypeName(element)
            is LimeType -> getTypeName(element.actualType)
            is LimeFunction -> getFunctionName(element)
            is LimeNamedElement -> cppNameResolver.getName(element)
            else ->
                throw GluecodiumExecutionException("Unsupported element type ${element.javaClass.name}")
        }

    override fun resolveGetterName(element: Any) =
        when (element) {
            is LimeField -> cppNameResolver.getGetterName(element)
            else ->
                throw GluecodiumExecutionException("Unsupported element type ${element.javaClass.name}")
        }

    override fun resolveSetterName(element: Any) =
        when (element) {
            is LimeField -> cppNameResolver.getSetterName(element)
            else ->
                throw GluecodiumExecutionException("Unsupported element type ${element.javaClass.name}")
        }

    private fun getTypeRefName(limeTypeRef: LimeTypeRef): String {
        val limeType = limeTypeRef.type.actualType
        val typeName = getTypeName(limeType, isOptimized = limeTypeRef.attributes.have(LimeAttributeType.OPTIMIZED))
        return when {
            limeType is LimeContainerWithInheritance -> "std::shared_ptr<$typeName>"
            limeTypeRef.isNullable -> "$internalNamespace::optional<$typeName>"
            else -> typeName
        }
    }

    private fun getTypeName(limeType: LimeType, isOptimized: Boolean = false): String =
        when (limeType) {
            is LimeBasicType -> getBasicTypeName(limeType.typeId)
            is LimeGenericType -> getGenericTypeName(limeType, isOptimized)
            else -> cppNameResolver.getFullyQualifiedName(limeType)
        }

    private fun getExceptionTypeName(limeException: LimeException) =
        when (val errorType = limeException.errorType.type.actualType) {
            is LimeEnumeration -> "std::error_code"
            else -> getTypeName(errorType)
        }

    private fun getBasicTypeName(typeId: TypeId) =
        when (typeId) {
            TypeId.VOID -> "void"
            TypeId.INT8 -> "int8_t"
            TypeId.UINT8 -> "uint8_t"
            TypeId.INT16 -> "int16_t"
            TypeId.UINT16 -> "uint16_t"
            TypeId.INT32 -> "int32_t"
            TypeId.UINT32 -> "uint32_t"
            TypeId.INT64 -> "int64_t"
            TypeId.UINT64 -> "uint64_t"
            TypeId.BOOLEAN -> "bool"
            TypeId.FLOAT -> "float"
            TypeId.DOUBLE -> "double"
            TypeId.STRING -> "std::string"
            TypeId.BLOB -> "std::shared_ptr<std::vector<uint8_t>>"
            TypeId.DATE -> "std::chrono::system_clock::time_point"
            TypeId.LOCALE -> "$internalNamespace::Locale"
        }

    private fun getFieldName(limeField: LimeField) =
        when {
            getParentElement(limeField).attributes.have(CPP, ACCESSORS) ->
                cppNameResolver.getGetterName(limeField) + "()"
            else -> limeField.external?.cpp?.get(GETTER_NAME_NAME)?.let { "$it()" }
                ?: cppNameResolver.getName(limeField)
        }

    private fun getFunctionName(limeFunction: LimeFunction): String {
        val parentElement = getParentElement(limeFunction)
        return when {
            parentElement is LimeLambda -> "operator()"
            parentElement !is LimeProperty -> cppNameResolver.getName(limeFunction)
            limeFunction === parentElement.getter -> cppNameResolver.getGetterName(parentElement)
            limeFunction === parentElement.setter -> cppNameResolver.getSetterName(parentElement)
            else ->
                throw GluecodiumExecutionException("Invalid property accessor ${limeFunction.path}")
        }
    }

    private fun getGenericTypeName(limeType: LimeGenericType, isOptimized: Boolean): String {
        val templateName: String
        val templateParameters: List<String>
        when (limeType) {
            is LimeList -> {
                templateName = "vector"
                val elementName = when {
                    isOptimized && limeType.elementType.type.actualType !is LimeContainerWithInheritance ->
                        "::std::shared_ptr< ${resolveName(limeType.elementType)} >"
                    else -> resolveName(limeType.elementType)
                }
                templateParameters = listOf(elementName)
            }
            is LimeSet -> {
                templateName = "unordered_set"
                val typeName = resolveName(limeType.elementType)
                templateParameters = when {
                    CppLibraryIncludes.hasStdHash(limeType.elementType) -> listOf(typeName)
                    else -> listOf(typeName, "$internalNamespace::hash<$typeName>")
                }
            }
            is LimeMap -> {
                templateName = "unordered_map"
                val keyTypeName = resolveName(limeType.keyType)
                val valueTypeName = resolveName(limeType.valueType)
                templateParameters = when {
                    CppLibraryIncludes.hasStdHash(limeType.keyType) -> listOf(keyTypeName, valueTypeName)
                    else -> listOf(keyTypeName, valueTypeName, "$internalNamespace::hash<$keyTypeName>")
                }
            }
            else ->
                throw GluecodiumExecutionException("Unsupported element type ${limeType.javaClass.name}")
        }

        return "std::$templateName<${templateParameters.joinToString(", ")}>"
    }
}
