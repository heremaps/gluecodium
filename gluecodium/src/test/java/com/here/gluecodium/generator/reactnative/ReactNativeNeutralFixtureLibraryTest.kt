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
import com.here.gluecodium.generator.typescript.TypeScriptGenerator
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeNamedElement
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Genericity coverage matrix over the product-NEUTRAL [NeutralLimeFixtures] library (spec task 15.1 /
 * Requirement 7.1). One golden test per RN generator capability, all driven from the shared fixture
 * library, proving the emitter produces correct output for arbitrary LIME input with zero
 * HERE-specific identifiers.
 *
 * This test does NOT duplicate the deep, layer-by-layer assertions of the focused capability tests
 * (ReactNativeInheritedOverloadNameResolutionTest, ReactNativeInterfaceObjectParameterTest,
 * ReactNativeNullableFieldConstructorTest, ReactNativeInheritedInterfacePropertyWrapperTest,
 * ReactNativeSharedEngineFactoryErrorAccessorTest, ReactNativeWrapperFactoryTest,
 * ReactNativeMapMarshallingTest). It is a breadth check that every capability is reachable from one
 * neutral library, so the fixtures stay a credible, reusable upstream artefact.
 *
 * Validates: Requirement 7.1 (neutral fixture library covering nullable, collections, callbacks,
 * single- and multi-method listeners, inheritance, shared-engine, synthetic makes).
 */
class ReactNativeNeutralFixtureLibraryTest {
    private fun reactNative(sharedEngineType: String = ""): ReactNativeGenerator =
        ReactNativeGenerator().apply {
            initialize(
                GeneratorOptions(
                    cppRootNamespace = NeutralLimeFixtures.rootNamespace,
                    libraryName = "library",
                    sharedEngineType = sharedEngineType,
                ),
            )
        }

    private val typeScript =
        TypeScriptGenerator().apply { initialize(GeneratorOptions(tags = setOf("react-native"))) }

    private fun bridge(
        fileName: String,
        sharedEngineType: String = "",
        vararg elements: LimeNamedElement,
    ): String {
        val files = reactNative(sharedEngineType).generate(LimeModel(referenceMap = emptyMap(), topElements = elements.toList()))
        val f = files.find { it.targetFile.name == fileName }
        assertTrue("$fileName should be generated", f != null)
        return f!!.content
    }

    private fun ts(
        fileNameSuffix: String,
        vararg elements: LimeNamedElement,
    ): String {
        val files = typeScript.generate(LimeModel(referenceMap = emptyMap(), topElements = elements.toList()))
        val f = files.find { it.targetFile.path.endsWith(fileNameSuffix) }
        assertTrue("$fileNameSuffix should be generated", f != null)
        return f!!.content
    }

    // ── Nullable + synthetic make ─────────────────────────────────────────────────────────────────

    @Test
    fun `nullable-field struct with no explicit ctor gets a synthetic make marshalling each nullable kind`() {
        val tag = NeutralLimeFixtures.tagStruct()
        val impl = bridge("NativeReadingModule.cpp", elements = arrayOf(tag, NeutralLimeFixtures.readingStruct(tag)))
        assertTrue("synthetic make constructs the handle", impl.contains("library_gluecodium_model_Reading_create_handle("))
        assertTrue("nullable string boxed via String_create_handle_nullable", impl.contains("library_String_create_handle_nullable("))
        assertTrue("nullable date boxed via the ULong nullable box", impl.contains("library_ULong_create_handle_nullable("))
        assertTrue("non-nullable object field retrieved + null-checked", impl.contains("retrieveChecked(__hid_source, \"param 'source'\")"))
    }

    // ── Collections: List, Set, Map ───────────────────────────────────────────────────────────────

    @Test
    fun `class methods returning List, Set and Map all marshal into arrays`() {
        val tag = NeutralLimeFixtures.tagStruct()
        val impl = bridge("NativeTelemetryModule.cpp", elements = arrayOf(tag, NeutralLimeFixtures.telemetryClass(tag)))
        // List of struct handles + Set of strings iterate into jsi::Array.
        assertTrue("list return iterates a collection", impl.contains("_ListOf_") || impl.contains("ListOf_"))
        assertTrue("set return iterates a collection", impl.contains("SetOf_"))
        // Map<Int,Double> uses the by-value get_key/get_value ABI and builds [key,value] tuples.
        assertTrue("map return builds key/value tuples", impl.contains("_iterator_get_key(") && impl.contains("_iterator_get_value("))
        assertTrue("map return builds 2-element tuples", impl.contains("jsi::Array(rt, 2)"))
        // Map param puts entries by value.
        assertTrue("map param puts entries", impl.contains("_put("))
    }

    @Test
    fun `map wrapper exposes a real Map type`() {
        val tag = NeutralLimeFixtures.tagStruct()
        val wrapper = ts("wrapper/Telemetry.ts", tag, NeutralLimeFixtures.telemetryClass(tag))
        assertTrue("wrapper exposes Map<number, number>", wrapper.contains("Map<number, number>"))
    }

    // ── Callback (lambda param) ───────────────────────────────────────────────────────────────────

    @Test
    fun `lambda callback parameter is marshalled through a create_proxy slot`() {
        val impl = bridge("NativeSamplerModule.cpp", elements = arrayOf(NeutralLimeFixtures.samplerClass()))
        assertTrue("lambda param builds a callback proxy", impl.contains("_create_proxy("))
        assertTrue("lambda param acquires a callback slot", impl.contains("FfiCbs::acquire"))
    }

    // ── Single-method listener ────────────────────────────────────────────────────────────────────

    @Test
    fun `single-method listener param is a jsi Function callback`() {
        val tick = NeutralLimeFixtures.tickListenerInterface()
        val stream = NeutralLimeFixtures.streamListenerInterface()
        val base = NeutralLimeFixtures.baseSensorInterface()
        val derived = NeutralLimeFixtures.derivedSensorInterface(base)
        val hub = NeutralLimeFixtures.hubClass(tick, stream, derived)
        val header = bridge("NativeHubModule.h", elements = arrayOf(tick, stream, base, derived, hub))
        // A single-void-method listener parameter is typed as a jsi::Function (callback proxy path).
        assertTrue("watch(listener) param is a jsi::Function callback. Header:\n$header", header.contains("jsi::Function"))
    }

    // ── Multi-method listener ─────────────────────────────────────────────────────────────────────

    @Test
    fun `multi-method listener param is the generic Object of callbacks`() {
        val tick = NeutralLimeFixtures.tickListenerInterface()
        val stream = NeutralLimeFixtures.streamListenerInterface()
        val base = NeutralLimeFixtures.baseSensorInterface()
        val derived = NeutralLimeFixtures.derivedSensorInterface(base)
        val hub = NeutralLimeFixtures.hubClass(tick, stream, derived)
        val header = bridge("NativeHubModule.h", elements = arrayOf(tick, stream, base, derived, hub))
        // A multi-method (all-void, no-property) listener is passed as a jsi::Object of callbacks.
        assertTrue("stream(listener) param is a jsi::Object. Header:\n$header", header.contains("jsi::Object"))
    }

    // ── Interface inheritance ─────────────────────────────────────────────────────────────────────

    @Test
    fun `derived interface param routes through the object-handle path`() {
        val tick = NeutralLimeFixtures.tickListenerInterface()
        val stream = NeutralLimeFixtures.streamListenerInterface()
        val base = NeutralLimeFixtures.baseSensorInterface()
        val derived = NeutralLimeFixtures.derivedSensorInterface(base)
        val hub = NeutralLimeFixtures.hubClass(tick, stream, derived)
        // DerivedSensor has a non-void inherited method (get_name -> String), so it is NOT a callback
        // listener → it is passed as an opaque object handle (registry key), proving inheritance is
        // resolved (the inherited method disqualifies it from the listener path).
        val impl = bridge("NativeHubModule.cpp", elements = arrayOf(tick, stream, base, derived, hub))
        assertTrue(
            "attach(sensor) retrieves the object handle from the registry. Body:\n$impl",
            impl.contains("FfiHandleRegistry::instance().retrieve("),
        )
    }

    // ── Shared engine ─────────────────────────────────────────────────────────────────────────────

    @Test
    fun `shared-engine class factory wires setSharedEngineRaw`() {
        val impl = bridge("NativeEngineModule.cpp", sharedEngineType = "Engine", elements = arrayOf(NeutralLimeFixtures.engineClass()))
        assertTrue("shared-engine factory stores the raw engine handle", impl.contains("setSharedEngineRaw"))
    }
}
