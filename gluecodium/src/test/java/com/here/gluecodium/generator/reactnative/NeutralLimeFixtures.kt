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

import com.here.gluecodium.model.lime.LimeBasicType.TypeId
import com.here.gluecodium.model.lime.LimeBasicTypeRef
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeLambdaParameter
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimeReturnType
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeTypeRef

/**
 * A product-NEUTRAL LIME fixture library for the React Native generator golden tests (spec task 15.1
 * / Requirement 7.1). It is the single, reusable source of small LIME models exercising every RN
 * generator capability, so a genericity test can assert the emitter works for arbitrary LIME input
 * without any HERE-specific identifier.
 *
 * Every name here is a generic domain term (Sensor, Reading, Telemetry, ...) — NOT a HERE SDK type.
 * The `check-generator-genericity.sh` CI guard scans generator SOURCES (not these test fixtures), so
 * the fixtures are free to name their own neutral types. The library deliberately does NOT rewrite
 * the existing per-capability golden tests (surgical: those stay green); it consolidates the shapes
 * they each re-declared into one place so new tests can reuse them.
 *
 * Capability coverage (Requirement 7.1):
 *   - nullable fields (string / date / object)          → [readingStruct]
 *   - collections (List / Set / Map)                     → [telemetryClass]
 *   - callbacks (lambda param)                           → [samplerClass]
 *   - single-method interface listener (≤3 params, void) → [tickListenerInterface]
 *   - multi-method interface listener (object of cbs)    → [streamListenerInterface]
 *   - interface inheritance                              → [derivedSensorInterface] / [baseSensorInterface]
 *   - shared-engine factory                              → [engineClass] (via -sharedenginetype)
 *   - synthetic make (struct with no exposed ctor)       → [readingStruct]
 */
internal object NeutralLimeFixtures {
    val rootNamespace = listOf("gluecodium", "model")

    private fun path(vararg tail: String) = LimePath(rootNamespace, tail.toList())

    /** A trivial value struct used as a nullable OBJECT field and as a collection element. */
    fun tagStruct(): LimeStruct =
        LimeStruct(
            path("Tag"),
            fields = listOf(LimeField(path("Tag", "label"), typeRef = LimeBasicTypeRef(TypeId.STRING))),
        )

    /**
     * NULLABLE + SYNTHETIC-MAKE fixture. `Reading` has fields but NO explicit constructor, so the
     * generator synthesizes `make(<uninitialized fields>)`. It carries one nullable field of each
     * supported kind (string, date, object) plus a non-nullable object field to exercise the
     * retrieve+null-check path.
     */
    fun readingStruct(tag: LimeStruct): LimeStruct =
        LimeStruct(
            path("Reading"),
            fields =
                listOf(
                    LimeField(path("Reading", "source"), typeRef = LimeDirectTypeRef(tag)),
                    LimeField(path("Reading", "note"), typeRef = LimeBasicTypeRef(TypeId.STRING, isNullable = true)),
                    LimeField(path("Reading", "capturedAt"), typeRef = LimeBasicTypeRef(TypeId.DATE, isNullable = true)),
                    LimeField(path("Reading", "owner"), typeRef = LimeDirectTypeRef(tag, isNullable = true)),
                ),
        )

    private fun listOfTag(tag: LimeStruct): LimeTypeRef = LimeDirectTypeRef(LimeList(LimeDirectTypeRef(tag)))

    private fun setOfString(): LimeTypeRef = LimeDirectTypeRef(LimeSet(LimeBasicTypeRef(TypeId.STRING)))

    private fun mapIntToDouble(): LimeTypeRef = LimeDirectTypeRef(LimeMap(LimeBasicTypeRef(TypeId.INT32), LimeBasicTypeRef(TypeId.DOUBLE)))

    /** COLLECTIONS fixture: a class whose methods return/accept List, Set and Map. */
    fun telemetryClass(tag: LimeStruct): LimeClass {
        val getTags = LimeFunction(path("Telemetry", "getTags"), returnType = LimeReturnType(listOfTag(tag)))
        val getLabels = LimeFunction(path("Telemetry", "getLabels"), returnType = LimeReturnType(setOfString()))
        val getCurve = LimeFunction(path("Telemetry", "getCurve"), returnType = LimeReturnType(mapIntToDouble()))
        val setCurve =
            LimeFunction(
                path("Telemetry", "setCurve"),
                parameters = listOf(LimeParameter(path("Telemetry", "setCurve", "curve"), typeRef = mapIntToDouble())),
                returnType = LimeReturnType(LimeBasicTypeRef(TypeId.VOID)),
            )
        // Object-element collection PARAMETER: exercises the list-insert-element retrieve path, where
        // each JS array entry is a registry key that must be validated before it reaches the FFI.
        val consumeTags =
            LimeFunction(
                path("Telemetry", "consumeTags"),
                parameters = listOf(LimeParameter(path("Telemetry", "consumeTags", "tags"), typeRef = listOfTag(tag))),
                returnType = LimeReturnType(LimeBasicTypeRef(TypeId.VOID)),
            )
        return LimeClass(path("Telemetry"), functions = listOf(getTags, getLabels, getCurve, setCurve, consumeTags))
    }

    /** CALLBACK fixture: a class method taking a lambda `(Double) -> void`. */
    fun samplerClass(): LimeClass {
        val onSample =
            LimeLambda(
                path("Sampler", "SampleHandler"),
                parameters = listOf(LimeLambdaParameter(LimeBasicTypeRef(TypeId.DOUBLE), path("Sampler", "SampleHandler", "value"))),
            )
        val observe =
            LimeFunction(
                path("Sampler", "observe"),
                parameters = listOf(LimeParameter(path("Sampler", "observe", "handler"), typeRef = LimeDirectTypeRef(onSample))),
                returnType = LimeReturnType(LimeBasicTypeRef(TypeId.VOID)),
            )
        return LimeClass(path("Sampler"), lambdas = listOf(onSample), functions = listOf(observe))
    }

    /** SINGLE-METHOD LISTENER: one void method with ≤3 params → jsi::Function callback proxy. */
    fun tickListenerInterface(): LimeInterface =
        LimeInterface(
            path("TickListener"),
            functions =
                listOf(
                    LimeFunction(
                        path("TickListener", "on_tick"),
                        parameters =
                            listOf(
                                LimeParameter(path("TickListener", "on_tick", "value"), typeRef = LimeBasicTypeRef(TypeId.DOUBLE)),
                            ),
                        returnType = LimeReturnType(LimeBasicTypeRef(TypeId.VOID)),
                    ),
                ),
        )

    /** MULTI-METHOD LISTENER: several void methods, no properties → object-of-callbacks proxy. */
    fun streamListenerInterface(): LimeInterface =
        LimeInterface(
            path("StreamListener"),
            functions =
                listOf(
                    LimeFunction(
                        path("StreamListener", "on_started"),
                        returnType = LimeReturnType(LimeBasicTypeRef(TypeId.VOID)),
                    ),
                    LimeFunction(
                        path("StreamListener", "on_value"),
                        parameters =
                            listOf(
                                LimeParameter(path("StreamListener", "on_value", "value"), typeRef = LimeBasicTypeRef(TypeId.DOUBLE)),
                            ),
                        returnType = LimeReturnType(LimeBasicTypeRef(TypeId.VOID)),
                    ),
                    LimeFunction(
                        path("StreamListener", "on_stopped"),
                        returnType = LimeReturnType(LimeBasicTypeRef(TypeId.VOID)),
                    ),
                ),
        )

    /** INHERITANCE: a base interface with a property + method, and a derived interface extending it. */
    fun baseSensorInterface(): LimeInterface {
        val getName =
            LimeFunction(path("BaseSensor", "get_name"), returnType = LimeReturnType(LimeBasicTypeRef(TypeId.STRING)))
        return LimeInterface(path("BaseSensor"), functions = listOf(getName))
    }

    fun derivedSensorInterface(base: LimeInterface): LimeInterface {
        val calibrate =
            LimeFunction(path("DerivedSensor", "calibrate"), returnType = LimeReturnType(LimeBasicTypeRef(TypeId.VOID)))
        return LimeInterface(
            path("DerivedSensor"),
            parents = listOf(LimeDirectTypeRef(base)),
            functions = listOf(calibrate),
        )
    }

    /**
     * SHARED-ENGINE fixture: a class whose static `make()` is the shared engine, wired via the
     * `-sharedenginetype` flag (the generator emits setSharedEngineRaw in its factory). The neutral
     * name is `Engine`; tests pass `sharedEngineType = "Engine"` in GeneratorOptions.
     */
    fun engineClass(): LimeClass {
        val make =
            LimeFunction(
                path("Engine", "make"),
                isConstructor = true,
            )
        return LimeClass(path("Engine"), functions = listOf(make))
    }

    /**
     * A host class that USES the interfaces as method parameters/return types. A React Native
     * TurboModule is generated for a class (an instantiable JS-facing type), not for a standalone
     * interface — interfaces are marshalled inline where referenced. This host therefore materializes
     * the single-method listener, multi-method listener, and interface-inheritance capabilities into
     * one `NativeHub*` module the coverage matrix can assert on.
     */
    fun hubClass(
        tickListener: LimeInterface,
        streamListener: LimeInterface,
        derivedSensor: LimeInterface,
    ): LimeClass {
        val watch =
            LimeFunction(
                path("Hub", "watch"),
                parameters = listOf(LimeParameter(path("Hub", "watch", "listener"), typeRef = LimeDirectTypeRef(tickListener))),
                returnType = LimeReturnType(LimeBasicTypeRef(TypeId.VOID)),
            )
        val stream =
            LimeFunction(
                path("Hub", "stream"),
                parameters = listOf(LimeParameter(path("Hub", "stream", "listener"), typeRef = LimeDirectTypeRef(streamListener))),
                returnType = LimeReturnType(LimeBasicTypeRef(TypeId.VOID)),
            )
        val attach =
            LimeFunction(
                path("Hub", "attach"),
                parameters = listOf(LimeParameter(path("Hub", "attach", "sensor"), typeRef = LimeDirectTypeRef(derivedSensor))),
                returnType = LimeReturnType(LimeBasicTypeRef(TypeId.VOID)),
            )
        return LimeClass(path("Hub"), functions = listOf(watch, stream, attach))
    }
}
