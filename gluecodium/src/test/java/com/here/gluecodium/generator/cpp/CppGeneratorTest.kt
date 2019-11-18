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

package com.here.gluecodium.generator.cpp

import com.here.gluecodium.model.common.Comments
import com.here.gluecodium.model.cpp.CppConstant
import com.here.gluecodium.model.cpp.CppEnum
import com.here.gluecodium.model.cpp.CppExternableElement
import com.here.gluecodium.model.cpp.CppFile
import com.here.gluecodium.model.cpp.CppTypeRef
import com.here.gluecodium.model.cpp.CppUsing
import com.here.gluecodium.model.cpp.CppValue
import org.junit.Assert.assertEquals
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class CppGeneratorTest {
    private val generator: CppGenerator = CppGenerator("", listOf())

    @Test
    fun emptyFileWillBeSkipped() {
        val model = CppFile("")
        val generatedFiles = generator.generateCode(model)
        assertEquals(0, generatedFiles.size)
    }

    @Test
    fun fileWithTypedefWillBeGenerated() {
        val typeRef = object : CppTypeRef("", emptyList()) {}
        val using = CppUsing("", "", Comments(), typeRef)
        val model = CppFile(filename = "", members = listOf(using))
        val generatedFiles = generator.generateCode(model)
        assertEquals(2, generatedFiles.size)
    }

    @Test
    fun fileWithErrorWillBeGenerated() {
        val error = CppEnum("", "", emptyList(), false, listOf())
        val model = CppFile(filename = "", errorEnums = listOf(error))
        val generatedFiles = generator.generateCode(model)
        assertEquals(2, generatedFiles.size)
    }

    @Test
    fun fileWithConstantWillBeGenerated() {
        val typeRef = object : CppTypeRef("", emptyList()) {}
        val value = CppValue("")
        val constant = CppConstant("", "", typeRef, value)
        val model = CppFile(filename = "", members = listOf(constant))
        val generatedFiles = generator.generateCode(model)
        assertEquals(2, generatedFiles.size)
    }

    @Test
    fun fileWithInternalExternableElementWillBeGenerated() {
        val externable = object : CppExternableElement("", "", emptyList(), Comments(), false) {}
        val model = CppFile(filename = "", members = listOf(externable))
        val generatedFiles = generator.generateCode(model)
        assertEquals(2, generatedFiles.size)
    }

    @Test
    fun onlyImplementationFilForExternalElementWillBeGenerated() {
        val externable = object : CppExternableElement("", "", emptyList(), Comments(), true) {}
        val model = CppFile(filename = "", members = listOf(externable))
        val generatedFiles = generator.generateCode(model)
        assertEquals(1, generatedFiles.size)
        assertEquals("cpp", generatedFiles.first().targetFile.extension)
    }
}
