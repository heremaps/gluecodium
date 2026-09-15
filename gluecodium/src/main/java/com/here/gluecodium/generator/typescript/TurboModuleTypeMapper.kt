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

import com.here.gluecodium.generator.common.isCallbackListenerInterface
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeBasicType.TypeId
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeTypeRef

/**
 * Maps LIME types to TypeScript types for React Native TurboModule specs (FFI approach).
 *
 * All complex types (structs, classes, interfaces, collections) map to `string` because
 * they pass as opaque handle IDs through the FFI layer. Basic types (number, boolean,
 * string) pass directly.
 */
internal class TurboModuleTypeMapper {
    /** Maps a LIME type reference to its TurboModule spec equivalent, with nullable wrapping. */
    fun mapType(typeRef: LimeTypeRef): String {
        val baseType = mapResolvedType(typeRef)
        if (!typeRef.isNullable) return baseType
        // Function types must be parenthesized before union: (() => void) | null
        // Without parens, `() => void | null` is parsed as returning `void | null`.
        return if (baseType.contains("=>")) "($baseType) | null" else "$baseType | null"
    }

    /** Maps return type — in FFI approach, classes/interfaces return string handles. */
    fun mapReturnType(typeRef: LimeTypeRef): String {
        val type = typeRef.type.actualType
        // Classes, interfaces, and structs all return opaque handle strings via FFI
        if (type is LimeInterface || type is LimeClass || type is LimeStruct) {
            return if (typeRef.isNullable) "string | null" else "string"
        }
        // Lambda/callback objects are opaque handles in FFI — return as string
        if (type is LimeLambda) return if (typeRef.isNullable) "string | null" else "string"
        return mapType(typeRef)
    }

    /** Formats a method as `readonly name: (params) => ReturnType;` per Pure C++ TurboModule syntax. */
    fun formatMethodSignature(
        name: String,
        params: String,
        returnType: String,
    ): String = "readonly $name: ($params) => $returnType;"

    private fun mapResolvedType(typeRef: LimeTypeRef): String =
        when (val type = typeRef.type.actualType) {
            is LimeBasicType -> mapBasicType(type.typeId)
            // All complex types pass as opaque handle strings via FFI
            is LimeStruct -> "string"
            is LimeClass -> "string"
            is LimeInterface -> {
                // Single-method interfaces (listeners): map as callback function type
                // Multi-method listeners: object of optional callbacks (Phase 23.5)
                // Other multi-method interfaces: opaque handle string
                if (type.functions.size == 1 && type.functions[0].parameters.size <= 3) {
                    mapInterfaceAsCallback(type)
                } else if (type.isCallbackListenerInterface()) {
                    // Multi-method listener: opaque object of callbacks. RN Codegen rejects object types
                    // with function-typed properties, so the spec param is the generic `Object`
                    // (→ jsi::Object); the C++ proxy reads each callback property by name (Phase 23.5).
                    "Object"
                } else {
                    "string"
                }
            }
            is LimeList -> "ReadonlyArray<${mapListElementTypeForSpec(type.elementType)}>"
            is LimeSet -> "ReadonlyArray<${mapListElementTypeForSpec(type.elementType)}>"
            // A map crosses the TurboModule boundary as an array of [key, value] tuples. Each side
            // uses the scalar/handle spec representation (number / string) so RN Codegen accepts it;
            // the idiomatic wrapper re-exposes a real Map<K,V> (spec task 15.3).
            is LimeMap ->
                "ReadonlyArray<[${mapListElementTypeForSpec(type.keyType)}, " +
                    "${mapListElementTypeForSpec(type.valueType)}]>"
            is LimeEnumeration -> "number"
            is LimeLambda -> mapLambdaAsInlineFunction(type)
            else -> "Object"
        }

    private fun mapBasicType(typeId: TypeId): String =
        when (typeId) {
            TypeId.VOID -> "void"
            TypeId.BOOLEAN -> "boolean"
            TypeId.STRING -> "string"
            TypeId.BLOB -> "string"
            TypeId.DATE -> "number"
            TypeId.LOCALE -> "string"
            TypeId.DURATION -> "number"
            else -> "number"
        }

    private fun mapLambdaAsInlineFunction(lambda: LimeLambda): String {
        val params =
            lambda.parameters.joinToString(", ") { param ->
                "${param.path.name}: ${mapType(param.typeRef)}"
            }
        val returnType = lambda.returnType.typeRef
        val mappedReturn =
            when (returnType.type.actualType) {
                is LimeLambda, is LimeInterface -> "Object"
                else -> mapType(returnType)
            }
        return "($params) => $mappedReturn"
    }

    private fun mapInterfaceAsCallback(iface: LimeInterface): String {
        val lastFunction = iface.functions.lastOrNull() ?: return "() => void"
        val params =
            lastFunction.parameters.joinToString(", ") { param ->
                "${param.path.name}: ${mapType(param.typeRef)}"
            }
        val returnActualType = lastFunction.returnType.typeRef.type.actualType
        val returnType =
            when (returnActualType) {
                is LimeLambda, is LimeInterface -> "Object"
                else -> mapType(lastFunction.returnType.typeRef)
            }
        return "($params) => $returnType"
    }

    /** Maps a list/set element type to its TS spec representation (no nested arrays). */
    private fun mapListElementTypeForSpec(typeRef: LimeTypeRef): String =
        when (val type = typeRef.type.actualType) {
            is LimeBasicType -> mapBasicType(type.typeId)
            is LimeEnumeration -> "number"
            else -> "string" // struct, class, interface, nested collections → opaque handle
        }
}
