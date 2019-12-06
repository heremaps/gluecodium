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
import com.here.gluecodium.generator.common.NameRules
import com.here.gluecodium.model.lime.LimeAttributeType.CPP
import com.here.gluecodium.model.lime.LimeAttributeValueType.ACCESSORS
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeBasicType.TypeId
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeRef
import com.here.gluecodium.model.lime.LimeTypesCollection

internal class FfiCppNameResolver(
    private val limeReferenceMap: Map<String, LimeElement>,
    private val nameRules: NameRules,
    internalNamespace: List<String>
) : NameResolver {

    private val internalNamespace = internalNamespace.joinToString("::")

    override fun resolveName(element: Any): String =
        when (element) {
            is LimeTypeRef -> getTypeRefName(element)
            is LimeType -> getTypeName(element.actualType)
            is LimeField -> getFieldName(element)
            is LimeNamedElement -> nameRules.getName(element)
            else ->
                throw GluecodiumExecutionException("Unsupported element type ${element.javaClass.name}")
        }

    private fun getTypeRefName(limeTypeRef: LimeTypeRef): String {
        val limeType = limeTypeRef.type.actualType
        val typeName = getTypeName(limeType)
        return when {
            limeType is LimeContainerWithInheritance -> "std::shared_ptr<$typeName>"
            limeTypeRef.isNullable -> "$internalNamespace::optional<$typeName>"
            else -> typeName
        }
    }

    private fun getTypeName(limeType: LimeType): String =
        when (limeType) {
            is LimeBasicType -> getBasicTypeName(limeType)
            is LimeList -> "std::vector<${getTypeRefName(limeType.elementType)}>"
            is LimeSet -> "std::unordered_set<${getTypeRefName(limeType.elementType)}>"
            is LimeMap -> {
                val keyTypeName = getTypeRefName(limeType.keyType)
                val valueTypeName = getTypeRefName(limeType.valueType)
                "std::unordered_map<$keyTypeName, $valueTypeName>"
            }
            else -> getFullyQualifiedName(limeType)
        }

    private fun getBasicTypeName(limeType: LimeBasicType) =
        when (limeType.typeId) {
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
        }

    private fun getFullyQualifiedName(limeElement: LimeNamedElement): String {
        val prefix = when {
            limeElement.path.hasParent -> {
                val parentElement = getParentElement(limeElement)
                when (parentElement) {
                    is LimeTypesCollection -> ""
                    else -> getFullyQualifiedName(parentElement)
                }
            }
            else -> limeElement.path.head.joinToString("::")
        }

        val elementName = nameRules.getName(limeElement)

        return "$prefix::$elementName"
    }

    private fun getFieldName(limeField: LimeField) =
        when {
            getParentElement(limeField).attributes.have(CPP, ACCESSORS) ->
                nameRules.getGetterName(limeField) + "()"
            else -> nameRules.getName(limeField)
        }

    private fun getParentElement(limeElement: LimeNamedElement) =
        (limeReferenceMap[limeElement.path.parent.toString()] as? LimeNamedElement
                ?: throw GluecodiumExecutionException(
                    "Failed to resolve parent for element ${limeElement.fullName}"
                ))
}
