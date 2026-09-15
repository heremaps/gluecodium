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
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributes
import com.here.gluecodium.model.lime.LimeBasicType.TypeId
import com.here.gluecodium.model.lime.LimeBasicTypeRef
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimeReturnType
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Golden test for Phase 27.37 (spec task 52): the RN generator must emit a native MODULE for an
 * INTERFACE that carries a STATIC FACTORY returning the interface itself. Real-SDK case:
 * `LocationEngineBase.makeLocationEngineFromSharedSdkNativeEngine()` — the device-positioning engine,
 * whose C-FFI symbols exist but which had NO NativeLocationEngineBaseModule because the generator
 * only looped over classes/structs, not interfaces. So the engine was unreachable from TypeScript
 * (the "stays on Chicago" positioning gap).
 *
 * Neutral, non-HERE fixture: interface `Sensor` with
 *   - static `make_from_shared() -> Sensor`  (the self-returning factory that makes it instantiable)
 *   - instance `start() -> void`              (operates on the factory-produced handle)
 * The generator must produce NativeSensorModule.{cpp,h,ts} where the factory is a STATIC bridge
 * method (no `_self` handle param) and the instance method retrieves the handle from the registry.
 */
class ReactNativeFactoryInterfaceModuleTest {
    private val rootNamespace = listOf("gluecodium", "sensors")

    private val reactNativeGenerator =
        ReactNativeGenerator().apply {
            initialize(GeneratorOptions(cppRootNamespace = rootNamespace, libraryName = "library", sharedEngineType = "SDKNativeEngine"))
        }

    private val typeScriptGenerator =
        TypeScriptGenerator().apply {
            initialize(GeneratorOptions(tags = setOf("react-native"), sharedEngineType = "SDKNativeEngine"))
        }

    /**
     * Interface `Sensor` with a self-returning static factory + one instance method.
     * The factory's return type is a Sensor of the SAME PATH (the generator's factory-interface
     * check compares by path), so a stub instance with the same path is a valid self-return.
     */
    private val sensor: LimeInterface by lazy {
        val sensorPath = LimePath(rootNamespace, listOf("Sensor"))
        val selfReturn = LimeInterface(sensorPath)
        // The real SDK marks these factories @Java(Skip)+@Swift(Skip); RN must still emit them.
        val skippedAttributes =
            LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.JAVA, com.here.gluecodium.model.lime.LimeAttributeValueType.SKIP)
                .addAttribute(LimeAttributeType.SWIFT, com.here.gluecodium.model.lime.LimeAttributeValueType.SKIP)
                .build() // same path -> recognised as self-returning
        // A self-returning static factory that takes a parameter (mirrors
        // makeLocationEngine(SDKNativeEngine)) — a plain string param stands in for the engine.
        val factoryWithParam =
            LimeFunction(
                LimePath(rootNamespace, listOf("Sensor", "make_from_config")),
                isStatic = true,
                parameters =
                    listOf(
                        LimeParameter(
                            LimePath(rootNamespace, listOf("Sensor", "make_from_config", "config")),
                            typeRef = LimeBasicTypeRef(TypeId.STRING),
                        ),
                    ),
                returnType = LimeReturnType(LimeDirectTypeRef(selfReturn)),
            )
        val factory =
            LimeFunction(
                LimePath(rootNamespace, listOf("Sensor", "make_from_shared")),
                // Real SDK shape (verified via generation debug on LocationEngineBase):
                // a self-returning factory is a STATIC, NON-constructor function that the SDK marks
                // @Java(Skip)+@Swift(Skip) — RN must emit it anyway.
                attributes = skippedAttributes,
                isStatic = true,
                returnType = LimeReturnType(LimeDirectTypeRef(selfReturn)),
            )
        val start =
            LimeFunction(
                LimePath(rootNamespace, listOf("Sensor", "start")),
                returnType = LimeReturnType(LimeBasicTypeRef(TypeId.VOID)),
            )
        LimeInterface(sensorPath, functions = listOf(factoryWithParam, factory, start))
    }

    private fun reactNativeFiles(vararg elements: LimeNamedElement) =
        reactNativeGenerator.generate(LimeModel(referenceMap = emptyMap(), topElements = elements.toList()))

    private fun typeScriptFiles(vararg elements: LimeNamedElement) =
        typeScriptGenerator.generate(LimeModel(referenceMap = emptyMap(), topElements = elements.toList()))

    @Test
    fun `a factory-bearing interface gets a native module (cpp + header)`() {
        val files = reactNativeFiles(sensor)
        val impl = files.find { it.targetFile.name == "NativeSensorModule.cpp" }
        val header = files.find { it.targetFile.name == "NativeSensorModule.h" }
        assertTrue(
            "A native module (NativeSensorModule.cpp) MUST be generated for an interface with a " +
                "self-returning static factory. Files: ${files.map { it.targetFile.name }}",
            impl != null,
        )
        assertTrue("NativeSensorModule.h MUST be generated too.", header != null)
    }

    @Test
    fun `the static factory is a static bridge method and the instance method retrieves the handle`() {
        val impl = reactNativeFiles(sensor).find { it.targetFile.name == "NativeSensorModule.cpp" }!!.content
        // The static factory must NOT retrieve a _self handle (it constructs one).
        assertTrue(
            "The factory (make/makeFromShared) must be present in the bridge. Body:\n$impl",
            impl.contains("makeFromShared") || impl.contains("make_from_shared") ||
                Regex("\"make\"").containsMatchIn(impl) || impl.contains("::make"),
        )
        // The instance method `start` must retrieve the self handle from the registry.
        assertTrue(
            "The instance method 'start' must retrieve the FFI handle from the registry (__self). Body:\n$impl",
            impl.contains("FfiHandleRegistry::instance().retrieve") && impl.contains("__self"),
        )
    }

    @Test
    fun `the TurboModule spec exposes the factory + instance method`() {
        val spec = typeScriptFiles(sensor).find { it.targetFile.name == "NativeSensorModule.ts" }
        assertTrue(
            "TurboModule spec NativeSensorModule.ts MUST be generated for the factory interface.",
            spec != null,
        )
        assertTrue(
            "The spec must expose the factory (make/makeFromShared, returning a handle string) and " +
                "the instance method (start). Spec:\n${spec!!.content}",
            (
                spec.content.contains("makeFromShared") || spec.content.contains("make_from_shared") ||
                    Regex("readonly make\\s*:\\s*\\(\\)\\s*=>\\s*string").containsMatchIn(spec.content)
            ) &&
                spec.content.contains("start"),
        )
    }
}
