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

package com.here.gluecodium.generator.dart

import com.here.gluecodium.cli.GluecodiumExecutionException
import com.here.gluecodium.generator.common.NameResolver
import com.here.gluecodium.generator.common.NameRules
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeBasicType.TypeId
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeGenericType
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeTypeRef
import com.here.gluecodium.model.lime.LimeTypesCollection
import com.here.gluecodium.model.lime.LimeValue
import com.here.gluecodium.model.lime.LimeVisibility

internal class DartNameResolver(
    private val limeReferenceMap: Map<String, LimeElement>,
    private val nameRules: NameRules
) : NameResolver {

    override fun resolveName(element: Any): String =
        when (element) {
            is TypeId -> resolveBasicType(element)
            is LimeVisibility -> resolveVisibility(element)
            is LimeBasicType -> resolveBasicType(element.typeId)
            is LimeValue -> resolveValue(element)
            is LimeGenericType -> resolveGenericType(element)
            is LimeTypeRef -> resolveName(element.type)
            is LimeTypeAlias -> resolveName(element.typeRef)
            is LimeType -> resolveType(element)
            is LimeNamedElement -> getPlatformName(element)
            else ->
                throw GluecodiumExecutionException("Unsupported element type ${element.javaClass.name}")
        }

    private fun resolveVisibility(limeVisibility: LimeVisibility) =
        when (limeVisibility) {
            LimeVisibility.INTERNAL -> "_"
            else -> ""
        }

    private fun resolveBasicType(typeId: TypeId) =
        when (typeId) {
            TypeId.VOID -> "void"
            TypeId.INT8, TypeId.UINT8, TypeId.INT16, TypeId.UINT16,
            TypeId.INT32, TypeId.UINT32, TypeId.INT64, TypeId.UINT64 -> "int"
            TypeId.BOOLEAN -> "bool"
            TypeId.FLOAT, TypeId.DOUBLE -> "double"
            TypeId.STRING -> "String"
            TypeId.BLOB -> "Uint8List"
            TypeId.DATE -> "DateTime"
        }

    private fun resolveValue(limeValue: LimeValue): String =
        when (limeValue) {
            is LimeValue.Literal -> limeValue.toString()
            is LimeValue.Enumerator -> {
                val enumerator = limeValue.valueRef.enumerator
                val enumeration = getParentElement(enumerator)
                "${resolveName(enumeration)}.${resolveName(enumerator)}"
            }
            is LimeValue.Special -> {
                val specialName = when (limeValue.value) {
                    LimeValue.Special.ValueId.NAN -> "nan"
                    LimeValue.Special.ValueId.INFINITY -> "infinity"
                    LimeValue.Special.ValueId.NEGATIVE_INFINITY -> "negativeInfinity"
                }
                "double.$specialName"
            }
            is LimeValue.Null -> "null"
            is LimeValue.InitializerList -> {
                val actualType = limeValue.typeRef.type.actualType
                val prefix: String
                val postfix: String
                when (actualType) {
                    is LimeStruct -> {
                        val useDefaultsConstructor =
                            actualType.fields.isNotEmpty() && limeValue.values.isEmpty()
                        val constructorName = if (useDefaultsConstructor) ".withDefaults" else ""
                        prefix = "${resolveName(actualType)}$constructorName("
                        postfix = ")"
                    }
                    is LimeList -> {
                        prefix = "["
                        postfix = "]"
                    }
                    else -> {
                        prefix = "{"
                        postfix = "}"
                    }
                }
                limeValue.values.joinToString(
                    prefix = prefix,
                    postfix = postfix,
                    separator = ", "
                ) { resolveValue(it) }
            }
            is LimeValue.KeyValuePair ->
                "${resolveValue(limeValue.key)}: ${resolveValue(limeValue.value)}"
        }

    private fun resolveGenericType(limeType: LimeGenericType) =
        when (limeType) {
            is LimeList -> "List<${resolveName(limeType.elementType)}>"
            is LimeMap ->
                "Map<${resolveName(limeType.keyType)}, ${resolveName(limeType.valueType)}>"
            is LimeSet -> "Set<${resolveName(limeType.elementType)}>"
            else -> throw GluecodiumExecutionException(
                "Unsupported element type ${limeType.javaClass.name}"
            )
        }

    private fun resolveType(limeType: LimeType): String {
        val typeName = getPlatformName(limeType)
        val parentType = if (limeType.path.hasParent) getParentElement(limeType) else null
        return when (parentType) {
            null -> listOf(typeName)
            is LimeTypesCollection -> listOf(typeName)
            else -> listOf(resolveName(parentType), typeName)
        }.joinToString("_")
    }

    private fun getPlatformName(element: LimeNamedElement) =
        element.attributes.get(LimeAttributeType.DART, LimeAttributeValueType.NAME)
            ?: nameRules.getName(element)

    private fun getParentElement(limeElement: LimeNamedElement) =
        (limeReferenceMap[limeElement.path.parent.toString()] as? LimeNamedElement
                ?: throw GluecodiumExecutionException(
                    "Failed to resolve parent for element ${limeElement.fullName}"
                ))
}
