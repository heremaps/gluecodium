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

import com.here.namerules.namerules.CUSTOM_NAME_RULES_DROID
import com.here.gluecodium.test.namerules.BuildConfig;
import junit.framework.TestCase.assertEquals
import junit.framework.TestCase.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4
import java.io.File

@RunWith(JUnit4::class)
class NameRulesTest {

    init {
        val appLibraryPath = File(BuildConfig.NATIVE_LIB_HOST_DIR)

        appLibraryPath.listFiles{ _, name -> name.contains(".so") || name.endsWith(".dylib") }
            .forEach { System.load(it.getAbsolutePath()) }
    }

    @Test
    fun `test attributes`() {
        val someClass = CUSTOM_NAME_RULES_DROID()
        someClass.STORE_BOOLEAN_ATTRIBUTE(true)
        someClass.STORE_INT_ATTRIBUTE(8)
        someClass.STORE_STRUCT_ATTRIBUTE(CUSTOM_NAME_RULES_DROID.EXAMPLE_STRUCT_DROID(3.14, listOf(7)))
        assertTrue(someClass.loadBooleanAttribute())
        assertEquals(someClass.loadIntAttribute(), 8)
        assertEquals(someClass.loadStructAttribute().j_int_values.size, 1)
        assertEquals(someClass.loadStructAttribute().j_int_values[0], 7)
    }

    @Test(expected = CUSTOM_NAME_RULES_DROID.example_x::class)
    fun `test errors`() {
        val someClass = CUSTOM_NAME_RULES_DROID()
        val someStruct = CUSTOM_NAME_RULES_DROID.EXAMPLE_STRUCT_DROID(3.14, listOf(7))
        someClass.some_method(someStruct)
    }
}
