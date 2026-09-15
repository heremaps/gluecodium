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
 * Golden tests for spec task 12.2 (Phase 27.20, Requirement 5.2): the callback-slot layer must
 *  (a) own each registration's state on the HEAP and FREE it in `close_fn` (so a long-running nav
 *      session that registers/unregisters thousands of listeners does not leak),
 *  (b) keep the typed-error exhaustion contract (reject a SINGLE call, do not corrupt neighbours), and
 *  (c) expose a live-registration / leaked-slot METRIC queryable from JS so the soak test can assert
 *      bounded growth and zero leaks.
 *
 * The C `create_proxy(token, isolate, dart_handle, close_fn, call_fn)` ABI requires `call_fn`/
 * `close_fn` to be plain (non-capturing) C function pointers, so a compile-time-indexed trampoline
 * table is retained (that is an ABI constraint, not a design choice). The per-registration STATE,
 * however, moves to a heap-owned context that `close_fn` releases, and an atomic counter tracks the
 * number of live contexts for the metric.
 *
 * These tests are EXPECTED TO FAIL until FfiCallbackSlot generation is reworked.
 *
 * Validates: Requirements 5.2, 5.5 (design §6.2 dynamic callback contexts).
 */
class ReactNativeCallbackContextTest {
    private val reactNativeGenerator =
        ReactNativeGenerator().apply {
            initialize(
                GeneratorOptions(
                    cppRootNamespace = NeutralLimeFixtures.rootNamespace,
                    libraryName = "library",
                ),
            )
        }

    private fun slotFile(ext: String): String {
        val files =
            reactNativeGenerator.generate(
                LimeModel(referenceMap = emptyMap(), topElements = emptyList<LimeNamedElement>()),
            )
        val name = "FfiCallbackSlot.$ext"
        val found = files.find { it.targetFile.name == name }
        assertTrue("Expected generated file $name", found != null)
        return found!!.content
    }

    /** A live-registration metric must exist and be declared in the header for JS to query. */
    @Test
    fun `header declares a live-registration metric accessor`() {
        val header = slotFile("h")
        assertTrue(
            "FfiCallbackSlot.h must declare a liveRegistrations() metric accessor for the soak test. " +
                "Header:\n$header",
            header.contains("liveRegistrations"),
        )
    }

    /** The registration state must be heap-owned (a CallbackContext), not bare std::function arrays. */
    @Test
    fun `slot state is a heap-owned callback context`() {
        val impl = slotFile("cpp")
        assertTrue(
            "FfiCallbackSlot.cpp must own each registration's state in a heap-allocated CallbackContext " +
                "(new/unique_ptr), not only raw std::function slot arrays. Impl:\n$impl",
            impl.contains("CallbackContext"),
        )
    }

    /** close_fn must free the heap-owned context and decrement the live counter. */
    @Test
    fun `close frees the heap-owned context and decrements the live counter`() {
        val impl = slotFile("cpp")
        assertTrue(
            "The generated close trampoline must release the heap-owned context (freeing its state). " +
                "Impl:\n$impl",
            impl.contains("releaseContext") || impl.contains("g_liveRegistrations.fetch_sub"),
        )
        assertTrue(
            "The live-registration counter must be defined so the metric can report it. Impl:\n$impl",
            impl.contains("g_liveRegistrations"),
        )
        assertTrue(
            "liveRegistrations() must be defined in the impl. Impl:\n$impl",
            impl.contains("liveRegistrations"),
        )
    }

    /** Exhaustion keeps the typed-error contract (rejects a single call, does not corrupt neighbours). */
    @Test
    fun `exhaustion throws a typed error`() {
        val impl = slotFile("cpp")
        assertTrue(
            "Slot exhaustion must still throw a typed error (std::runtime_error), rejecting only the " +
                "affected call. Impl:\n$impl",
            impl.contains("throw std::runtime_error"),
        )
    }
}
