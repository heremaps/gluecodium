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

package com.here.gluecodium.generator.reactnative

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
 * Maps LIME types to JSI (JavaScript Interface) types for TurboModule method signatures.
 * JSI types are what appear in the C++ TurboModule method parameters and return types.
 *
 * Key: All numeric LIME types → `double` (JSI only supports double for numbers).
 */
internal class ReactNativeJsiTypeMapper {
    /** Maps a LIME type to the JSI type used in method parameters. */
    fun mapType(typeRef: LimeTypeRef): String {
        val baseType = mapResolvedType(typeRef, isReturnContext = false)
        return if (typeRef.isNullable) "std::optional<$baseType>" else baseType
    }

    /** Maps a LIME type to the JSI type used in method return types. */
    fun mapReturnType(typeRef: LimeTypeRef): String {
        val baseType = mapResolvedType(typeRef, isReturnContext = true)
        return if (typeRef.isNullable) "std::optional<$baseType>" else baseType
    }

    private fun mapResolvedType(
        typeRef: LimeTypeRef,
        isReturnContext: Boolean,
    ): String =
        when (val type = typeRef.type.actualType) {
            is LimeBasicType -> mapBasicType(type.typeId)
            // All complex types pass as FfiOpaqueHandle (opaque pointer) via FFI,
            // represented as string keys in the JS handle registry.
            is LimeStruct -> "jsi::String"
            is LimeEnumeration -> "double"
            is LimeLambda -> if (isReturnContext) "jsi::String" else "jsi::Function"
            is LimeInterface ->
                when {
                    isReturnContext -> "jsi::String"
                    type.functions.size == 1 && type.functions[0].parameters.size <= 3 -> "jsi::Function"
                    type.isCallbackListenerInterface() -> "jsi::Object" // multi-method listener: object of callbacks
                    else -> "jsi::String" // object interface: pass as handle
                }
            is LimeClass -> "jsi::String"
            is LimeList -> "jsi::Array"
            is LimeSet -> "jsi::Array"
            // A map crosses the boundary as an array of [key, value] tuples (jsi::Array of
            // 2-element jsi::Array). See FfiMethodBodyBuilder map marshalling (spec task 15.3).
            is LimeMap -> "jsi::Array"
            else -> "jsi::Value"
        }

    private fun mapBasicType(typeId: TypeId): String =
        when (typeId) {
            TypeId.VOID -> "void"
            TypeId.BOOLEAN -> "bool"
            TypeId.STRING -> "jsi::String"
            TypeId.BLOB -> "jsi::String" // Blob is base64 string in TS/JSI
            TypeId.LOCALE -> "jsi::String" // Locale is opaque handle string in TS/JSI
            else -> "double"
        }
}
