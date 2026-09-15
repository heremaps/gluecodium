/*
 * Copyright (C) 2016-2026 HERE Europe B.V.
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

package com.here.gluecodium.generator.typescript

import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeBasicType.TypeId
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeTypeRef

/**
 * Maps LIME types to TypeScript type strings for general TypeScript declarations.
 *
 * Note: TurboModule spec type mapping has additional constraints (no Map, Set, Uint8Array, Date,
 * custom enum). See [TurboModuleTypeMapper] for that context.
 */
internal class TypeScriptTypeMapper {
    /** Maps a LIME type reference to its TypeScript equivalent, including nullable wrapping. */
    fun mapType(typeRef: LimeTypeRef): String {
        val baseType = mapResolvedType(typeRef)
        return if (typeRef.isNullable) "$baseType | null" else baseType
    }

    /** Extracts struct fields as name/type/nullable maps for Mustache template consumption. */
    fun mapStructFields(struct: LimeStruct): List<Map<String, Any>> =
        struct.fields.map { field ->
            mapOf(
                "name" to field.path.name,
                "type" to mapType(field.typeRef),
                "isNullable" to field.typeRef.isNullable,
            )
        }

    private fun mapResolvedType(typeRef: LimeTypeRef): String =
        when (val type = typeRef.type.actualType) {
            is LimeBasicType -> mapBasicType(type.typeId)
            is LimeList -> {
                val elementTs = mapType(type.elementType)
                val wrapped = if (type.elementType.isNullable) "($elementTs)" else elementTs
                "$wrapped[]"
            }
            is LimeSet -> "Set<${mapType(type.elementType)}>"
            is LimeMap -> "Map<${mapType(type.keyType)}, ${mapType(type.valueType)}>"
            is LimeStruct -> type.path.name
            is LimeEnumeration -> type.path.name
            is LimeLambda -> mapLambdaType(type)
            else -> type.name
        }

    private fun mapBasicType(typeId: TypeId): String =
        when (typeId) {
            TypeId.VOID -> "void"
            TypeId.BOOLEAN -> "boolean"
            TypeId.STRING -> "string"
            TypeId.BLOB -> "Uint8Array"
            TypeId.DATE -> "Date"
            TypeId.LOCALE -> "string"
            TypeId.DURATION -> "number"
            else -> "number"
        }

    private fun mapLambdaType(lambda: LimeLambda): String {
        val params =
            lambda.parameters.joinToString(", ") { param ->
                "${param.path.name}: ${mapType(param.typeRef)}"
            }
        val returnType = mapType(lambda.returnType.typeRef)
        return "($params) => $returnType"
    }
}
