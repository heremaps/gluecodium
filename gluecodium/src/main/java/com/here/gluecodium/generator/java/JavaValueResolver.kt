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

package com.here.gluecodium.generator.java

import com.here.gluecodium.cli.GluecodiumExecutionException
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeBasicType.TypeId
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeValue
import com.here.gluecodium.model.lime.LimeValue.Duration.TimeUnit

internal class JavaValueResolver(private val nameResolver: JavaNameResolver) {

    fun resolveValue(limeValue: LimeValue): String =
        when (limeValue) {
            is LimeValue.Literal -> {
                val limeType = limeValue.typeRef.type.actualType
                val suffix = when {
                    limeType !is LimeBasicType -> ""
                    limeType.typeId == TypeId.FLOAT -> "f"
                    limeType.typeId == TypeId.UINT32 || limeType.typeId == TypeId.UINT64 ||
                        limeType.typeId == TypeId.INT64 -> "L"
                    else -> ""
                }
                limeValue.toString() + suffix
            }
            is LimeValue.Enumerator -> {
                val limeEnumerator = limeValue.valueRef.enumerator
                val limeEnumeration = limeValue.typeRef.type.actualType
                listOf(
                    nameResolver.resolveReferenceName(limeEnumeration),
                    nameResolver.resolveName(limeEnumerator)
                ).joinToString(".")
            }
            is LimeValue.Special -> mapSpecialValue(limeValue)
            is LimeValue.Null -> "null"
            is LimeValue.InitializerList -> mapInitializerList(limeValue)
            is LimeValue.StructInitializer -> mapStructInitializer(limeValue)
            is LimeValue.KeyValuePair -> {
                val keyValue = resolveValue(limeValue.key)
                val valueValue = resolveValue(limeValue.value)
                "new AbstractMap.SimpleEntry<>($keyValue, $valueValue)"
            }
            is LimeValue.Duration -> mapDurationValue(limeValue)
        }

    private fun mapInitializerList(limeValue: LimeValue.InitializerList): String {
        val values = limeValue.values.joinToString(", ") { resolveValue(it) }
        return when (val limeType = limeValue.typeRef.type.actualType) {
            is LimeList -> {
                val valuesAsList = if (values.isEmpty()) "" else "Arrays.asList($values)"
                "new ArrayList<>($valuesAsList)"
            }
            is LimeSet -> {
                val implName = if (limeType.elementType.type.actualType is LimeEnumeration) "EnumSet" else "HashSet"
                val valuesAsList = if (values.isEmpty()) "" else "Arrays.asList($values)"
                "new $implName<>($valuesAsList)"
            }
            is LimeMap -> {
                val valuesAsList = when {
                    values.isEmpty() -> ""
                    else -> "Stream.of($values).collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue))"
                }
                "new HashMap<>($valuesAsList)"
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
        return "new ${nameResolver.resolveReferenceName(actualType)}($values)"
    }

    private fun mapSpecialValue(limeValue: LimeValue.Special): String {
        val prefix = when ((limeValue.typeRef.type as LimeBasicType).typeId) {
            TypeId.FLOAT -> "Float"
            else -> "Double"
        }
        val value = when (limeValue.value) {
            LimeValue.Special.ValueId.NAN -> "NaN"
            LimeValue.Special.ValueId.INFINITY -> "POSITIVE_INFINITY"
            LimeValue.Special.ValueId.NEGATIVE_INFINITY -> "NEGATIVE_INFINITY"
        }
        return "$prefix.$value"
    }

    private fun mapDurationValue(limeValue: LimeValue.Duration): String {
        val factoryMethod = when (limeValue.timeUnit) {
            TimeUnit.DAY -> "ofDays"
            TimeUnit.HOUR -> "ofHours"
            TimeUnit.MINUTE -> "ofMinutes"
            TimeUnit.SECOND -> "ofSeconds"
            TimeUnit.MILLISECOND -> "ofMillis"
            TimeUnit.MICROSECOND, TimeUnit.NANOSECOND -> "ofNanos"
        }
        val valueSuffix = when (limeValue.timeUnit) {
            TimeUnit.MICROSECOND -> "000L"
            else -> "L"
        }
        return "Duration.$factoryMethod(${limeValue.value}$valueSuffix)"
    }
}
