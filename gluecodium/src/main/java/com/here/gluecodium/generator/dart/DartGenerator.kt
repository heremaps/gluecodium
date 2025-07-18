/*
 * Copyright (C) 2016-2024 HERE Europe B.V.
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

package com.here.gluecodium.generator.dart

import com.here.gluecodium.cli.GluecodiumExecutionException
import com.here.gluecodium.common.LimeLogger
import com.here.gluecodium.common.LimeModelFilter
import com.here.gluecodium.common.LimeModelSkipPredicates
import com.here.gluecodium.common.LimeTypeRefsVisitor
import com.here.gluecodium.generator.common.CamelCaseNameResolver
import com.here.gluecodium.generator.common.CommentsProcessor
import com.here.gluecodium.generator.common.CommonGeneratorPredicates
import com.here.gluecodium.generator.common.GeneratedFile
import com.here.gluecodium.generator.common.GeneratedFile.SourceSet.COMMON
import com.here.gluecodium.generator.common.Generator
import com.here.gluecodium.generator.common.GeneratorOptions
import com.here.gluecodium.generator.common.GenericImportsCollector
import com.here.gluecodium.generator.common.GenericIncludesCollector
import com.here.gluecodium.generator.common.ImportsCollector
import com.here.gluecodium.generator.common.ImportsResolver
import com.here.gluecodium.generator.common.Include
import com.here.gluecodium.generator.common.NameResolver
import com.here.gluecodium.generator.common.NameRules
import com.here.gluecodium.generator.common.OptimizedListsCollector
import com.here.gluecodium.generator.common.ReferenceMapBasedResolver
import com.here.gluecodium.generator.common.nameRuleSetFromConfig
import com.here.gluecodium.generator.common.templates.TemplateEngine
import com.here.gluecodium.generator.cpp.CppNameRules
import com.here.gluecodium.generator.ffi.FfiCppIncludeResolver
import com.here.gluecodium.generator.ffi.FfiCppNameResolver
import com.here.gluecodium.generator.ffi.FfiCppParameterTypeNameResolver
import com.here.gluecodium.generator.ffi.FfiCppReturnTypeNameResolver
import com.here.gluecodium.generator.ffi.FfiNameResolver
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeType.DART
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeAttributes
import com.here.gluecodium.model.lime.LimeBasicType.TypeId
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeFieldConstructor
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeGenericType
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeProperty
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeTypeHelper
import com.here.gluecodium.model.lime.LimeTypeRef
import java.util.logging.Logger

internal class DartGenerator : Generator {
    private lateinit var libraryName: String
    private lateinit var lookupErrorMessage: String
    private lateinit var nameRules: NameRules
    private lateinit var cppNameRules: CppNameRules
    private lateinit var rootNamespace: List<String>
    private lateinit var internalNamespace: List<String>
    private lateinit var internalPrefix: String
    private lateinit var commentsProcessor: CommentsProcessor
    private lateinit var activeTags: Set<String>
    private var overloadsWerror: Boolean = false
    private var disableFinalizableMarker: Boolean = false

    override val shortName = "dart"

    override fun initialize(options: GeneratorOptions) {
        libraryName = options.libraryName
        lookupErrorMessage = options.dartLookupErrorMessage
        nameRules = NameRules(nameRuleSetFromConfig(options.dartNameRules))
        cppNameRules = CppNameRules(options.cppRootNamespace, nameRuleSetFromConfig(options.cppNameRules))
        rootNamespace = options.cppRootNamespace
        internalNamespace = options.cppInternalNamespace
        internalPrefix = options.internalPrefix ?: ""
        commentsProcessor = DartCommentsProcessor(options.werror.contains(GeneratorOptions.WARNING_DOC_LINKS))
        overloadsWerror = options.werror.contains(GeneratorOptions.WARNING_DART_OVERLOADS)
        disableFinalizableMarker = options.dartDisableFinalizableMarker
        activeTags = options.tags
    }

    override fun generate(limeModel: LimeModel): List<GeneratedFile> {
        val limeLogger = LimeLogger(logger, limeModel.fileNameMap)

        val ffiFilteredModel =
            LimeModelFilter.filter(limeModel) {
                LimeModelSkipPredicates.shouldRetainElement(it, activeTags, DART, retainFunctionsAndFields = true)
            }
        val visibilityResolver = VisibilityResolver(limeModel.referenceMap)
        val dartFilteredModel =
            LimeModelFilter.filter(limeModel) {
                !visibilityResolver.isSkippedByVisibility(it) &&
                    LimeModelSkipPredicates.shouldRetainElement(it, activeTags, DART, retainFunctionsAndFields = false)
            }

        val ffiReferenceMap = ffiFilteredModel.referenceMap.toMutableMap()
        val dartNameResolver = DartNameResolver(ffiReferenceMap, nameRules, limeLogger, commentsProcessor)
        val ffiNameResolver = FfiNameResolver(ffiReferenceMap, nameRules, internalPrefix)

        val overloadsValidationResult =
            DartOverloadsValidator(dartNameResolver, limeLogger, overloadsWerror)
                .validate(dartFilteredModel.referenceMap.values)
        val defaultValuesValidationResult =
            DartDefaultValuesValidator(limeLogger).validate(dartFilteredModel.referenceMap)
        if (!overloadsValidationResult || !defaultValuesValidationResult) {
            throw GluecodiumExecutionException("Validation errors found, see log for details.")
        }

        val generatorPredicates = DartGeneratorPredicates(dartFilteredModel.referenceMap, activeTags, dartNameResolver)
        val predicatesMap = generatorPredicates.predicates

        val dartResolvers =
            mapOf(
                "" to dartNameResolver,
                "Ffi" to CamelCaseNameResolver(ffiNameResolver),
                "FfiSnakeCase" to ffiNameResolver,
                "FfiApiTypes" to FfiApiTypeNameResolver(),
                "FfiDartTypes" to FfiDartTypeNameResolver(),
                "visibility" to DartVisibilityResolver(predicatesMap["isInternal"]!!),
            )
        val ffiCppNameResolver = FfiCppNameResolver(ffiReferenceMap, cppNameRules, rootNamespace, internalNamespace)
        val ffiResolvers =
            mapOf(
                "" to ffiNameResolver,
                "C++" to ffiCppNameResolver,
                "C++ parameter" to FfiCppParameterTypeNameResolver(ffiCppNameResolver),
                "C++ return type" to FfiCppReturnTypeNameResolver(internalNamespace, ffiCppNameResolver),
            )

        val descendantInterfaces = LimeTypeHelper.collectDescendantInterfaces(dartFilteredModel.topElements)
        val importResolver =
            DartImportResolver(dartFilteredModel.referenceMap, dartNameResolver, "$libraryName/$SRC_DIR_SUFFIX")
        val declarationImportResolver =
            DartDeclarationImportResolver(
                dartFilteredModel.referenceMap,
                dartNameResolver,
                "$libraryName/$SRC_DIR_SUFFIX",
                descendantInterfaces,
            )
        val importsCollector = DartImportsCollector(importResolver)
        val declarationImportsCollector = GenericImportsCollector(declarationImportResolver, collectOwnImports = true)

        val includeResolver = FfiCppIncludeResolver(ffiReferenceMap, cppNameRules, internalNamespace)
        val includeCollector =
            GenericIncludesCollector(
                includeResolver,
                retainPredicate = {
                    generatorPredicates.shouldRetain(it) ||
                        CommonGeneratorPredicates.needsImportsForSkippedField(it, DART, ffiReferenceMap)
                },
            )

        val exportsCollector = mutableMapOf<List<String>, MutableList<DartExport>>()
        val typeRepositoriesCollector = mutableListOf<LimeContainerWithInheritance>()

        val genericTypes =
            TypeRefsCollector.getAllTypeRefs(dartFilteredModel)
                .map { it.type }
                .filterIsInstance<LimeGenericType>()
                .distinctBy { ffiNameResolver.resolveName(it) }
                .sortedBy { ffiNameResolver.resolveName(it) }

        val asyncHelpers =
            dartFilteredModel.topElements
                .flatMap { DartAsyncHelpers.createAsyncHelpers(it, dartNameResolver) }
                .associateBy { it.pathKey }
        injectAsyncHelpers(ffiReferenceMap, asyncHelpers)

        val generatedFiles =
            dartFilteredModel.topElements.flatMap {
                listOf(
                    generateDart(
                        it, dartResolvers, dartNameResolver, listOf(importsCollector, declarationImportsCollector),
                        exportsCollector, typeRepositoriesCollector, predicatesMap, descendantInterfaces,
                        asyncHelpers[it.fullName],
                    ),
                )
            } +
                ffiFilteredModel.topElements.flatMap {
                    generateFfi(
                        it, ffiResolvers, includeResolver, includeCollector, ffiReferenceMap, activeTags,
                        asyncHelpers[it.fullName],
                    )
                } +
                generateDartGenericTypesConversion(genericTypes, importResolver, dartResolvers, predicatesMap) +
                generateFfiGenericTypesConversion(genericTypes, ffiResolvers, includeResolver) +
                generateDartCommonFiles(exportsCollector, typeRepositoriesCollector, dartResolvers, importResolver) +
                generateFfiCommonFiles(ffiResolvers)

        if (commentsProcessor.hasError) {
            throw GluecodiumExecutionException("Validation errors found, see log for details.")
        }

        return generatedFiles
    }

    private fun generateDart(
        rootElement: LimeNamedElement,
        nameResolvers: Map<String, NameResolver>,
        dartNameResolver: DartNameResolver,
        importCollectors: List<ImportsCollector<DartImport>>,
        exportsCollector: MutableMap<List<String>, MutableList<DartExport>>,
        typeRepositoriesCollector: MutableList<LimeContainerWithInheritance>,
        predicates: Map<String, (Any) -> Boolean>,
        descendantInterfaces: Map<String, List<LimeInterface>>,
        asyncHelpers: DartAsyncHelpers.AsyncHelpersGroup?,
    ): GeneratedFile {
        val contentTemplateName = selectTemplate(rootElement)

        val packagePath = rootElement.path.head.joinToString(separator = "/")
        val fileName = dartNameResolver.resolveFileName(rootElement)
        val filePath = "$packagePath/$fileName"
        val relativePath = "$SRC_DIR_SUFFIX/$filePath.dart"

        val isInternal = predicates["isInternal"]!!

        val allTypes = LimeTypeHelper.getAllTypes(rootElement)
        val nonExternalTypes = allTypes.filter { it.external?.dart == null }
        val allSymbols = nonExternalTypes.filterNot { isInternal(it) }
        if (allSymbols.isNotEmpty()) {
            val allNames = allSymbols.map { dartNameResolver.resolveName(it) }
            val testNames =
                allSymbols
                    .filter { CommonGeneratorPredicates.hasStaticFunctions(it) }
                    .map { dartNameResolver.resolveName(it) + "\$Impl" }
            exportsCollector
                .getOrPut(rootElement.path.head) { mutableListOf() }
                .add(DartExport(relativePath, (allNames + testNames).sorted()))
        }
        typeRepositoriesCollector += getTypeRepositories(allTypes)
        val optimizedLists = OptimizedListsCollector().getAllOptimizedLists(rootElement)

        val imports = importCollectors.flatMap { it.collectImports(rootElement) }
        val nonConversionImports = imports.filterNot { it.filePath.endsWith("__conversion") }
        val content =
            TemplateEngine.render(
                "dart/DartFile",
                mapOf(
                    "imports" to imports.distinct().sorted().filterNot { it.filePath.endsWith(filePath) },
                    "nonConversionImports" to nonConversionImports.distinct().sorted().filterNot { it.filePath.endsWith(filePath) },
                    "model" to rootElement,
                    "contentTemplate" to contentTemplateName,
                    "libraryName" to libraryName,
                    "optimizedLists" to optimizedLists,
                    "descendantInterfaces" to descendantInterfaces,
                    "asyncHelpers" to asyncHelpers,
                    "disableFinalizableMarker" to disableFinalizableMarker,
                ),
                nameResolvers,
                predicates,
            )

        return GeneratedFile(content, "$LIB_DIR/$relativePath")
    }

    private fun getTypeRepositories(allTypes: List<LimeType>) =
        allTypes.filterIsInstance<LimeInterface>() +
            allTypes.filterIsInstance<LimeClass>().filter { it.parents.isNotEmpty() || it.isOpen }

    private fun generateFfi(
        rootElement: LimeNamedElement,
        nameResolvers: Map<String, NameResolver>,
        includeResolver: ImportsResolver<Include>,
        includeCollector: ImportsCollector<Include>,
        limeReferenceMap: Map<String, LimeElement>,
        activeTags: Set<String>,
        asyncHelpers: DartAsyncHelpers.AsyncHelpersGroup?,
    ): List<GeneratedFile> {
        val limeType = rootElement as? LimeType
        if (limeType == null || limeType is LimeException) return emptyList()

        val types = LimeTypeHelper.getAllTypes(limeType)
        val lambdas = types.filterIsInstance<LimeLambda>()
        val interfaces = types.filterIsInstance<LimeInterface>()
        val classes = types.filterIsInstance<LimeClass>() + interfaces
        val enums = types.filterIsInstance<LimeEnumeration>()
        val structs = types.filterIsInstance<LimeStruct>()

        val packagePath = rootElement.path.head.joinToString(separator = "_")
        val fileName = "ffi_${packagePath}_${nameRules.getName(rootElement)}"
        val data =
            mapOf(
                "model" to rootElement,
                "libraryName" to libraryName,
                "classes" to classes,
                "enums" to enums,
                "interfaces" to interfaces,
                "lambdas" to lambdas,
                "typeRepositories" to getTypeRepositories(types),
                "structs" to structs,
                "internalNamespace" to internalNamespace,
                "headerName" to fileName,
                "includes" to includeCollector.collectImports(limeType).distinct().sorted(),
                "asyncHelpers" to asyncHelpers,
            )
        val predicates = DartGeneratorPredicates(limeReferenceMap, activeTags).predicates
        val headerContent = TemplateEngine.render("ffi/FfiHeader", data, nameResolvers, predicates)
        val implContent = TemplateEngine.render("ffi/FfiImplementation", data, nameResolvers, predicates)

        val optimizedLists = OptimizedListsCollector().getAllOptimizedLists(rootElement)

        return listOf(
            GeneratedFile(headerContent, "$FFI_DIR/$fileName.h"),
            GeneratedFile(implContent, "$FFI_DIR/$fileName.cpp"),
        ) +
            optimizedLists.keys.flatMap {
                generateOptimizedListFiles(limeReferenceMap[it], optimizedLists[it], fileName, nameResolvers, includeResolver, predicates)
            }
    }

    private fun generateOptimizedListFiles(
        limeElement: LimeElement?,
        lists: List<LimeList>?,
        fileNamePrefix: String,
        nameResolvers: Map<String, NameResolver>,
        includeResolver: ImportsResolver<Include>,
        predicates: Map<String, (Any) -> Boolean>,
    ): List<GeneratedFile> {
        if (limeElement !is LimeNamedElement || lists.isNullOrEmpty()) return emptyList()

        val containerData =
            mutableMapOf(
                "container" to limeElement,
                "internalNamespace" to internalNamespace,
                "libraryName" to libraryName,
            )
        return lists.flatMap {
            generateOptimizedListFile(it, fileNamePrefix, containerData, nameResolvers, includeResolver, predicates)
        }
    }

    private fun generateOptimizedListFile(
        limeList: LimeList,
        containerFileName: String,
        containerData: MutableMap<String, Any>,
        nameResolvers: Map<String, NameResolver>,
        includeResolver: ImportsResolver<Include>,
        predicates: Map<String, (Any) -> Boolean>,
    ): List<GeneratedFile> {
        val fileName = "${containerFileName}_${limeList.elementType.type.actualType.name}LazyList"

        containerData["listType"] = LimeDirectTypeRef(limeList, attributes = optimizedAttributes)
        containerData["elementType"] = limeList.elementType
        val headerFile =
            GeneratedFile(
                TemplateEngine.render("ffi/FfiLazyListHeader", containerData, nameResolvers, predicates),
                "$FFI_DIR/$fileName.h",
            )

        val implIncludes =
            includeResolver.resolveElementImports(limeList.elementType) + Include.createInternalInclude("$fileName.h")
        containerData["includes"] = implIncludes.distinct().sorted()

        val implFile =
            GeneratedFile(
                TemplateEngine.render("ffi/FfiLazyListImpl", containerData, nameResolvers, predicates),
                "$FFI_DIR/$fileName.cpp",
            )

        return listOf(headerFile, implFile)
    }

    private fun generateDartCommonFiles(
        exports: Map<List<String>, List<DartExport>>,
        typeRepositories: List<LimeContainerWithInheritance>,
        nameResolvers: Map<String, NameResolver>,
        importResolver: DartImportResolver,
    ): List<GeneratedFile> {
        val exportFiles =
            exports.map {
                GeneratedFile(
                    TemplateEngine.render("dart/DartExports", mapOf("files" to it.value.sorted()), nameResolvers),
                    "$LIB_DIR/${it.key.joinToString(".")}.dart",
                )
            }
        val templateData =
            mapOf(
                "libraryName" to libraryName,
                "lookupErrorMessage" to lookupErrorMessage,
                "builtInTypes" to TypeId.values().subtract(customNullableTypes),
                "typeRepositories" to typeRepositories.sortedBy { it.fullName },
                "disableFinalizableMarker" to disableFinalizableMarker,
                "imports" to
                    typeRepositories.flatMap { importResolver.resolveElementImports(it) }.distinct().sorted(),
            )
        return exportFiles +
            listOf(
                GeneratedFile(
                    TemplateEngine.render("dart/DartLibraryContextExport", templateData, nameResolvers),
                    "$LIB_DIR/${libraryName}_context.dart",
                    COMMON,
                ),
                GeneratedFile(
                    TemplateEngine.render("dart/DartLibraryContext", templateData, nameResolvers),
                    "$LIB_DIR/$SRC_DIR_SUFFIX/_library_context.dart",
                    COMMON,
                ),
                GeneratedFile(
                    TemplateEngine.render("dart/DartLazyList", templateData, nameResolvers),
                    "$LIB_DIR/$SRC_DIR_SUFFIX/_lazy_list.dart",
                    COMMON,
                ),
                GeneratedFile(
                    TemplateEngine.render("dart/DartNativeBase", templateData, nameResolvers),
                    "$LIB_DIR/$SRC_DIR_SUFFIX/_native_base.dart",
                    COMMON,
                ),
                GeneratedFile(
                    TemplateEngine.render("dart/DartPubspec", templateData, nameResolvers),
                    "$ROOT_DIR/pubspec.yaml",
                    COMMON,
                ),
                GeneratedFile(
                    TemplateEngine.render("dart/DartBuiltInTypesConversion", templateData, nameResolvers),
                    "$LIB_DIR/$SRC_DIR_SUFFIX/builtin_types__conversion.dart",
                    COMMON,
                ),
                GeneratedFile(
                    TemplateEngine.render("dart/DartTypeRepository", templateData, nameResolvers),
                    "$LIB_DIR/$SRC_DIR_SUFFIX/_type_repository.dart",
                    COMMON,
                ),
                GeneratedFile(
                    TemplateEngine.render("dart/DartTokenCache", templateData, nameResolvers),
                    "$LIB_DIR/$SRC_DIR_SUFFIX/_token_cache.dart",
                    COMMON,
                ),
            )
    }

    private fun generateFfiCommonFiles(nameResolvers: Map<String, NameResolver>): List<GeneratedFile> {
        val headerOnly = listOf("ConversionBase", "Export", "OpaqueHandle")
        val headerAndImpl =
            listOf(
                "BlobHandle",
                "CallbacksQueue",
                "CallbacksHandle",
                "DartDLInit",
                "InstanceCache",
                "IsolateContext",
                "FinalizerData",
                "LocaleHandle",
                "NullableHandles",
                "ProxyCache",
                "StringHandle",
            )
        val data =
            mapOf(
                "libraryName" to libraryName,
                "opaqueHandleType" to OPAQUE_HANDLE_TYPE,
                "internalNamespace" to internalNamespace,
                "builtInTypes" to TypeId.values().subtract(customNullableTypes),
            )

        return headerOnly.map {
            GeneratedFile(
                TemplateEngine.render("ffi/Ffi$it", data, nameResolvers),
                "$FFI_DIR/$it.h",
                COMMON,
            )
        } +
            headerAndImpl.flatMap {
                listOf(
                    GeneratedFile(
                        TemplateEngine.render("ffi/Ffi${it}Header", data, nameResolvers),
                        "$FFI_DIR/$it.h",
                        COMMON,
                    ),
                    GeneratedFile(
                        TemplateEngine.render("ffi/Ffi${it}Impl", data, nameResolvers),
                        "$FFI_DIR/$it.cpp",
                        COMMON,
                    ),
                )
            }
    }

    private fun generateDartGenericTypesConversion(
        genericTypes: List<LimeGenericType>,
        importResolver: DartImportResolver,
        nameResolvers: Map<String, NameResolver>,
        predicates: Map<String, (Any) -> Boolean>,
    ): GeneratedFile {
        val elementTypeRefs =
            genericTypes.filterIsInstance<LimeList>().map { it.elementType } +
                genericTypes.filterIsInstance<LimeSet>().map { it.elementType } +
                genericTypes.filterIsInstance<LimeMap>().flatMap { listOf(it.keyType, it.valueType) }
        val imports = (genericTypes + elementTypeRefs).flatMap { importResolver.resolveElementImports(it) }

        val fileName = "$SRC_DIR_SUFFIX/generic_types__conversion"
        val content =
            TemplateEngine.render(
                "dart/DartGenericTypesConversion",
                mapOf(
                    "libraryName" to libraryName,
                    "internalPrefix" to internalPrefix,
                    "imports" to imports.distinct().sorted().filterNot { it.filePath.endsWith(fileName) },
                    "genericTypes" to genericTypes,
                ),
                nameResolvers,
                predicates,
            )

        return GeneratedFile(content, "$LIB_DIR/$fileName.dart")
    }

    private fun generateFfiGenericTypesConversion(
        genericTypes: List<LimeGenericType>,
        nameResolvers: Map<String, NameResolver>,
        includeResolver: FfiCppIncludeResolver,
    ): List<GeneratedFile> {
        val includes = genericTypes.flatMap { includeResolver.resolveElementImports(it) }

        val fileName = "GenericTypesConversion"
        val data =
            mapOf(
                "libraryName" to libraryName,
                "internalPrefix" to internalPrefix,
                "genericTypes" to genericTypes,
                "internalNamespace" to internalNamespace,
                "headerName" to fileName,
                "includes" to includes.distinct().sorted(),
            )
        val headerContent = TemplateEngine.render("ffi/FfiGenericTypesHeader", data, nameResolvers)
        val implContent = TemplateEngine.render("ffi/FfiGenericTypesImpl", data, nameResolvers)

        return listOf(
            GeneratedFile(headerContent, "$FFI_DIR/$fileName.h"),
            GeneratedFile(implContent, "$FFI_DIR/$fileName.cpp"),
        )
    }

    private fun selectTemplate(limeElement: LimeNamedElement) =
        when (limeElement) {
            is LimeClass -> "dart/DartClass"
            is LimeInterface -> "dart/DartInterface"
            is LimeStruct -> "dart/DartStruct"
            is LimeEnumeration -> "dart/DartEnumeration"
            is LimeException -> "dart/DartException"
            is LimeLambda -> "dart/DartLambda"
            is LimeTypeAlias -> "dart/DartTypeAlias"
            else -> throw GluecodiumExecutionException(
                "Unsupported top-level element: " +
                    limeElement::class.java.name,
            )
        }

    private fun injectAsyncHelpers(
        referenceMap: MutableMap<String, LimeElement>,
        asyncHelpers: Map<String, DartAsyncHelpers.AsyncHelpersGroup>,
    ) {
        val lambdas = asyncHelpers.values.map { it.lambdas }.flatten()
        referenceMap += lambdas.associateBy { it.fullName }
        referenceMap += lambdas.associateBy { it.path.toAmbiguousString() }

        val helpers = asyncHelpers.values.map { it.helpers.values }.flatten()
        referenceMap += helpers.associateBy { it.fullName }
        referenceMap += helpers.associateBy { it.path.toAmbiguousString() }
    }

    private object TypeRefsCollector : LimeTypeRefsVisitor<List<LimeTypeRef>>() {
        override fun visitTypeRef(
            parentElement: LimeNamedElement,
            limeTypeRef: LimeTypeRef?,
        ): List<LimeTypeRef> =
            listOfNotNull(limeTypeRef) +
                when (val limeType = limeTypeRef?.type?.actualType) {
                    is LimeList -> visitTypeRef(parentElement, limeType.elementType)
                    is LimeSet -> visitTypeRef(parentElement, limeType.elementType)
                    is LimeMap ->
                        visitTypeRef(parentElement, limeType.keyType) +
                            visitTypeRef(parentElement, limeType.valueType)
                    else -> emptyList()
                }

        fun getAllTypeRefs(limeModel: LimeModel): List<LimeTypeRef> {
            val allElements = limeModel.referenceMap.values.filterIsInstance<LimeNamedElement>()
            return traverseModel(allElements).flatten()
        }
    }

    private class VisibilityResolver(referenceMap: Map<String, LimeElement>) : ReferenceMapBasedResolver(referenceMap) {
        fun isSkippedByVisibility(limeElement: LimeNamedElement) =
            when {
                limeElement !is LimeFunction && limeElement !is LimeProperty && limeElement !is LimeFieldConstructor ->
                    false
                limeElement.attributes.have(DART, LimeAttributeValueType.PUBLIC) -> false
                else -> CommonGeneratorPredicates.isInternal(limeElement, DART)
            }
    }

    companion object {
        private val logger = Logger.getLogger(DartGenerator::class.java.name)
        private const val ROOT_DIR = "dart"
        private const val LIB_DIR = "$ROOT_DIR/lib"
        private const val SRC_DIR_SUFFIX = "src"
        private const val FFI_DIR = "$ROOT_DIR/ffi"
        private const val OPAQUE_HANDLE_TYPE = "void*"

        private val optimizedAttributes = LimeAttributes.Builder().addAttribute(LimeAttributeType.OPTIMIZED).build()
        private val customNullableTypes = setOf(TypeId.VOID, TypeId.DATE, TypeId.DURATION)
    }
}
