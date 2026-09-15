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
import com.here.gluecodium.model.lime.LimeBasicType.TypeId
import com.here.gluecodium.model.lime.LimeBasicTypeRef
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimeProperty
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Golden tests for design §1.3 "Inherited interface properties in wrappers" (spec task 4.3).
 *
 * A class inherits a settable PROPERTY from a parent interface. The TurboModule TS spec and the C++
 * bridge already traverse `interfaceInheritedProperties` (TypeScriptGenerator.kt / ReactNativeGenerator.kt
 * emit `(container.properties + inheritedProperties)`), but the idiomatic WRAPPER emitter
 * (TypeScriptWrapperEmitter.kt) traverses only `c.properties` — so an inherited property's getter/setter
 * never appears on the wrapper class. This is the last VisualNavigator wrapper gap worked around by
 * `_patch_wrapper_visual_navigator` (scripts/patches/wrapper-additions.sh), which hand-adds the
 * inherited `setRoute(route)`.
 *
 * The wrapper emitter SHALL traverse inherited interface properties and emit their idiomatic
 * getter/setter accessors using the SAME effective naming and nullability rules used by the spec and
 * bridge layers, reusing the shared resolvers (no duplicated naming logic).
 *
 * Neutral fixture (no HERE identifiers):
 *  - interface `Playable` declares:
 *      * `var speed: Double`          — a settable NON-NULLABLE primitive property
 *      * `var background: Texture?`   — a settable NULLABLE OBJECT (class) property; mirrors
 *                                       `VisualNavigator.route` which is a nullable `Route`.
 *  - class `Player` inherits `Playable` (declares nothing of its own).
 *
 * These tests FAIL until the wrapper emitter traverses inherited interface properties.
 *
 * Validates: Requirements 3.2 (design §1.3 inherited interface properties in wrappers).
 */
class ReactNativeInheritedInterfacePropertyWrapperTest {
    private val rootNamespace = listOf("gluecodium", "media")

    private val typeScriptGenerator =
        TypeScriptGenerator().apply {
            initialize(GeneratorOptions(tags = setOf("react-native")))
        }

    /** Plain data class `Texture` used as the type of the nullable object property. */
    private fun createTextureClass(): LimeClass = LimeClass(LimePath(rootNamespace, listOf("Texture")))

    /**
     * Interface `Playable` with two settable properties:
     *  - `speed: Double`         (non-nullable primitive)
     *  - `background: Texture?`  (nullable object) — mirrors VisualNavigator.route (nullable Route)
     */
    private fun createPlayableInterface(texture: LimeClass): LimeInterface {
        val speedPath = LimePath(rootNamespace, listOf("Playable", "speed"))
        val speed =
            LimeProperty(
                path = speedPath,
                typeRef = LimeBasicTypeRef(TypeId.DOUBLE),
                getter = LimeFunction(speedPath.child("get")),
                setter = LimeFunction(speedPath.child("set")),
            )
        val backgroundPath = LimePath(rootNamespace, listOf("Playable", "background"))
        val background =
            LimeProperty(
                path = backgroundPath,
                typeRef = LimeDirectTypeRef(texture, isNullable = true),
                getter = LimeFunction(backgroundPath.child("get")),
                setter = LimeFunction(backgroundPath.child("set")),
            )
        return LimeInterface(
            LimePath(rootNamespace, listOf("Playable")),
            properties = listOf(speed, background),
        )
    }

    /** Class `Player` inheriting `Playable`; declares no members of its own. */
    private fun createPlayerClass(playable: LimeInterface): LimeClass =
        LimeClass(
            LimePath(rootNamespace, listOf("Player")),
            parents = listOf(LimeDirectTypeRef(playable)),
        )

    private fun playerWrapper(): String {
        val texture = createTextureClass()
        val playable = createPlayableInterface(texture)
        val files =
            typeScriptGenerator.generate(
                LimeModel(
                    referenceMap = emptyMap(),
                    topElements = listOf<LimeNamedElement>(texture, playable, createPlayerClass(playable)),
                ),
            )
        val wrapper = files.find { it.targetFile.path.endsWith("wrapper/Player.ts") }
        assertTrue("Wrapper class (wrapper/Player.ts) should be generated", wrapper != null)
        return wrapper!!.content
    }

    // ── Inherited non-nullable primitive property: getter + setter on the wrapper ─────────────────

    @Test
    fun `wrapper emits the inherited non-nullable primitive property getter`() {
        val wrapper = playerWrapper()
        assertTrue(
            "Player wrapper must expose the inherited `speed` getter (get speed(): number). Wrapper:\n$wrapper",
            Regex("get\\s+speed\\s*\\(\\s*\\)\\s*:\\s*number").containsMatchIn(wrapper),
        )
    }

    @Test
    fun `wrapper emits the inherited non-nullable primitive property setter`() {
        val wrapper = playerWrapper()
        assertTrue(
            "Player wrapper must expose the inherited `speed` setter (set speed(value: number)). Wrapper:\n$wrapper",
            Regex("set\\s+speed\\s*\\(\\s*value\\s*:\\s*number\\s*\\)").containsMatchIn(wrapper),
        )
        assertTrue(
            "The inherited `speed` setter must call the spec's setSpeed with the handle and the value. Wrapper:\n$wrapper",
            wrapper.contains("NativePlayerModule.setSpeed(this._handle,"),
        )
    }

    // ── Inherited nullable OBJECT property (mirrors VisualNavigator.route: nullable Route) ────────

    @Test
    fun `wrapper emits the inherited nullable object property setter with the effective name`() {
        val wrapper = playerWrapper()
        assertTrue(
            "Player wrapper must expose the inherited nullable-object `background` setter (mirrors " +
                "VisualNavigator.route). Wrapper:\n$wrapper",
            Regex("set\\s+background\\s*\\(").containsMatchIn(wrapper),
        )
        assertTrue(
            "The inherited nullable-object `background` setter must accept a nullable Texture " +
                "(Texture | undefined | null). Wrapper:\n$wrapper",
            Regex("set\\s+background\\s*\\(\\s*value\\s*:\\s*Texture\\s*\\|").containsMatchIn(wrapper),
        )
        assertTrue(
            "The inherited nullable-object `background` setter must marshal the object to its native " +
                "handle (not pass the wrapper object). Wrapper:\n$wrapper",
            wrapper.contains("NativePlayerModule.setBackground(this._handle,"),
        )
    }

    @Test
    fun `wrapper emits the inherited nullable object property getter marshalling from handle`() {
        val wrapper = playerWrapper()
        assertTrue(
            "Player wrapper must expose the inherited nullable-object `background` getter typed " +
                "`Texture | undefined`. Wrapper:\n$wrapper",
            Regex("get\\s+background\\s*\\(\\s*\\)\\s*:\\s*Texture\\s*\\|\\s*undefined").containsMatchIn(wrapper),
        )
    }
}
