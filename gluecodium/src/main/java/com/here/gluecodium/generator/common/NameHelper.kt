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

package com.here.gluecodium.generator.common

import com.google.common.base.CaseFormat
import com.google.common.base.CharMatcher
import java.util.Locale

@Suppress("UnstableApiUsage", "DEPRECATION")
object NameHelper {
    private const val UNDERSCORE = "_"

    fun toUpperSnakeCase(input: String?): String =
        when {
            input == null -> ""
            input.contains(UNDERSCORE) ->
                CaseFormat.LOWER_UNDERSCORE.to(CaseFormat.UPPER_UNDERSCORE, input)
            CharMatcher.javaLowerCase().matchesAnyOf(input) &&
                CharMatcher.javaUpperCase().matchesAnyOf(input) ->
                CaseFormat.UPPER_CAMEL.to(CaseFormat.UPPER_UNDERSCORE, input)
            else -> input.toUpperCase()
        }

    fun joinToUpperSnakeCase(inputs: List<String?>) =
        inputs.filterNotNull().joinToString(transform = { toUpperSnakeCase(it) }, separator = UNDERSCORE)

    fun toLowerSnakeCase(input: String?): String =
        when {
            input == null -> ""
            input.contains(UNDERSCORE) ->
                CaseFormat.UPPER_UNDERSCORE.to(CaseFormat.LOWER_UNDERSCORE, input)

            CharMatcher.javaLowerCase().matchesAnyOf(input) &&
                CharMatcher.javaUpperCase().matchesAnyOf(input) ->
                CaseFormat.UPPER_CAMEL.to(CaseFormat.LOWER_UNDERSCORE, input)

            else -> input.lowercase(Locale.getDefault())
        }

    fun joinToLowerSnakeCase(inputs: List<String?>) =
        inputs.filterNotNull().joinToString(transform = { toLowerSnakeCase(it) }, separator = UNDERSCORE)

    fun toUpperCamelCase(input: String?): String =
        when {
            input == null -> ""
            input.contains(UNDERSCORE) ->
                CaseFormat.LOWER_UNDERSCORE.to(CaseFormat.UPPER_CAMEL, input)

            CharMatcher.javaLowerCase().matchesAnyOf(input) &&
                CharMatcher.javaUpperCase().matchesAnyOf(input) ->
                CaseFormat.LOWER_CAMEL.to(CaseFormat.UPPER_CAMEL, input)

            else -> input.lowercase(Locale.getDefault()).capitalize()
        }

    fun joinToUpperCamelCase(inputs: List<String?>) =
        inputs.filterNotNull().joinToString(transform = { toUpperCamelCase(it) }, separator = "")

    fun toLowerCamelCase(input: String?): String =
        when {
            input == null -> ""
            input.contains(UNDERSCORE) ->
                CaseFormat.LOWER_UNDERSCORE.to(CaseFormat.LOWER_CAMEL, input)

            CharMatcher.javaLowerCase().matchesAnyOf(input) &&
                CharMatcher.javaUpperCase().matchesAnyOf(input) ->
                CaseFormat.UPPER_CAMEL.to(CaseFormat.LOWER_CAMEL, input)

            else -> input.lowercase(Locale.getDefault())
        }

    fun joinToLowerCamelCase(inputs: List<String?>): String {
        val filtered = inputs.filterNotNull()
        return toLowerCamelCase(filtered.firstOrNull()) + joinToUpperCamelCase(filtered.drop(1))
    }
}
