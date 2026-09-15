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
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeLambdaParameter
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimeReturnType
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeTypeRef
import com.here.gluecodium.model.lime.LimeValue
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Golden tests for Phase 27.15 (spec task 6.1): universal wrapper mirrors and factories.
 *
 * Design §1.5 "Wrapper object construction and factories" + §1.6 "Collection and callback
 * marshalling" require the wrapper emitter (TypeScriptWrapperEmitter.kt) to emit — generically,
 * from LIME, with NO post-generation patch — five conveniences currently injected by three patches
 * in scripts/patches/wrapper-additions.sh:
 *
 *   (a) universal `static _fromHandle(handle)` on every generated class
 *          → maps to `_patch_wrapper_class_fromHandle`
 *   (b) `fromDefaults()` when a no-argument native factory exists AND the normal wrapper constructor
 *       requires explicit fields
 *          → maps to `_patch_wrapper_options_defaults`
 *   (c) a named LIME factory (e.g. `MapImage.makeFromPath`) emitted as a NAMED static wrapper factory
 *          → maps to `_patch_wrapper_class_fromHandle` (MapImage.makeFromPath branch)
 *   (d) a returned `List<SomeClass>` typed as a wrapper array (NOT `any`), reconstructed via
 *       `_fromHandle`
 *          → maps to `_patch_wrapper_map_downloader` (getInstalledRegions marshalling)
 *   (e) an async/callback factory (a STATIC method whose trailing param is an error/result callback)
 *       emitted as a Promise-returning static wrapper factory that does NOT reference `this._handle`
 *          → maps to `_patch_wrapper_map_downloader` (fromEngine async factory)
 *
 * TDD status (spec task 6.1): per the established 2.3/4.3/5.1 pattern, the generator on this branch
 * ALREADY emits some of these. Each test documents whether it is a GREEN regression guard (already
 * emitted correctly) or a genuine RED gap that tasks 6.2–6.4 must close. Genuine gaps are marked with
 * `EXPECT-RED` in the failure message so the report can distinguish them from pre-existing failures.
 *
 * All fixtures are product-neutral (no HERE identifiers). They reuse the inline-LimeModel /
 * assert-file-content convention of ReactNativeInheritedInterfacePropertyWrapperTest and
 * ReactNativeNullableFieldConstructorTest.
 *
 * Validates: Requirements 3.4, 7.1.
 */
class ReactNativeWrapperFactoryTest {
    private val rootNamespace = listOf("gluecodium", "model")

    private val typeScriptGenerator =
        TypeScriptGenerator().apply {
            initialize(GeneratorOptions(tags = setOf("react-native")))
        }

    // ── Fixtures ──────────────────────────────────────────────────────────────────────────────

    /**
     * `Region` — a plain data class used as the element of a returned class-list and as the async
     * factory result. It has no exposed constructor, so the wrapper is handle-only (uses _fromHandle).
     */
    private fun createRegionClass(): LimeClass = LimeClass(LimePath(rootNamespace, listOf("Region")))

    /**
     * `Options` — a value struct with one required (non-nullable) field that carries a DEFAULT value.
     * Because the field is defaulted, the synthesized native factory is genuinely no-argument
     * (`make()`), yet the idiomatic wrapper constructor still demands the non-nullable field. Design
     * §1.5 therefore requires a `fromDefaults()` static delegating to the no-arg native `make()`.
     * Mirrors RoutingOptions/SearchOptions/BicycleOptions. NOTE: the default value is what makes the
     * native make() zero-argument — without it the make would require the field and no fromDefaults
     * may be emitted (see `createRequiredArgStruct`).
     */
    private fun createOptionsStruct(): LimeStruct {
        val timeout =
            LimeField(
                LimePath(rootNamespace, listOf("Options", "timeout")),
                typeRef = LimeBasicTypeRef(TypeId.INT32),
                defaultValue = LimeValue.Literal(LimeBasicTypeRef(TypeId.INT32), "0"),
            )
        return LimeStruct(
            LimePath(rootNamespace, listOf("Options")),
            fields = listOf(timeout),
        )
    }

    /**
     * `RequiredArgStruct` — a value struct with a single UNINITIALIZED (no default) non-nullable
     * field. Its synthesized native factory therefore REQUIRES that field as an argument
     * (`make(value)`), so a zero-argument `fromDefaults()` that called `make()` would be a type error
     * (TS2554 "Expected 1 arguments, but got 0"). Design §1.5 scopes `fromDefaults()` to a
     * *no-argument* native factory, so NO `fromDefaults()` may be emitted here. Mirrors AddressQuery /
     * TileKey / DimensionRestriction.
     */
    private fun createRequiredArgStruct(): LimeStruct {
        val value =
            LimeField(
                LimePath(rootNamespace, listOf("RequiredArgStruct", "value")),
                typeRef = LimeBasicTypeRef(TypeId.INT32),
            )
        return LimeStruct(
            LimePath(rootNamespace, listOf("RequiredArgStruct")),
            fields = listOf(value),
        )
    }

    /**
     * `Detail` — a plain generated value struct used as the parameter type of another struct's
     * constructor to exercise import collection for constructor-parameter types that are NOT stored
     * struct fields.
     */
    private fun createDetailStruct(): LimeStruct =
        LimeStruct(
            LimePath(rootNamespace, listOf("Detail")),
            fields =
                listOf(
                    LimeField(
                        LimePath(rootNamespace, listOf("Detail", "label")),
                        typeRef = LimeBasicTypeRef(TypeId.STRING),
                    ),
                ),
        )

    /**
     * `Wrapper` — a value struct whose exposed constructor takes a `Detail` argument that is NOT one
     * of the reconstructed struct fields (a make()-only parameter, like DesiredCatalog.version or
     * MapMeasureDependentColor.color). The wrapper constructor references `Detail`, so `Detail` MUST
     * be imported or the file has a dangling name (TS2304 "Cannot find name 'Detail'").
     */
    private fun createCtorParamStruct(detail: LimeStruct): LimeStruct {
        val label =
            LimeField(
                LimePath(rootNamespace, listOf("Wrapper", "label")),
                typeRef = LimeBasicTypeRef(TypeId.STRING),
            )
        val ctor =
            LimeFunction(
                LimePath(rootNamespace, listOf("Wrapper", "make")),
                isConstructor = true,
                parameters =
                    listOf(
                        LimeParameter(
                            LimePath(rootNamespace, listOf("Wrapper", "make", "detail")),
                            typeRef = LimeDirectTypeRef(detail),
                        ),
                    ),
            )
        return LimeStruct(
            LimePath(rootNamespace, listOf("Wrapper")),
            fields = listOf(label),
            functions = listOf(ctor),
        )
    }

    /**
     * `Image` — a class with TWO factory constructors:
     *   - a primary no-arg `make()` (default image), and
     *   - a NAMED factory `make_from_path(path, width, height)` via `@Dart(Name = "make_from_path")`.
     * Design §1.5: "A named LIME factory such as `makeFromPath` remains a named static wrapper
     * factory." Mirrors `MapImage.makeFromPath`. The wrapper today collapses all constructors to a
     * single `constructor(...)`, so the named factory has no static mirror → genuine gap.
     */
    private fun createImageClass(): LimeClass {
        val defaultCtor =
            LimeFunction(
                LimePath(rootNamespace, listOf("Image", "make")),
                isConstructor = true,
            )
        val namedCtor =
            LimeFunction(
                LimePath(rootNamespace, listOf("Image", "make_from_path")),
                attributes =
                    LimeAttributes.Builder()
                        .addAttribute(LimeAttributeType.DART, LimeAttributeValueType.NAME, "make_from_path")
                        .build(),
                isConstructor = true,
                parameters =
                    listOf(
                        LimeParameter(
                            LimePath(rootNamespace, listOf("Image", "make_from_path", "path")),
                            typeRef = LimeBasicTypeRef(TypeId.STRING),
                        ),
                        LimeParameter(
                            LimePath(rootNamespace, listOf("Image", "make_from_path", "width")),
                            typeRef = LimeBasicTypeRef(TypeId.INT32),
                        ),
                        LimeParameter(
                            LimePath(rootNamespace, listOf("Image", "make_from_path", "height")),
                            typeRef = LimeBasicTypeRef(TypeId.INT32),
                        ),
                    ),
            )
        return LimeClass(
            LimePath(rootNamespace, listOf("Image")),
            functions = listOf(defaultCtor, namedCtor),
        )
    }

    /**
     * `Badge` — a class with a primary no-arg `make()` and a NAMED additional factory
     * `make_with_detail(detail: Detail)`. The named factory (design §1.5) references the generated
     * struct `Detail`, whose import must be collected from the additional constructor's parameters.
     */
    private fun createNamedFactoryParamClass(detail: LimeStruct): LimeClass {
        val defaultCtor =
            LimeFunction(
                LimePath(rootNamespace, listOf("Badge", "make")),
                isConstructor = true,
            )
        val namedCtor =
            LimeFunction(
                LimePath(rootNamespace, listOf("Badge", "make_with_detail")),
                attributes =
                    LimeAttributes.Builder()
                        .addAttribute(LimeAttributeType.DART, LimeAttributeValueType.NAME, "make_with_detail")
                        .build(),
                isConstructor = true,
                parameters =
                    listOf(
                        LimeParameter(
                            LimePath(rootNamespace, listOf("Badge", "make_with_detail", "detail")),
                            typeRef = LimeDirectTypeRef(detail),
                        ),
                    ),
            )
        return LimeClass(
            LimePath(rootNamespace, listOf("Badge")),
            functions = listOf(defaultCtor, namedCtor),
        )
    }

    /** A neutral error enum: nullable first callback param → error/result promisification. */
    private fun createLoadErrorEnum(): LimeEnumeration =
        LimeEnumeration(
            LimePath(rootNamespace, listOf("LoadError")),
            enumerators = listOf(LimeEnumerator(LimePath(rootNamespace, listOf("LoadError", "failed")))),
        )

    /** A callback lambda `(error: LoadError?, downloader: Downloader?) -> void`. */
    private fun createLoadCallbackLambda(
        errorEnum: LimeEnumeration,
        downloader: LimeClass,
    ): LimeLambda =
        LimeLambda(
            LimePath(rootNamespace, listOf("LoadCallback")),
            parameters =
                listOf(
                    LimeLambdaParameter(
                        LimeDirectTypeRef(errorEnum, isNullable = true),
                        LimePath(rootNamespace, listOf("LoadCallback", "error")),
                    ),
                    LimeLambdaParameter(
                        LimeDirectTypeRef(downloader, isNullable = true),
                        LimePath(rootNamespace, listOf("LoadCallback", "downloader")),
                    ),
                ),
            returnType = LimeReturnType.VOID,
        )

    /**
     * `Downloader` — a class with:
     *   - `get_installed_regions() -> List<Region>` : a returned class-list (case d), and
     *   - static `from_engine(engineHandle: String, LoadCallback)` : an async/callback FACTORY that
     *     returns `Downloader` via the error/result callback (case e). Mirrors
     *     `MapDownloader.getInstalledRegions()` and `MapDownloader.fromEngineAsync()`.
     */
    private fun createDownloaderClass(
        region: LimeClass,
        loadCallback: LimeLambda,
    ): LimeClass {
        val getInstalledRegions =
            LimeFunction(
                LimePath(rootNamespace, listOf("Downloader", "get_installed_regions")),
                returnType = LimeReturnType(LimeDirectTypeRef(LimeList(LimeDirectTypeRef(region)))),
            )
        val fromEngine =
            LimeFunction(
                LimePath(rootNamespace, listOf("Downloader", "from_engine")),
                isStatic = true,
                parameters =
                    listOf(
                        LimeParameter(
                            LimePath(rootNamespace, listOf("Downloader", "from_engine", "engine")),
                            typeRef = LimeBasicTypeRef(TypeId.STRING),
                        ),
                        LimeParameter(
                            LimePath(rootNamespace, listOf("Downloader", "from_engine", "callback")),
                            typeRef = LimeDirectTypeRef(loadCallback),
                        ),
                    ),
                returnType = LimeReturnType.VOID,
            )
        return LimeClass(
            LimePath(rootNamespace, listOf("Downloader")),
            functions = listOf(getInstalledRegions, fromEngine),
        )
    }

    // ── Generation helpers ──────────────────────────────────────────────────────────────────────

    private fun typeScriptFiles(vararg elements: LimeNamedElement) =
        typeScriptGenerator.generate(LimeModel(referenceMap = emptyMap(), topElements = elements.toList()))

    private fun wrapperContent(
        wrapperFileName: String,
        vararg elements: LimeNamedElement,
    ): String {
        val files = typeScriptFiles(*elements)
        val wrapper = files.find { it.targetFile.path.endsWith("wrapper/$wrapperFileName") }
        assertTrue("Wrapper class ($wrapperFileName) should be generated", wrapper != null)
        return wrapper!!.content
    }

    // ── (a) universal static _fromHandle — GREEN regression guard ─────────────────────────────────

    @Test
    fun `case a - every generated class emits a universal static _fromHandle`() {
        val wrapper = wrapperContent("Region.ts", createRegionClass())
        assertTrue(
            "Region wrapper must emit `static _fromHandle(handle: string): Region`. Wrapper:\n$wrapper",
            Regex("static\\s+_fromHandle\\s*\\(\\s*handle\\s*:\\s*string\\s*\\)\\s*:\\s*Region")
                .containsMatchIn(wrapper),
        )
    }

    // ── (b) fromDefaults() — genuine gap (task 6.3) ───────────────────────────────────────────────

    @Test
    fun `case b - a struct with a required field and a no-arg native factory emits fromDefaults`() {
        val wrapper = wrapperContent("Options.ts", createOptionsStruct())
        assertTrue(
            "EXPECT-RED (gap → task 6.3, _patch_wrapper_options_defaults): Options wrapper must emit a " +
                "`static fromDefaults(): Options` delegating to the no-arg native make(). Wrapper:\n$wrapper",
            Regex("static\\s+fromDefaults\\s*\\(\\s*\\)\\s*:\\s*Options").containsMatchIn(wrapper),
        )
    }

    // ── (c) named LIME factory → named static wrapper factory — genuine gap (task 6.3) ────────────

    @Test
    fun `case c - a named LIME factory is emitted as a named static wrapper factory`() {
        val wrapper = wrapperContent("Image.ts", createImageClass())
        assertTrue(
            "EXPECT-RED (gap → task 6.3, _patch_wrapper_class_fromHandle MapImage.makeFromPath): Image " +
                "wrapper must emit a NAMED static factory `static makeFromPath(path: string, width: number, " +
                "height: number): Image`. Wrapper:\n$wrapper",
            Regex(
                "static\\s+makeFromPath\\s*\\(\\s*path\\s*:\\s*string\\s*,\\s*width\\s*:\\s*number\\s*,\\s*" +
                    "height\\s*:\\s*number\\s*\\)\\s*:\\s*Image",
            ).containsMatchIn(wrapper),
        )
    }

    // ── (d) returned List<Class> typed (not `any`) — expected GREEN regression guard ──────────────

    @Test
    fun `case d - a method returning a list of class handles is typed as a wrapper array not any`() {
        val region = createRegionClass()
        val errorEnum = createLoadErrorEnum()
        val downloaderForCallback = LimeClass(LimePath(rootNamespace, listOf("Downloader")))
        val callback = createLoadCallbackLambda(errorEnum, downloaderForCallback)
        val downloader = createDownloaderClass(region, callback)
        val wrapper =
            wrapperContent("Downloader.ts", region, errorEnum, callback, downloader)
        assertTrue(
            "getInstalledRegions must be typed `readonly Region[]` (NOT any). Wrapper:\n$wrapper",
            Regex("getInstalledRegions\\s*\\(\\s*\\)\\s*:\\s*readonly\\s+Region\\[\\]").containsMatchIn(wrapper),
        )
        assertTrue(
            "getInstalledRegions must reconstruct elements via Region._fromHandle (typed marshalling, " +
                "not `as any`). Wrapper:\n$wrapper",
            wrapper.contains("Region._fromHandle("),
        )
    }

    // ── (e) async/callback factory → Promise-returning static factory — genuine gap (task 6.3) ────

    @Test
    fun `case e - a static async factory is emitted as a Promise-returning static not an instance method`() {
        val region = createRegionClass()
        val errorEnum = createLoadErrorEnum()
        val downloaderForCallback = LimeClass(LimePath(rootNamespace, listOf("Downloader")))
        val callback = createLoadCallbackLambda(errorEnum, downloaderForCallback)
        val downloader = createDownloaderClass(region, callback)
        val wrapper = wrapperContent("Downloader.ts", region, errorEnum, callback, downloader)

        assertTrue(
            "EXPECT-RED (gap → task 6.3, _patch_wrapper_map_downloader fromEngine): the static async " +
                "factory must be emitted as `static fromEngine(...): Promise<Downloader>`. Wrapper:\n$wrapper",
            Regex("static\\s+fromEngine\\s*\\([^)]*\\)\\s*:\\s*Promise<\\s*Downloader\\s*>").containsMatchIn(wrapper),
        )
        assertTrue(
            "EXPECT-RED (gap → task 6.3): a STATIC factory must NOT reference `this._handle` in its body. " +
                "Wrapper:\n$wrapper",
            !Regex("static\\s+fromEngine[\\s\\S]*?this\\._handle").containsMatchIn(wrapper),
        )
    }

    // ── (h) over-eager fromDefaults regression — struct whose native make REQUIRES args ───────────
    //
    // REGRESSION GUARD (task 6.3 follow-up): fromDefaults() must be emitted ONLY when the selected
    // native factory takes ZERO arguments. A struct with an uninitialized non-nullable field has a
    // native make(value) that requires an argument; emitting `fromDefaults() { return
    // T._fromHandle(NativeT.make()); }` would call make() with no args → TS2554. So NO fromDefaults
    // may be emitted for such a struct.

    @Test
    fun `case h - a struct whose only native factory requires arguments emits no fromDefaults`() {
        val wrapper = wrapperContent("RequiredArgStruct.ts", createRequiredArgStruct())
        assertTrue(
            "RequiredArgStruct.make(value) requires an argument, so a zero-arg fromDefaults() calling " +
                "make() would be a TS2554 type error. No fromDefaults() must be emitted. Wrapper:\n$wrapper",
            !Regex("static\\s+fromDefaults\\s*\\(").containsMatchIn(wrapper),
        )
        // Sanity: the native make it WOULD have called really is arg-taking (proven by _toHandle).
        assertTrue(
            "Fixture sanity: _toHandle must marshal the field through make(<arg>). Wrapper:\n$wrapper",
            Regex("\\.make\\(\\s*this\\.value").containsMatchIn(wrapper),
        )
    }

    // ── (i) genuine zero-arg fromDefaults still emitted — GREEN regression guard ──────────────────

    @Test
    fun `case i - a struct with a defaulted field has a zero-arg make and still emits fromDefaults`() {
        val wrapper = wrapperContent("Options.ts", createOptionsStruct())
        assertTrue(
            "Options has a defaulted field, so its native make() is zero-argument and the required-field " +
                "wrapper constructor warrants a fromDefaults(). Wrapper:\n$wrapper",
            Regex("static\\s+fromDefaults\\s*\\(\\s*\\)\\s*:\\s*Options").containsMatchIn(wrapper),
        )
        // And the body must call the zero-arg make (no arguments).
        assertTrue(
            "Options.fromDefaults() must delegate to the zero-arg native make(). Wrapper:\n$wrapper",
            Regex("fromDefaults[\\s\\S]*?_fromHandle\\(\\s*\\w+\\.make\\(\\s*\\)\\s*\\)").containsMatchIn(wrapper),
        )
    }

    // ── (j) constructor-parameter type is imported — dangling-name regression (task 6.3 follow-up) ─
    //
    // A struct constructor parameter whose type is another generated type but which is NOT one of the
    // reconstructed struct fields (a make()-only param, like DesiredCatalog.version /
    // MapMeasureDependentColor.color) must still be imported. Previously import collection only walked
    // struct FIELDS, so such a parameter type produced a dangling name (TS2304).

    @Test
    fun `case j - a struct constructor parameter type that is not a field is still imported`() {
        val detail = createDetailStruct()
        val wrapper = wrapperContent("Wrapper.ts", detail, createCtorParamStruct(detail))
        assertTrue(
            "Wrapper's constructor references `Detail`, so `Detail` must be imported (no dangling name). " +
                "Wrapper:\n$wrapper",
            wrapper.contains("import { Detail } from './Detail';"),
        )
        assertTrue(
            "Fixture sanity: the constructor must actually reference the `Detail` type. Wrapper:\n$wrapper",
            Regex("constructor\\([^)]*:\\s*Detail").containsMatchIn(wrapper),
        )
    }

    // ── (k) named-factory parameter type is imported — dangling-name regression (task 6.3) ────────
    //
    // The named static factory emitted for an additional constructor (design §1.5) references its
    // parameter types. Those element types must be added to the wrapper's import set, or the file has
    // a dangling name (TS2304). Extends the case-c Image fixture with a factory taking a generated
    // struct.

    @Test
    fun `case k - a named factory parameter type that is a generated type is imported`() {
        val detail = createDetailStruct()
        val wrapper = wrapperContent("Badge.ts", detail, createNamedFactoryParamClass(detail))
        assertTrue(
            "Badge's named factory references `Detail`, so `Detail` must be imported. Wrapper:\n$wrapper",
            wrapper.contains("import { Detail } from './Detail';"),
        )
        assertTrue(
            "Fixture sanity: a named static factory must reference the `Detail` parameter type. " +
                "Wrapper:\n$wrapper",
            Regex("static\\s+\\w+\\([^)]*:\\s*Detail").containsMatchIn(wrapper),
        )
    }

    // ── Task 6.4 fixtures: NON-class list element types ──────────────────────────────────────────
    //
    // Spec task 6.1 found CLASS-list returns already typed (case d GREEN). The remaining `any`
    // widening (design §1.6 "wrappers SHALL not widen values to any") is in NON-class list returns —
    // lists of ENUMS (getActiveFeatures/getSupportedFeatures) and lists of value STRUCTS
    // (getLayersInfo). `resolveType` already declares the correct element type for the RETURN TYPE,
    // but `marshalFromNative` only reconstructs struct/class elements; enum (and other non-class)
    // element lists fall through to `($expr as any[] ?? []) as any`, widening the VALUE to `any`
    // even though the signature promises a typed array. This fixture is product-neutral.

    /** A neutral feature enum — the element type of an enum list (mirrors MapFeatureModes). */
    private fun createFeatureEnum(): LimeEnumeration =
        LimeEnumeration(
            LimePath(rootNamespace, listOf("Feature")),
            enumerators =
                listOf(
                    LimeEnumerator(LimePath(rootNamespace, listOf("Feature", "traffic_flow"))),
                    LimeEnumerator(LimePath(rootNamespace, listOf("Feature", "traffic_incidents"))),
                ),
        )

    /** A neutral value struct — the element type of a struct list (mirrors a LayerInfo). */
    private fun createLayerInfoStruct(): LimeStruct =
        LimeStruct(
            LimePath(rootNamespace, listOf("LayerInfo")),
            fields =
                listOf(
                    LimeField(
                        LimePath(rootNamespace, listOf("LayerInfo", "name")),
                        typeRef = LimeBasicTypeRef(TypeId.STRING),
                    ),
                ),
        )

    /**
     * `Scene` — a class exposing three non-class list returns modelled on the real widening sites:
     *   - `get_active_features() -> List<Feature>`     (enum list)
     *   - `get_supported_features() -> List<Feature>`  (enum list)
     *   - `get_layers_info() -> List<LayerInfo>`        (value-struct list)
     */
    private fun createSceneClass(
        feature: LimeEnumeration,
        layerInfo: LimeStruct,
    ): LimeClass {
        fun listGetter(
            methodName: String,
            elementRef: LimeTypeRef,
        ) = LimeFunction(
            LimePath(rootNamespace, listOf("Scene", methodName)),
            returnType = LimeReturnType(LimeDirectTypeRef(LimeList(elementRef))),
        )
        return LimeClass(
            LimePath(rootNamespace, listOf("Scene")),
            functions =
                listOf(
                    listGetter("get_active_features", LimeDirectTypeRef(feature)),
                    listGetter("get_supported_features", LimeDirectTypeRef(feature)),
                    listGetter("get_layers_info", LimeDirectTypeRef(layerInfo)),
                ),
        )
    }

    private fun sceneWrapper(): String {
        val feature = createFeatureEnum()
        val layerInfo = createLayerInfoStruct()
        val scene = createSceneClass(feature, layerInfo)
        return wrapperContent("Scene.ts", feature, layerInfo, scene)
    }

    // ── (f) enum-list return typed, NOT any — genuine gap (task 6.4) ──────────────────────────────

    @Test
    fun `case f - getActiveFeatures returns a typed enum array not any`() {
        val wrapper = sceneWrapper()
        assertTrue(
            "getActiveFeatures must be TYPED `readonly Feature[]` (resolveType already does this). " +
                "Wrapper:\n$wrapper",
            Regex("getActiveFeatures\\s*\\(\\s*\\)\\s*:\\s*readonly\\s+Feature\\[\\]").containsMatchIn(wrapper),
        )
        // The body must NOT widen the value to `any`. The enum ordinals come back as numbers; the
        // marshalled value must be a typed array, never `... as any`.
        val activeBody =
            Regex("getActiveFeatures\\s*\\(\\s*\\)\\s*:\\s*readonly\\s+Feature\\[\\]\\s*\\{[\\s\\S]*?\\n  \\}")
                .find(wrapper)?.value ?: ""
        assertTrue(
            "EXPECT-RED (gap → task 6.4, _patch_wrapper_class_fromHandle): getActiveFeatures must NOT " +
                "widen its enum-list value to `any`. Body:\n$activeBody\nWrapper:\n$wrapper",
            activeBody.isNotEmpty() && !activeBody.contains("as any"),
        )
    }

    @Test
    fun `case f2 - getSupportedFeatures returns a typed enum array not any`() {
        val wrapper = sceneWrapper()
        val body =
            Regex("getSupportedFeatures\\s*\\(\\s*\\)\\s*:\\s*readonly\\s+Feature\\[\\]\\s*\\{[\\s\\S]*?\\n  \\}")
                .find(wrapper)?.value ?: ""
        assertTrue(
            "EXPECT-RED (gap → task 6.4): getSupportedFeatures must be `readonly Feature[]` and its body " +
                "must NOT widen to `any`. Wrapper:\n$wrapper",
            body.isNotEmpty() && !body.contains("as any"),
        )
    }

    // ── (g) value-struct-list return typed, NOT any — GREEN regression guard ──────────────────────

    @Test
    fun `case g - getLayersInfo returns a typed struct array reconstructed via _fromHandle not any`() {
        val wrapper = sceneWrapper()
        assertTrue(
            "getLayersInfo must be typed `readonly LayerInfo[]` (NOT any). Wrapper:\n$wrapper",
            Regex("getLayersInfo\\s*\\(\\s*\\)\\s*:\\s*readonly\\s+LayerInfo\\[\\]").containsMatchIn(wrapper),
        )
        assertTrue(
            "getLayersInfo must reconstruct elements via LayerInfo._fromHandle (typed marshalling). " +
                "Wrapper:\n$wrapper",
            wrapper.contains("LayerInfo._fromHandle("),
        )
        val body =
            Regex("getLayersInfo\\s*\\(\\s*\\)\\s*:\\s*readonly\\s+LayerInfo\\[\\]\\s*\\{[\\s\\S]*?\\n  \\}")
                .find(wrapper)?.value ?: ""
        assertTrue(
            "getLayersInfo body must NOT widen to `any`. Body:\n$body",
            body.isNotEmpty() && !body.contains("as any"),
        )
    }
}
