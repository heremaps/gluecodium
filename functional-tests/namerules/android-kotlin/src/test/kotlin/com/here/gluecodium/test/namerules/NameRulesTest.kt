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

import com.here.ktnamerules.namerules.CUSTOM_NAME_RULES_XKOTLIN
import com.here.gluecodium.test.namerules.BuildConfig;
import junit.framework.TestCase.assertEquals
import junit.framework.TestCase.assertTrue
import org.junit.Assert.assertThrows
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4
import java.io.File

@RunWith(JUnit4::class)
class NameRulesTest {
    init {
        loadBindingsLibrary(File(BuildConfig.NATIVE_LIB_HOST_DIR))
    }

    @Test
    fun testNamerulesForProperties() {
        val someClass = CUSTOM_NAME_RULES_XKOTLIN()
        someClass.isBooleanAttribute = true
        someClass.intAttribute = 8
        someClass.structAttribute = CUSTOM_NAME_RULES_XKOTLIN.EXAMPLE_STRUCT_XKOTLIN(3.14, mutableListOf(7))

        assertTrue(someClass.isBooleanAttribute)
        assertEquals(someClass.intAttribute, 8)
        assertEquals(someClass.structAttribute.xfield_int_values.size, 1)
        assertEquals(someClass.structAttribute.xfield_int_values[0], 7)
    }

    @Test
    fun testNamerulesForErrorTypes() {
        val someStruct = CUSTOM_NAME_RULES_XKOTLIN.EXAMPLE_STRUCT_XKOTLIN(3.14, mutableListOf(7))
        val exception = assertThrows(CUSTOM_NAME_RULES_XKOTLIN.example_xerror::class.java) {
            CUSTOM_NAME_RULES_XKOTLIN().some_method(someStruct)
        }
        assertEquals(exception.error, CUSTOM_NAME_RULES_XKOTLIN.EXAMPLE_ERROR_CODE_XKOTLIN.FATAL)
    }

    companion object {
        private fun loadBindingsLibrary(path: File) {
            path.listFiles{ _, name -> name.contains(".so") || name.endsWith(".dylib") }
                .forEach { System.load(it.getAbsolutePath()) }
        }
    }
}
