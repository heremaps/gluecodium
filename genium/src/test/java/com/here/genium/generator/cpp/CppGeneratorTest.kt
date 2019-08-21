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

package com.here.genium.generator.cpp

import com.here.genium.model.common.Comments
import com.here.genium.model.cpp.CppConstant
import com.here.genium.model.cpp.CppEnum
import com.here.genium.model.cpp.CppExternableElement
import com.here.genium.model.cpp.CppFile
import com.here.genium.model.cpp.CppTypeRef
import com.here.genium.model.cpp.CppUsing
import com.here.genium.model.cpp.CppValue
import org.junit.Assert.assertEquals
import org.junit.Test
import org.mockito.Mockito.mock

class CppGeneratorTest {
    private val generator: CppGenerator = CppGenerator("", listOf())

    @Test
    fun emptyFileWillBeSkipped() {
        val model = CppFile("", listOf(), listOf(), listOf(), listOf(), listOf())
        val generatedFiles = generator.generateCode(model)
        assertEquals(0, generatedFiles.size)
    }

    @Test
    fun fileWithTypedefWillBeGenerated() {
        val typeRef = mock(CppTypeRef::class.java)
        val using = CppUsing("", "", Comments(), typeRef)
        val model = CppFile("", listOf(), listOf(using), listOf(), listOf(), listOf())
        val generatedFiles = generator.generateCode(model)
        assertEquals(2, generatedFiles.size)
    }

    @Test
    fun fileWithErrorWillBeGenerated() {
        val error = CppEnum("", "", emptyList(), false, listOf())
        val model = CppFile("", listOf(), listOf(), listOf(), listOf(), listOf(error))
        val generatedFiles = generator.generateCode(model)
        assertEquals(2, generatedFiles.size)
    }

    @Test
    fun fileWithConstantWillBeGenerated() {
        val typeRef = mock(CppTypeRef::class.java)
        val value = CppValue("")
        val constant = CppConstant("", "", typeRef, value)
        val model = CppFile("", listOf(), listOf(constant), listOf(), listOf(), listOf())
        val generatedFiles = generator.generateCode(model)
        assertEquals(2, generatedFiles.size)
    }

    @Test
    fun fileWithInternalExternableElementWillBeGenerated() {
        val externable = object : CppExternableElement("", "", emptyList(), Comments(), false) {}
        val model = CppFile("", listOf(), listOf(externable), listOf(), listOf(), listOf())
        val generatedFiles = generator.generateCode(model)
        assertEquals(2, generatedFiles.size)
    }
}
