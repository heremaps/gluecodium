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
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeAttributes
import com.here.gluecodium.model.lime.LimeBasicType.TypeId
import com.here.gluecodium.model.lime.LimeBasicTypeRef
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeEnumerator
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeLambdaParameter
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimeReturnType
import com.here.gluecodium.model.lime.LimeStruct
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * TDD-RED fixture + failing golden tests for Phase 27.12 (spec task 2.1).
 *
 * A neutral (product-neutral) LIME interface declares a method that is overloaded via the
 * existing `@Dart(Name)` annotation. A class inherits that interface, so the overloaded
 * methods reach every emitter through inheritance — mirroring the real RoutingEngine
 * transport-mode overloads without any HERE identifiers.
 *
 * The disambiguated `@Dart(Name)` name MUST appear in all three emission layers:
 *   - the C++ JSI bridge (NativeAreaEngineModule.h),
 *   - the TurboModule TypeScript spec (specs/NativeAreaEngineModule.ts), and
 *   - the idiomatic TypeScript wrapper (wrapper/AreaEngine.ts).
 *
 * These tests are EXPECTED TO FAIL until task 2.2 wires the shared effective-name resolver
 * into all three emitters. Currently both `resolveName` implementations ignore `@Dart(Name)`
 * and collapse the two overloads to a single `computeArea` during name de-duplication, so the
 * disambiguated `computeAreaRectangle` is silently dropped from every layer.
 *
 * Validates: Requirements 3.1, 3.6, 7.1 (design §1.1 shared callable-name resolution).
 */
class ReactNativeInheritedOverloadNameResolutionTest {
    private val rootNamespace = listOf("gluecodium", "shapes")

    /** The disambiguated overload name declared via `@Dart(Name)` on the second method. */
    private val disambiguatedName = "computeAreaRectangle"

    private val reactNativeGenerator =
        ReactNativeGenerator().apply {
            initialize(
                GeneratorOptions(
                    cppRootNamespace = rootNamespace,
                    libraryName = "library",
                ),
            )
        }

    private val typeScriptGenerator =
        TypeScriptGenerator().apply {
            initialize(GeneratorOptions(tags = setOf("react-native")))
        }

    /**
     * Interface `AreaCalculator` with an overloaded method:
     *  - `compute_area(width)`                    -> effective name "computeArea"
     *  - `compute_area(width, height)` @Dart(Name = "compute_area_rectangle")
     *      -> effective name MUST become "computeAreaRectangle"
     *
     * Both share the same LIME leaf name `compute_area`, which is exactly why overload
     * disambiguation is required.
     */
    private fun createAreaCalculatorInterface(): LimeInterface {
        val interfacePath = LimePath(rootNamespace, listOf("AreaCalculator"))

        val computeAreaWidth =
            LimeFunction(
                LimePath(rootNamespace, listOf("AreaCalculator", "compute_area")),
                parameters =
                    listOf(
                        LimeParameter(
                            LimePath(rootNamespace, listOf("AreaCalculator", "compute_area", "width")),
                            typeRef = LimeBasicTypeRef(TypeId.DOUBLE),
                        ),
                    ),
                returnType = LimeReturnType(LimeBasicTypeRef(TypeId.DOUBLE)),
            )

        val rectangleOverloadAttributes =
            LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.DART, LimeAttributeValueType.NAME, "compute_area_rectangle")
                .build()

        val computeAreaRectangle =
            LimeFunction(
                LimePath(rootNamespace, listOf("AreaCalculator", "compute_area")),
                attributes = rectangleOverloadAttributes,
                parameters =
                    listOf(
                        LimeParameter(
                            LimePath(rootNamespace, listOf("AreaCalculator", "compute_area", "width")),
                            typeRef = LimeBasicTypeRef(TypeId.DOUBLE),
                        ),
                        LimeParameter(
                            LimePath(rootNamespace, listOf("AreaCalculator", "compute_area", "height")),
                            typeRef = LimeBasicTypeRef(TypeId.DOUBLE),
                        ),
                    ),
                returnType = LimeReturnType(LimeBasicTypeRef(TypeId.DOUBLE)),
            )

        return LimeInterface(
            interfacePath,
            functions = listOf(computeAreaWidth, computeAreaRectangle),
        )
    }

    /** Class `AreaEngine` inherits `AreaCalculator`, so the overloads arrive via inheritance. */
    private fun createAreaEngineClass(areaCalculator: LimeInterface): LimeClass =
        LimeClass(
            LimePath(rootNamespace, listOf("AreaEngine")),
            parents = listOf(LimeDirectTypeRef(areaCalculator)),
        )

    private fun reactNativeFiles(vararg elements: LimeNamedElement) =
        reactNativeGenerator.generate(LimeModel(referenceMap = emptyMap(), topElements = elements.toList()))

    private fun typeScriptFiles(vararg elements: LimeNamedElement) =
        typeScriptGenerator.generate(LimeModel(referenceMap = emptyMap(), topElements = elements.toList()))

    @Test
    fun `C++ bridge header emits the disambiguated inherited overload`() {
        val areaCalculator = createAreaCalculatorInterface()
        val files = reactNativeFiles(areaCalculator, createAreaEngineClass(areaCalculator))
        val header = files.find { it.targetFile.name == "NativeAreaEngineModule.h" }
        assertTrue("C++ bridge header should be generated", header != null)
        assertTrue(
            "C++ bridge header MUST expose the @Dart(Name) overload '$disambiguatedName' " +
                "so the inherited two-argument compute_area is reachable",
            header!!.content.contains(disambiguatedName),
        )
    }

    @Test
    fun `TurboModule TypeScript spec emits the disambiguated inherited overload`() {
        val areaCalculator = createAreaCalculatorInterface()
        val files = typeScriptFiles(areaCalculator, createAreaEngineClass(areaCalculator))
        val specFile = files.find { it.targetFile.name == "NativeAreaEngineModule.ts" }
        assertTrue("TurboModule spec should be generated", specFile != null)
        assertTrue(
            "TurboModule spec MUST declare the @Dart(Name) overload '$disambiguatedName'",
            specFile!!.content.contains(disambiguatedName),
        )
    }

    @Test
    fun `TypeScript wrapper class emits the disambiguated inherited overload`() {
        val areaCalculator = createAreaCalculatorInterface()
        val files = typeScriptFiles(areaCalculator, createAreaEngineClass(areaCalculator))
        val wrapperFile = files.find { it.targetFile.name == "AreaEngine.ts" }
        assertTrue("Wrapper class should be generated", wrapperFile != null)
        assertTrue(
            "Wrapper class MUST expose the @Dart(Name) overload '$disambiguatedName' as a method",
            wrapperFile!!.content.contains(disambiguatedName),
        )
    }

    @Test
    fun `all three layers agree on the disambiguated overload name`() {
        val areaCalculator = createAreaCalculatorInterface()
        val reactNative = reactNativeFiles(areaCalculator, createAreaEngineClass(areaCalculator))
        val typeScript = typeScriptFiles(areaCalculator, createAreaEngineClass(areaCalculator))

        val header = reactNative.find { it.targetFile.name == "NativeAreaEngineModule.h" }
        val spec = typeScript.find { it.targetFile.name == "NativeAreaEngineModule.ts" }
        val wrapper = typeScript.find { it.targetFile.name == "AreaEngine.ts" }

        assertTrue("C++ bridge header should be generated", header != null)
        assertTrue("TurboModule spec should be generated", spec != null)
        assertTrue("Wrapper class should be generated", wrapper != null)

        val layersMissingName =
            listOf(
                "C++ bridge" to header!!.content.contains(disambiguatedName),
                "TS spec" to spec!!.content.contains(disambiguatedName),
                "TS wrapper" to wrapper!!.content.contains(disambiguatedName),
            ).filterNot { it.second }.map { it.first }

        assertTrue(
            "The disambiguated overload '$disambiguatedName' is missing from: $layersMissingName. " +
                "It must appear consistently in every layer.",
            layersMissingName.isEmpty(),
        )
    }

    // ────────────────────────────────────────────────────────────────────────────
    // Async-callback overload shape (mirrors the real RoutingEngine.calculateRoute).
    //
    // The sync fixtures above (compute_area) exercise overload disambiguation for
    // plain value-returning methods. The REAL RoutingEngine overloads differ in the
    // one dimension that historically diverged between emitters:
    //   - each overload takes a distinct *options* struct plus a trailing callback
    //     lambda (error/result pattern), and
    //   - they all share the same LIME leaf name `calculate_route`, disambiguated via
    //     the positional `@Dart("calculateXxxRoute")` annotation.
    // The callback param routes these through the wrapper's promisified async path
    // (generateAsyncMethod) instead of the sync path. This is a REGRESSION GUARD: it
    // pins the invariant that the async disambiguated overload appears in BOTH the
    // TurboModule spec AND the idiomatic wrapper, so a future change to either
    // enumeration path can never again drop the wrapper overload while the spec keeps
    // it (the exact skew that motivated the shared resolver). Product-neutral: no HERE
    // identifiers. Extends — does not replace — the sync fixtures above.
    // ────────────────────────────────────────────────────────────────────────────

    /** The @Dart(Name) disambiguated async overload name (mirrors calculateRouteBicycle). */
    private val disambiguatedAsyncName = "planTripBicycle"

    /** A neutral options struct used to differentiate the two async overloads. */
    private fun createOptionsStruct(leaf: String): LimeStruct =
        LimeStruct(
            LimePath(rootNamespace, listOf(leaf)),
            fields =
                listOf(
                    LimeField(
                        LimePath(rootNamespace, listOf(leaf, "quality")),
                        typeRef = LimeBasicTypeRef(TypeId.DOUBLE),
                    ),
                ),
        )

    /** A neutral error enum: nullable first callback param → error/result promisification. */
    private fun createErrorEnum(): LimeEnumeration =
        LimeEnumeration(
            LimePath(rootNamespace, listOf("TripError")),
            enumerators =
                listOf(
                    LimeEnumerator(LimePath(rootNamespace, listOf("TripError", "failed"))),
                ),
        )

    /**
     * A callback lambda `(error: TripError?, trip: Trip?) -> void` — the error/result pattern
     * the wrapper promisifies. `trip` is a neutral result struct.
     */
    private fun createTripCallbackLambda(
        errorEnum: LimeEnumeration,
        tripStruct: LimeStruct,
    ): LimeLambda =
        LimeLambda(
            LimePath(rootNamespace, listOf("TripCallback")),
            parameters =
                listOf(
                    LimeLambdaParameter(
                        LimeDirectTypeRef(errorEnum, isNullable = true),
                        LimePath(rootNamespace, listOf("TripCallback", "error")),
                    ),
                    LimeLambdaParameter(
                        LimeDirectTypeRef(tripStruct, isNullable = true),
                        LimePath(rootNamespace, listOf("TripCallback", "trip")),
                    ),
                ),
            returnType = LimeReturnType.VOID,
        )

    /**
     * Interface `TripPlanner` with two async overloads sharing leaf name `plan_trip`:
     *  - plan_trip(waypoints, WalkOptions, callback)                    -> "planTrip"
     *  - plan_trip(waypoints, RideOptions, callback) @Dart(Name = "plan_trip_bicycle")
     *      -> MUST become "planTripBicycle"
     * Both take a trailing error/result callback (async path) and have equal arity.
     */
    private fun createTripPlannerInterface(
        walkOptions: LimeStruct,
        rideOptions: LimeStruct,
        tripCallback: LimeLambda,
    ): LimeInterface {
        fun overload(
            optionsStruct: LimeStruct,
            dartName: String?,
        ): LimeFunction {
            val attributes =
                dartName?.let {
                    LimeAttributes.Builder()
                        .addAttribute(LimeAttributeType.DART, LimeAttributeValueType.NAME, it)
                        .build()
                }
            return LimeFunction(
                LimePath(rootNamespace, listOf("TripPlanner", "plan_trip")),
                attributes = attributes ?: LimeAttributes.Builder().build(),
                parameters =
                    listOf(
                        LimeParameter(
                            LimePath(rootNamespace, listOf("TripPlanner", "plan_trip", "waypoints")),
                            typeRef = LimeBasicTypeRef(TypeId.DOUBLE),
                        ),
                        LimeParameter(
                            LimePath(rootNamespace, listOf("TripPlanner", "plan_trip", "options")),
                            typeRef = LimeDirectTypeRef(optionsStruct),
                        ),
                        LimeParameter(
                            LimePath(rootNamespace, listOf("TripPlanner", "plan_trip", "callback")),
                            typeRef = LimeDirectTypeRef(tripCallback),
                        ),
                    ),
                returnType = LimeReturnType.VOID,
            )
        }
        return LimeInterface(
            LimePath(rootNamespace, listOf("TripPlanner")),
            functions =
                listOf(
                    overload(walkOptions, null),
                    overload(rideOptions, "plan_trip_bicycle"),
                ),
        )
    }

    private fun createTripEngineClass(tripPlanner: LimeInterface): LimeClass =
        LimeClass(
            LimePath(rootNamespace, listOf("TripEngine")),
            parents = listOf(LimeDirectTypeRef(tripPlanner)),
        )

    private fun buildAsyncModel(): List<LimeNamedElement> {
        val errorEnum = createErrorEnum()
        val tripStruct =
            LimeStruct(
                LimePath(rootNamespace, listOf("Trip")),
                fields =
                    listOf(
                        LimeField(
                            LimePath(rootNamespace, listOf("Trip", "distance")),
                            typeRef = LimeBasicTypeRef(TypeId.DOUBLE),
                        ),
                    ),
            )
        val walkOptions = createOptionsStruct("WalkOptions")
        val rideOptions = createOptionsStruct("RideOptions")
        val tripCallback = createTripCallbackLambda(errorEnum, tripStruct)
        val tripPlanner = createTripPlannerInterface(walkOptions, rideOptions, tripCallback)
        val tripEngine = createTripEngineClass(tripPlanner)
        return listOf(errorEnum, tripStruct, walkOptions, rideOptions, tripCallback, tripPlanner, tripEngine)
    }

    @Test
    fun `TurboModule spec emits the disambiguated inherited async-callback overload`() {
        val files = typeScriptFiles(*buildAsyncModel().toTypedArray())
        val specFile = files.find { it.targetFile.name == "NativeTripEngineModule.ts" }
        assertTrue("TurboModule spec should be generated", specFile != null)
        assertTrue(
            "TurboModule spec MUST declare the async @Dart(Name) overload '$disambiguatedAsyncName'",
            specFile!!.content.contains(disambiguatedAsyncName),
        )
    }

    @Test
    fun `TypeScript wrapper emits the disambiguated inherited async-callback overload`() {
        val files = typeScriptFiles(*buildAsyncModel().toTypedArray())
        val wrapperFile = files.find { it.targetFile.name == "TripEngine.ts" }
        assertTrue("Wrapper class should be generated", wrapperFile != null)
        assertTrue(
            "Wrapper class MUST expose the async @Dart(Name) overload '$disambiguatedAsyncName' as a " +
                "method — mirroring the real RoutingEngine.calculateRouteBicycle that was dropped from " +
                "the wrapper while the spec + C++ bridge kept it",
            wrapperFile!!.content.contains(disambiguatedAsyncName),
        )
    }

    @Test
    fun `spec and wrapper agree on the disambiguated async-callback overload name`() {
        val files = typeScriptFiles(*buildAsyncModel().toTypedArray())
        val spec = files.find { it.targetFile.name == "NativeTripEngineModule.ts" }
        val wrapper = files.find { it.targetFile.name == "TripEngine.ts" }
        assertTrue("TurboModule spec should be generated", spec != null)
        assertTrue("Wrapper class should be generated", wrapper != null)

        val layersMissingName =
            listOf(
                "TS spec" to spec!!.content.contains(disambiguatedAsyncName),
                "TS wrapper" to wrapper!!.content.contains(disambiguatedAsyncName),
            ).filterNot { it.second }.map { it.first }

        assertTrue(
            "The async disambiguated overload '$disambiguatedAsyncName' is missing from: " +
                "$layersMissingName. It must appear consistently in the spec and the wrapper.",
            layersMissingName.isEmpty(),
        )
    }
}
