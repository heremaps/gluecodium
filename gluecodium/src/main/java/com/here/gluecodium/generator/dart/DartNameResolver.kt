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
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeBasicType.TypeId
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeGenericType
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeTypeRef
import com.here.gluecodium.model.lime.LimeValue
import com.here.gluecodium.model.lime.LimeVisibility

internal class DartNameResolver(
    private val limeReferenceMap: Map<String, LimeElement>,
    private val nameRules: NameRules
) : NameResolver {

    override fun resolveName(element: Any): String =
        when (element) {
            is LimeVisibility -> resolveVisibility(element)
            is LimeBasicType -> resolveBasicType(element)
            is LimeValue -> resolveValue(element)
            is LimeGenericType -> resolveGenericType(element)
            is LimeTypeRef -> resolveName(element.type)
            is LimeTypeAlias -> resolveName(element.typeRef)
            is LimeElement -> nameRules.getName(element)
            else ->
                throw GluecodiumExecutionException("Unsupported element type ${element.javaClass.name}")
        }

    private fun resolveVisibility(limeVisibility: LimeVisibility) =
        when (limeVisibility) {
            LimeVisibility.INTERNAL -> "_"
            else -> ""
        }

    private fun resolveBasicType(limeBasicType: LimeBasicType) =
        when (limeBasicType.typeId) {
            TypeId.VOID -> "void"
            TypeId.INT8, TypeId.UINT8, TypeId.INT16, TypeId.UINT16,
            TypeId.INT32, TypeId.UINT32, TypeId.INT64, TypeId.UINT64 -> "int"
            TypeId.BOOLEAN -> "bool"
            TypeId.FLOAT, TypeId.DOUBLE -> "double"
            TypeId.STRING -> "String"
            TypeId.BLOB -> "List<int>"
            TypeId.DATE -> "DateTime"
        }

    private fun resolveValue(limeValue: LimeValue) =
        when (limeValue) {
            is LimeValue.Literal -> limeValue.toString()
            is LimeValue.Enumerator -> {
                val enumerator = limeValue.valueRef.enumerator
                val enumeration = limeReferenceMap[enumerator.path.parent.toString()]
                    ?: throw GluecodiumExecutionException(
                        "Failed to resolve enumeration for enumerator ${enumerator.fullName}"
                    )
                "${resolveName(enumeration)}.${resolveName(enumerator)}"
            }
            is LimeValue.Special -> TODO()
            is LimeValue.Null -> TODO()
            is LimeValue.InitializerList -> TODO()
            is LimeValue.KeyValuePair -> TODO()
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
}
