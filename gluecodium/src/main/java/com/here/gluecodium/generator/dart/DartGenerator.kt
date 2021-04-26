/*
 * Copyright (C) 2016-2019 HERE Europe B.V.
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
import com.here.gluecodium.common.LimeTypeRefsVisitor
import com.here.gluecodium.generator.common.CommentsProcessor
import com.here.gluecodium.generator.common.CommonGeneratorPredicates
import com.here.gluecodium.generator.common.GeneratedFile
import com.here.gluecodium.generator.common.GeneratedFile.SourceSet.COMMON
import com.here.gluecodium.generator.common.Generator
import com.here.gluecodium.generator.common.GeneratorOptions
import com.here.gluecodium.generator.common.Include
import com.here.gluecodium.generator.common.NameResolver
import com.here.gluecodium.generator.common.NameRules
import com.here.gluecodium.generator.common.OptimizedListsCollector
import com.here.gluecodium.generator.common.nameRuleSetFromConfig
import com.here.gluecodium.generator.common.templates.TemplateEngine
import com.here.gluecodium.generator.cpp.CppLibraryIncludes
import com.here.gluecodium.generator.cpp.CppNameRules
import com.here.gluecodium.generator.ffi.FfiCppIncludeResolver
import com.here.gluecodium.generator.ffi.FfiCppNameResolver
import com.here.gluecodium.generator.ffi.FfiCppParameterTypeNameResolver
import com.here.gluecodium.generator.ffi.FfiCppReturnTypeNameResolver
import com.here.gluecodium.generator.ffi.FfiNameResolver
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeType.DART
import com.here.gluecodium.model.lime.LimeAttributeValueType.SKIP
import com.here.gluecodium.model.lime.LimeAttributes
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeContainer
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeExternalDescriptor.Companion.CONVERTER_NAME
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
import com.here.gluecodium.model.lime.LimeTypesCollection
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
    private var overloadsWerror: Boolean = false
    private var testableMode: Boolean = false

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
        testableMode = options.generateStubs
    }

    override fun generate(limeModel: LimeModel): List<GeneratedFile> {
        val limeLogger = LimeLogger(logger, limeModel.fileNameMap)
        val dartNameResolver =
            DartNameResolver(limeModel.referenceMap, nameRules, limeLogger, commentsProcessor)
        val ffiNameResolver = FfiNameResolver(limeModel.referenceMap, nameRules, internalPrefix)

        val ffiFilteredModel = LimeModelFilter.filter(limeModel) {
            it is LimeFunction || it is LimeProperty || !it.attributes.have(DART, SKIP)
        }
        val dartFilteredElements = LimeModelFilter.filter(limeModel) { !it.attributes.have(DART, SKIP) }.topElements
        val validationResult = DartOverloadsValidator(dartNameResolver, limeLogger, overloadsWerror)
            .validate(dartFilteredElements)
        if (!validationResult) {
            throw GluecodiumExecutionException("Validation errors found, see log for details.")
        }

        val dartResolvers = mapOf(
            "" to dartNameResolver,
            "Ffi" to ffiNameResolver,
            "FfiApiTypes" to FfiApiTypeNameResolver(),
            "FfiDartTypes" to FfiDartTypeNameResolver()
        )
        val ffiCppNameResolver = FfiCppNameResolver(
            limeModel.referenceMap,
            cppNameRules,
            rootNamespace,
            internalNamespace
        )
        val ffiResolvers = mapOf(
            "" to ffiNameResolver,
            "C++" to ffiCppNameResolver,
            "C++ parameter" to FfiCppParameterTypeNameResolver(ffiCppNameResolver),
            "C++ return type" to FfiCppReturnTypeNameResolver(internalNamespace, ffiCppNameResolver)
        )
        val importResolver = DartImportResolver(
            limeModel.referenceMap,
            dartNameResolver,
            "$libraryName/$SRC_DIR_SUFFIX"
        )
        val includeResolver = FfiCppIncludeResolver(limeModel.referenceMap, cppNameRules, internalNamespace)
        val exportsCollector = mutableMapOf<List<String>, MutableList<DartExport>>()
        val typeRepositoriesCollector = mutableListOf<LimeContainerWithInheritance>()

        val genericTypes = TypeRefsCollector.getAllTypeRefs(limeModel)
            .map { it.type }
            .filterIsInstance<LimeGenericType>()
            .distinctBy { ffiNameResolver.resolveName(it) }
            .sortedBy { ffiNameResolver.resolveName(it) }

        val generatedFiles = dartFilteredElements.flatMap {
            listOfNotNull(
                generateDart(
                    it, dartResolvers, dartNameResolver, importResolver,
                    exportsCollector, typeRepositoriesCollector
                )
            )
        } + ffiFilteredModel.topElements.flatMap {
            generateFfi(it, ffiResolvers, includeResolver, ffiFilteredModel.referenceMap)
        } +
            generateDartGenericTypesConversion(genericTypes, dartResolvers, importResolver) +
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
        importResolver: DartImportResolver,
        exportsCollector: MutableMap<List<String>, MutableList<DartExport>>,
        typeRepositoriesCollector: MutableList<LimeContainerWithInheritance>
    ): GeneratedFile? {
        val contentTemplateName = selectTemplate(rootElement) ?: return null

        val packagePath = rootElement.path.head.joinToString(separator = "/")
        val fileName = importResolver.resolveFileName(rootElement)
        val filePath = "$packagePath/$fileName"
        val relativePath = "$SRC_DIR_SUFFIX/$filePath.dart"

        val allTypes = LimeTypeHelper.getAllTypes(rootElement).filterNot { it is LimeTypeAlias }
        val freeConstants = (rootElement as? LimeTypesCollection)?.constants ?: emptyList()
        val nonExternalTypes = allTypes.filter { it.external?.dart == null }
        val allSymbols = (nonExternalTypes + freeConstants)
            .filterNot { it.visibility.isInternal }
            .map { dartNameResolver.resolveName(it) }
        if (allSymbols.isNotEmpty()) {
            exportsCollector
                .getOrPut(rootElement.path.head, { mutableListOf() })
                .add(DartExport(relativePath, allSymbols))
        }
        typeRepositoriesCollector += getTypeRepositories(allTypes)
        val optimizedLists = OptimizedListsCollector().getAllOptimizedLists(rootElement)

        val parentImports = (rootElement as? LimeContainerWithInheritance)?.parent
            ?.let { importResolver.resolveImports(it) } ?: emptyList()
        val imports = allTypes.flatMap { importResolver.resolveDeclarationImports(it) } +
            collectReferenceImports(allTypes, importResolver) + parentImports
        val content = TemplateEngine.render(
            "dart/DartFile",
            mapOf(
                "imports" to imports.distinct().sorted().filterNot { it.filePath.endsWith(filePath) },
                "model" to rootElement,
                "contentTemplate" to contentTemplateName,
                "libraryName" to libraryName,
                "testableMode" to testableMode,
                "optimizedLists" to optimizedLists
            ),
            nameResolvers,
            predicates
        )

        return GeneratedFile(content, "$LIB_DIR/$relativePath")
    }

    private fun getTypeRepositories(allTypes: List<LimeType>) =
        allTypes.filterIsInstance<LimeInterface>() +
            allTypes.filterIsInstance<LimeClass>().filter { it.parent != null || it.visibility.isOpen }

    private fun collectReferenceImports(
        allTypes: List<LimeType>,
        importResolver: DartImportResolver
    ): List<DartImport> {
        val classes = allTypes.filterIsInstance<LimeContainerWithInheritance>()
        val functions = allTypes.filterIsInstance<LimeContainer>().flatMap { it.functions } +
            classes.flatMap { it.inheritedFunctions }
        val properties = classes.flatMap { it.properties + it.inheritedProperties }
        val lambdas = allTypes.filterIsInstance<LimeLambda>()
        val exceptions = allTypes.filterIsInstance<LimeException>()
        val structs = allTypes.filterIsInstance<LimeStruct>()
        val typeRefs = structs.flatMap { it.fields + it.constants }.map { it.typeRef } +
            functions.flatMap { collectTypeRefs(it) } + properties.map { it.typeRef } +
            lambdas.flatMap { collectTypeRefs(it.asFunction()) } +
            exceptions.map { it.errorType }

        return functions.mapNotNull { it.exception }.flatMap { importResolver.resolveImports(it) } +
            typeRefs.flatMap { importResolver.resolveImports(it) }
    }

    private fun generateFfi(
        rootElement: LimeNamedElement,
        nameResolvers: Map<String, NameResolver>,
        includeResolver: FfiCppIncludeResolver,
        limeReferenceMap: Map<String, LimeElement>
    ): List<GeneratedFile> {
        val limeType = rootElement as? LimeType
        if (limeType == null || limeType is LimeException) return emptyList()

        val types = LimeTypeHelper.getAllTypes(limeType)
        val lambdas = types.filterIsInstance<LimeLambda>()
        val interfaces = types.filterIsInstance<LimeInterface>()
        val classes = types.filterIsInstance<LimeClass>() + interfaces
        val enums = types.filterIsInstance<LimeEnumeration>()

        val structs = types.filterIsInstance<LimeStruct>()
        val externalTypes = types.filter { it.external?.cpp != null }
        val externalStructs = externalTypes.filterIsInstance<LimeStruct>() +
            externalTypes.filterIsInstance<LimeContainer>().flatMap { it.structs }
        val nonExternalStructs = structs - externalStructs

        val containers = types.filterIsInstance<LimeContainer>()
        val functions = containers.flatMap { it.functions } + lambdas.map { it.asFunction() } +
            containers.flatMap { it.properties }.flatMap { listOfNotNull(it.getter, it.setter) }

        val includes = includeResolver.resolveIncludes(limeType) +
            functions.flatMap { collectTypeRefs(it) }.flatMap { includeResolver.resolveIncludes(it) } +
            structs.flatMap { includeResolver.resolveIncludes(it) } +
            structs.flatMap { it.fields }.map { it.typeRef }.flatMap { includeResolver.resolveIncludes(it) } +
            enums.flatMap { includeResolver.resolveIncludes(it) } +
            resolveThrownTypeIncludes(types) + resolveProxyIncludes(types) +
            listOfNotNull(
                isolateContextInclude.takeIf { functions.isNotEmpty() },
                includeResolver.typeRepositoryInclude.takeIf {
                    containers.any { CommonGeneratorPredicates.hasTypeRepository(it) }
                }
            )

        val packagePath = rootElement.path.head.joinToString(separator = "_")
        val fileName = "ffi_${packagePath}_${nameRules.getName(rootElement)}"
        val data = mapOf(
            "model" to rootElement,
            "libraryName" to libraryName,
            "classes" to classes,
            "enums" to enums,
            "interfaces" to interfaces,
            "lambdas" to lambdas,
            "typeRepositories" to getTypeRepositories(types),
            "externalStructs" to externalStructs,
            "nonExternalStructs" to nonExternalStructs,
            "internalNamespace" to internalNamespace,
            "headerName" to fileName,
            "includes" to includes.distinct().sorted()
        )
        val headerContent = TemplateEngine.render("ffi/FfiHeader", data, nameResolvers)
        val implContent = TemplateEngine.render("ffi/FfiImplementation", data, nameResolvers)

        val optimizedLists = OptimizedListsCollector().getAllOptimizedLists(rootElement)

        return listOf(
            GeneratedFile(headerContent, "$FFI_DIR/$fileName.h"),
            GeneratedFile(implContent, "$FFI_DIR/$fileName.cpp")
        ) + optimizedLists.keys.flatMap {
            generateOptimizedListFiles(limeReferenceMap[it], optimizedLists[it], fileName, nameResolvers, includeResolver)
        }
    }

    private fun generateOptimizedListFiles(
        limeElement: LimeElement?,
        lists: List<LimeList>?,
        fileNamePrefix: String,
        nameResolvers: Map<String, NameResolver>,
        includeResolver: FfiCppIncludeResolver
    ): List<GeneratedFile> {
        if (limeElement !is LimeNamedElement || lists.isNullOrEmpty()) return emptyList()

        val containerData = mutableMapOf(
            "container" to limeElement,
            "internalNamespace" to internalNamespace,
            "libraryName" to libraryName
        )
        return lists.flatMap { generateOptimizedListFile(it, fileNamePrefix, containerData, nameResolvers, includeResolver) }
    }

    private fun generateOptimizedListFile(
        limeList: LimeList,
        containerFileName: String,
        containerData: MutableMap<String, Any>,
        nameResolvers: Map<String, NameResolver>,
        includeResolver: FfiCppIncludeResolver
    ): List<GeneratedFile> {
        val fileName = "${containerFileName}_${limeList.elementType.type.actualType.name}LazyList"

        containerData["listType"] = LimeDirectTypeRef(limeList, attributes = optimizedAttributes)
        containerData["elementType"] = limeList.elementType
        val headerFile = GeneratedFile(
            TemplateEngine.render("ffi/FfiLazyListHeader", containerData, nameResolvers, predicates),
            "$FFI_DIR/$fileName.h"
        )

        val implIncludes =
            includeResolver.resolveIncludes(limeList.elementType) + Include.createInternalInclude("$fileName.h")
        containerData["includes"] = implIncludes.distinct().sorted()

        val implFile = GeneratedFile(
            TemplateEngine.render("ffi/FfiLazyListImpl", containerData, nameResolvers, predicates),
            "$FFI_DIR/$fileName.cpp"
        )

        return listOf(headerFile, implFile)
    }

    private fun resolveThrownTypeIncludes(types: List<LimeType>): List<Include> {
        val exceptionEnums = types.filterIsInstance<LimeInterface>()
            .flatMap { it.functions }
            .mapNotNull { it.exception?.errorType?.type?.actualType }
            .filterIsInstance<LimeEnumeration>()
        return when {
            exceptionEnums.isNotEmpty() -> listOf(CppLibraryIncludes.SYSTEM_ERROR)
            else -> emptyList()
        }
    }

    private fun resolveProxyIncludes(types: List<LimeType>): List<Include> {
        val proxiedTypes =
            types.filterIsInstance<LimeInterface>() + types.filterIsInstance<LimeLambda>()
        return when {
            proxiedTypes.isNotEmpty() -> listOf(
                Include.createInternalInclude("CallbacksQueue.h"),
                Include.createInternalInclude("ProxyCache.h")
            )
            else -> emptyList()
        }
    }

    private fun generateDartCommonFiles(
        exports: Map<List<String>, List<DartExport>>,
        typeRepositories: List<LimeContainerWithInheritance>,
        nameResolvers: Map<String, NameResolver>,
        importResolver: DartImportResolver
    ): List<GeneratedFile> {
        val exportFiles = exports.map {
            GeneratedFile(
                TemplateEngine.render("dart/DartExports", mapOf("files" to it.value), nameResolvers),
                "$LIB_DIR/${it.key.joinToString(".")}.dart"
            )
        }
        val templateData = mapOf(
            "libraryName" to libraryName,
            "lookupErrorMessage" to lookupErrorMessage,
            "builtInTypes" to
                LimeBasicType.TypeId.values().filterNot { it == LimeBasicType.TypeId.VOID },
            "typeRepositories" to typeRepositories.sortedBy { it.fullName },
            "imports" to
                typeRepositories.flatMap { importResolver.resolveImports(it) }.distinct().sorted()
        )
        return exportFiles + listOf(
            GeneratedFile(
                TemplateEngine.render("dart/DartLibraryContextExport", templateData, nameResolvers),
                "$LIB_DIR/${libraryName}_context.dart",
                COMMON
            ),
            GeneratedFile(
                TemplateEngine.render("dart/DartLibraryContext", templateData, nameResolvers),
                "$LIB_DIR/$SRC_DIR_SUFFIX/_library_context.dart",
                COMMON
            ),
            GeneratedFile(
                TemplateEngine.render("dart/DartLazyList", templateData, nameResolvers),
                "$LIB_DIR/$SRC_DIR_SUFFIX/_lazy_list.dart",
                COMMON
            ),
            GeneratedFile(
                TemplateEngine.render("dart/DartPubspec", templateData, nameResolvers),
                "$ROOT_DIR/pubspec.yaml",
                COMMON
            ),
            GeneratedFile(
                TemplateEngine.render("dart/DartBuiltInTypesConversion", templateData, nameResolvers),
                "$LIB_DIR/$SRC_DIR_SUFFIX/builtin_types__conversion.dart",
                COMMON
            ),
            GeneratedFile(
                TemplateEngine.render("dart/DartTypeRepository", templateData, nameResolvers),
                "$LIB_DIR/$SRC_DIR_SUFFIX/_type_repository.dart",
                COMMON
            ),
            GeneratedFile(
                TemplateEngine.render("dart/DartTokenCache", templateData, nameResolvers),
                "$LIB_DIR/$SRC_DIR_SUFFIX/_token_cache.dart",
                COMMON
            )
        )
    }

    private fun generateFfiCommonFiles(
        nameResolvers: Map<String, NameResolver>
    ): List<GeneratedFile> {
        val headerOnly = listOf("ConversionBase", "Export", "OpaqueHandle")
        val headerAndImpl = listOf(
            "BlobHandle",
            "CallbacksQueue",
            "CallbacksHandle",
            "IsolateContext",
            "LocaleHandle",
            "NullableHandles",
            "ProxyCache",
            "ReverseCache",
            "StringHandle"
        )
        val data = mapOf(
            "libraryName" to libraryName,
            "opaqueHandleType" to OPAQUE_HANDLE_TYPE,
            "internalNamespace" to internalNamespace,
            "builtInTypes" to
                LimeBasicType.TypeId.values().filterNot { it == LimeBasicType.TypeId.VOID }
        )

        return headerOnly.map {
            GeneratedFile(
                TemplateEngine.render("ffi/Ffi$it", data, nameResolvers),
                "$FFI_DIR/$it.h",
                COMMON
            )
        } + headerAndImpl.flatMap {
            listOf(
                GeneratedFile(
                    TemplateEngine.render("ffi/Ffi${it}Header", data, nameResolvers),
                    "$FFI_DIR/$it.h",
                    COMMON
                ),
                GeneratedFile(
                    TemplateEngine.render("ffi/Ffi${it}Impl", data, nameResolvers),
                    "$FFI_DIR/$it.cpp",
                    COMMON
                )
            )
        }
    }

    private fun generateDartGenericTypesConversion(
        genericTypes: List<LimeGenericType>,
        nameResolvers: Map<String, NameResolver>,
        importResolver: DartImportResolver
    ): GeneratedFile {
        val imports = genericTypes.flatMap { importResolver.resolveImports(it) }

        val content = TemplateEngine.render(
            "dart/DartGenericTypesConversion",
            mapOf(
                "libraryName" to libraryName,
                "internalPrefix" to internalPrefix,
                "imports" to imports.distinct().sorted(),
                "genericTypes" to genericTypes
            ),
            nameResolvers
        )

        return GeneratedFile(content, "$LIB_DIR/$SRC_DIR_SUFFIX/generic_types__conversion.dart")
    }

    private fun generateFfiGenericTypesConversion(
        genericTypes: List<LimeGenericType>,
        nameResolvers: Map<String, NameResolver>,
        includeResolver: FfiCppIncludeResolver
    ): List<GeneratedFile> {
        val includes = genericTypes.flatMap { includeResolver.resolveIncludes(it) }

        val fileName = "GenericTypesConversion"
        val data = mapOf(
            "libraryName" to libraryName,
            "internalPrefix" to internalPrefix,
            "genericTypes" to genericTypes,
            "internalNamespace" to internalNamespace,
            "headerName" to fileName,
            "includes" to includes.distinct().sorted()
        )
        val headerContent = TemplateEngine.render("ffi/FfiGenericTypesHeader", data, nameResolvers)
        val implContent = TemplateEngine.render("ffi/FfiGenericTypesImpl", data, nameResolvers)

        return listOf(
            GeneratedFile(headerContent, "$FFI_DIR/$fileName.h"),
            GeneratedFile(implContent, "$FFI_DIR/$fileName.cpp")
        )
    }

    private fun selectTemplate(limeElement: LimeNamedElement) =
        when (limeElement) {
            is LimeTypesCollection -> "dart/DartTypes"
            is LimeClass -> "dart/DartClass"
            is LimeInterface -> "dart/DartInterface"
            is LimeStruct -> "dart/DartStruct"
            is LimeEnumeration -> "dart/DartEnumeration"
            is LimeException -> "dart/DartException"
            is LimeLambda -> "dart/DartLambda"
            is LimeTypeAlias -> null
            else -> throw GluecodiumExecutionException(
                "Unsupported top-level element: " +
                    limeElement::class.java.name
            )
        }

    private fun collectTypeRefs(limeFunction: LimeFunction) =
        limeFunction.parameters.map { it.typeRef } +
            limeFunction.returnType.typeRef +
            listOfNotNull(limeFunction.exception?.errorType)

    private object TypeRefsCollector : LimeTypeRefsVisitor<List<LimeTypeRef>>() {
        override fun visitTypeRef(
            parentElement: LimeNamedElement,
            limeTypeRef: LimeTypeRef?
        ): List<LimeTypeRef> =
            listOfNotNull(limeTypeRef) + when (val limeType = limeTypeRef?.type?.actualType) {
                is LimeList -> visitTypeRef(parentElement, limeType.elementType)
                is LimeSet -> visitTypeRef(parentElement, limeType.elementType)
                is LimeMap -> visitTypeRef(parentElement, limeType.keyType) +
                    visitTypeRef(parentElement, limeType.valueType)
                else -> emptyList()
            }

        fun getAllTypeRefs(limeModel: LimeModel): List<LimeTypeRef> {
            val allElements = limeModel.referenceMap.values
                .filterIsInstance<LimeNamedElement>()
                .filterNot { isSkipped(it, limeModel) }
            return traverseModel(allElements).flatten()
        }

        private fun isSkipped(element: LimeNamedElement, limeModel: LimeModel) =
            generateSequence(element) {
                when {
                    it.path.hasParent -> limeModel.referenceMap[it.path.parent.toString()] as? LimeNamedElement
                    else -> null
                }
            }.any { it.attributes.have(DART, SKIP) }
    }

    companion object {
        private val logger = Logger.getLogger(DartGenerator::class.java.name)
        private const val ROOT_DIR = "dart"
        private const val LIB_DIR = "$ROOT_DIR/lib"
        private const val SRC_DIR_SUFFIX = "src"
        private const val FFI_DIR = "$ROOT_DIR/ffi"
        private const val OPAQUE_HANDLE_TYPE = "void*"

        private val isolateContextInclude = Include.createInternalInclude("IsolateContext.h")
        private val optimizedAttributes = LimeAttributes.Builder().addAttribute(LimeAttributeType.OPTIMIZED).build()

        private val predicates = mapOf(
            "skipDeclaration" to { limeType: Any ->
                limeType is LimeType && skipDeclaration(limeType)
            }
        )

        private fun skipDeclaration(limeType: LimeType) = limeType.external?.dart != null &&
            limeType.external?.dart?.get(CONVERTER_NAME) == null
    }
}
