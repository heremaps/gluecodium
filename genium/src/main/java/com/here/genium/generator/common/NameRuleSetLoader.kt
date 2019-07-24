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

package com.here.genium.generator.common

import com.here.genium.generator.common.NameRuleSet.Companion.ignore2
import com.here.genium.generator.common.NameRuleSet.Companion.illegal
import com.natpryce.konfig.Configuration
import com.natpryce.konfig.Key
import com.natpryce.konfig.enumType
import com.natpryce.konfig.stringType

private object NameRuleSetLoader {
    fun getNameRuleSet(config: Configuration) = NameRuleSet(
            getFieldName = getNameRule(config, NameTypes.Field),
            getParameterName = getNameRule(config, NameTypes.Parameter),
            getConstantName = getNameRule(config, NameTypes.Constant),
            getEnumeratorName = getNameRule(config, NameTypes.Enumerator),
            getMethodName = getNameRule(config, NameTypes.Method),
            getTypeName = getNameRule(config, NameTypes.Type),
            getPropertyName = getNameRuleBooleanPrefix(config, NameTypes.Property),
            getSetterName = getNameRule(config, NameTypes.Setter),
            getGetterName = getNameRuleBooleanPrefix(config, NameTypes.Getter),
            getErrorName = getNameRule(config, NameTypes.Error)
    )

    @Suppress("EnumEntryName")
    enum class NameFormat(val apply: (String) -> String, val joinApply: (List<String?>) -> String) {
        UPPER_SNAKE_CASE(NameHelper::toUpperSnakeCase, NameHelper::joinToUpperSnakeCase),
        lower_snake_case(NameHelper::toLowerSnakeCase, NameHelper::joinToLowerSnakeCase),
        UpperCamelCase(NameHelper::toUpperCamelCase, NameHelper::joinToUpperCamelCase),
        lowerCamelCase(NameHelper::toLowerCamelCase, NameHelper::joinToLowerCamelCase)
    }

    enum class NameTypes {
        Field,
        Parameter,
        Constant,
        Enumerator,
        Method,
        Type,
        Property,
        Setter,
        Getter,
        Error
    }

    private fun getNameRuleBooleanPrefix(config: Configuration, nameType: NameTypes): (String, Boolean) -> String {
        val key = nameType.toString().toLowerCase()
        val formattingKey = Key(key, enumType<NameFormat>())
        val prefixKey = Key("$key.prefix", stringType)
        val booleanPrefixKey = Key("$key.prefix.boolean", stringType)
        val suffixKey = Key("$key.suffix", stringType)

        if (!config.contains(formattingKey)) {
            return ignore2(::illegal)
        }

        val prefix = config.getOrNull(prefixKey)
        val suffix = config.getOrNull(suffixKey)
        val formatting = config[formattingKey]
        val booleanPrefix = config.getOrElse(booleanPrefixKey, prefix)
        return { name, isBoolean ->
            if (isBoolean) {
                formatting.joinApply(listOf(booleanPrefix, name, suffix))
            } else {
                formatting.joinApply(listOf(prefix, name, suffix))
            }
        }
    }

    private fun getNameRule(config: Configuration, nameType: NameTypes): (String) -> String {
        val key = nameType.toString().toLowerCase()
        val formattingKey = Key(key, enumType<NameFormat>())
        val prefixKey = Key("$key.prefix", stringType)
        val suffixKey = Key("$key.suffix", stringType)

        if (!config.contains(formattingKey)) {
            return ::illegal
        }

        if (config.contains(prefixKey) || config.contains(suffixKey)) {
            val prefix = config.getOrNull(prefixKey)
            val suffix = config.getOrNull(suffixKey)
            val formatting = config[formattingKey]
            return { formatting.joinApply(listOf(prefix, it, suffix)) }
        } else return config[formattingKey].apply
    }
}

fun nameRuleSetFromConfig(config: Configuration): NameRuleSet {
    return NameRuleSetLoader.getNameRuleSet(config)
}
