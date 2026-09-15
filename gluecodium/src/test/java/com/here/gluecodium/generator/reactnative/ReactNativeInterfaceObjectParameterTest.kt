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
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimeReturnType
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * TDD-RED fixture + failing golden tests for Phase 27.13 (spec task 4.1).
 *
 * A method takes a parameter whose type is a MULTI-METHOD INTERFACE that represents an EXISTING
 * SDK OBJECT (not a callback/listener). The C++ bridge MUST:
 *   (a) accept the parameter as a `jsi::String` registry key (NOT a `jsi::Function`),
 *   (b) retrieve the FFI handle from `FfiHandleRegistry` and validate it is non-null, and
 *   (c) pass the retrieved handle to the FFI call — no synthesized callback proxy, no `nullptr`.
 * The TurboModule TypeScript spec MUST type the parameter as `string` (a handle), not a callback
 * function type.
 *
 * The real-SDK verification case is `VisualNavigator.startRendering(MapViewBase)`, currently worked
 * around by `_patch_visual_nav_start_rendering` (scripts/patches/api-surface.sh). This neutral
 * fixture — `Renderer.attach(Canvas)` where `Canvas` is a multi-method OBJECT interface — proves the
 * behaviour is not HERE-specific.
 *
 * `Canvas` is deliberately NOT a callback listener: it declares a NON-VOID method (`get_width -> Int`),
 * so `isCallbackListenerInterface()` is false and the interface routes down the object-handle path
 * rather than the object-of-callbacks proxy path. This is exactly the path that today emits
 * `FfiOpaqueHandle __ffi_canvas_0 = nullptr; // TODO: pass interface handle` in
 * `FfiMethodBodyBuilder.marshalInterfaceListenerParam` — dropping the object entirely.
 *
 * These tests are EXPECTED TO FAIL until task 4.2 implements interface-object parameter marshalling
 * in the C++ emitter. They are distinct from the pre-existing failing type-mapper test
 * ("maps Interface as callback parameter to function type"): that test concerns a SINGLE-method
 * listener interface mapping to `jsi::Function`, whereas these tests concern a MULTI-method OBJECT
 * interface that must marshal as a validated registry handle.
 *
 * Validates: Requirements 3.2, 7.1 (design §1.2 interface-typed object parameters).
 */
class ReactNativeInterfaceObjectParameterTest {
    private val rootNamespace = listOf("gluecodium", "graphics")

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
     * Interface `Canvas` — a multi-method OBJECT interface (an existing SDK object), NOT a listener.
     * It declares:
     *  - `present()`             -> void, 0 params
     *  - `get_width()`           -> Int  (NON-VOID: this disqualifies it from being a callback listener)
     * Because a method returns a value, `isCallbackListenerInterface()` is false, so the parameter
     * must be marshalled as an opaque object handle (registry key), not as a callback proxy.
     */
    private fun createCanvasInterface(): LimeInterface {
        val present =
            LimeFunction(
                LimePath(rootNamespace, listOf("Canvas", "present")),
                returnType = LimeReturnType(LimeBasicTypeRef(TypeId.VOID)),
            )
        val getWidth =
            LimeFunction(
                LimePath(rootNamespace, listOf("Canvas", "get_width")),
                returnType = LimeReturnType(LimeBasicTypeRef(TypeId.INT32)),
            )
        return LimeInterface(
            LimePath(rootNamespace, listOf("Canvas")),
            functions = listOf(present, getWidth),
        )
    }

    /**
     * Class `Renderer` with `attach(canvas: Canvas)` — mirrors `VisualNavigator.startRendering(
     * MapViewBase)`: an object-typed interface passed as a method parameter.
     */
    private fun createRendererClass(canvas: LimeInterface): LimeClass {
        val attach =
            LimeFunction(
                LimePath(rootNamespace, listOf("Renderer", "attach")),
                parameters =
                    listOf(
                        LimeParameter(
                            LimePath(rootNamespace, listOf("Renderer", "attach", "canvas")),
                            typeRef = LimeDirectTypeRef(canvas),
                        ),
                    ),
                returnType = LimeReturnType(LimeBasicTypeRef(TypeId.VOID)),
            )
        return LimeClass(
            LimePath(rootNamespace, listOf("Renderer")),
            functions = listOf(attach),
        )
    }

    private fun reactNativeFiles(vararg elements: LimeNamedElement) =
        reactNativeGenerator.generate(LimeModel(referenceMap = emptyMap(), topElements = elements.toList()))

    private fun typeScriptFiles(vararg elements: LimeNamedElement) =
        typeScriptGenerator.generate(LimeModel(referenceMap = emptyMap(), topElements = elements.toList()))

    private fun rendererImpl(): String {
        val canvas = createCanvasInterface()
        val files = reactNativeFiles(canvas, createRendererClass(canvas))
        val impl = files.find { it.targetFile.name == "NativeRendererModule.cpp" }
        assertTrue("C++ bridge impl (NativeRendererModule.cpp) should be generated", impl != null)
        return impl!!.content
    }

    private fun rendererHeader(): String {
        val canvas = createCanvasInterface()
        val files = reactNativeFiles(canvas, createRendererClass(canvas))
        val header = files.find { it.targetFile.name == "NativeRendererModule.h" }
        assertTrue("C++ bridge header (NativeRendererModule.h) should be generated", header != null)
        return header!!.content
    }

    // ── (a) The parameter is accepted as a jsi::String registry key, NOT a jsi::Function ──────────

    @Test
    fun `C++ bridge types the object interface parameter as a jsi String registry key`() {
        val header = rendererHeader()
        assertTrue(
            "The 'attach' parameter for an object-typed interface must be a jsi::String registry key, " +
                "not a jsi::Function callback. Header:\n$header",
            header.contains("jsi::String map_view") ||
                Regex("attach\\s*\\([^)]*jsi::String\\s+canvas").containsMatchIn(header) ||
                header.contains("jsi::String canvas"),
        )
        assertTrue(
            "The 'attach' parameter must NOT be typed as jsi::Function (that is the callback-listener " +
                "shape, wrong for an existing SDK object). Header:\n$header",
            !Regex("attach\\s*\\([^)]*jsi::Function\\s+canvas").containsMatchIn(header),
        )
    }

    // ── (b) The bridge retrieves the FFI handle from FfiHandleRegistry and validates non-null ─────

    @Test
    fun `C++ bridge retrieves the object interface handle from FfiHandleRegistry and validates it`() {
        val impl = rendererImpl()
        assertTrue(
            "The 'attach' body must marshal the canvas parameter to its utf8 registry key (canvas.utf8(rt)) " +
                "before retrieval. Body:\n$impl",
            impl.contains("canvas.utf8(rt)"),
        )
        assertTrue(
            "The 'attach' body must retrieve the canvas FFI handle from FfiHandleRegistry (the same " +
                "pattern used for class/struct params), not synthesize it. Body:\n$impl",
            Regex("FfiHandleRegistry::instance\\(\\)\\.retrieve\\([^)]*canvas[^)]*\\)")
                .containsMatchIn(impl) ||
                // Accept the ordering where the utf8 var is retrieved by an intermediate name.
                (impl.contains("canvas.utf8(rt)") && impl.contains("FfiHandleRegistry::instance().retrieve(")),
        )
        assertTrue(
            "The 'attach' body must validate the retrieved canvas handle is non-null before the FFI call " +
                "(e.g. `if (!__ffi_canvas...) ...` or the shared retrieveChecked helper). Body:\n$impl",
            Regex("if\\s*\\(\\s*!\\s*__ffi_canvas").containsMatchIn(impl) ||
                impl.contains("Invalid handle for param 'canvas'") ||
                impl.contains("retrieveChecked(__hid_canvas"),
        )
    }

    // ── (c) The bridge passes the retrieved handle, with no nullptr and no synthesized proxy ──────

    @Test
    fun `C++ bridge does not pass nullptr or synthesize a proxy for the object interface parameter`() {
        val impl = rendererImpl()
        assertTrue(
            "The current generator drops the object parameter with a nullptr TODO placeholder. Once " +
                "object-interface marshalling lands, that placeholder must be gone. Body:\n$impl",
            !impl.contains("TODO: pass interface handle"),
        )
        assertTrue(
            "The object interface parameter must not be treated as an untranslated 'Multi-method interface' " +
                "placeholder. Body:\n$impl",
            !impl.contains("Multi-method interface — pass as handle") &&
                !impl.contains("Multi-method interface — not a listener, treated as handle"),
        )
        assertTrue(
            "The object interface parameter must not be marshalled via a create_proxy callback proxy " +
                "(that is the listener path, wrong for an existing SDK object). Body:\n$impl",
            !impl.contains("_Canvas_create_proxy"),
        )
    }

    // ── The TS spec types the parameter as a handle string, not a callback function type ──────────

    @Test
    fun `TurboModule spec types the object interface parameter as a handle string`() {
        val canvas = createCanvasInterface()
        val files = typeScriptFiles(canvas, createRendererClass(canvas))
        val spec = files.find { it.targetFile.name == "NativeRendererModule.ts" }
        assertTrue("TurboModule spec (NativeRendererModule.ts) should be generated", spec != null)
        assertTrue(
            "The 'attach' canvas parameter must be typed as a `string` handle in the spec, not a callback " +
                "function type. Spec:\n${spec!!.content}",
            Regex("canvas\\s*:\\s*string").containsMatchIn(spec.content),
        )
        assertTrue(
            "The 'attach' canvas parameter must NOT be typed as a callback function `(...) => ...` in the " +
                "spec. Spec:\n${spec.content}",
            !Regex("canvas\\s*:\\s*\\([^)]*\\)\\s*=>").containsMatchIn(spec.content),
        )
    }
}
