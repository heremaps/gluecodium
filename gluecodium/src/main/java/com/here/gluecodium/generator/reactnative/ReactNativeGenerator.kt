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

import com.here.gluecodium.common.LimeModelFilter
import com.here.gluecodium.common.LimeModelSkipPredicates
import com.here.gluecodium.generator.common.GeneratedFile
import com.here.gluecodium.generator.common.Generator
import com.here.gluecodium.generator.common.GeneratorOptions
import com.here.gluecodium.generator.common.NameHelper
import com.here.gluecodium.generator.common.NameRuleSet
import com.here.gluecodium.generator.common.NameRules
import com.here.gluecodium.generator.common.TurboModuleCallableNameResolver
import com.here.gluecodium.generator.common.makeFullFields
import com.here.gluecodium.generator.common.nameRuleSetFromConfig
import com.here.gluecodium.generator.common.orderedByPrimaryThenArity
import com.here.gluecodium.generator.common.templates.TemplateEngine
import com.here.gluecodium.generator.ffi.FfiNameResolver
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeValueType.SKIP
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeContainer
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeType

/**
 * Generates C++ TurboModule bridge files that call the pre-built SDK's C FFI layer.
 *
 * Output files:
 * - {ModuleName}.h        — TurboModule header
 * - {ModuleName}.cpp      — TurboModule impl (calls extern "C" FFI functions)
 * - {ModuleName}Provider.h/.mm — iOS module provider
 * - FfiOpaqueHandle.h     — Handle typedef
 * - FfiHandleRegistry.h   — Handle registry
 */
internal class ReactNativeGenerator : Generator {
    override val shortName = "react-native"

    private lateinit var cppRootNamespace: List<String>
    private lateinit var cppInternalNamespace: List<String>
    private lateinit var activeTags: Set<String>
    private lateinit var cppNameRuleSet: NameRuleSet
    private lateinit var libraryName: String
    private lateinit var ffiNameRules: NameRules
    private var sharedEngineType: String = ""
    private var filteredRefMap: Map<String, LimeElement> = emptyMap()

    private fun isPlatformSpecificType(type: LimeType): Boolean = type.attributes.have(LimeAttributeType.DART, SKIP)

    private fun snakeToUpperCamel(name: String): String = NameHelper.toUpperCamelCase(name)

    private fun shouldExcludeFunction(function: LimeFunction): Boolean {
        if (function.parameters.any { isPlatformSpecificType(it.typeRef.type.actualType) }) return true
        if (function.attributes.have(LimeAttributeType.JAVA, SKIP) &&
            function.attributes.have(LimeAttributeType.SWIFT, SKIP)
        ) {
            return true
        }
        return false
    }

    override fun initialize(options: GeneratorOptions) {
        cppRootNamespace = options.cppRootNamespace
        cppInternalNamespace = options.cppInternalNamespace
        activeTags = options.tags
        cppNameRuleSet = nameRuleSetFromConfig(options.cppNameRules)
        libraryName = options.libraryName
        sharedEngineType = options.sharedEngineType
        ffiNameRules = NameRules(nameRuleSetFromConfig(options.dartNameRules))
    }

    override fun generate(limeModel: LimeModel): List<GeneratedFile> {
        val filteredModel =
            LimeModelFilter.filter(limeModel) {
                LimeModelSkipPredicates.shouldRetainElement(it, activeTags)
            }
        filteredRefMap = filteredModel.referenceMap
        val internalPrefix = cppInternalNamespace.joinToString("_")
        val ffiNameResolver = FfiNameResolver(filteredRefMap, ffiNameRules, internalPrefix)
        val jsiTypeMapper = ReactNativeJsiTypeMapper()
        val files = mutableListOf<GeneratedFile>()

        // Collect all types to process so we can detect naming collisions across packages
        val allStructs = mutableListOf<LimeStruct>()
        filteredModel.topElements.filterIsInstance<LimeStruct>().forEach { allStructs += it }
        filteredModel.topElements.filterIsInstance<LimeClass>().forEach { allStructs += collectNestedStructs(it) }
        filteredModel.topElements.filterIsInstance<LimeStruct>().forEach { allStructs += collectNestedStructs(it) }

        // Collect nested classes (e.g. MapPolyline.SolidRepresentation)
        val nestedClasses = mutableListOf<LimeClass>()
        filteredModel.topElements.filterIsInstance<LimeClass>().forEach { nestedClasses += collectNestedClasses(it) }

        // Collect INTERFACES that expose a static FACTORY returning the interface itself (e.g.
        // LocationEngineBase.makeLocationEngineFromSharedSdkNativeEngine). Such an interface is
        // effectively instantiable from a platform without a Dart runtime: the static factory yields
        // an opaque handle and the (non-static) instance methods operate on it. The RN generator
        // otherwise emits a native module only for LimeClass/struct, so these interfaces had no
        // module and were unreachable from TypeScript. The emit path already distinguishes
        // function.isStatic (static → no _self; instance → retrieve the handle), so feeding such an
        // interface through generateModuleFiles produces a correct module with no template change.
        val factoryInterfaces =
            filteredModel.topElements.filterIsInstance<LimeInterface>()
                .filter { iface -> interfaceHasSelfReturningStaticFactory(iface) }

        // Find names that appear in multiple packages → need disambiguation prefix
        val allContainers: List<LimeContainer> =
            filteredModel.topElements.filterIsInstance<LimeClass>() + nestedClasses + allStructs + factoryInterfaces
        val nameToHeads = mutableMapOf<String, MutableSet<List<String>>>()
        for (c in allContainers) {
            val tailName = c.path.tail.joinToString("") { it.replaceFirstChar { ch -> ch.uppercase() } }
            nameToHeads.getOrPut(tailName) { mutableSetOf() }.add(c.path.head)
        }
        val collisionNames = nameToHeads.filter { it.value.size > 1 }.keys.toSet()
        val nameResolver = ReactNativeNameResolver(collisionNames)

        // Dedup by module name: same-named types with different disambiguators
        // (e.g. TbtManeuver @EnableIf("WeGo") vs @Skip("WeGo")) must not overwrite each other
        val seenModuleNames = mutableSetOf<String>()

        filteredModel.topElements.filterIsInstance<LimeClass>()
            .filter { seenModuleNames.add(nameResolver.resolveModuleName(nameResolver.resolveName(it))) }
            .forEach { limeClass ->
                files += generateModuleFiles(limeClass, nameResolver, ffiNameResolver, jsiTypeMapper)
            }

        // Generate modules for nested classes (e.g. MapPolyline.SolidRepresentation)
        nestedClasses
            .filter { seenModuleNames.add(nameResolver.resolveModuleName(nameResolver.resolveName(it))) }
            .forEach { limeClass ->
                files += generateModuleFiles(limeClass, nameResolver, ffiNameResolver, jsiTypeMapper)
            }

        // Generate modules for factory-bearing interfaces (e.g. LocationEngineBase). The static
        // factory + instance methods emit correctly because the shared emit path already keys on
        // function.isStatic.
        factoryInterfaces
            .filter { seenModuleNames.add(nameResolver.resolveModuleName(nameResolver.resolveName(it))) }
            .forEach { limeInterface ->
                files += generateModuleFiles(limeInterface, nameResolver, ffiNameResolver, jsiTypeMapper)
            }

        allStructs
            .filter { limeStruct ->
                limeStruct.constructors.isNotEmpty() ||
                    limeStruct.fieldConstructors.isNotEmpty() ||
                    limeStruct.functions.any { !it.isConstructor } ||
                    limeStruct.fields.isNotEmpty()
            }
            .filter { seenModuleNames.add(nameResolver.resolveModuleName(nameResolver.resolveName(it))) }
            .forEach { limeStruct ->
                files += generateModuleFiles(limeStruct, nameResolver, ffiNameResolver, jsiTypeMapper)
            }

        // Support files (static/near-static C++/ObjC infrastructure — rendered from templates)
        files += GeneratedFile(renderSupportFile("FfiOpaqueHandle"), "$ROOT_DIR/FfiOpaqueHandle.h")
        files += GeneratedFile(renderSupportFile("FfiHandleRegistry"), "$ROOT_DIR/FfiHandleRegistry.h")
        files += GeneratedFile(renderSupportFile("FfiLambdaProxy"), "$ROOT_DIR/FfiLambdaProxy.h")
        files += GeneratedFile(renderSupportFile("SharedEngineRefHeader"), "$ROOT_DIR/SharedEngineRef.h")
        files += GeneratedFile(renderSupportFile("SharedEngineRefImpl"), "$ROOT_DIR/SharedEngineRef.cpp")
        files += GeneratedFile(renderSupportFile("FfiCallbackInitHeader"), "$ROOT_DIR/FfiCallbackInit.h")
        files += GeneratedFile(renderSupportFile("FfiCallbackInitImpl"), "$ROOT_DIR/FfiCallbackInit.cpp")
        files += GeneratedFile(renderSupportFile("FfiCallbackSlotHeader"), "$ROOT_DIR/FfiCallbackSlot.h")
        files += GeneratedFile(renderSupportFile("FfiCallbackSlotImpl"), "$ROOT_DIR/FfiCallbackSlot.cpp")

        return files
    }

    private fun generateModuleFiles(
        container: LimeContainer,
        nameResolver: ReactNativeNameResolver,
        ffiNameResolver: FfiNameResolver,
        jsiTypeMapper: ReactNativeJsiTypeMapper,
    ): List<GeneratedFile> {
        val className = nameResolver.resolveName(container)
        val moduleName = nameResolver.resolveModuleName(className)

        // Include inherited interface methods for classes (a class implementing an interface)
        val inheritedFunctions: List<LimeFunction> =
            if (container is LimeClass) {
                container.interfaceInheritedFunctions.filter { !it.isConstructor }
            } else {
                emptyList()
            }

        // For a factory-bearing INTERFACE (e.g. LocationEngineBase), its self-returning STATIC
        // factory functions (makeLocationEngine / makeLocationEngineFromSharedSdkNativeEngine) are
        // the ONLY way to obtain an instance. The real SDK marks them @Java(Skip)+@Swift(Skip)
        // (Android/iOS construct the engine via a different platform class), so shouldExcludeFunction
        // would drop them — but for React Native they ARE the construction path. Expose them as
        // ordinary STATIC bridge methods (no _self; returns the created handle string), BYPASSING the
        // Java/Swift-skip exclusion, so the interface is reachable from TypeScript (device-positioning
        // gap, 27.37). Restricted to SELF-returning static factories so ordinary skipped methods stay
        // skipped.
        val interfaceStaticFactories: List<LimeFunction> =
            if (container is LimeInterface) {
                container.functions.filter {
                    it.isStatic &&
                        it.returnType.typeRef.type.actualType.path == container.path
                }
            } else {
                emptyList()
            }

        val methods =
            (
                (container.functions.filter { !it.isConstructor } + inheritedFunctions)
                    .filter { !shouldExcludeFunction(it) } +
                    // factory statics bypass the Java/Swift-skip exclusion (see above); de-dupe by identity.
                    interfaceStaticFactories
            )
                .distinct()
                .sortedBy { it.parameters.size }
        val seenNames = mutableSetOf("create", "getConstants", "getName")
        // Shared effective-name resolution: an overload disambiguated via @Dart(Name) keeps its
        // base name if free, else falls back to the @Dart(Name) alternate, else is omitted. The
        // resolved name is recorded so the emitter renders the disambiguated JS method name (the
        // FFI symbol itself is derived from parameter types and is unaffected).
        val methodNameOverrides = mutableMapOf<LimeFunction, String>()
        val dedupedMethods =
            methods.mapNotNull { function ->
                val effectiveName =
                    TurboModuleCallableNameResolver.resolveEffectiveName(function, seenNames)
                        ?: return@mapNotNull null
                if (effectiveName != nameResolver.resolveName(function)) {
                    methodNameOverrides[function] = effectiveName
                }
                function
            }

        // Field constructors (field constructor(fields)) are separate from functions in LimeStruct
        val fieldConstructorFunctions: List<LimeFunction> =
            if (container is LimeStruct) {
                container.fieldConstructors.map { it.asFunction() }
            } else {
                emptyList()
            }

        val allConstructors =
            (container.constructors + fieldConstructorFunctions)
                .filter { !shouldExcludeFunction(it) }
                .orderedByPrimaryThenArity()
        // Disambiguate multiple constructors through the shared effective-name resolver (design §1.1):
        // the primary ctor claims `make`, an additional @Dart(Name) ctor (e.g. make_from_path →
        // makeFromPath) surfaces under its alternate name in the bridge too — matching the spec and
        // wrapper layers so a named LIME factory is never dropped in only one layer.
        val constructorNameOverrides = mutableMapOf<LimeFunction, String>()
        val constructorsToExpose =
            allConstructors.mapNotNull { ctor ->
                val effectiveName =
                    TurboModuleCallableNameResolver.resolveEffectiveName(ctor, seenNames)
                        ?: return@mapNotNull null
                constructorNameOverrides[ctor] = effectiveName
                ctor
            }
        // Map each exposed plain ctor P -> its (dropped) shared-engine
        // sibling E whose params == [sharedEngineType] ++ P.params (exact tail-type match).
        val engineVariants: Map<LimeFunction, LimeFunction> =
            if (sharedEngineType.isEmpty()) {
                emptyMap()
            } else {
                constructorsToExpose.mapNotNull { plain ->
                    val plainTypes = plain.parameters.map { it.typeRef.type.actualType.path.toString() }
                    allConstructors.firstOrNull { e ->
                        e !== plain &&
                            e.parameters.size == plain.parameters.size + 1 &&
                            e.parameters[0].typeRef.type.actualType.path.toString().contains(sharedEngineType) &&
                            e.parameters.drop(1).map { it.typeRef.type.actualType.path.toString() } == plainTypes
                    }?.let { plain to it }
                }.toMap()
            }

        val nameOverrides = mutableMapOf<LimeFunction, String>()
        nameOverrides.putAll(methodNameOverrides)
        nameOverrides.putAll(constructorNameOverrides)
        // Include inherited interface properties for classes (e.g. Navigator : NavigatorInterface -> route)
        val inheritedProperties = (container as? LimeClass)?.interfaceInheritedProperties.orEmpty()
        val bridgeableProperties =
            (container.properties + inheritedProperties).filter { prop ->
                val actualType = prop.typeRef.type.actualType
                actualType !is LimeLambda &&
                    !isPlatformSpecificType(actualType)
            }
        val propertyGetters =
            bridgeableProperties
                .filter { it.typeRef.type.actualType !is LimeInterface } // interface getters not useful
                .filter { seenNames.add("get${snakeToUpperCamel(it.path.name)}") }
                .map { prop ->
                    nameOverrides[prop.getter] = "get${snakeToUpperCamel(prop.path.name)}"
                    prop.getter
                }
        val propertySetters =
            bridgeableProperties
                .filter { it.setter != null }
                .filter { seenNames.add("set${snakeToUpperCamel(it.path.name)}") }
                .map { prop ->
                    nameOverrides[prop.setter!!] = "set${snakeToUpperCamel(prop.path.name)}"
                    prop.setter!!
                }

        // Struct field getters (read-only: only get_field_* FFI functions exist)
        val structFields = if (container is LimeStruct) container.fields else emptyList()
        val fieldGetterNames = mutableSetOf<String>()
        val fieldGetterNameOverrides = mutableMapOf<String, String>()
        val structFieldGetters =
            structFields
                .filter { field ->
                    var methodName = "get${snakeToUpperCamel(field.path.name)}"
                    if (!seenNames.add(methodName)) {
                        // Collision with reserved name — use "getField" prefix
                        methodName = "getField${snakeToUpperCamel(field.path.name)}"
                        if (!seenNames.add(methodName)) return@filter false
                        fieldGetterNameOverrides[field.path.name] = methodName
                    }
                    fieldGetterNames.add(methodName)
                }

        val templateData =
            buildTemplateData(
                container,
                moduleName,
                dedupedMethods + propertyGetters + propertySetters,
                constructorsToExpose,
                engineVariants,
                ffiNameResolver,
                jsiTypeMapper,
                nameResolver,
                nameOverrides,
                structFieldGetters,
                fieldGetterNameOverrides,
            )

        return listOf(
            GeneratedFile(
                TemplateEngine.render("reactnative/SharedNativeModuleHeader", templateData),
                "$ROOT_DIR/$moduleName.h",
            ),
            GeneratedFile(
                TemplateEngine.render("reactnative/SharedNativeModuleImpl", templateData),
                "$ROOT_DIR/$moduleName.cpp",
            ),
            GeneratedFile(
                TemplateEngine.render("reactnative/IosProviderHeader", mapOf("moduleName" to moduleName)),
                "$ROOT_DIR/${moduleName}Provider.h",
            ),
            GeneratedFile(
                TemplateEngine.render("reactnative/IosProviderImpl", mapOf("moduleName" to moduleName)),
                "$ROOT_DIR/${moduleName}Provider.mm",
            ),
        )
    }

    private fun buildTemplateData(
        limeContainer: LimeContainer,
        moduleName: String,
        methods: List<LimeFunction>,
        constructors: List<LimeFunction>,
        engineVariants: Map<LimeFunction, LimeFunction>,
        ffiNameResolver: FfiNameResolver,
        jsiTypeMapper: ReactNativeJsiTypeMapper,
        nameResolver: ReactNativeNameResolver,
        nameOverrides: Map<LimeFunction, String> = emptyMap(),
        structFields: List<LimeField> = emptyList(),
        fieldGetterNameOverrides: Map<String, String> = emptyMap(),
    ): Map<String, Any> {
        val allFfiDeclarations = mutableSetOf<String>()

        val methodsData =
            methods.map { function ->
                val jsiReturnType = jsiTypeMapper.mapReturnType(function.returnType.typeRef)
                val methodName = nameOverrides[function] ?: nameResolver.resolveName(function)
                val bodyBuilder =
                    FfiMethodBodyBuilder(
                        function,
                        limeContainer,
                        ffiNameResolver,
                        libraryName,
                        sharedEngineType = sharedEngineType,
                    )
                val body = bodyBuilder.build()
                allFfiDeclarations.addAll(bodyBuilder.ffiDeclarations)

                mapOf(
                    "name" to methodName,
                    "jsiReturnType" to jsiReturnType,
                    "jsiParams" to
                        (
                            if (!function.isStatic) {
                                listOf(mapOf("name" to "__nativeHandle", "jsiType" to "jsi::String"))
                            } else {
                                emptyList()
                            }
                        ) +
                        function.parameters.map { param ->
                            mapOf(
                                "name" to param.path.name,
                                "jsiType" to jsiTypeMapper.mapType(param.typeRef),
                            )
                        },
                    "body" to body,
                )
            }

        // Constructor methods (return native handle string)
        // Is THIS module the shared engine class (emit setSharedEngineRaw after its make)?
        val isSharedEngineModule =
            sharedEngineType.isNotEmpty() &&
                limeContainer.path.toString().contains(sharedEngineType)

        val constructorMethodsData =
            constructors.map { function ->
                val methodName = nameOverrides[function] ?: nameResolver.resolveName(function)

                // If this ctor has a dropped shared-engine sibling, emit its
                // JS signature but call the sibling with the engine injected from SharedEngineRef.
                val engineCtor = engineVariants[function]

                if (engineCtor != null) {
                    val bodyBuilder =
                        FfiMethodBodyBuilder(
                            engineCtor,
                            limeContainer,
                            ffiNameResolver,
                            libraryName,
                        )
                    val body = bodyBuilder.buildSharedEngineConstructor(sharedEngineType)
                    allFfiDeclarations.addAll(bodyBuilder.ffiDeclarations)
                    mapOf(
                        "name" to methodName,
                        "jsiReturnType" to "jsi::String",
                        "jsiParams" to
                            engineCtor.parameters.drop(1).map { param ->
                                mapOf(
                                    "name" to param.path.name,
                                    "jsiType" to jsiTypeMapper.mapType(param.typeRef),
                                )
                            },
                        "body" to body,
                        "needsSharedEngineRef" to true,
                    )
                } else {
                    val bodyBuilder =
                        FfiMethodBodyBuilder(
                            function,
                            limeContainer,
                            ffiNameResolver,
                            libraryName,
                        )
                    val body = bodyBuilder.buildConstructor(emitSharedEngineStore = isSharedEngineModule)
                    allFfiDeclarations.addAll(bodyBuilder.ffiDeclarations)

                    mapOf(
                        "name" to methodName,
                        "jsiReturnType" to "jsi::String",
                        "jsiParams" to
                            function.parameters.map { param ->
                                mapOf(
                                    "name" to param.path.name,
                                    "jsiType" to jsiTypeMapper.mapType(param.typeRef),
                                )
                            },
                        "body" to body,
                    )
                }
            }

        // Release method
        val ffiReleaseName = "${libraryName}_${ffiNameResolver.resolveName(limeContainer)}_release_handle"
        allFfiDeclarations += "void $ffiReleaseName(FfiOpaqueHandle handle);"
        val releaseBody = """  auto __handleStr = __nativeHandle.utf8(rt);
  FfiOpaqueHandle __handle = FfiHandleRegistry::instance().remove(__handleStr);
  if (__handle) {
    $ffiReleaseName(__handle);
  }"""
        val releaseMethodData =
            listOf(
                mapOf(
                    "name" to "release",
                    "jsiReturnType" to "void",
                    "jsiParams" to listOf(mapOf("name" to "__nativeHandle", "jsiType" to "jsi::String")),
                    "body" to releaseBody,
                ),
            )

        // getConstants method (if class has constants)
        val constantsMethodData =
            if (limeContainer.constants.isNotEmpty()) {
                val body = buildGetConstantsBody(limeContainer)
                listOf(
                    mapOf(
                        "name" to "getConstants",
                        "jsiReturnType" to "jsi::Object",
                        "jsiParams" to emptyList<Map<String, String>>(),
                        "body" to body,
                    ),
                )
            } else {
                emptyList()
            }

        // Struct field getter methods
        val fieldGetterMethodsData =
            structFields.map { field ->
                val methodName =
                    fieldGetterNameOverrides[field.path.name]
                        ?: "get${snakeToUpperCamel(field.path.name)}"
                val (body, decls) = buildFieldGetterBody(limeContainer, field, ffiNameResolver)
                allFfiDeclarations.addAll(decls)
                val jsiReturnType = jsiTypeMapper.mapReturnType(field.typeRef)
                mapOf(
                    "name" to methodName,
                    "jsiReturnType" to jsiReturnType,
                    "jsiParams" to listOf(mapOf("name" to "__nativeHandle", "jsiType" to "jsi::String")),
                    "body" to body,
                )
            }

        // For structs with NO EXPOSED constructor, synthesize a make() over the struct's
        // uninitialized fields. This covers two cases:
        //   1. structs with no LIME constructors at all (e.g. CarOptions → no-arg make(); external
        //      Color → make(r,g,b,a)), and
        //   2. structs whose ONLY constructors are excluded by `shouldExcludeFunction`
        //      (@Skip(Java)+@Skip(Swift)) — e.g. a struct's `field constructor(...)` skipped on Java/Swift
        //      with @Skip(Cpp, Java, Kotlin, Swift). Without this, such a struct would be
        //      uninstantiable through the wrapper (retires _patch_transit_waypoint_make).
        // `constructors` is the post-exclusion, name-deduped exposed set (constructorsToExpose).
        val syntheticMakeData: List<Map<String, Any>> =
            if (limeContainer is LimeStruct &&
                constructors.isEmpty() &&
                limeContainer.fields.isNotEmpty()
            ) {
                // Route the synthetic make() through the field-constructor machinery
                // (buildConstructor → buildFieldConstructorBody → fieldDefaultValue), which recurses
                // non-nullable nested structs and preserves LIME literal defaults. make() takes the
                // struct's UNDEFAULTED fields as params: 0 for all-defaulted structs (e.g. CarOptions →
                // no-arg make(), Phase 23.2); r,g,b,a for the external Color struct (→ make(r,g,b,a),
                // Phase 23.6-C). An empty path name marks a field ctor, so buildConstructor dispatches.
                val makeParams = limeContainer.uninitializedFields.map { LimeParameter(it.path, typeRef = it.typeRef) }
                val syntheticCtor =
                    LimeFunction(
                        path = limeContainer.path.child("", "0"),
                        isConstructor = true,
                        parameters = makeParams,
                    )
                val bodyBuilder =
                    FfiMethodBodyBuilder(
                        syntheticCtor,
                        limeContainer,
                        ffiNameResolver,
                        libraryName,
                        sharedEngineType = sharedEngineType,
                    )
                val body = bodyBuilder.buildConstructor()
                allFfiDeclarations.addAll(bodyBuilder.ffiDeclarations)
                listOf(
                    mapOf(
                        "name" to "make",
                        "jsiReturnType" to "jsi::String",
                        "jsiParams" to
                            makeParams.map { param ->
                                mapOf("name" to param.path.name, "jsiType" to jsiTypeMapper.mapType(param.typeRef))
                            },
                        "body" to body,
                    ),
                )
            } else {
                emptyList()
            }

        // Phase 23.11: lossless all-fields serializer for structs whose exposed ctors omit fields
        // (e.g. Location — its widest field ctor drops pitch/laneIndex). Routed through the field-ctor
        // machinery (buildFieldConstructorBody) so nullable fields box correctly. Retires the
        // hand-written Location.makeWithAllFields patch.
        val makeFullData: List<Map<String, Any>> =
            if (limeContainer is LimeStruct) {
                val fullFields = makeFullFields(limeContainer) { shouldExcludeFunction(it) }
                if (fullFields != null) {
                    val makeParams = fullFields.map { LimeParameter(it.path, typeRef = it.typeRef) }
                    val makeFullCtor =
                        LimeFunction(
                            path = limeContainer.path.child("", "full"),
                            isConstructor = true,
                            parameters = makeParams,
                        )
                    val bodyBuilder =
                        FfiMethodBodyBuilder(
                            makeFullCtor,
                            limeContainer,
                            ffiNameResolver,
                            libraryName,
                            sharedEngineType = sharedEngineType,
                        )
                    val body = bodyBuilder.buildConstructor()
                    allFfiDeclarations.addAll(bodyBuilder.ffiDeclarations)
                    listOf(
                        mapOf(
                            "name" to "makeFull",
                            "jsiReturnType" to "jsi::String",
                            "jsiParams" to
                                makeParams.map { param ->
                                    mapOf("name" to param.path.name, "jsiType" to jsiTypeMapper.mapType(param.typeRef))
                                },
                            "body" to body,
                        ),
                    )
                } else {
                    emptyList()
                }
            } else {
                emptyList()
            }

        val needsSharedEngineRef =
            constructorMethodsData.any {
                (it["needsSharedEngineRef"] as? Boolean) == true
            }

        return mapOf(
            "nativeModuleName" to moduleName,
            "ffiDeclarations" to dedupeFfiDeclarations(allFfiDeclarations).joinToString("\n    "),
            "methods" to syntheticMakeData + makeFullData + constructorMethodsData + releaseMethodData +
                constantsMethodData + methodsData + fieldGetterMethodsData,
            "needsSharedEngineRef" to (needsSharedEngineRef || isSharedEngineModule),
        )
    }

    /**
     * Collapse the collected extern-"C" FFI declarations, guarding against the one situation that
     * does not compile: the same function signature declared with two different return types.
     *
     * The declarations are gathered from multiple emission paths (instance methods, primary
     * constructors, shared-engine/named factory constructors, field getters, ...). A declaration
     * has the shape `<returnType> <name>(<params>);`. Two declarations that differ in name or
     * parameters are distinct C symbols and both must survive (the generator relies on this, e.g.
     * for resolved inherited overloads). But two declarations with the SAME `<name>(<params>)` and
     * DIFFERENT `<returnType>` are a bug: C has no overloading, so clang rejects them ("functions
     * that differ only in their return type cannot be overloaded"). This is exactly how a
     * `_return_get_error` accessor regressed when one emission path declared it `FfiOpaqueHandle`
     * instead of `uint32_t`. Fail loudly at the source rather than emit broken C++.
     */
    private fun dedupeFfiDeclarations(declarations: Collection<String>): List<String> {
        // Split "<returnType> <name>(<params>);" into (returnType, "<name>(<params>);").
        val declarationRegex = Regex("""^(.*?)\s+([A-Za-z_][A-Za-z0-9_]*\s*\(.*)$""")
        val returnTypeBySignature = HashMap<String, String>()
        for (declaration in declarations) {
            val match = declarationRegex.find(declaration.trim()) ?: continue
            val returnType = match.groupValues[1].trim()
            val signature = match.groupValues[2].trim()
            val existing = returnTypeBySignature[signature]
            require(existing == null || existing == returnType) {
                "Conflicting FFI extern return types for '$signature':\n" +
                    "  $existing $signature\n  $returnType $signature\n" +
                    "All emission paths must declare a symbol with an identical return type."
            }
            returnTypeBySignature.putIfAbsent(signature, returnType)
        }
        return declarations.toSortedSet().toList()
    }

    /**
     * True when [iface] declares a STATIC factory function whose return type is the interface itself
     * (e.g. LocationEngineBase.makeLocationEngineFromSharedSdkNativeEngine / makeLocationEngine).
     * Such an interface is instantiable from a platform without a Dart runtime — the static factory
     * yields a handle and the instance methods operate on it — so the RN generator should emit a
     * native module for it (it otherwise only emits modules for classes/structs). Restricting to a
     * SELF-returning static factory keeps this narrow: listener-only / callback interfaces (which are
     * marshalled as proxies, not instantiated) are not matched.
     */
    private fun interfaceHasSelfReturningStaticFactory(iface: LimeInterface): Boolean =
        iface.functions.any { function ->
            // A static factory whose return type resolves (by PATH, not reference — the type-ref may
            // be a LimeLazyTypeRef/alias indirection) to the interface itself. Matches whether or not
            // the factory is flagged isConstructor: the real SDK models make* factories as STATIC
            // CONSTRUCTORS, which must still be recognised here.
            function.isStatic &&
                function.returnType.typeRef.type.actualType.path == iface.path
        }

    private fun collectNestedStructs(container: LimeContainer): List<LimeStruct> {
        val result = mutableListOf<LimeStruct>()
        for (nested in container.structs) {
            result += nested
            result += collectNestedStructs(nested)
        }
        return result
    }

    /** Recursively collect nested classes from any container. */
    private fun collectNestedClasses(container: LimeContainer): List<LimeClass> {
        val result = mutableListOf<LimeClass>()
        for (nested in container.classes) {
            result += nested
            result += collectNestedClasses(nested)
        }
        return result
    }

    /**
     * Builds a constructor body that uses the SharedEngineRef singleton to call
     * the make__SharedEngineType variant instead of the no-arg make().
     * Generic: works for any class that has a constructor taking the configured shared engine type.
     */
    private fun buildSharedEngineConstructorBody(
        engineConstructor: LimeFunction,
        limeContainer: LimeContainer,
        ffiNameResolver: FfiNameResolver,
    ): Pair<String, List<String>> {
        val ns = libraryName.replace("-", "_")
        val ffiFuncName = "${libraryName}_${ffiNameResolver.resolveName(engineConstructor)}"
        val decls = mutableListOf<String>()
        decls += "FfiOpaqueHandle $ffiFuncName(int32_t isolate_id, FfiOpaqueHandle engine);"

        val canThrow = engineConstructor.thrownType != null
        val lines = mutableListOf<String>()
        lines += "  FfiOpaqueHandle __sdkEngine = $ns::getSharedEngineRaw();"
        lines += "  if (!__sdkEngine) throw jsi::JSError(rt, \"SDK engine not initialized. Call $sharedEngineType.make() first.\");"

        if (canThrow) {
            val hasErrorFn = "${ffiFuncName}_return_has_error"
            val getResultFn = "${ffiFuncName}_return_get_result"
            val getErrorFn = "${ffiFuncName}_return_get_error"
            val releaseFn = "${ffiFuncName}_return_release_handle"
            decls += "FfiOpaqueHandle $getResultFn(FfiOpaqueHandle handle);"
            decls += "FfiOpaqueHandle $getErrorFn(FfiOpaqueHandle handle);"
            decls += "bool $hasErrorFn(FfiOpaqueHandle handle);"
            decls += "void $releaseFn(FfiOpaqueHandle handle);"

            lines += "  FfiOpaqueHandle __returnHandle = $ffiFuncName(0, __sdkEngine);"
            lines += "  if ($hasErrorFn(__returnHandle)) {"
            lines += "    auto __errCode = $getErrorFn(__returnHandle);"
            lines += "    $releaseFn(__returnHandle);"
            lines += "    throw jsi::JSError(rt, \"Native error: \" + std::to_string(reinterpret_cast<intptr_t>(__errCode)));"
            lines += "  }"
            lines += "  FfiOpaqueHandle __result = $getResultFn(__returnHandle);"
            lines += "  $releaseFn(__returnHandle);"
            lines += "  auto __key = FfiHandleRegistry::instance().store(__result);"
            lines += "  return jsi::String::createFromUtf8(rt, __key);"
        } else {
            lines += "  FfiOpaqueHandle __result = $ffiFuncName(0, __sdkEngine);"
            lines += "  if (!__result) throw jsi::JSError(rt, \"FFI returned null handle\");"
            lines += "  auto __key = FfiHandleRegistry::instance().store(__result);"
            lines += "  return jsi::String::createFromUtf8(rt, __key);"
        }

        return lines.joinToString("\n") to decls
    }

    private fun buildGetConstantsBody(container: LimeContainer): String {
        val lines = mutableListOf<String>()
        lines += "  jsi::Object constants(rt);"
        for (constant in container.constants) {
            val name = constant.path.name
            val value = constant.value
            val resolvedType = constant.typeRef.type.actualType
            when {
                resolvedType is LimeBasicType && resolvedType.typeId == LimeBasicType.TypeId.STRING -> {
                    val strValue = (value as? com.here.gluecodium.model.lime.LimeValue.Literal)?.value ?: ""
                    // strValue is unquoted, wrap in C++ string literal
                    val escaped = strValue.replace("\\", "\\\\").replace("\"", "\\\"")
                    lines += "  constants.setProperty(rt, \"$name\", jsi::String::createFromUtf8(rt, \"$escaped\"));"
                }
                resolvedType is LimeBasicType && resolvedType.typeId.isNumericType -> {
                    val numValue = (value as? com.here.gluecodium.model.lime.LimeValue.Literal)?.value ?: "0"
                    lines += "  constants.setProperty(rt, \"$name\", $numValue);"
                }
                else -> {
                    val strValue = (value as? com.here.gluecodium.model.lime.LimeValue.Literal)?.value ?: ""
                    val escaped = strValue.replace("\\", "\\\\").replace("\"", "\\\"")
                    lines += "  constants.setProperty(rt, \"$name\", jsi::String::createFromUtf8(rt, \"$escaped\"));"
                }
            }
        }
        lines += "  return constants;"
        return lines.joinToString("\n")
    }

    /**
     * Build the getter body and FFI declarations for a struct field.
     * FFI pattern: {lib}_{structFfiName}_get_field_{fieldFfiName}(handle) → value
     * Returns (body, ffiDeclarations).
     */
    private fun buildFieldGetterBody(
        container: LimeContainer,
        field: LimeField,
        ffiNameResolver: FfiNameResolver,
    ): Pair<String, List<String>> {
        val structFfiName = ffiNameResolver.resolveName(container as LimeType)
        val fieldFfiName = ffiNameResolver.resolveName(field)
        val ffiFuncName = "${libraryName}_${structFfiName}_get_field_$fieldFfiName"

        val typeRef = field.typeRef
        val resolvedType = typeRef.type.actualType
        val isNullable = typeRef.isNullable

        val decls = mutableListOf<String>()
        val lines = mutableListOf<String>()

        lines += "  auto __handleStr = __nativeHandle.utf8(rt);"
        lines += "  FfiOpaqueHandle __self = FfiHandleRegistry::instance().retrieve(__handleStr);"
        lines += "  if (!__self) throw jsi::JSError(rt, \"Invalid native handle\");"

        when {
            isNullable && resolvedType is LimeBasicType -> {
                val nullablePrefix = getNullableBasicTypeFfiPrefix(resolvedType.typeId)
                val getValFn = "${libraryName}_${nullablePrefix}_get_value_nullable"
                val relFn = "${libraryName}_${nullablePrefix}_release_handle_nullable"
                decls += "FfiOpaqueHandle $ffiFuncName(FfiOpaqueHandle handle);"
                when (resolvedType.typeId) {
                    LimeBasicType.TypeId.DOUBLE -> {
                        decls += "double $getValFn(FfiOpaqueHandle handle);"
                        decls += "void $relFn(FfiOpaqueHandle handle);"
                        lines += "  FfiOpaqueHandle __r = $ffiFuncName(__self);"
                        lines += "  if (!__r) return std::nullopt;"
                        lines += "  double __val = $getValFn(__r);"
                        lines += "  $relFn(__r);"
                        lines += "  return __val;"
                    }
                    LimeBasicType.TypeId.FLOAT -> {
                        decls += "float $getValFn(FfiOpaqueHandle handle);"
                        decls += "void $relFn(FfiOpaqueHandle handle);"
                        lines += "  FfiOpaqueHandle __r = $ffiFuncName(__self);"
                        lines += "  if (!__r) return std::nullopt;"
                        lines += "  float __val = $getValFn(__r);"
                        lines += "  $relFn(__r);"
                        lines += "  return static_cast<double>(__val);"
                    }
                    LimeBasicType.TypeId.BOOLEAN -> {
                        decls += "bool $getValFn(FfiOpaqueHandle handle);"
                        decls += "void $relFn(FfiOpaqueHandle handle);"
                        lines += "  FfiOpaqueHandle __r = $ffiFuncName(__self);"
                        lines += "  if (!__r) return std::nullopt;"
                        lines += "  bool __val = $getValFn(__r);"
                        lines += "  $relFn(__r);"
                        lines += "  return __val;"
                    }
                    LimeBasicType.TypeId.STRING -> {
                        decls += "FfiOpaqueHandle $getValFn(FfiOpaqueHandle handle);"
                        decls += "void $relFn(FfiOpaqueHandle handle);"
                        decls += "const char* ${libraryName}_std_string_get_value(FfiOpaqueHandle handle);"
                        decls += "void ${libraryName}_std_string_release_handle(FfiOpaqueHandle handle);"
                        lines += "  FfiOpaqueHandle __r = $ffiFuncName(__self);"
                        lines += "  if (!__r) return std::nullopt;"
                        lines += "  FfiOpaqueHandle __inner = $getValFn(__r);"
                        lines += "  $relFn(__r);"
                        lines += "  if (!__inner) return std::nullopt;"
                        lines += "  auto __sv = ${libraryName}_std_string_get_value(__inner);"
                        lines += "  auto __jstr = jsi::String::createFromUtf8(rt, __sv);"
                        lines += "  ${libraryName}_std_string_release_handle(__inner);"
                        lines += "  return __jstr;"
                    }
                    LimeBasicType.TypeId.BLOB, LimeBasicType.TypeId.LOCALE -> {
                        // Opaque handle types — inner value stays as handle in registry
                        decls += "FfiOpaqueHandle $getValFn(FfiOpaqueHandle handle);"
                        decls += "void $relFn(FfiOpaqueHandle handle);"
                        lines += "  FfiOpaqueHandle __r = $ffiFuncName(__self);"
                        lines += "  if (!__r) return std::nullopt;"
                        lines += "  FfiOpaqueHandle __inner = $getValFn(__r);"
                        lines += "  $relFn(__r);"
                        lines += "  if (!__inner) return std::nullopt;"
                        lines += "  auto __key = FfiHandleRegistry::instance().store(__inner);"
                        lines += "  return jsi::String::createFromUtf8(rt, __key);"
                    }
                    LimeBasicType.TypeId.DURATION -> {
                        // Nullable Duration: unbox via the SDK-exported ULong nullable box (a nullable
                        // Duration is ABI-identical to a nullable uint64), then apply the same
                        // microseconds→seconds conversion as the non-nullable/method-return paths.
                        val cType = intFfiCType(resolvedType.typeId)
                        decls += "$cType $getValFn(FfiOpaqueHandle handle);"
                        decls += "void $relFn(FfiOpaqueHandle handle);"
                        lines += "  FfiOpaqueHandle __r = $ffiFuncName(__self);"
                        lines += "  if (!__r) return std::nullopt;"
                        lines += "  $cType __val = $getValFn(__r);"
                        lines += "  $relFn(__r);"
                        lines += "  return static_cast<double>(__val) / 1000000.0;  // microseconds → seconds"
                    }
                    else -> {
                        // Integer/uint types
                        val cType = intFfiCType(resolvedType.typeId)
                        decls += "$cType $getValFn(FfiOpaqueHandle handle);"
                        decls += "void $relFn(FfiOpaqueHandle handle);"
                        lines += "  FfiOpaqueHandle __r = $ffiFuncName(__self);"
                        lines += "  if (!__r) return std::nullopt;"
                        lines += "  $cType __val = $getValFn(__r);"
                        lines += "  $relFn(__r);"
                        lines += "  return static_cast<double>(__val);"
                    }
                }
            }
            !isNullable && resolvedType is LimeBasicType -> {
                when (resolvedType.typeId) {
                    LimeBasicType.TypeId.DOUBLE -> {
                        decls += "double $ffiFuncName(FfiOpaqueHandle handle);"
                        lines += "  double __val = $ffiFuncName(__self);"
                        lines += "  return __val;"
                    }
                    LimeBasicType.TypeId.FLOAT -> {
                        decls += "float $ffiFuncName(FfiOpaqueHandle handle);"
                        lines += "  float __val = $ffiFuncName(__self);"
                        lines += "  return static_cast<double>(__val);"
                    }
                    LimeBasicType.TypeId.BOOLEAN -> {
                        decls += "bool $ffiFuncName(FfiOpaqueHandle handle);"
                        lines += "  bool __val = $ffiFuncName(__self);"
                        lines += "  return __val;"
                    }
                    LimeBasicType.TypeId.STRING -> {
                        decls += "FfiOpaqueHandle $ffiFuncName(FfiOpaqueHandle handle);"
                        decls += "const char* ${libraryName}_std_string_get_value(FfiOpaqueHandle handle);"
                        decls += "void ${libraryName}_std_string_release_handle(FfiOpaqueHandle handle);"
                        lines += "  FfiOpaqueHandle __sh = $ffiFuncName(__self);"
                        lines += "  if (!__sh) throw jsi::JSError(rt, \"FFI returned null string handle\");"
                        lines += "  auto __sv = ${libraryName}_std_string_get_value(__sh);"
                        lines += "  auto __jstr = jsi::String::createFromUtf8(rt, __sv);"
                        lines += "  ${libraryName}_std_string_release_handle(__sh);"
                        lines += "  return __jstr;"
                    }
                    LimeBasicType.TypeId.BLOB, LimeBasicType.TypeId.LOCALE -> {
                        // Opaque handle types — store in registry, return as jsi::String key
                        decls += "FfiOpaqueHandle $ffiFuncName(FfiOpaqueHandle handle);"
                        lines += "  FfiOpaqueHandle __h = $ffiFuncName(__self);"
                        lines += "  if (!__h) throw jsi::JSError(rt, \"FFI returned null handle\");"
                        lines += "  auto __key = FfiHandleRegistry::instance().store(__h);"
                        lines += "  return jsi::String::createFromUtf8(rt, __key);"
                    }
                    LimeBasicType.TypeId.DURATION -> {
                        // A Duration crosses the FFI boundary as a microsecond count. Apply the same
                        // microseconds→seconds conversion the method-return path uses
                        // (FfiMethodBodyBuilder.emitReturnToJsi) so a Duration struct field is seconds
                        // in JS, consistent with a Duration method return.
                        val cType = intFfiCType(resolvedType.typeId)
                        decls += "$cType $ffiFuncName(FfiOpaqueHandle handle);"
                        lines += "  $cType __val = $ffiFuncName(__self);"
                        lines += "  return static_cast<double>(__val) / 1000000.0;  // microseconds → seconds"
                    }
                    else -> {
                        val cType = intFfiCType(resolvedType.typeId)
                        decls += "$cType $ffiFuncName(FfiOpaqueHandle handle);"
                        lines += "  $cType __val = $ffiFuncName(__self);"
                        lines += "  return static_cast<double>(__val);"
                    }
                }
            }
            resolvedType is LimeEnumeration -> {
                if (isNullable) {
                    decls += "FfiOpaqueHandle $ffiFuncName(FfiOpaqueHandle handle);"
                    lines += "  FfiOpaqueHandle __r = $ffiFuncName(__self);"
                    lines += "  if (!__r) return std::nullopt;"
                    val ffiTypeName = ffiNameResolver.resolveName(resolvedType as LimeType)
                    val getValFn = "${libraryName}_${ffiTypeName}_get_value_nullable"
                    val relFn = "${libraryName}_${ffiTypeName}_release_handle_nullable"
                    decls += "uint32_t $getValFn(FfiOpaqueHandle handle);"
                    decls += "void $relFn(FfiOpaqueHandle handle);"
                    lines += "  uint32_t __val = $getValFn(__r);"
                    lines += "  $relFn(__r);"
                    lines += "  return static_cast<double>(__val);"
                } else {
                    decls += "uint32_t $ffiFuncName(FfiOpaqueHandle handle);"
                    lines += "  uint32_t __val = $ffiFuncName(__self);"
                    lines += "  return static_cast<double>(__val);"
                }
            }
            resolvedType is LimeMap -> {
                // Map field — iterate FFI map into a jsi::Array of [key, value] tuples (spec task
                // 15.3). Unlike List/Set, the SDK generic-map iterator returns key/value BY VALUE for
                // primitive sides (get_key/get_value : K/V), so no boxing/unboxing round-trip.
                val mapType = resolvedType as LimeMap
                val keyType = mapType.keyType.type.actualType
                val valueType = mapType.valueType.type.actualType
                val mapFfiName = ffiNameResolver.resolveName(resolvedType)
                val mapPrefix = "${libraryName}_$mapFfiName"
                val keyCType = fieldMapEntryCType(keyType)
                val valueCType = fieldMapEntryCType(valueType)

                decls += "FfiOpaqueHandle $ffiFuncName(FfiOpaqueHandle handle);"
                decls += "FfiOpaqueHandle ${mapPrefix}_iterator(FfiOpaqueHandle handle);"
                decls += "int32_t ${mapPrefix}_iterator_is_valid(FfiOpaqueHandle mapHandle, FfiOpaqueHandle iterHandle);"
                decls += "$keyCType ${mapPrefix}_iterator_get_key(FfiOpaqueHandle iterHandle);"
                decls += "$valueCType ${mapPrefix}_iterator_get_value(FfiOpaqueHandle iterHandle);"
                decls += "void ${mapPrefix}_iterator_increment(FfiOpaqueHandle iterHandle);"
                decls += "void ${mapPrefix}_iterator_release_handle(FfiOpaqueHandle iterHandle);"
                decls += "void ${mapPrefix}_release_handle(FfiOpaqueHandle handle);"
                if (keyType is LimeBasicType && keyType.typeId == LimeBasicType.TypeId.STRING ||
                    valueType is LimeBasicType && valueType.typeId == LimeBasicType.TypeId.STRING
                ) {
                    decls += "const char* ${libraryName}_std_string_get_value(FfiOpaqueHandle handle);"
                    decls += "void ${libraryName}_std_string_release_handle(FfiOpaqueHandle handle);"
                }

                lines += "  FfiOpaqueHandle __fieldMap = $ffiFuncName(__self);"
                lines += "  std::vector<jsi::Value> __mapEntries;"
                lines += "  if (__fieldMap) {"
                lines += "    auto __mapIter = ${mapPrefix}_iterator(__fieldMap);"
                lines += "    while (${mapPrefix}_iterator_is_valid(__fieldMap, __mapIter)) {"
                lines += "      auto __rawKey = ${mapPrefix}_iterator_get_key(__mapIter);"
                lines += "      auto __rawVal = ${mapPrefix}_iterator_get_value(__mapIter);"
                lines += "      auto __tuple = jsi::Array(rt, 2);"
                lines += "      __tuple.setValueAtIndex(rt, 0, ${fieldMapEntryToJsi("__rawKey", keyType)});"
                lines += "      __tuple.setValueAtIndex(rt, 1, ${fieldMapEntryToJsi("__rawVal", valueType)});"
                lines += "      __mapEntries.push_back(jsi::Value(rt, __tuple));"
                lines += "      ${mapPrefix}_iterator_increment(__mapIter);"
                lines += "    }"
                lines += "    ${mapPrefix}_iterator_release_handle(__mapIter);"
                lines += "    ${mapPrefix}_release_handle(__fieldMap);"
                lines += "  }"
                lines += "  auto __result = jsi::Array(rt, __mapEntries.size());"
                lines += "  for (size_t __i = 0; __i < __mapEntries.size(); __i++) {"
                lines += "    __result.setValueAtIndex(rt, __i, std::move(__mapEntries[__i]));"
                lines += "  }"
                lines += "  return __result;"
            }
            resolvedType is LimeList || resolvedType is LimeSet -> {
                // Collection field — iterate FFI list/set into jsi::Array
                val elemTypeRef = if (resolvedType is LimeList) resolvedType.elementType else (resolvedType as LimeSet).elementType
                val elemType = elemTypeRef.type.actualType
                val collFfiName = ffiNameResolver.resolveName(resolvedType)
                val collPrefix = "${libraryName}_$collFfiName"

                decls += "FfiOpaqueHandle $ffiFuncName(FfiOpaqueHandle handle);"
                decls += "FfiOpaqueHandle ${collPrefix}_iterator(FfiOpaqueHandle handle);"
                decls += "int32_t ${collPrefix}_iterator_is_valid(FfiOpaqueHandle listHandle, FfiOpaqueHandle iterHandle);"
                decls += "FfiOpaqueHandle ${collPrefix}_iterator_get(FfiOpaqueHandle iterHandle);"
                decls += "void ${collPrefix}_iterator_increment(FfiOpaqueHandle iterHandle);"
                decls += "void ${collPrefix}_iterator_release_handle(FfiOpaqueHandle iterHandle);"
                decls += "void ${collPrefix}_release_handle(FfiOpaqueHandle handle);"

                val listVar = "__fieldList"
                lines += "  FfiOpaqueHandle $listVar = $ffiFuncName(__self);"
                lines += "  std::vector<jsi::Value> __resultElems;"
                lines += "  if ($listVar) {"
                lines += "    auto __listIter = ${collPrefix}_iterator($listVar);"
                lines += "    while (${collPrefix}_iterator_is_valid($listVar, __listIter)) {"
                lines += "      auto __item = ${collPrefix}_iterator_get(__listIter);"
                emitFieldListElement(lines, decls, "__resultElems", "__item", elemType)
                lines += "      ${collPrefix}_iterator_increment(__listIter);"
                lines += "    }"
                lines += "    ${collPrefix}_iterator_release_handle(__listIter);"
                lines += "    ${collPrefix}_release_handle($listVar);"
                lines += "  }"
                lines += "  auto __result = jsi::Array(rt, __resultElems.size());"
                lines += "  for (size_t __i = 0; __i < __resultElems.size(); __i++) {"
                lines += "    __result.setValueAtIndex(rt, __i, std::move(__resultElems[__i]));"
                lines += "  }"
                lines += "  return __result;"
            }
            else -> {
                // Struct, class, interface — returns opaque handle
                decls += "FfiOpaqueHandle $ffiFuncName(FfiOpaqueHandle handle);"
                if (isNullable) {
                    lines += "  FfiOpaqueHandle __r = $ffiFuncName(__self);"
                    lines += "  if (!__r) return std::nullopt;"
                    val ffiTypeName = ffiNameResolver.resolveName(resolvedType)
                    val getValFn = "${libraryName}_${ffiTypeName}_get_value_nullable"
                    val relFn = "${libraryName}_${ffiTypeName}_release_handle_nullable"
                    decls += "FfiOpaqueHandle $getValFn(FfiOpaqueHandle handle);"
                    decls += "void $relFn(FfiOpaqueHandle handle);"
                    lines += "  FfiOpaqueHandle __inner = $getValFn(__r);"
                    lines += "  $relFn(__r);"
                    lines += "  if (!__inner) return std::nullopt;"
                    lines += "  auto __key = FfiHandleRegistry::instance().store(__inner);"
                    lines += "  return jsi::String::createFromUtf8(rt, __key);"
                } else {
                    // A non-nullable class/struct/interface FIELD can still be null at the FFI level
                    // during transient SDK states (e.g. RouteProgress.route / routeMatchedLocation on
                    // early navigation ticks before a map-match lock). Throwing here would abort the
                    // WHOLE struct `_fromHandle` reconstruction in the TS wrapper, dropping the sibling
                    // fields the caller needs (e.g. sectionProgress). Instead of `throw jsi::JSError(rt,
                    // "FFI returned null handle")`, return an EMPTY jsi::String on a null handle. The
                    // getter's declared return type stays jsi::String (matching the TurboModule spec's
                    // `=> string`, so RN Codegen's CxxSpec bridging is unchanged), and the null-tolerant
                    // TS wrapper (TypeScriptWrapperEmitter.marshalFromNativeForStructField) treats an
                    // empty-string handle as absent and leaves the field undefined instead of failing
                    // the whole reconstruction.
                    lines += "  FfiOpaqueHandle __r = $ffiFuncName(__self);"
                    lines += "  if (!__r) return jsi::String::createFromUtf8(rt, \"\");"
                    lines += "  auto __key = FfiHandleRegistry::instance().store(__r);"
                    lines += "  return jsi::String::createFromUtf8(rt, __key);"
                }
            }
        }
        return Pair(lines.joinToString("\n"), decls)
    }

    private fun getNullableBasicTypeFfiPrefix(typeId: LimeBasicType.TypeId): String =
        when (typeId) {
            LimeBasicType.TypeId.DOUBLE -> "Double"
            LimeBasicType.TypeId.FLOAT -> "Float"
            LimeBasicType.TypeId.BOOLEAN -> "Boolean"
            LimeBasicType.TypeId.STRING -> "String"
            LimeBasicType.TypeId.INT8 -> "Byte"
            LimeBasicType.TypeId.UINT8 -> "UByte"
            LimeBasicType.TypeId.INT16 -> "Short"
            LimeBasicType.TypeId.UINT16 -> "UShort"
            LimeBasicType.TypeId.INT32 -> "Int"
            LimeBasicType.TypeId.UINT32 -> "UInt"
            LimeBasicType.TypeId.INT64 -> "Long"
            LimeBasicType.TypeId.UINT64 -> "ULong"
            // See FfiMethodBodyBuilder.getNullableBasicTypeFfiName: a nullable Date/Duration boxes
            // as `std::optional<uint64_t>*`, identical to a nullable uint64, and the SDK exports no
            // standalone Date/Duration nullable box — reuse the exported ULong box.
            LimeBasicType.TypeId.DATE -> "ULong"
            LimeBasicType.TypeId.DURATION -> "ULong"
            else -> "Unknown"
        }

    private fun intFfiCType(typeId: LimeBasicType.TypeId): String =
        when (typeId) {
            LimeBasicType.TypeId.INT8 -> "int8_t"
            LimeBasicType.TypeId.UINT8 -> "uint8_t"
            LimeBasicType.TypeId.INT16 -> "int16_t"
            LimeBasicType.TypeId.UINT16 -> "uint16_t"
            LimeBasicType.TypeId.INT32 -> "int32_t"
            LimeBasicType.TypeId.UINT32 -> "uint32_t"
            LimeBasicType.TypeId.INT64 -> "int64_t"
            LimeBasicType.TypeId.UINT64 -> "uint64_t"
            LimeBasicType.TypeId.DATE, LimeBasicType.TypeId.DURATION -> "uint64_t"
            else -> "int32_t"
        }

    /** The FFI C type for a map key/value in a struct FIELD getter (SDK generic-map ABI: primitives
     *  by value, String/Blob/Locale and complex types as FfiOpaqueHandle). */
    private fun fieldMapEntryCType(entryType: LimeType): String =
        when (entryType) {
            is LimeBasicType ->
                when (entryType.typeId) {
                    LimeBasicType.TypeId.DOUBLE -> "double"
                    LimeBasicType.TypeId.FLOAT -> "float"
                    LimeBasicType.TypeId.BOOLEAN -> "bool"
                    LimeBasicType.TypeId.STRING, LimeBasicType.TypeId.BLOB, LimeBasicType.TypeId.LOCALE ->
                        "FfiOpaqueHandle"
                    else -> intFfiCType(entryType.typeId)
                }
            is LimeEnumeration -> "uint32_t"
            else -> "FfiOpaqueHandle"
        }

    /** Convert a by-value FFI map key/value into a jsi::Value for a struct FIELD getter. */
    private fun fieldMapEntryToJsi(
        rawVar: String,
        entryType: LimeType,
    ): String =
        when (entryType) {
            is LimeBasicType ->
                when (entryType.typeId) {
                    LimeBasicType.TypeId.STRING -> {
                        // A String side is a transient std_string handle: read then release it.
                        "([&]{ auto __sv = ${libraryName}_std_string_get_value($rawVar); " +
                            "auto __js = jsi::String::createFromUtf8(rt, __sv ? __sv : \"\"); " +
                            "${libraryName}_std_string_release_handle($rawVar); return jsi::Value(rt, __js); }())"
                    }
                    LimeBasicType.TypeId.BOOLEAN -> "jsi::Value(static_cast<bool>($rawVar))"
                    LimeBasicType.TypeId.DURATION -> "jsi::Value(static_cast<double>($rawVar) / 1000000.0)"
                    else -> "jsi::Value(static_cast<double>($rawVar))"
                }
            is LimeEnumeration -> "jsi::Value(static_cast<double>($rawVar))"
            else -> "jsi::Value(rt, jsi::String::createFromUtf8(rt, FfiHandleRegistry::instance().store($rawVar)))"
        }

    /** Emit code to push one FFI collection element into a std::vector<jsi::Value>. */
    private fun emitFieldListElement(
        lines: MutableList<String>,
        decls: MutableList<String>,
        vecVar: String,
        itemVar: String,
        elemType: LimeType,
    ) {
        when (elemType) {
            is LimeBasicType ->
                when (elemType.typeId) {
                    LimeBasicType.TypeId.STRING -> {
                        decls += "const char* ${libraryName}_std_string_get_value(FfiOpaqueHandle handle);"
                        decls += "void ${libraryName}_std_string_release_handle(FfiOpaqueHandle handle);"
                        lines += "      if ($itemVar) {"
                        lines += "        auto __sv = ${libraryName}_std_string_get_value($itemVar);"
                        lines += "        $vecVar.push_back(jsi::String::createFromUtf8(rt, __sv));"
                        lines += "        ${libraryName}_std_string_release_handle($itemVar);"
                        lines += "      }"
                    }
                    LimeBasicType.TypeId.DOUBLE, LimeBasicType.TypeId.FLOAT ->
                        lines += "      $vecVar.push_back(jsi::Value(*reinterpret_cast<double*>(&$itemVar)));"
                    LimeBasicType.TypeId.BOOLEAN ->
                        lines += "      $vecVar.push_back(jsi::Value(static_cast<bool>(reinterpret_cast<intptr_t>($itemVar))));"
                    else ->
                        lines += "      $vecVar.push_back(jsi::Value(static_cast<double>(reinterpret_cast<intptr_t>($itemVar))));"
                }
            is LimeEnumeration ->
                lines += "      $vecVar.push_back(jsi::Value(static_cast<double>(reinterpret_cast<intptr_t>($itemVar))));"
            else -> {
                lines += "      if ($itemVar) {"
                lines += "        auto __k = FfiHandleRegistry::instance().store($itemVar);"
                lines += "        $vecVar.push_back(jsi::String::createFromUtf8(rt, __k));"
                lines += "      }"
            }
        }
    }

    /**
     * Renders one of the static/near-static React Native support files from its mustache template.
     * The only interpolated values are the FFI symbol prefix (`libraryName`) and the derived C++
     * namespace, so the emitted C++/ObjC infrastructure lives in `resources/templates/reactnative/`
     * rather than as string literals in this generator.
     */
    private fun renderSupportFile(templateName: String): String =
        TemplateEngine.render(
            "reactnative/$templateName",
            mapOf(
                "libraryName" to libraryName,
                "namespace" to libraryName.replace("-", "_"),
            ),
        )

    companion object {
        private const val ROOT_DIR = "react-native"
    }
}
