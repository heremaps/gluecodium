/*
 * Copyright (C) 2016-2020 HERE Europe B.V.
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

package com.here.gluecodium.generator.jni

import com.here.gluecodium.cli.GluecodiumExecutionException
import com.here.gluecodium.generator.common.NameResolver
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeBasicType.TypeId
import com.here.gluecodium.model.lime.LimeReturnType
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeRef

internal class JniTypeSignatureNameResolver(
    private val baseNameResolver: JniNameResolver,
    private val internalPackages: List<String>,
) : NameResolver {

    override fun resolveName(element: Any) =
        when (element) {
            is LimeType -> resolveTypeSignature(element)
            is LimeTypeRef -> resolveTypeRefSignature(element)
            is LimeReturnType -> resolveTypeRefSignature(element.typeRef)
            else -> throw GluecodiumExecutionException("Unsupported element type ${element.javaClass.name}")
        }

    private fun resolveTypeRefSignature(limeTypeRef: LimeTypeRef): String {
        val limeType = limeTypeRef.type.actualType
        return when {
            limeTypeRef.isNullable && limeType is LimeBasicType -> resolveNullableBasicTypeSignature(limeType.typeId)
            else -> resolveTypeSignature(limeType)
        }
    }

    private fun resolveTypeSignature(limeType: LimeType) =
        when (limeType) {
            is LimeBasicType -> resolveBasicTypeSignature(limeType.typeId)
            else -> "L" + baseNameResolver.resolveName(limeType) + ";"
        }

    private fun resolveBasicTypeSignature(typeId: TypeId) =
        when (typeId) {
            TypeId.VOID -> "V"
            TypeId.INT8 -> "B"
            TypeId.UINT8, TypeId.INT16 -> "S"
            TypeId.UINT16, TypeId.INT32 -> "I"
            TypeId.UINT32, TypeId.INT64, TypeId.UINT64 -> "J"
            TypeId.BOOLEAN -> "Z"
            TypeId.FLOAT -> "F"
            TypeId.DOUBLE -> "D"
            TypeId.STRING -> "Ljava/lang/String;"
            TypeId.BLOB -> "[B"
            TypeId.DATE -> "Ljava/util/Date;"
            TypeId.DURATION -> "L" + internalPackages.joinToString("/") + "/time/Duration;"
            TypeId.LOCALE -> "Ljava/util/Locale;"
        }

    private fun resolveNullableBasicTypeSignature(typeId: TypeId) =
        when (typeId) {
            TypeId.VOID -> "Ljava/lang/Object;"
            TypeId.INT8 -> "Ljava/lang/Byte;"
            TypeId.UINT8, TypeId.INT16 -> "Ljava/lang/Short;"
            TypeId.UINT16, TypeId.INT32 -> "Ljava/lang/Integer;"
            TypeId.UINT32, TypeId.INT64, TypeId.UINT64 -> "Ljava/lang/Long;"
            TypeId.BOOLEAN -> "Ljava/lang/Boolean;"
            TypeId.FLOAT -> "Ljava/lang/Float;"
            TypeId.DOUBLE -> "Ljava/lang/Double;"
            else -> resolveBasicTypeSignature(typeId)
        }
}
