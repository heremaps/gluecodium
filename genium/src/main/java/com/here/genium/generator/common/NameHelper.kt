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

import org.apache.commons.text.WordUtils.capitalizeFully

import com.google.common.base.CaseFormat
import com.google.common.base.CharMatcher
import com.google.common.base.Strings

@Suppress("UnstableApiUsage")
object NameHelper {
    private const val UNDERSCORE = "_"

    fun toUpperSnakeCase(input: String?): String =
        when {
            input == null -> ""
            input.contains(UNDERSCORE) ->
                CaseFormat.LOWER_UNDERSCORE.to(CaseFormat.UPPER_UNDERSCORE, input)
            CharMatcher.JAVA_LOWER_CASE.matchesAnyOf(input) &&
                    CharMatcher.JAVA_UPPER_CASE.matchesAnyOf(input) ->
                CaseFormat.UPPER_CAMEL.to(CaseFormat.UPPER_UNDERSCORE, input)
            else -> input.toUpperCase()
        }

    fun joinToUpperSnakeCase(inputs: List<String?>) =
        inputs.filterNotNull().joinToString(transform = ::toUpperSnakeCase, separator = UNDERSCORE)

    fun toLowerSnakeCase(input: String?): String =
        when {
            input == null -> ""
            input.contains(UNDERSCORE) ->
                CaseFormat.UPPER_UNDERSCORE.to(CaseFormat.LOWER_UNDERSCORE, input)
            CharMatcher.JAVA_LOWER_CASE.matchesAnyOf(input) &&
                    CharMatcher.JAVA_UPPER_CASE.matchesAnyOf(input) ->
                CaseFormat.UPPER_CAMEL.to(CaseFormat.LOWER_UNDERSCORE, input)
            else -> input.toLowerCase()
        }

    fun joinToLowerSnakeCase(inputs: List<String?>) =
        inputs.filterNotNull().joinToString(transform = ::toLowerSnakeCase, separator = UNDERSCORE)

    fun toUpperCamelCase(input: String?): String =
        when {
            input == null -> ""
            input.contains(UNDERSCORE) ->
                CaseFormat.LOWER_UNDERSCORE.to(CaseFormat.UPPER_CAMEL, input)
            CharMatcher.JAVA_LOWER_CASE.matchesAnyOf(input) &&
                    CharMatcher.JAVA_UPPER_CASE.matchesAnyOf(input) ->
                CaseFormat.LOWER_CAMEL.to(CaseFormat.UPPER_CAMEL, input)
            else -> capitalizeFully(input) // Capitalize the first character and lowercase the rest.
        }

    fun joinToUpperCamelCase(inputs: List<String?>) =
        inputs.filterNotNull().joinToString(transform = ::toUpperCamelCase, separator = "")

    fun toLowerCamelCase(input: String?): String =
        when {
            input == null -> ""
            input.contains(UNDERSCORE) ->
                CaseFormat.LOWER_UNDERSCORE.to(CaseFormat.LOWER_CAMEL, input)
            CharMatcher.JAVA_LOWER_CASE.matchesAnyOf(input) &&
                    CharMatcher.JAVA_UPPER_CASE.matchesAnyOf(input) ->
                CaseFormat.UPPER_CAMEL.to(CaseFormat.LOWER_CAMEL, input)
            else -> input.toLowerCase()
        }

    fun joinToLowerCamelCase(inputs: List<String?>): String {
        val filtered = inputs.filterNotNull()
        return toLowerCamelCase(filtered.firstOrNull()) + joinToUpperCamelCase(filtered.drop(1))
    }

    fun joinNames(firstString: String?, secondString: String?, delimiter: String): String? =
        when {
            Strings.isNullOrEmpty(firstString) -> secondString
            Strings.isNullOrEmpty(secondString) -> firstString
            else -> firstString + delimiter + secondString
        }
}
