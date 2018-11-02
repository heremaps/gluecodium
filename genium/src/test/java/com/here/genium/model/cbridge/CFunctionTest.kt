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

package com.here.genium.model.cbridge

import com.here.genium.generator.cbridge.CppTypeInfo
import com.here.genium.generator.cbridge.CppTypeInfo.TypeCategory
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertSame
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class CFunctionTest {
    private var builder = CFunction.builder("FUNCTION_NAME")

    @Test
    fun generateEmptyFunction() {
        val function = builder!!.build()

        assertEquals("FUNCTION_NAME", function.name)
        assertEquals(
            "By default function return void", function.returnType.functionReturnType, CType.VOID
        )
        assertEquals(
            "For empty function there is no parameters",
            0,
            function.parameters.size.toLong()
        )
    }

    @Test
    fun providedParametersArePropagatedToFunction() {
        val param = CParameter("FLAG", CppTypeInfo(CType.BOOL))
        val function = builder!!.parameters(listOf(param)).build()

        assertNotNull("Function parameters should be not null", function.parameters)
        assertEquals("Function should have 1 input parameter", 1, function.parameters.size.toLong())
        assertSame(param, function.parameters[0])
    }

    @Test
    fun providedDelegateCallTemplateIsPropagated() {
        val function = builder!!.delegateCall("delegateCall()").build()
        assertEquals("delegateCall()", function.delegateCall)
    }

    @Test
    fun errorIsNullIfNotProvided() {
        val function = builder!!.build()

        assertNull(function.error)
    }

    @Test
    fun providedErrorIsPropagated() {
        val error = CppTypeInfo(CType("SomeError"), TypeCategory.ENUM)

        val function = builder!!.error(error).build()

        assertNotNull(function.error)
        assertSame(error, function.error)
    }

    @Test
    fun isReturningVoidForVoidFunction() {
        val function = builder!!.build()

        assertTrue(function.isReturningVoid)
    }

    @Test
    fun isReturningVoidForNonVoidFunction() {
        val function = builder!!.returnType(CppTypeInfo(CType.FLOAT)).build()

        assertFalse(function.isReturningVoid)
    }
}
