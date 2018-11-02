/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
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

package com.here.genium.common

import org.junit.Assert.assertEquals

import java.util.Arrays
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class CollectionsHelperTest {
    @Test
    fun getAllOfTypeNone() {
        // Arrange, act
        val result = CollectionsHelper.getAllOfType(NUMBER_LIST, Byte::class.java)

        // Assert
        assertEquals(0, result.size.toLong())
    }

    @Test
    fun getAllOfTypeSome() {
        // Arrange, act
        val result = CollectionsHelper.getAllOfType(NUMBER_LIST, Integer::class.java)

        // Assert
        assertEquals(2, result.size.toLong())
    }

    @Test
    fun getFirstOfTypeNone() {
        // Arrange, act
        val result = CollectionsHelper.getFirstOfType(NUMBER_LIST, Byte::class.java)

        // Assert
        assertEquals(null, result)
    }

    @Test
    fun getFirstOfTypeNoneWithDefault() {
        // Arrange, act
        val result =
            CollectionsHelper.getFirstOfType(NUMBER_LIST, Byte::class.java, DEFAULT_VALUE.toByte())

        // Assert
        assertEquals(DEFAULT_VALUE.toLong(), result.toLong())
    }

    @Test
    fun getFirstOfTypeSome() {
        // Arrange, act
        val result = CollectionsHelper.getFirstOfType(NUMBER_LIST, Integer::class.java)

        // Assert
        assertEquals(2, result.toLong())
    }

    companion object {
        private val NUMBER_LIST = Arrays.asList<Number>(
            java.lang.Float.valueOf(1f),
            Integer.valueOf(2),
            java.lang.Double.valueOf(3.0),
            Integer.valueOf(4),
            java.lang.Double.valueOf(5.0)
        )

        const val DEFAULT_VALUE = 123
    }
}
