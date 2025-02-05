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
package com.here.android.test

import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue

import com.here.android.RobolectricApplication
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(application = RobolectricApplication::class)
class StaticStringMethodsTest {
    @org.junit.Test
    fun returnInputString() {
        // Arrange
        val inputString: String = "Foo"

        // Act
        val returnedString: String = StaticStringMethods.returnInputString(inputString)

        // Assert
        assertEquals(inputString, returnedString)
    }

    @org.junit.Test
    fun concatenateStrings() {
        // Arrange
        val inputString1: String = "Hello"
        val inputString2: String = "World"

        // Act
        val returnedString: String = StaticStringMethods.concatenateStrings(inputString1, inputString2)

        // Assert
        assertEquals(inputString1 + inputString2, returnedString)
    }

    @org.junit.Test
    fun returnHelloString() {
        // Arrange, act
        val returnedString: String = StaticStringMethods.returnHelloString()

        // Assert
        assertEquals("hello", returnedString)
    }

    @org.junit.Test
    fun returnEmpty() {
        // Arrange, act
        val returnedString: String = StaticStringMethods.returnEmpty()

        // Assert
        assertTrue(returnedString.isEmpty())
    }

    @org.junit.Test
    fun stringRef() {
        val result: String = CppRefReturnType.stringRef()

        assertEquals("nonsense", result)
    }
}