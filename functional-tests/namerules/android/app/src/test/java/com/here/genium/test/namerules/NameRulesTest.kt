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

import com.here.namerules.namerules.NameRules
import junit.framework.TestCase.assertEquals
import junit.framework.TestCase.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4
import java.io.File

@RunWith(JUnit4::class)
class NameRulesTest {

    init {
        val currentWorkingDirAbsolute = File("").absoluteFile
        val appLibraryPath = File(currentWorkingDirAbsolute, "libs")

        appLibraryPath.listFiles{ _, name -> name.contains(".so") || name.endsWith(".dylib") }
            .forEach { System.load(it.getAbsolutePath()) }
    }

    @Test
    fun `test attributes`() {
        val someClass = NameRules()
        someClass.isBooleanAttribute = true
        someClass.intAttribute = 8
        someClass.structAttribute = NameRules.ExampleStruct(3.14, listOf(7))
        assertTrue(someClass.isBooleanAttribute)
        assertEquals(someClass.intAttribute, 8)
        assertEquals(someClass.structAttribute.intValues.size, 1)
        assertEquals(someClass.structAttribute.intValues[0], 7)
    }

    @Test(expected = NameRules.ExampleErrorException::class)
    fun `test errors`() {
        val someClass = NameRules()
        val someStruct = NameRules.ExampleStruct(3.14, listOf(7))
        someClass.someMethod(someStruct)
    }
}