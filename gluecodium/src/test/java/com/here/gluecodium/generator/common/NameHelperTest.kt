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

import org.junit.Assert.assertEquals
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class NameHelperTest {
    @Test
    fun fromLowerCamelToLowerCamel() =
        assertEquals(LOWER_CAMEL_CASE, NameHelper.toLowerCamelCase(LOWER_CAMEL_CASE))

    @Test
    fun fromUpperCamelToLowerCamel() =
        assertEquals(LOWER_CAMEL_CASE, NameHelper.toLowerCamelCase(UPPER_CAMEL_CASE))

    @Test
    fun fromLowerSnakeCaseToLowerCamel() =
        assertEquals(LOWER_CAMEL_CASE, NameHelper.toLowerCamelCase(LOWER_SNAKE_CASE))

    @Test
    fun fromUpperSnakeCaseToLowerCamel() =
        assertEquals(LOWER_CAMEL_CASE, NameHelper.toLowerCamelCase(UPPER_SNAKE_CASE))

    @Test
    fun fromLowerCaseToLowerCamel() =
        assertEquals(LOWER_CASE, NameHelper.toLowerCamelCase(LOWER_CASE))

    @Test
    fun fromUpperCaseToLowerCamel() =
        assertEquals(LOWER_CASE, NameHelper.toLowerCamelCase(UPPER_CASE))

    @Test
    fun fromLowerCamelToUpperCamel() =
        assertEquals(UPPER_CAMEL_CASE, NameHelper.toUpperCamelCase(LOWER_CAMEL_CASE))

    @Test
    fun fromUpperCamelToUpperCamel() =
        assertEquals(UPPER_CAMEL_CASE, NameHelper.toUpperCamelCase(UPPER_CAMEL_CASE))

    @Test
    fun fromLowerSnakeCaseToUpperCamel() =
        assertEquals(UPPER_CAMEL_CASE, NameHelper.toUpperCamelCase(LOWER_SNAKE_CASE))

    @Test
    fun fromUpperSnakeCaseToUpperCamel() =
        assertEquals(UPPER_CAMEL_CASE, NameHelper.toUpperCamelCase(UPPER_SNAKE_CASE))

    @Test
    fun fromLowerCaseToUpperCamel() =
        assertEquals(SIMPLE_UPPER_CAMEL_CASE, NameHelper.toUpperCamelCase(LOWER_CASE))

    @Test
    fun fromUpperCaseToUpperCamel() =
        assertEquals(SIMPLE_UPPER_CAMEL_CASE, NameHelper.toUpperCamelCase(UPPER_CASE))

    @Test
    fun fromLowerCamelToUpperSnakeCase() =
        assertEquals(UPPER_SNAKE_CASE, NameHelper.toUpperSnakeCase(LOWER_CAMEL_CASE))

    @Test
    fun fromUpperCamelToUpperSnakeCase() =
        assertEquals(UPPER_SNAKE_CASE, NameHelper.toUpperSnakeCase(UPPER_CAMEL_CASE))

    @Test
    fun fromLowerSnakeCaseToUpperSnakeCase() =
        assertEquals(UPPER_SNAKE_CASE, NameHelper.toUpperSnakeCase(LOWER_SNAKE_CASE))

    @Test
    fun fromUpperSnakeCaseToUpperSnakeCase() =
        assertEquals(UPPER_SNAKE_CASE, NameHelper.toUpperSnakeCase(UPPER_SNAKE_CASE))

    @Test
    fun fromUpperCaseToUpperSnakeCase() =
        assertEquals(UPPER_CASE, NameHelper.toUpperSnakeCase(UPPER_CASE))

    @Test
    fun fromLowerCaseToUpperSnakeCase() =
        assertEquals(UPPER_CASE, NameHelper.toUpperSnakeCase(LOWER_CASE))

    @Test
    fun fromLowerCamelToLowerSnakeCase() =
        assertEquals(LOWER_SNAKE_CASE, NameHelper.toLowerSnakeCase(LOWER_CAMEL_CASE))

    @Test
    fun fromUpperCamelToLowerSnakeCase() =
        assertEquals(LOWER_SNAKE_CASE, NameHelper.toLowerSnakeCase(UPPER_CAMEL_CASE))

    @Test
    fun fromLowerSnakeCaseToLowerSnakeCase() =
        assertEquals(LOWER_SNAKE_CASE, NameHelper.toLowerSnakeCase(LOWER_SNAKE_CASE))

    @Test
    fun fromUpperSnakeCaseToLowerSnakeCase() =
        assertEquals(LOWER_SNAKE_CASE, NameHelper.toLowerSnakeCase(UPPER_SNAKE_CASE))

    @Test
    fun fromUpperCaseToLowerSnakeCase() =
        assertEquals(LOWER_CASE, NameHelper.toLowerSnakeCase(UPPER_CASE))

    @Test
    fun fromLowerCaseToLowerSnakeCase() =
        assertEquals(LOWER_CASE, NameHelper.toLowerSnakeCase(LOWER_CASE))

    @Test
    fun `join lower camel case`() = assertEquals(
        "$LOWER_CAMEL_CASE$UPPER_CAMEL_CASE",
        NameHelper.joinToLowerCamelCase(listOf(LOWER_SNAKE_CASE, UPPER_CAMEL_CASE))
    )

    @Test
    fun `join lower camel case with null`() = assertEquals(
        "$LOWER_CAMEL_CASE$UPPER_CAMEL_CASE",
        NameHelper.joinToLowerCamelCase(listOf(UPPER_SNAKE_CASE, null, UPPER_CAMEL_CASE, null))
    )

    @Test
    fun `join lower snake case`() = assertEquals(
        LOWER_SNAKE_CASE + "_$LOWER_SNAKE_CASE",
        NameHelper.joinToLowerSnakeCase(listOf(UPPER_SNAKE_CASE, UPPER_CAMEL_CASE))
    )

    @Test
    fun `join lower snake case with null`() = assertEquals(
        LOWER_SNAKE_CASE + "_$LOWER_SNAKE_CASE",
        NameHelper.joinToLowerSnakeCase(listOf(LOWER_CAMEL_CASE, null, UPPER_CAMEL_CASE, null))
    )

    @Test
    fun `join upper camel case`() = assertEquals(
        "$UPPER_CAMEL_CASE$UPPER_CAMEL_CASE",
        NameHelper.joinToUpperCamelCase(listOf(LOWER_SNAKE_CASE, UPPER_CAMEL_CASE))
    )

    @Test
    fun `join upper camel case with null`() = assertEquals(
        "$UPPER_CAMEL_CASE$UPPER_CAMEL_CASE",
        NameHelper.joinToUpperCamelCase(listOf(LOWER_SNAKE_CASE, null, UPPER_CAMEL_CASE, null))
    )

    @Test
    fun `join upper snake case`() = assertEquals(
        UPPER_SNAKE_CASE + "_$UPPER_SNAKE_CASE",
        NameHelper.joinToUpperSnakeCase(listOf(LOWER_CAMEL_CASE, UPPER_CAMEL_CASE))
    )

    @Test
    fun `join upper snake case with null`() = assertEquals(
        UPPER_SNAKE_CASE + "_$UPPER_SNAKE_CASE",
        NameHelper.joinToUpperSnakeCase(listOf(LOWER_SNAKE_CASE, null, UPPER_CAMEL_CASE, null))
    )

    companion object {
        private const val LOWER_CAMEL_CASE = "someTestString"
        private const val UPPER_CAMEL_CASE = "SomeTestString"
        private const val LOWER_SNAKE_CASE = "some_test_string"
        private const val UPPER_SNAKE_CASE = "SOME_TEST_STRING"
        private const val UPPER_CASE = "SOMETESTSTRING"
        private const val LOWER_CASE = "someteststring"
        private const val SIMPLE_UPPER_CAMEL_CASE = "Someteststring"
    }
}
