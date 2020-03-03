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

import com.here.gluecodium.Gluecodium
import com.here.gluecodium.cli.GluecodiumExecutionException
import com.here.gluecodium.common.LimeTypeRefsVisitor
import com.here.gluecodium.generator.common.GeneratedFile
import com.here.gluecodium.generator.common.NameResolver
import com.here.gluecodium.generator.common.NameRules
import com.here.gluecodium.generator.common.nameRuleSetFromConfig
import com.here.gluecodium.generator.common.templates.TemplateEngine
import com.here.gluecodium.generator.cpp.CppLibraryIncludes
import com.here.gluecodium.generator.cpp.CppNameRules
import com.here.gluecodium.generator.ffi.FfiCppIncludeResolver
import com.here.gluecodium.generator.ffi.FfiCppNameResolver
import com.here.gluecodium.generator.ffi.FfiCppParameterTypeNameResolver
import com.here.gluecodium.generator.ffi.FfiCppReturnTypeNameResolver
import com.here.gluecodium.generator.ffi.FfiNameResolver
import com.here.gluecodium.model.common.Include
import com.here.gluecodium.model.lime.LimeAttributeType.CPP
import com.here.gluecodium.model.lime.LimeAttributeValueType.EXTERNAL_TYPE
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeContainer
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeGenericType
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeTypeHelper
import com.here.gluecodium.model.lime.LimeTypeRef
import com.here.gluecodium.model.lime.LimeTypesCollection
import com.here.gluecodium.platform.common.GeneratorSuite

class DartGeneratorSuite(options: Gluecodium.Options) : GeneratorSuite() {

    private val libraryName = options.libraryName
    private val nameRules = NameRules(nameRuleSetFromConfig(options.dartNameRules))
    private val cppNameRules =
        CppNameRules(options.cppRootNamespace, nameRuleSetFromConfig(options.cppNameRules))
    private val rootNamespace = options.cppRootNamespace
    private val internalNamespace = options.cppInternalNamespace

    override fun generate(limeModel: LimeModel): List<GeneratedFile> {
        val dartNameResolver = DartNameResolver(limeModel.referenceMap, nameRules)
        val ffiNameResolver = FfiNameResolver(limeModel.referenceMap, nameRules)

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
        val includeResolver =
            FfiCppIncludeResolver(limeModel.referenceMap, cppNameRules, internalNamespace)
        val exportsCollector = mutableListOf<DartExport>()
        val typeRepositoriesCollector = mutableListOf<LimeContainerWithInheritance>()

        val genericTypes = TypeRefsCollector.getAllTypeRefs(limeModel)
            .map { it.type }
            .filterIsInstance<LimeGenericType>()
            .distinctBy { ffiNameResolver.resolveName(it) }
            .sortedBy { ffiNameResolver.resolveName(it) }

        return limeModel.topElements.flatMap {
            listOfNotNull(generateDart(it, dartResolvers, dartNameResolver, importResolver,
                exportsCollector, typeRepositoriesCollector)) + generateFfi(it, ffiResolvers, includeResolver)
        } + generateDartGenericTypesConversion(genericTypes, dartResolvers, importResolver) +
            generateFfiGenericTypesConversion(genericTypes, ffiResolvers, includeResolver) +
            generateDartCommonFiles(exportsCollector, typeRepositoriesCollector, dartResolvers, importResolver) +
            generateFfiCommonFiles(ffiResolvers)
    }

    private fun generateDart(
        rootElement: LimeNamedElement,
        nameResolvers: Map<String, NameResolver>,
        dartNameResolver: DartNameResolver,
        importResolver: DartImportResolver,
        exportsCollector: MutableList<DartExport>,
        typeRepositoriesCollector: MutableList<LimeContainerWithInheritance>
    ): GeneratedFile? {
        val contentTemplateName = selectTemplate(rootElement) ?: return null

        val packagePath = rootElement.path.head.joinToString(separator = "/")
        val filePath = "$packagePath/${dartNameResolver.resolveName(rootElement)}"
        val relativePath = "$SRC_DIR_SUFFIX/$filePath.dart"

        val allTypes = LimeTypeHelper.getAllTypes(rootElement).filterNot { it is LimeTypeAlias }
        val freeConstants = (rootElement as? LimeTypesCollection)?.constants ?: emptyList()
        val allSymbols = (allTypes + freeConstants)
            .filterNot { it.visibility.isInternal }
            .map { dartNameResolver.resolveName(it) }
        exportsCollector += DartExport(relativePath, allSymbols)
        typeRepositoriesCollector += getTypeRepositories(allTypes)

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
                "libraryName" to libraryName
            ),
            nameResolvers
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
            classes
                .filter { it.parent?.type?.actualType is LimeInterface }
                .flatMap { it.inheritedFunctions }
        val properties = classes.flatMap { it.properties }
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
        includeResolver: FfiCppIncludeResolver
    ): List<GeneratedFile> {
        val limeType = rootElement as? LimeType
        if (limeType == null || limeType is LimeException) return emptyList()

        val types = LimeTypeHelper.getAllTypes(limeType)
        val lambdas = types.filterIsInstance<LimeLambda>()
        val interfaces = types.filterIsInstance<LimeInterface>()
        val classes = types.filterIsInstance<LimeClass>() + interfaces
        val enums = types.filterIsInstance<LimeEnumeration>()

        val structs = types.filterIsInstance<LimeStruct>()
        val externalTypes = types.filter { it.attributes.have(CPP, EXTERNAL_TYPE) }
        val externalStructs = externalTypes.filterIsInstance<LimeStruct>() +
            externalTypes.filterIsInstance<LimeContainer>().flatMap { it.structs }
        val nonExternalStructs = structs - externalStructs

        val functions = types.filterIsInstance<LimeContainer>().flatMap { it.functions } +
            lambdas.map { it.asFunction() }
        val includes = includeResolver.resolveIncludes(limeType) +
            functions.flatMap { collectTypeRefs(it) }.flatMap { includeResolver.resolveIncludes(it) } +
            structs.flatMap { includeResolver.resolveIncludes(it) } +
            structs.flatMap { it.fields }.map { it.typeRef }.flatMap { includeResolver.resolveIncludes(it) } +
            enums.flatMap { includeResolver.resolveIncludes(it) } +
            resolveThrownTypeIncludes(types)

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

        return listOf(
            GeneratedFile(headerContent, "$FFI_DIR/$fileName.h"),
            GeneratedFile(implContent, "$FFI_DIR/$fileName.cpp")
        )
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

    private fun generateDartCommonFiles(
        relativePaths: List<DartExport>,
        typeRepositories: List<LimeContainerWithInheritance>,
        nameResolvers: Map<String, NameResolver>,
        importResolver: DartImportResolver
    ): List<GeneratedFile> {
        val templateData = mapOf(
            "libraryName" to libraryName,
            "files" to relativePaths,
            "builtInTypes" to
                LimeBasicType.TypeId.values().filterNot { it == LimeBasicType.TypeId.VOID },
            "typeRepositories" to typeRepositories,
            "imports" to
                typeRepositories.flatMap { importResolver.resolveImports(it) }.distinct().sorted()
        )
        return listOf(
            GeneratedFile(
                TemplateEngine.render("dart/DartExports", templateData, nameResolvers),
                "$LIB_DIR/$libraryName.dart"
            ),
            GeneratedFile(
                TemplateEngine.render("dart/DartLibraryInit", templateData, nameResolvers),
                "$LIB_DIR/$SRC_DIR_SUFFIX/_library_init.dart"
            ),
            GeneratedFile(
                TemplateEngine.render("dart/DartPubspec", templateData, nameResolvers),
                "$ROOT_DIR/pubspec.yaml"
            ),
            GeneratedFile(
                TemplateEngine.render("dart/DartBuiltInTypesConversion", templateData, nameResolvers),
                "$LIB_DIR/$SRC_DIR_SUFFIX/BuiltInTypes__conversion.dart"
            ),
            GeneratedFile(
                TemplateEngine.render("dart/DartTypeRepository", templateData, nameResolvers),
                "$LIB_DIR/$SRC_DIR_SUFFIX/_type_repository.dart"
            ),
            GeneratedFile(
                TemplateEngine.render("dart/DartTokenCache", templateData, nameResolvers),
                "$LIB_DIR/$SRC_DIR_SUFFIX/_token_cache.dart"
            )
        )
    }

    private fun generateFfiCommonFiles(
        nameResolvers: Map<String, NameResolver>
    ): List<GeneratedFile> {
        val headerOnly = listOf("ConversionBase", "Export", "OpaqueHandle")
        val headerAndImpl = listOf("StringHandle", "BlobHandle", "NullableHandles")
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
                "$FFI_DIR/$it.h"
            )
        } + headerAndImpl.flatMap { listOf(
            GeneratedFile(
                TemplateEngine.render("ffi/Ffi${it}Header", data, nameResolvers),
                "$FFI_DIR/$it.h"
            ),
            GeneratedFile(
                TemplateEngine.render("ffi/Ffi${it}Impl", data, nameResolvers),
                "$FFI_DIR/$it.cpp"
            )
        ) }
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
                "imports" to imports.distinct().sorted(),
                "genericTypes" to genericTypes
            ),
            nameResolvers
        )

        return GeneratedFile(content, "$LIB_DIR/$SRC_DIR_SUFFIX/GenericTypes__conversion.dart")
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
            else -> throw GluecodiumExecutionException("Unsupported top-level element: " +
                    limeElement::class.java.name)
        }

    private fun collectTypeRefs(limeFunction: LimeFunction) =
        limeFunction.parameters.map { it.typeRef } +
            limeFunction.returnType.typeRef +
            listOfNotNull(limeFunction.exception?.errorType)

    override val name = "com.here.DartGenerator"

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

        fun getAllTypeRefs(limeModel: LimeModel) = traverseModel(limeModel).flatten()
    }

    companion object {
        const val GENERATOR_NAME = "dart"
        private const val ROOT_DIR = GENERATOR_NAME
        private const val LIB_DIR = "$ROOT_DIR/lib"
        private const val SRC_DIR_SUFFIX = "src"
        private const val FFI_DIR = "$ROOT_DIR/ffi"
        private const val OPAQUE_HANDLE_TYPE = "void*"
    }
}
