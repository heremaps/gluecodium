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

package com.here.genium.model.lime

import com.here.genium.common.StringHelper

class LimeAttributes private constructor(
    private val attributes: Map<LimeAttributeType, Map<LimeAttributeValueType, Any>>
) {
    fun have(type: LimeAttributeType) = attributes[type] != null

    fun have(attributeType: LimeAttributeType, valueType: LimeAttributeValueType) =
        when (val value = attributes[attributeType]?.get(valueType)) {
            is Boolean -> value
            null -> false
            else -> true
        }

    fun <T> get(
        attributeType: LimeAttributeType,
        valueType: LimeAttributeValueType,
        clazz: Class<T>
    ): T? {
        val value = attributes[attributeType]?.get(valueType)
        return if (clazz.isInstance(value)) clazz.cast(value) else null
    }

    fun get(attributeType: LimeAttributeType, valueType: LimeAttributeValueType) =
        get(attributeType, valueType, String::class.java)

    fun isEmpty() = attributes.isEmpty()

    override fun toString() = attributes.entries.sortedBy { it.key }.joinToString("\n") {
        val attributeType = it.key
        if (it.value.isEmpty()) {
            return@joinToString "@$attributeType"
        }
        val valuesString = it.value.entries.joinToString(", ") { nameValue ->
            createValueString(attributeType, nameValue.key, nameValue.value)
        }
        "@$attributeType($valuesString)"
    }

    private fun createValueString(
        attributeType: LimeAttributeType,
        valueType: LimeAttributeValueType,
        literal: Any
    ): String {
        val prefix = if (valueType != attributeType.defaultValueType) valueType.toString() else ""
        val suffix = createValueLiteral(literal)
        val infix = if (prefix.isNotEmpty() && suffix.isNotEmpty()) " = " else ""
        return "$prefix$infix$suffix"
    }

    private fun createValueLiteral(value: Any?): String =
        when (value) {
            null, true -> ""
            is String -> StringHelper.escapeStringLiteral(value)
            is List<*> -> {
                val listLiteral = value.joinToString(", ") { createValueLiteral(it) }
                "[$listLiteral]"
            }
            else -> value.toString()
        }

    class Builder {
        private val attributes =
            mutableMapOf<LimeAttributeType, MutableMap<LimeAttributeValueType, Any>>()

        fun addAttribute(type: LimeAttributeType): Builder {
            attributes.putIfAbsent(type, mutableMapOf())
            return this
        }

        fun addAttribute(
            attributeType: LimeAttributeType,
            valueType: LimeAttributeValueType,
            value: Any? = true
        ): Builder {
            value?.let { attributes.getOrPut(attributeType, { mutableMapOf() })[valueType] = it }
            return this
        }

        fun build() = LimeAttributes(attributes)
    }
}
