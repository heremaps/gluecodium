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
 * Golden tests for spec task 12.1 (Phase 27.20, Requirement 5.1): every FFI handle `retrieve()`
 * whose result is passed to the SDK FFI MUST be null-checked, INCLUDING collection elements and
 * struct fields, via a single shared validated helper. Today `FfiHandleRegistry::retrieve()` can
 * return `nullptr` for a released/invalid key; for a scalar object param the emitter already guards
 * it, but a COLLECTION ELEMENT (`emitListInsertElement`) and a STRUCT FIELD (synthetic `make`) are
 * passed UNCHECKED — the documented null-handle → SIGSEGV pitfall.
 *
 * The fix routes every non-nullable retrieve through `FfiHandleRegistry::instance().retrieveChecked(
 * key, context)`, which throws a typed error carrying the param/element context instead of
 * dereferencing null. Nullable sites (absence is legal) keep passing `nullptr`.
 *
 * These tests are EXPECTED TO FAIL until the generator emits the validated helper and routes the
 * element/field sites through it.
 *
 * Validates: Requirements 5.1 (design §6.1 validated handle retrieval).
 */
class ReactNativeNullCheckedRetrieveTest {
    private val reactNativeGenerator =
        ReactNativeGenerator().apply {
            initialize(
                GeneratorOptions(
                    cppRootNamespace = NeutralLimeFixtures.rootNamespace,
                    libraryName = "library",
                ),
            )
        }

    private fun files(vararg elements: LimeNamedElement) =
        reactNativeGenerator.generate(LimeModel(referenceMap = emptyMap(), topElements = elements.toList()))

    private fun file(
        name: String,
        vararg elements: LimeNamedElement,
    ): String {
        val generated = files(*elements)
        val found = generated.find { it.targetFile.name == name }
        assertTrue("Expected generated file $name", found != null)
        return found!!.content
    }

    /** The shared registry helper must exist and throw when the handle is null. */
    @Test
    fun `FfiHandleRegistry exposes a validated retrieveChecked helper that throws on null`() {
        val registry = file("FfiHandleRegistry.h", NeutralLimeFixtures.tagStruct())
        assertTrue(
            "FfiHandleRegistry.h must declare a retrieveChecked(key, context) helper. Content:\n$registry",
            registry.contains("retrieveChecked"),
        )
        assertTrue(
            "retrieveChecked must throw (not return nullptr) when the handle is missing. Content:\n$registry",
            registry.contains("throw"),
        )
        assertTrue(
            "retrieveChecked must include the caller-supplied context in the error message. Content:\n$registry",
            registry.contains("context"),
        )
    }

    /** A live registry-size metric must be queryable so the soak test can assert bounded growth. */
    @Test
    fun `FfiHandleRegistry exposes a live-size accessor for the soak metric`() {
        val registry = file("FfiHandleRegistry.h", NeutralLimeFixtures.tagStruct())
        assertTrue(
            "FfiHandleRegistry.h must expose a size() accessor for the reliability metric. Content:\n$registry",
            registry.contains("size()"),
        )
    }

    /** Object list-element retrieval must be validated (was: `insert(list, __h)` unchecked). */
    @Test
    fun `list element object handle is validated before insertion`() {
        val tag = NeutralLimeFixtures.tagStruct()
        val impl = file("NativeTelemetryModule.cpp", tag, NeutralLimeFixtures.telemetryClass(tag))
        assertTrue(
            "consumeTags(List<Tag>) must route each element handle through retrieveChecked before inserting " +
                "it into the FFI list — an unchecked retrieve of a released key SIGSEGVs the SDK. Body:\n$impl",
            impl.contains("retrieveChecked(__hid, \"list element\")"),
        )
        assertTrue(
            "No list element may be inserted from a bare (unchecked) retrieve() result. Body:\n$impl",
            !Regex("retrieve\\(__hid\\);\\s*\\n\\s*library_[A-Za-z0-9_]+_insert").containsMatchIn(impl),
        )
    }

    /** Synthetic-make struct field object handle must be validated via the shared helper. */
    @Test
    fun `object handle method param is validated via the shared helper`() {
        val tag = NeutralLimeFixtures.tagStruct()
        val impl = file("NativeReadingModule.cpp", tag, NeutralLimeFixtures.readingStruct(tag))
        assertTrue(
            "Reading.make must validate the non-nullable `source` object handle via retrieveChecked " +
                "(the shared validated helper) before passing it to create_handle. Body:\n$impl",
            impl.contains("retrieveChecked(__hid_source, \"param 'source'\")"),
        )
        assertTrue(
            "No non-nullable object param may reach the FFI from a bare retrieve() + hand-rolled null check. " +
                "Body:\n$impl",
            !impl.contains("FfiHandleRegistry::instance().retrieve(__hid_source)"),
        )
    }
}
