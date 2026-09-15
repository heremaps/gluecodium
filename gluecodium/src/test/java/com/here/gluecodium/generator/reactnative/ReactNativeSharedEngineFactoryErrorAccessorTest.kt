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

package com.here.gluecodium.generator.reactnative

import com.here.gluecodium.generator.common.GeneratorOptions
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeComment
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimeReturnType
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeThrownType
import com.here.gluecodium.model.lime.LimeTypeRef
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test

/**
 * Regression test for the shared-engine / named factory constructor error-accessor.
 *
 * A class whose factory constructor injects the shared engine (i.e. the plain `make()` has a
 * dropped `make(Engine)` sibling) is emitted through the shared-engine constructor path. That
 * path declares the throwing-return error accessor `<ffi>_return_get_error`. The accessor yields
 * the error CODE, so it MUST be declared `uint32_t`, exactly as the primary throwing paths
 * declare it. When the shared-engine path declared it as `FfiOpaqueHandle` instead, the
 * extern-"C" block for the same symbol contained two conflicting declarations, which is not
 * valid C++ ("functions that differ only in their return type cannot be overloaded") and also
 * broke `std::to_string(errorCode)`.
 *
 * This is product-neutral: `CalculationEngine`/`Widget` stand in for any shared-engine factory.
 */
class ReactNativeSharedEngineFactoryErrorAccessorTest {
    private val generator = ReactNativeGenerator()

    @Before
    fun setUp() {
        generator.initialize(
            GeneratorOptions(
                cppRootNamespace = listOf("gluecodium", "calculator"),
                libraryName = "library",
                sharedEngineType = "CalculationEngine",
            ),
        )
    }

    // The configured shared engine type. Sub-engine factory constructors take this as their
    // first parameter; the generator drops that parameter and injects the shared engine handle.
    private fun createEngineClass(): LimeClass = LimeClass(LimePath(listOf("gluecodium", "calculator"), listOf("CalculationEngine")))

    private fun engineTypeRef(engine: LimeClass): LimeTypeRef = LimeDirectTypeRef(engine)

    private fun throwsClause(): LimeThrownType =
        LimeThrownType(
            LimeDirectTypeRef(
                LimeException(
                    LimePath(listOf("gluecodium", "calculator"), listOf("Widget", "InstantiationError")),
                    comment = LimeComment(),
                    errorType =
                        LimeDirectTypeRef(
                            LimeStruct(LimePath(listOf("gluecodium", "calculator"), listOf("WidgetErrorCode"))),
                        ),
                ),
            ),
        )

    /**
     * A class with a throwing factory constructor in two shapes:
     *   - plain    `make()`               — exposed to JS
     *   - variant  `make(CalculationEngine)` — dropped; JS `make()` calls it with the shared engine
     * The variant is emitted via the shared-engine constructor path.
     */
    private fun createWidgetClass(engine: LimeClass): LimeClass {
        val plainMake =
            LimeFunction(
                LimePath(listOf("gluecodium", "calculator"), listOf("Widget", "make")),
                isConstructor = true,
                thrownType = throwsClause(),
                returnType = LimeReturnType(LimeDirectTypeRef(engine)),
            )
        val engineMake =
            LimeFunction(
                LimePath(listOf("gluecodium", "calculator"), listOf("Widget", "makeWithEngine")),
                isConstructor = true,
                parameters =
                    listOf(
                        LimeParameter(
                            LimePath(listOf("gluecodium", "calculator"), listOf("Widget", "makeWithEngine", "engine")),
                            typeRef = engineTypeRef(engine),
                        ),
                    ),
                thrownType = throwsClause(),
                returnType = LimeReturnType(LimeDirectTypeRef(engine)),
            )
        return LimeClass(
            LimePath(listOf("gluecodium", "calculator"), listOf("Widget")),
            functions = listOf(plainMake, engineMake),
        )
    }

    private fun widgetImpl(): String {
        val engine = createEngineClass()
        val files =
            generator.generate(
                LimeModel(referenceMap = emptyMap(), topElements = listOf(engine, createWidgetClass(engine))),
            )
        val impl = files.find { it.targetFile.name == "NativeWidgetModule.cpp" }
        assertTrue("NativeWidgetModule.cpp should be generated", impl != null)
        return impl!!.content
    }

    private fun errorAccessorDeclarations(content: String): List<String> {
        val regex = Regex(""".*_return_get_error\(FfiOpaqueHandle handle\);""")
        return content.lines().map { it.trim() }.filter { regex.matches(it) }
    }

    @Test
    fun `error accessor extern is declared exactly once`() {
        val declarations = errorAccessorDeclarations(widgetImpl())
        assertEquals(
            "Expected a single _return_get_error extern, got: $declarations",
            1,
            declarations.size,
        )
    }

    @Test
    fun `error accessor extern returns uint32_t not a handle`() {
        val declaration = errorAccessorDeclarations(widgetImpl()).single()
        assertTrue(
            "Error accessor must return uint32_t, was: $declaration",
            declaration.startsWith("uint32_t "),
        )
        assertFalse(
            "Error accessor must not be declared as FfiOpaqueHandle, was: $declaration",
            declaration.startsWith("FfiOpaqueHandle "),
        )
    }

    @Test
    fun `error code is stringified directly without reinterpret_cast`() {
        val content = widgetImpl()
        assertTrue(
            "Body should stringify the error code with std::to_string(__errCode)",
            content.contains("std::to_string(__errCode)"),
        )
        assertFalse(
            "Body must not reinterpret_cast the error code to a pointer",
            content.contains("reinterpret_cast<intptr_t>(__errCode)"),
        )
    }
}
