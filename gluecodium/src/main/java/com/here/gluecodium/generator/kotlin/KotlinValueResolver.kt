/*
 * Copyright (C) 2016-2025 HERE Europe B.V.
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

package com.here.gluecodium.generator.kotlin

import com.here.gluecodium.cli.GluecodiumExecutionException
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeBasicType.TypeId
import com.here.gluecodium.model.lime.LimeEnumerator
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeTypeHelper
import com.here.gluecodium.model.lime.LimeValue
import com.here.gluecodium.model.lime.LimeValue.Duration.TimeUnit

internal class KotlinValueResolver(private val nameResolver: KotlinNameResolver) {
    fun resolveValue(limeValue: LimeValue): String =
        when (limeValue) {
            is LimeValue.Literal -> mapLiteralValue(limeValue)
            is LimeValue.Constant -> resolveConstantValue(limeValue)
            is LimeValue.Special -> mapSpecialValue(limeValue)
            is LimeValue.Null -> "null"
            is LimeValue.InitializerList -> mapInitializerList(limeValue)
            is LimeValue.StructInitializer -> mapStructInitializer(limeValue)
            is LimeValue.KeyValuePair -> "${resolveValue(limeValue.key)} to ${resolveValue(limeValue.value)}"
            is LimeValue.Duration -> mapDurationValue(limeValue)
        }

    private fun mapLiteralValue(limeValue: LimeValue.Literal): String {
        val limeType = limeValue.typeRef.type.actualType
        if (limeType !is LimeBasicType) return limeType.toString()

        return when (limeType.typeId) {
            TypeId.FLOAT -> "${limeValue}f"
            TypeId.UINT32, TypeId.UINT64, TypeId.INT64 -> "${limeValue}L"
            TypeId.DATE -> {
                val epochSeconds = LimeTypeHelper.dateLiteralEpochSeconds(limeValue.value)?.let { it * 1000 }
                "Date(${epochSeconds}L)"
            }
            TypeId.LOCALE -> {
                val localeTag = LimeTypeHelper.normalizeLocaleTag(limeValue.value)
                "Locale.forLanguageTag(\"$localeTag\")"
            }
            else -> limeValue.toString()
        }
    }

    private fun resolveConstantValue(limeValue: LimeValue.Constant): String {
        return when (val limeElement = limeValue.valueRef.element) {
            is LimeEnumerator -> {
                val typeName = nameResolver.resolveReferenceName(limeValue.typeRef.type.actualType)
                val elementName = nameResolver.resolveName(limeElement)
                "$typeName.$elementName"
            }
            else -> nameResolver.resolveFullReferenceName(limeElement)
        }
    }

    private fun mapInitializerList(limeValue: LimeValue.InitializerList): String {
        val limeType = limeValue.typeRef.type.actualType
        if (limeType is LimeBasicType && limeType.typeId == TypeId.BLOB) {
            val values = limeValue.values.joinToString(", ") { "${resolveValue(it)}.toByte()" }
            return "byteArrayOf( $values )"
        }

        return when (limeType) {
            is LimeList -> {
                val values = limeValue.values.joinToString(", ") { resolveValue(it) }
                "listOf($values)"
            }

            is LimeSet -> {
                val values = limeValue.values.joinToString(", ") { resolveValue(it) }
                "setOf($values)"
            }

            is LimeMap -> {
                val values = limeValue.values.joinToString(", ") { resolveValue(it) }
                "mapOf($values)"
            }

            else -> throw GluecodiumExecutionException("Unsupported type ${limeType.javaClass.name} for initializer list")
        }
    }

    private fun mapStructInitializer(limeValue: LimeValue.StructInitializer): String {
        val actualType = limeValue.typeRef.type.actualType
        if (actualType !is LimeStruct) {
            throw GluecodiumExecutionException("Unsupported type ${actualType.javaClass.name} for struct initializer")
        }
        val values = limeValue.values.joinToString(", ") { resolveValue(it) }
        return "${nameResolver.resolveReferenceName(actualType)}($values)"
    }

    private fun mapSpecialValue(limeValue: LimeValue.Special): String {
        val prefix =
            when ((limeValue.typeRef.type as LimeBasicType).typeId) {
                TypeId.FLOAT -> "Float"
                else -> "Double"
            }
        val value =
            when (limeValue.value) {
                LimeValue.Special.ValueId.NAN -> "NaN"
                LimeValue.Special.ValueId.INFINITY -> "POSITIVE_INFINITY"
                LimeValue.Special.ValueId.NEGATIVE_INFINITY -> "NEGATIVE_INFINITY"
            }
        return "$prefix.$value"
    }

    private fun mapDurationValue(limeValue: LimeValue.Duration): String {
        val factoryMethod =
            when (limeValue.timeUnit) {
                TimeUnit.DAY -> "ofDays"
                TimeUnit.HOUR -> "ofHours"
                TimeUnit.MINUTE -> "ofMinutes"
                TimeUnit.SECOND -> "ofSeconds"
                TimeUnit.MILLISECOND -> "ofMillis"
                TimeUnit.MICROSECOND, TimeUnit.NANOSECOND -> "ofNanos"
            }
        val valueSuffix =
            when (limeValue.timeUnit) {
                TimeUnit.MICROSECOND -> "000L"
                else -> "L"
            }
        return "Duration.$factoryMethod(${limeValue.value}$valueSuffix)"
    }
}
