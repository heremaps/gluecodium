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

package com.here.gluecodium.generator.typescript

import com.here.gluecodium.common.LimeModelFilter
import com.here.gluecodium.common.LimeModelSkipPredicates
import com.here.gluecodium.generator.common.GeneratedFile
import com.here.gluecodium.generator.common.Generator
import com.here.gluecodium.generator.common.GeneratorOptions
import com.here.gluecodium.generator.common.TurboModuleCallableNameResolver
import com.here.gluecodium.generator.common.makeFullFields
import com.here.gluecodium.generator.common.orderedByPrimaryThenArity
import com.here.gluecodium.generator.common.templates.TemplateEngine
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeValueType.SKIP
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeContainer
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeType

/**
 * Generates TypeScript declarations and React Native TurboModule specs from LIME model.
 *
 * Produces two categories of output:
 * - **Type declarations** (classes, structs, enums, interfaces, lambdas, exceptions) as `.ts` files
 * - **TurboModule spec** (`specs/NativeXxxModule.ts`) when the `react-native` tag is active
 *
 * Type declarations use rich TypeScript types ([TypeScriptTypeMapper]) while the TurboModule
 * spec is constrained by React Native codegen rules ([TurboModuleTypeMapper]).
 */
internal class TypeScriptGenerator : Generator {
    override val shortName = "typescript"

    private lateinit var activeTags: Set<String>
    private var libraryName: String = "library"
    private val typeMapper = TypeScriptTypeMapper()
    private var nameResolver = TypeScriptNameResolver()

    /**
     * Check if a type is platform-specific (Java/Kotlin only).
     * Types with @Skip(Dart) are Java/Kotlin-only and shouldn't appear in React Native.
     * Note: @Skip(Dart) is stored as attributes[DART][SKIP] in the model.
     */
    private fun isPlatformSpecificType(type: LimeType): Boolean = type.attributes.have(LimeAttributeType.DART, SKIP)

    /**
     * Check if a function should be excluded from React Native generation.
     * Excluded if:
     * - It has parameters with platform-specific types (e.g., AndroidContext)
     * - It itself is skipped for both Java AND Swift (meaning Dart-only)
     */
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
        activeTags = options.tags
        libraryName = options.libraryName
    }

    override fun generate(limeModel: LimeModel): List<GeneratedFile> {
        val files = mutableListOf<GeneratedFile>()

        // Compute collision names across all types in the full model
        val allContainers = limeModel.topElements.filterIsInstance<LimeContainer>()
        val nameToHeads = mutableMapOf<String, MutableSet<List<String>>>()
        for (c in allContainers) {
            val tailName = c.path.tail.joinToString("") { it.replaceFirstChar { ch -> ch.uppercase() } }
            nameToHeads.getOrPut(tailName) { mutableSetOf() }.add(c.path.head)
        }
        val collisionNames = nameToHeads.filter { it.value.size > 1 }.keys.toSet()
        nameResolver = TypeScriptNameResolver(collisionNames)

        val seenTypePaths = mutableSetOf<String>()
        limeModel.topElements.forEach { element ->
            when (element) {
                is LimeClass -> {
                    if (seenTypePaths.add(nameResolver.resolveFilePath(element))) {
                        files += generateClassFile(element)
                        files += generateNestedTypes(element)
                    }
                }
                is LimeInterface -> {
                    if (seenTypePaths.add(nameResolver.resolveFilePath(element))) {
                        files += generateInterfaceFile(element)
                    }
                }
                is LimeStruct -> {
                    if (seenTypePaths.add(nameResolver.resolveFilePath(element))) {
                        files += generateStructFile(element)
                    }
                }
                is LimeEnumeration -> {
                    if (seenTypePaths.add(nameResolver.resolveFilePath(element))) {
                        files += generateEnumFile(element)
                    }
                }
                is LimeLambda -> {
                    if (seenTypePaths.add(nameResolver.resolveFilePath(element))) {
                        files += generateLambdaFile(element)
                    }
                }
                is LimeException -> {
                    if (seenTypePaths.add(nameResolver.resolveFilePath(element))) {
                        files += generateExceptionFile(element)
                    }
                }
            }
        }

        if (activeTags.contains("react-native")) {
            // Filter model by active tags so TurboModule specs match the C++ impl
            val filteredModel =
                LimeModelFilter.filter(limeModel) {
                    LimeModelSkipPredicates.shouldRetainElement(it, activeTags)
                }

            val allStructs = mutableListOf<LimeStruct>()
            filteredModel.topElements.filterIsInstance<LimeStruct>().forEach { allStructs += it }
            filteredModel.topElements.filterIsInstance<LimeClass>().forEach { allStructs += collectNestedStructs(it) }
            filteredModel.topElements.filterIsInstance<LimeStruct>().forEach { allStructs += collectNestedStructs(it) }

            // Dedup by spec file path: same-named types with different disambiguators
            // must not overwrite each other's spec files
            val seenSpecPaths = mutableSetOf<String>()

            filteredModel.topElements.filterIsInstance<LimeClass>()
                .filter { seenSpecPaths.add(specFilePath(it)) }
                .forEach { limeClass -> files += generateTurboModuleSpec(limeClass) }

            // Generate specs for nested classes (e.g. MapPolyline.SolidRepresentation)
            val nestedClasses = mutableListOf<LimeClass>()
            filteredModel.topElements.filterIsInstance<LimeClass>().forEach { nestedClasses += collectNestedClasses(it) }
            nestedClasses
                .filter { seenSpecPaths.add(specFilePath(it)) }
                .forEach { limeClass -> files += generateTurboModuleSpec(limeClass) }

            // Generate TurboModule specs for INTERFACES that carry a self-returning static factory
            // (e.g. LocationEngineBase.makeLocationEngineFromSharedSdkNativeEngine). These interfaces
            // are instantiable from the platform (the factory yields a handle, instance methods
            // operate on it), so they get a native module in the RN C++ generator — the TS spec MUST
            // match or the module is unreachable from TypeScript (device-positioning gap, 27.37).
            filteredModel.topElements.filterIsInstance<LimeInterface>()
                .filter { interfaceHasSelfReturningStaticFactory(it) }
                .filter { seenSpecPaths.add(specFilePath(it)) }
                .forEach { limeInterface -> files += generateTurboModuleSpec(limeInterface) }

            allStructs
                .filter { limeStruct ->
                    limeStruct.constructors.isNotEmpty() ||
                        limeStruct.fieldConstructors.isNotEmpty() ||
                        limeStruct.functions.any { !it.isConstructor } ||
                        limeStruct.fields.isNotEmpty()
                }
                .filter { seenSpecPaths.add(specFilePath(it)) }
                .forEach { limeStruct -> files += generateTurboModuleSpec(limeStruct) }

            // Generate idiomatic TypeScript wrapper classes
            val wrapperEmitter = TypeScriptWrapperEmitter(nameResolver, libraryName)
            val wrapperClasses =
                (filteredModel.topElements.filterIsInstance<LimeClass>() + nestedClasses)
                    .filter { !isPlatformSpecificType(it) }
            val wrapperStructs = allStructs.filter { it.fields.isNotEmpty() }
            val wrapperEnums =
                filteredModel.topElements.filterIsInstance<LimeEnumeration>()
                    .filter { it.enumerators.isNotEmpty() }
            files += wrapperEmitter.generate(wrapperClasses, wrapperStructs, wrapperEnums)
        }

        return files
    }

    /**
     * True when [iface] declares a self-returning static factory (e.g.
     * LocationEngineBase.makeLocationEngineFromSharedSdkNativeEngine) — such an interface is
     * instantiable from the platform and must get a TurboModule spec to match the RN C++ module.
     * Compared by PATH (not reference) so a factory return-type indirection still matches.
     */
    private fun interfaceHasSelfReturningStaticFactory(iface: LimeInterface): Boolean =
        iface.functions.any { function ->
            // A static factory whose return type resolves (by path) to the interface itself. This
            // matches whether or not the factory is flagged isConstructor — the real SDK models
            // make* factories as STATIC CONSTRUCTORS, which must still be recognised here.
            function.isStatic &&
                function.returnType.typeRef.type.actualType.path == iface.path
        }

    private fun specFilePath(container: LimeContainer): String = "typescript/specs/Native${nameResolver.resolveName(container)}Module.ts"

    private fun generateNestedTypes(container: LimeClass): List<GeneratedFile> {
        val files = mutableListOf<GeneratedFile>()
        container.structs.forEach { files += generateStructFile(it) }
        container.enumerations.forEach { files += generateEnumFile(it) }
        container.lambdas.forEach { files += generateLambdaFile(it) }
        container.exceptions.forEach { files += generateExceptionFile(it) }
        container.interfaces.forEach { files += generateInterfaceFile(it) }
        return files
    }

    private fun collectNestedStructs(container: LimeContainer): List<LimeStruct> {
        val result = mutableListOf<LimeStruct>()
        for (nested in container.structs) {
            result += nested
            result += collectNestedStructs(nested)
        }
        return result
    }

    private fun collectNestedClasses(container: LimeContainer): List<LimeClass> {
        val result = mutableListOf<LimeClass>()
        for (nested in container.classes) {
            result += nested
            result += collectNestedClasses(nested)
        }
        return result
    }

    private fun generateClassFile(limeClass: LimeClass): GeneratedFile {
        // Include inherited interface methods so a class that only inherits its API still exposes
        // every method, and disambiguate overloads via the shared effective-name resolver so a
        // @Dart(Name) overload is never silently dropped (design §1.1; requirements 3.1/7.1/7.2).
        val inheritedFunctions = limeClass.interfaceInheritedFunctions.filter { !it.isConstructor }
        val orderedMethods =
            (limeClass.functions.filter { !it.isConstructor } + inheritedFunctions)
                .sortedBy { it.parameters.size }
        val seenNames = mutableSetOf<String>()
        val constructors = limeClass.constructors
        val constructorNames =
            constructors.associateWith {
                TurboModuleCallableNameResolver.resolveEffectiveName(it, seenNames)
            }
        val data =
            mapOf(
                "modelName" to nameResolver.resolveName(limeClass),
                "className" to nameResolver.resolveName(limeClass),
                "methods" to
                    orderedMethods.mapNotNull { function ->
                        val effectiveName =
                            TurboModuleCallableNameResolver.resolveEffectiveName(function, seenNames)
                                ?: return@mapNotNull null
                        mapOf(
                            "name" to effectiveName,
                            "params" to formatParameters(function.parameters),
                            "returnType" to mapReturnType(function),
                        )
                    },
                "constructors" to
                    constructors.mapNotNull { function ->
                        val effectiveName = constructorNames[function] ?: return@mapNotNull null
                        mapOf(
                            "name" to effectiveName,
                            "params" to formatParameters(function.parameters),
                            "className" to nameResolver.resolveName(limeClass),
                        )
                    },
            )
        val content = TemplateEngine.render("typescript/TypeScriptClass", data)
        return GeneratedFile(content, nameResolver.resolveFilePath(limeClass))
    }

    private fun generateInterfaceFile(iface: LimeInterface): GeneratedFile {
        val data =
            mapOf(
                "modelName" to nameResolver.resolveName(iface),
                "methods" to
                    iface.functions.map { function ->
                        mapOf(
                            "name" to nameResolver.resolveName(function),
                            "params" to formatParameters(function.parameters),
                            "returnType" to mapReturnType(function),
                        )
                    },
            )
        val content = TemplateEngine.render("typescript/TypeScriptInterface", data)
        return GeneratedFile(content, nameResolver.resolveFilePath(iface))
    }

    private fun generateStructFile(struct: LimeStruct): GeneratedFile {
        val data =
            mapOf(
                "modelName" to nameResolver.resolveName(struct),
                "fields" to typeMapper.mapStructFields(struct),
            )
        val content = TemplateEngine.render("typescript/TypeScriptStruct", data)
        return GeneratedFile(content, nameResolver.resolveFilePath(struct))
    }

    private fun generateEnumFile(enumeration: LimeEnumeration): GeneratedFile {
        val data =
            mapOf(
                "modelName" to nameResolver.resolveName(enumeration),
                "enumerators" to
                    enumeration.enumerators.map { enumerator ->
                        mapOf(
                            "name" to nameResolver.resolveName(enumerator),
                            "value" to enumerator.value.toString(),
                        )
                    },
            )
        val content = TemplateEngine.render("typescript/TypeScriptEnumeration", data)
        return GeneratedFile(content, nameResolver.resolveFilePath(enumeration))
    }

    private fun generateLambdaFile(lambda: LimeLambda): GeneratedFile {
        val data =
            mapOf(
                "modelName" to nameResolver.resolveName(lambda),
                "typeSignature" to typeMapper.mapType(LimeDirectTypeRefHelper.create(lambda)),
            )
        val content = TemplateEngine.render("typescript/TypeScriptLambda", data)
        return GeneratedFile(content, nameResolver.resolveFilePath(lambda))
    }

    private fun generateExceptionFile(exception: LimeException): GeneratedFile {
        val data =
            mapOf(
                "modelName" to nameResolver.resolveName(exception),
                "errorType" to typeMapper.mapType(exception.errorType),
            )
        val content = TemplateEngine.render("typescript/TypeScriptException", data)
        return GeneratedFile(content, nameResolver.resolveFilePath(exception))
    }

    private fun formatParameters(parameters: List<com.here.gluecodium.model.lime.LimeParameter>): String =
        parameters.joinToString(", ") { param ->
            "${param.path.name}: ${typeMapper.mapType(param.typeRef)}"
        }

    private fun mapReturnType(function: com.here.gluecodium.model.lime.LimeFunction): String =
        typeMapper.mapType(function.returnType.typeRef)

    private fun generateTurboModuleSpec(container: LimeContainer): GeneratedFile {
        val turboMapper = TurboModuleTypeMapper()
        val moduleName = "Native${nameResolver.resolveName(container)}Module"
        // RN codegen does not support method overloading — keep only the first
        // occurrence of each method name.
        // Pre-reserve names that conflict with TurboModule base class methods
        val seenNames = mutableSetOf("create", "getConstants", "getName")

        // Add constructors as "make" methods that return a native handle
        // Field constructors (field constructor(fields)) are separate from functions in LimeStruct
        val fieldConstructorFunctions: List<LimeFunction> =
            if (container is LimeStruct) {
                container.fieldConstructors.map { it.asFunction() }
            } else {
                emptyList()
            }
        // Factory-interface static factories (see the RN generator): expose an interface's
        // self-returning static factory as an ordinary static spec method so the TS spec matches the
        // C++ module and the interface is instantiable from TypeScript (27.37).
        val interfaceStaticFactories: List<LimeFunction> =
            if (container is LimeInterface) {
                container.functions.filter {
                    it.isStatic &&
                        it.returnType.typeRef.type.actualType.path == container.path
                }
            } else {
                emptyList()
            }

        val constructorMethods =
            (container.constructors + fieldConstructorFunctions)
                .filter { !shouldExcludeFunction(it) }
                // A factory-interface's self-returning static factories are emitted as static methods
                // (interfaceStaticFactories, below) to match the RN C++ generator — exclude them here
                // so they are not ALSO claimed by the constructor path (which would consume the name
                // from seenNames and drop the static-method emission).
                .filter { it !in interfaceStaticFactories }
                .orderedByPrimaryThenArity()
                .mapNotNull { function ->
                    // Disambiguate multiple constructors through the shared effective-name resolver
                    // (design §1.1): the primary constructor claims `make`, an additional @Dart(Name)
                    // constructor (e.g. make_from_path → makeFromPath) surfaces under its alternate
                    // name in every layer, so a named LIME factory is never silently dropped here.
                    val name =
                        TurboModuleCallableNameResolver.resolveEffectiveName(function, seenNames)
                            ?: return@mapNotNull null
                    val params =
                        function.parameters.joinToString(", ") { param ->
                            "${param.path.name}: ${turboMapper.mapType(param.typeRef)}"
                        }
                    mapOf("signature" to turboMapper.formatMethodSignature(name, params, "string"))
                }

        // For structs with NO EXPOSED constructor, add a synthetic make() over the struct's
        // uninitialized fields. Mirrors ReactNativeGenerator: fires both when there are no LIME
        // constructors at all AND when the only constructors are excluded by shouldExcludeFunction
        // (@Skip(Java)+@Skip(Swift)), e.g. a struct with an excluded field ctor. `constructorMethods` is the post-exclusion
        // exposed set, so its emptiness is the correct signal.
        val syntheticMakeMethods: List<Map<String, String>> =
            if (container is LimeStruct &&
                constructorMethods.isEmpty() &&
                container.fields.isNotEmpty() &&
                seenNames.add("make")
            ) {
                // make() takes the struct's UNDEFAULTED fields as params: 0 for all-defaulted structs
                // (e.g. CarOptions → no-arg make(), Phase 23.2); r,g,b,a for external Color (Phase 23.6-C).
                val params =
                    container.uninitializedFields.joinToString(", ") { field ->
                        "${field.path.name}: ${turboMapper.mapType(field.typeRef)}"
                    }
                listOf(mapOf("signature" to turboMapper.formatMethodSignature("make", params, "string")))
            } else {
                emptyList()
            }

        // Phase 23.11: lossless all-fields serializer (arity matches ReactNativeGenerator's makeFull).
        val makeFullMethods: List<Map<String, String>> =
            if (container is LimeStruct) {
                val fullFields = makeFullFields(container) { shouldExcludeFunction(it) }
                if (fullFields != null && seenNames.add("makeFull")) {
                    val params =
                        fullFields.joinToString(", ") { field ->
                            "${field.path.name}: ${turboMapper.mapType(field.typeRef)}"
                        }
                    listOf(mapOf("signature" to turboMapper.formatMethodSignature("makeFull", params, "string")))
                } else {
                    emptyList()
                }
            } else {
                emptyList()
            }

        // Add a release method for handle lifecycle management
        val releaseMethods =
            listOf(
                mapOf("signature" to "readonly release: (__nativeHandle: string) => void"),
            )

        val inheritedMethods: List<LimeFunction> =
            if (container is LimeClass) {
                container.interfaceInheritedFunctions.filter { !it.isConstructor }
            } else {
                emptyList()
            }

        val methods =
            (
                (container.functions.filter { !it.isConstructor } + inheritedMethods)
                    .filter { !shouldExcludeFunction(it) } +
                    // factory statics bypass the Java/Swift-skip exclusion (see interfaceStaticFactories).
                    interfaceStaticFactories
            )
                .distinct()
                .sortedBy { it.parameters.size }
                .mapNotNull { function ->
                    val name =
                        TurboModuleCallableNameResolver.resolveEffectiveName(function, seenNames)
                            ?: return@mapNotNull null
                    val comment = function.comment.getFor("").ifEmpty { null }
                    val userParams =
                        function.parameters.joinToString(", ") { param ->
                            "${param.path.name}: ${turboMapper.mapType(param.typeRef)}"
                        }
                    // Instance methods receive a __nativeHandle to identify the object
                    val params =
                        if (!function.isStatic) {
                            if (userParams.isEmpty()) {
                                "__nativeHandle: string"
                            } else {
                                "__nativeHandle: string, $userParams"
                            }
                        } else {
                            userParams
                        }
                    val returnType = turboMapper.mapReturnType(function.returnType.typeRef)
                    val sig = turboMapper.formatMethodSignature(name, params, returnType)
                    if (comment != null) mapOf("signature" to sig, "comment" to comment) else mapOf("signature" to sig)
                }

        // Expose property getters/setters as methods (skip unsupported types like lambdas)
        val inheritedProperties = (container as? LimeClass)?.interfaceInheritedProperties.orEmpty()
        val bridgeableProperties =
            (container.properties + inheritedProperties).filter { prop ->
                val actualType = prop.typeRef.type.actualType
                actualType !is LimeLambda &&
                    !isPlatformSpecificType(actualType)
            }
        val propertyMethods =
            bridgeableProperties
                .filter { it.typeRef.type.actualType !is LimeInterface } // interface getters not useful
                .mapNotNull { prop ->
                    val propName = prop.path.name
                    val getterName = "get${snakeToUpperCamel(propName)}"
                    if (!seenNames.add(getterName)) return@mapNotNull null
                    val returnType = turboMapper.mapReturnType(prop.typeRef)
                    // Instance property getters receive a __nativeHandle
                    val handleParam = if (!prop.isStatic) "__nativeHandle: string" else ""
                    mapOf("signature" to turboMapper.formatMethodSignature(getterName, handleParam, returnType))
                } +
                bridgeableProperties.filter { it.setter != null }.mapNotNull { prop ->
                    val propName = prop.path.name
                    val setterName = "set${snakeToUpperCamel(propName)}"
                    if (!seenNames.add(setterName)) return@mapNotNull null
                    val paramType = turboMapper.mapType(prop.typeRef)
                    // Instance property setters receive a __nativeHandle
                    val params =
                        if (!prop.isStatic) {
                            "__nativeHandle: string, value: $paramType"
                        } else {
                            "value: $paramType"
                        }
                    mapOf("signature" to turboMapper.formatMethodSignature(setterName, params, "void"))
                }

        // Expose static constants via getConstants()
        val stringConstants =
            container.constants.filter { constant ->
                val actualType = constant.typeRef.type.actualType
                actualType is LimeBasicType && actualType.typeId == LimeBasicType.TypeId.STRING
            }
        val numericConstants =
            container.constants.filter { constant ->
                val actualType = constant.typeRef.type.actualType
                actualType is LimeBasicType && actualType.typeId != LimeBasicType.TypeId.STRING
            }
        val constantsMethods =
            if (stringConstants.isNotEmpty() || numericConstants.isNotEmpty()) {
                val fields =
                    (stringConstants + numericConstants).joinToString("; ") { constant ->
                        val constName = constant.path.name
                        val actualType = constant.typeRef.type.actualType as LimeBasicType
                        val tsType =
                            when (actualType.typeId) {
                                LimeBasicType.TypeId.STRING -> "string"
                                else -> "number"
                            }
                        "$constName: $tsType"
                    }
                listOf(mapOf("signature" to "readonly getConstants: () => { $fields }"))
            } else {
                emptyList()
            }

        // Struct field getter methods
        val structFieldMethods =
            if (container is LimeStruct) {
                container.fields.mapNotNull { field ->
                    val fieldName = field.path.name
                    var getterName = "get${snakeToUpperCamel(fieldName)}"
                    if (!seenNames.add(getterName)) {
                        getterName = "getField${snakeToUpperCamel(fieldName)}"
                        if (!seenNames.add(getterName)) return@mapNotNull null
                    }
                    val returnType = turboMapper.mapReturnType(field.typeRef)
                    mapOf("signature" to turboMapper.formatMethodSignature(getterName, "__nativeHandle: string", returnType))
                }
            } else {
                emptyList()
            }

        val moduleComment = container.comment.getFor("").ifEmpty { null }
        val data =
            mapOf(
                "moduleName" to moduleName,
                "methods" to syntheticMakeMethods + makeFullMethods + constructorMethods + releaseMethods +
                    methods + propertyMethods + constantsMethods + structFieldMethods,
            ) + (if (moduleComment != null) mapOf("comment" to moduleComment) else emptyMap())
        val content = TemplateEngine.render("typescript/TypeScriptTurboModuleSpec", data)
        return GeneratedFile(content, "typescript/specs/$moduleName.ts")
    }

    private fun snakeToUpperCamel(name: String): String = name.split("_").joinToString("") { it.replaceFirstChar { c -> c.uppercase() } }
}

private object LimeDirectTypeRefHelper {
    fun create(lambda: LimeLambda) = com.here.gluecodium.model.lime.LimeDirectTypeRef(lambda)
}
