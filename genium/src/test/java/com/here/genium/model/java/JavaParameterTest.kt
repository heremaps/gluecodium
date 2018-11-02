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

package com.here.genium.model.java

import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull

import com.here.genium.model.java.JavaReferenceType.Type
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class JavaParameterTest {
    @Test
    fun newJavaParameter() {
        // Arrange, act
        val javaParameter = JavaParameter(TEST_STRING_TYPE, TEST_PARAMETER_NAME)

        // Assert
        assertNotNull(javaParameter.type)
        assertEquals(TEST_STRING_TYPE, javaParameter.type)
        assertEquals(TEST_PARAMETER_NAME, javaParameter.name)
        assertNull(javaParameter.defaultValue)
    }

    @Test
    fun newJavaParameterWithDefaultValue() {
        // Arrange, act
        val javaParameter = JavaParameter(TEST_STRING_TYPE, TEST_PARAMETER_NAME, TEST_DEFAULT_VALUE)

        // Assert
        assertNotNull(javaParameter.type)
        assertEquals(TEST_STRING_TYPE, javaParameter.type)
        assertEquals(TEST_PARAMETER_NAME, javaParameter.name)
        assertNotNull(javaParameter.defaultValue)
        assertEquals(TEST_DEFAULT_VALUE, javaParameter.defaultValue)
    }

    companion object {
        private const val TEST_PARAMETER_NAME = "myParam"
        private val TEST_STRING_TYPE = JavaReferenceType(Type.STRING)
        private val TEST_DEFAULT_VALUE = JavaValue("SomeString")
    }
}
