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

package com.here.genium.model.cpp

import com.here.genium.generator.cpp.CppLibraryIncludes
import com.here.genium.model.common.Include
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class CppTemplateTypeRefTest {
    @Test
    fun sharedPointerOfPrimitiveType() {
        val templateTypeRef = CppTemplateTypeRef.create(
            CppTemplateTypeRef.TemplateClass.SHARED_POINTER, INT_TYPE_REF
        )

        assertEquals(
            CppTemplateTypeRef.TemplateClass.SHARED_POINTER, templateTypeRef.templateClass
        )
        assertEquals(1, templateTypeRef.templateParameters.size)
        assertEquals(INT_TYPE_REF, templateTypeRef.templateParameters[0])
        assertEquals(2, templateTypeRef.includes.size)
        assertTrue(templateTypeRef.includes.contains(CppLibraryIncludes.MEMORY))
        assertTrue(templateTypeRef.includes.contains(CppLibraryIncludes.INT_TYPES))
    }

    @Test
    fun sharedPointerOfComplexType() {
        val templateTypeRef = CppTemplateTypeRef.create(
            CppTemplateTypeRef.TemplateClass.SHARED_POINTER, COMPLEX_TYPE_REF
        )

        assertEquals(
            CppTemplateTypeRef.TemplateClass.SHARED_POINTER, templateTypeRef.templateClass
        )
        assertEquals(1, templateTypeRef.templateParameters.size)
        assertEquals(COMPLEX_TYPE_REF, templateTypeRef.templateParameters[0])
        assertEquals(3, templateTypeRef.includes.size)
        assertTrue(templateTypeRef.includes.containsAll(INCLUDES))
        assertTrue(templateTypeRef.includes.contains(CppLibraryIncludes.MEMORY))
    }

    @Test
    fun map() {
        val templateTypeRef = CppTemplateTypeRef.create(
            CppTemplateTypeRef.TemplateClass.MAP, INT_TYPE_REF, COMPLEX_TYPE_REF
        )

        assertEquals(CppTemplateTypeRef.TemplateClass.MAP, templateTypeRef.templateClass)
        assertEquals(2, templateTypeRef.templateParameters.size)
        assertEquals(INT_TYPE_REF, templateTypeRef.templateParameters[0])
        assertEquals(COMPLEX_TYPE_REF, templateTypeRef.templateParameters[1])
        assertEquals(4, templateTypeRef.includes.size)
        assertTrue(templateTypeRef.includes.containsAll(INCLUDES))
        assertTrue(templateTypeRef.includes.contains(CppLibraryIncludes.INT_TYPES))
        assertTrue(templateTypeRef.includes.contains(CppLibraryIncludes.MAP))
    }

    @Test
    fun vectorOfPrimitiveType() {
        val templateTypeRef =
            CppTemplateTypeRef.create(CppTemplateTypeRef.TemplateClass.VECTOR, INT_TYPE_REF)

        assertEquals(CppTemplateTypeRef.TemplateClass.VECTOR, templateTypeRef.templateClass)
        assertEquals(1, templateTypeRef.templateParameters.size)
        assertEquals(INT_TYPE_REF, templateTypeRef.templateParameters[0])

        assertEquals(2, templateTypeRef.includes.size)
        assertTrue(templateTypeRef.includes.contains(CppLibraryIncludes.VECTOR))
        assertTrue(templateTypeRef.includes.contains(CppLibraryIncludes.INT_TYPES))
    }

    @Test
    fun vectorOfComplexType() {
        val templateTypeRef =
            CppTemplateTypeRef.create(CppTemplateTypeRef.TemplateClass.VECTOR, COMPLEX_TYPE_REF)

        assertEquals(CppTemplateTypeRef.TemplateClass.VECTOR, templateTypeRef.templateClass)
        assertEquals(1, templateTypeRef.templateParameters.size)
        assertEquals(COMPLEX_TYPE_REF, templateTypeRef.templateParameters[0])

        assertEquals(3, templateTypeRef.includes.size)
        assertTrue(templateTypeRef.includes.contains(CppLibraryIncludes.VECTOR))
        assertTrue(templateTypeRef.includes.containsAll(INCLUDES))
    }

    @Test
    fun expected() {
        val templateTypeRef = CppTemplateTypeRef.create(
            "", CppTemplateTypeRef.TemplateClass.RETURN, COMPLEX_TYPE_REF, ERROR_TYPE_REF
        )

        assertEquals(CppTemplateTypeRef.TemplateClass.RETURN, templateTypeRef.templateClass)
        assertEquals(2, templateTypeRef.templateParameters.size)
        assertEquals(COMPLEX_TYPE_REF, templateTypeRef.templateParameters[0])
        assertEquals(ERROR_TYPE_REF, templateTypeRef.templateParameters[1])

        assertEquals(4, templateTypeRef.includes.size)
        assertTrue(templateTypeRef.includes.contains(CppLibraryIncludes.RETURN))
        assertTrue(templateTypeRef.includes.containsAll(INCLUDES))
        assertTrue(templateTypeRef.includes.containsAll(ERROR_INCLUDES))
    }

    companion object {
        private val INCLUDES =
            listOf(Include.createInternalInclude("a"), Include.createInternalInclude("b"))
        private val INT_TYPE_REF = CppPrimitiveTypeRef.INT32
        private val COMPLEX_TYPE_REF = CppComplexTypeRef("Custom", INCLUDES, null, false, false)
        private val ERROR_INCLUDES = listOf(Include.createInternalInclude("E"))
        private val ERROR_TYPE_REF =
            CppComplexTypeRef("CustomError", ERROR_INCLUDES, null, false, false)
    }
}
