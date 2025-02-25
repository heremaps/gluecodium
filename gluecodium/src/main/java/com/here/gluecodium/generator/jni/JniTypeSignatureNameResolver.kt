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
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeBasicType.TypeId
import com.here.gluecodium.model.lime.LimeExternalDescriptor
import com.here.gluecodium.model.lime.LimeReturnType
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeRef

internal class JniTypeSignatureNameResolver(
    private val baseNameResolver: JniNameResolver,
    private val internalPackages: List<String>,
    private val platformAttribute: LimeAttributeType,
) : NameResolver {
    private val kotlinSpecificResolver = JniKotlinSpecificSignatureResolver()

    override fun resolveName(element: Any) =
        when (element) {
            is String -> resolveExternalStringName(element)
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

    private fun resolveExternalStringName(typeName: String): String {
        return if (kotlinSpecificResolver.isBasicKotlinType(typeName)) {
            kotlinSpecificResolver.resolveExternalKotlinName(typeName)
        } else {
            "L" + baseNameResolver.resolveName(typeName) + ";"
        }
    }

    private fun resolveTypeSignature(limeType: LimeType): String {
        val externalName = limeType.external?.getFor(platformAttribute)?.get(LimeExternalDescriptor.NAME_NAME)
        if (externalName != null) {
            return resolveExternalStringName(externalName)
        }

        return when (limeType) {
            is LimeBasicType -> resolveBasicTypeSignature(limeType.typeId)
            else -> "L" + baseNameResolver.resolveName(limeType) + ";"
        }
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

    inner class JniKotlinSpecificSignatureResolver {
        fun isBasicKotlinType(typeName: String): Boolean {
            val rawTypeName = if (isNullable(typeName)) typeName.dropLast(1) else typeName
            return KOTLIN_FUNDAMENTALS.contains(rawTypeName)
        }

        private fun isNullable(typeName: String) = typeName.endsWith("?")

        fun resolveExternalKotlinName(typeName: String): String {
            val isTypeNullable = isNullable(typeName)
            val rawTypeName = if (isTypeNullable) typeName.dropLast(1) else typeName
            val typeId = KOTLIN_FUNDAMENTALS_TYPE_ID[rawTypeName]

            if (typeId != null) {
                return if (isTypeNullable) {
                    resolveNullableBasicTypeSignature(typeId)
                } else {
                    resolveBasicTypeSignature(typeId)
                }
            }

            // Certain basic types are not represented as Gluecodium types e.g. Char.
            return if (isTypeNullable) {
                resolveNullableExternalKotlinNameWithoutTypeId(typeName)
            } else {
                resolveExternalKotlinNameWithoutTypeId(typeName)
            }
        }

        private fun resolveExternalKotlinNameWithoutTypeId(typeName: String): String {
            return when (typeName) {
                "kotlin.Char" -> "C"
                else -> throw GluecodiumExecutionException("Unsupported basic Kotlin type: $typeName")
            }
        }

        private fun resolveNullableExternalKotlinNameWithoutTypeId(typeName: String): String {
            return when (typeName) {
                "kotlin.Char" -> "Ljava/lang/Char;"
                else -> throw GluecodiumExecutionException("Unsupported basic Kotlin type: $typeName")
            }
        }
    }

    companion object {
        val KOTLIN_FUNDAMENTALS =
            setOf(
                "kotlin.Boolean", "kotlin.Byte", "kotlin.Short", "kotlin.Int",
                "kotlin.Long", "kotlin.Float", "kotlin.Double", "kotlin.String", "kotlin.Char",
            )

        val KOTLIN_FUNDAMENTALS_TYPE_ID =
            mapOf(
                "kotlin.Boolean" to TypeId.BOOLEAN,
                "kotlin.Byte" to TypeId.INT8,
                "kotlin.Short" to TypeId.INT16,
                "kotlin.Int" to TypeId.INT32,
                "kotlin.Long" to TypeId.INT64,
                "kotlin.Float" to TypeId.FLOAT,
                "kotlin.Double" to TypeId.DOUBLE,
                "kotlin.String" to TypeId.STRING,
            )
    }
}
