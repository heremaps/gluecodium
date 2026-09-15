/*
 * Copyright (C) 2016-2026 HERE Europe B.V.
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

package com.here.gluecodium.generator.typescript

import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeEnumerator
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimeStruct
import org.junit.Assert.assertEquals
import org.junit.Test

class TypeScriptNameResolverTest {
    private val resolver = TypeScriptNameResolver()

    @Test
    fun `resolves class name as PascalCase`() {
        val limeClass = LimeClass(LimePath(listOf("com", "example"), listOf("Calculator")))
        assertEquals("Calculator", resolver.resolveName(limeClass))
    }

    @Test
    fun `resolves interface name as PascalCase`() {
        val iface = LimeInterface(LimePath(listOf("com", "example"), listOf("MultiplyCallback")))
        assertEquals("MultiplyCallback", resolver.resolveName(iface))
    }

    @Test
    fun `resolves struct name as PascalCase`() {
        val struct = LimeStruct(LimePath(listOf("com", "example"), listOf("DivideArguments")))
        assertEquals("DivideArguments", resolver.resolveName(struct))
    }

    @Test
    fun `resolves enum name as PascalCase`() {
        val enumeration = LimeEnumeration(LimePath(listOf("com", "example"), listOf("CalculatorError")))
        assertEquals("CalculatorError", resolver.resolveName(enumeration))
    }

    @Test
    fun `resolves function name as camelCase`() {
        val function = LimeFunction(LimePath(listOf("com", "example"), listOf("Calculator", "summarize")))
        assertEquals("summarize", resolver.resolveName(function))
    }

    @Test
    fun `resolves snake_case function to camelCase`() {
        val function = LimeFunction(LimePath(listOf("com", "example"), listOf("Calculator", "get_result")))
        assertEquals("getResult", resolver.resolveName(function))
    }

    @Test
    fun `resolves enum enumerator preserves name`() {
        val enumerator = LimeEnumerator(LimePath(listOf("com", "example"), listOf("MyEnum", "RESULT_OUT_OF_BOUNDS")))
        assertEquals("RESULT_OUT_OF_BOUNDS", resolver.resolveName(enumerator))
    }

    @Test
    fun `resolves file path from class`() {
        val limeClass = LimeClass(LimePath(listOf("gluecodium", "calculator"), listOf("Calculator")))
        assertEquals("typescript/gluecodium/calculator/Calculator.ts", resolver.resolveFilePath(limeClass))
    }

    @Test
    fun `resolves file path from nested type`() {
        val struct =
            LimeStruct(LimePath(listOf("gluecodium", "calculator"), listOf("Calculator", "DivideArguments")))
        assertEquals("typescript/gluecodium/calculator/DivideArguments.ts", resolver.resolveFilePath(struct))
    }
}
