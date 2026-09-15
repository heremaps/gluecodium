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
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeNamedElement
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Golden test for spec task 12.4 (Phase 27.20, Requirement 5.4): the `Dart_*` stub table in the
 * generated `FfiCallbackInit.cpp` must be SOURCED from the `dart_api_dl.h` `DART_API_ALL_DL_SYMBOLS`
 * X-macro (via `#include <dart_api_dl.h>` when present, else a single embedded X-macro that mirrors
 * it), so the table can never silently drift from the real Dart ABI. Today the table is a
 * hand-maintained parallel `g_dart_stubs[]` array — two lists that can diverge.
 *
 * The generated file must:
 *   (a) attempt `#include <dart_api_dl.h>` so a real header wins when the build provides it,
 *   (b) drive the stub table from a SINGLE symbol list (an X-macro) rather than a second hand list, and
 *   (c) document that the embedded list mirrors DART_API_ALL_DL_SYMBOLS and how to refresh it.
 *
 * Expected to FAIL until the generator reworks the table to be X-macro-sourced.
 *
 * Validates: Requirements 5.4 (design §6.4 Dart symbol table).
 */
class ReactNativeDartStubTableTest {
    private val reactNativeGenerator =
        ReactNativeGenerator().apply {
            initialize(
                GeneratorOptions(
                    cppRootNamespace = NeutralLimeFixtures.rootNamespace,
                    libraryName = "library",
                ),
            )
        }

    private fun callbackInitImpl(): String {
        val files =
            reactNativeGenerator.generate(
                LimeModel(referenceMap = emptyMap(), topElements = emptyList<LimeNamedElement>()),
            )
        val found = files.find { it.targetFile.name == "FfiCallbackInit.cpp" }
        assertTrue("Expected generated FfiCallbackInit.cpp", found != null)
        return found!!.content
    }

    @Test
    fun `prefers the real dart_api_dl header when available`() {
        val impl = callbackInitImpl()
        assertTrue(
            "FfiCallbackInit.cpp must attempt to include the real dart_api_dl.h so it wins when the " +
                "build provides it. Impl:\n$impl",
            impl.contains("dart_api_dl.h"),
        )
        assertTrue(
            "The include must be guarded by __has_include so the build still works without the header. " +
                "Impl:\n$impl",
            impl.contains("__has_include"),
        )
    }

    @Test
    fun `stub table is driven by a single X-macro symbol list`() {
        val impl = callbackInitImpl()
        assertTrue(
            "The stub table must be sourced from a single X-macro symbol list (mirroring " +
                "DART_API_ALL_DL_SYMBOLS), not a hand-maintained parallel array. Impl:\n$impl",
            impl.contains("DART_API_ALL_DL_SYMBOLS") || impl.contains("FFI_DART_DL_SYMBOLS"),
        )
        assertTrue(
            "The g_dart_stubs table entries must be expanded from the X-macro, not listed by hand. " +
                "Impl:\n$impl",
            Regex("g_dart_stubs\\[\\]\\s*=\\s*\\{[^}]*#|_SYMBOLS\\(").containsMatchIn(impl) ||
                impl.contains("FFI_DART_DL_ENTRY") ||
                impl.contains("_SYMBOLS(FFI_DART"),
        )
    }

    @Test
    fun `documents the source of the embedded symbol list`() {
        val impl = callbackInitImpl()
        assertTrue(
            "The embedded fallback list must document that it mirrors DART_API_ALL_DL_SYMBOLS and how to " +
                "refresh it. Impl:\n$impl",
            impl.contains("DART_API_ALL_DL_SYMBOLS"),
        )
    }

    /** Every symbol that was in the hand-maintained table must still be present (no coverage loss). */
    @Test
    fun `retains core Dart DL symbols`() {
        val impl = callbackInitImpl()
        for (symbol in listOf(
            "Dart_NewPersistentHandle",
            "Dart_DeletePersistentHandle",
            "Dart_PostCObject",
            "Dart_NewNativePort",
            "Dart_CloseNativePort",
            "Dart_GetCurrentThreadOwnsIsolate",
        )) {
            assertTrue("Dart DL symbol $symbol must remain in the table. Impl:\n$impl", impl.contains(symbol))
        }
    }
}
