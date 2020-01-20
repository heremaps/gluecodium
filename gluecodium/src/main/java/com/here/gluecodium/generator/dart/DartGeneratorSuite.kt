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
import com.here.gluecodium.generator.cpp.CppNameRules
import com.here.gluecodium.generator.ffi.FfiCppIncludeResolver
import com.here.gluecodium.generator.ffi.FfiCppNameResolver
import com.here.gluecodium.generator.ffi.FfiNameResolver
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeContainer
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeGenericType
import com.here.gluecodium.model.lime.LimeInterface
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
        val ffiResolvers = mapOf(
            "" to ffiNameResolver,
            "C++" to FfiCppNameResolver(limeModel.referenceMap, cppNameRules, internalNamespace)
        )
        val importResolver = DartImportResolver(nameRules, dartNameResolver)
        val includeResolver =
            FfiCppIncludeResolver(limeModel.referenceMap, cppNameRules, internalNamespace)
        val pathsCollector = mutableListOf<DartExport>()

        val allTypes = limeModel.topElements
            .filterIsInstance<LimeType>()
            .flatMap { LimeTypeHelper.getAllTypes(it) }
        val structs = allTypes.filterIsInstance<LimeStruct>().distinct()
        val enums = allTypes.filterIsInstance<LimeEnumeration>().distinct()
        val genericTypes = TypeRefsCollector.getAllTypeRefs(limeModel)
            .map { it.type }
            .filterIsInstance<LimeGenericType>()
            .distinctBy { ffiNameResolver.resolveName(it) }
            .sortedBy { ffiNameResolver.resolveName(it) }

        return limeModel.topElements.flatMap {
            listOfNotNull(
                generateDart(it, dartResolvers, dartNameResolver, importResolver, pathsCollector)
            ) + generateFfi(it, ffiResolvers, includeResolver)
        } + structs.flatMap {
            generateDartStructConversion(it, dartResolvers, dartNameResolver, importResolver)
        } + enums.flatMap {
            generateDartEnumConversion(it, dartResolvers, dartNameResolver, importResolver)
        } + generateDartGenericTypesConversion(genericTypes, dartResolvers, importResolver) +
            generateFfiGenericTypesConversion(genericTypes, ffiResolvers, includeResolver) +
            generateDartCommonFiles(pathsCollector) + generateFfiCommonFiles()
    }

    private fun generateDart(
        rootElement: LimeNamedElement,
        nameResolvers: Map<String, NameResolver>,
        dartNameResolver: DartNameResolver,
        importResolver: DartImportResolver,
        pathsCollector: MutableList<DartExport>
    ): GeneratedFile? {
        val contentTemplateName = selectTemplate(rootElement) ?: return null

        val functions = collectFunctions(rootElement)
        val properties = (rootElement as? LimeContainerWithInheritance)?.properties ?: emptyList()
        val imports = importResolver.resolveImports(rootElement) +
            functions.flatMap { collectTypeRefs(it) }.flatMap { importResolver.resolveImports(it) } +
            properties.flatMap { importResolver.resolveImports(it.typeRef) }

        val packagePath = rootElement.path.head.joinToString(separator = "/")
        val filePath = "$packagePath/${nameRules.getName(rootElement)}"
        val relativePath = "$SRC_DIR_SUFFIX/$filePath.dart"

        val allTypes = LimeTypeHelper.getAllTypes(rootElement).filterNot { it is LimeTypeAlias }
        val freeConstants = (rootElement as? LimeTypesCollection)?.constants ?: emptyList()
        val allSymbols = (allTypes + freeConstants).map { dartNameResolver.resolveName(it) }
        pathsCollector += DartExport(relativePath, allSymbols)

        val content = TemplateEngine.render(
            "dart/DartFile",
            mapOf(
                "imports" to imports.distinct().sorted().filterNot { it.filePath == filePath },
                "model" to rootElement,
                "contentTemplate" to contentTemplateName,
                "libraryName" to libraryName
            ),
            nameResolvers
        )

        return GeneratedFile(content, "$LIB_DIR/$relativePath")
    }

    private fun generateFfi(
        rootElement: LimeNamedElement,
        nameResolvers: Map<String, NameResolver>,
        includeResolver: FfiCppIncludeResolver
    ): List<GeneratedFile> {
        val limeType = rootElement as? LimeType ?: return emptyList()

        val functions = collectFunctions(limeType).sortedBy { it.fullName }
        val types = LimeTypeHelper.getAllTypes(limeType)
        val classes = types.filterIsInstance<LimeContainerWithInheritance>()
        val structs = types.filterIsInstance<LimeStruct>()

        val packagePath = rootElement.path.head.joinToString(separator = "_")
        val fileName = "ffi_${packagePath}_${nameRules.getName(rootElement)}"
        val includes = includeResolver.resolveIncludes(limeType) +
            functions.flatMap { collectTypeRefs(it) }.flatMap { includeResolver.resolveIncludes(it) } +
            structs.flatMap { it.fields }.map { it.typeRef }.flatMap { includeResolver.resolveIncludes(it) }

        val data = mapOf(
            "model" to rootElement,
            "classes" to classes,
            "structs" to structs,
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

    private fun generateDartCommonFiles(relativePaths: List<DartExport>): List<GeneratedFile> {
        val templateData = mapOf("libraryName" to libraryName, "files" to relativePaths)
        return listOf(
            GeneratedFile(
                TemplateEngine.render("dart/DartExports", templateData),
                "$LIB_DIR/$libraryName.dart"
            ),
            GeneratedFile(
                TemplateEngine.render("dart/DartLibraryInit", templateData),
                "$LIB_DIR/$SRC_DIR_SUFFIX/_library_init.dart"
            ),
            GeneratedFile(
                TemplateEngine.render("dart/DartBooleanConversion", templateData),
                "$LIB_DIR/$SRC_DIR_SUFFIX/Boolean__conversion.dart"
            ),
            GeneratedFile(
                TemplateEngine.render("dart/DartStringConversion", templateData),
                "$LIB_DIR/$SRC_DIR_SUFFIX/String__conversion.dart"
            ),
            GeneratedFile(
                TemplateEngine.render("dart/DartPubspec", templateData),
                "$ROOT_DIR/pubspec.yaml"
            )
        )
    }

    private fun generateFfiCommonFiles(): List<GeneratedFile> {
        val headerOnly = listOf("ConversionBase", "Export", "OpaqueHandle")
        val headerAndImpl = listOf("StringHandle")
        val data = mapOf(
            "opaqueHandleType" to OPAQUE_HANDLE_TYPE,
            "internalNamespace" to internalNamespace
        )

        return headerOnly.map {
            GeneratedFile(TemplateEngine.render("ffi/Ffi$it", data), "$FFI_DIR/$it.h")
        } + headerAndImpl.flatMap { listOf(
            GeneratedFile(TemplateEngine.render("ffi/Ffi${it}Header", data), "$FFI_DIR/$it.h"),
            GeneratedFile(TemplateEngine.render("ffi/Ffi${it}Impl", data), "$FFI_DIR/$it.cpp")
        ) }
    }

    private fun generateDartStructConversion(
        limeStruct: LimeStruct,
        nameResolvers: Map<String, NameResolver>,
        dartNameResolver: DartNameResolver,
        importResolver: DartImportResolver
    ): List<GeneratedFile> {
        val imports = importResolver.resolveImports(limeStruct) +
            limeStruct.fields.map { it.typeRef }.flatMap { importResolver.resolveImports(it) }

        val packagePath = limeStruct.path.head.joinToString(separator = "/")
        val filePath = "$packagePath/${dartNameResolver.resolveName(limeStruct)}"
        val relativePath = "$SRC_DIR_SUFFIX/${filePath}__conversion.dart"

        val content = TemplateEngine.render(
            "dart/DartStructConversion",
            mapOf(
                "imports" to imports.distinct().sorted().filterNot { it.filePath == filePath },
                "model" to limeStruct,
                "libraryName" to libraryName
            ),
            nameResolvers
        )

        return listOf(GeneratedFile(content, "$LIB_DIR/$relativePath"))
    }

    private fun generateDartEnumConversion(
        limeEnum: LimeEnumeration,
        nameResolvers: Map<String, NameResolver>,
        dartNameResolver: DartNameResolver,
        importResolver: DartImportResolver
    ): List<GeneratedFile> {
        val imports = importResolver.resolveImports(limeEnum)

        val packagePath = limeEnum.path.head.joinToString(separator = "/")
        val filePath = "$packagePath/${dartNameResolver.resolveName(limeEnum)}"
        val relativePath = "$SRC_DIR_SUFFIX/${filePath}__conversion.dart"

        val content = TemplateEngine.render(
            "dart/DartEnumConversion",
            mapOf(
                "imports" to imports.distinct().sorted().filterNot { it.filePath == filePath },
                "model" to limeEnum,
                "libraryName" to libraryName
            ),
            nameResolvers
        )

        return listOf(GeneratedFile(content, "$LIB_DIR/$relativePath"))
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
                "imports" to imports.distinct().sorted(),
                "genericTypes" to genericTypes,
                "libraryName" to libraryName
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
            is LimeTypeAlias -> null
            else -> throw GluecodiumExecutionException("Unsupported top-level element: " +
                    limeElement::class.java.name)
        }

    private fun collectFunctions(limeElement: LimeNamedElement): List<LimeFunction> =
        when (limeElement) {
            is LimeContainer ->
                limeElement.functions + limeElement.structs.flatMap { collectFunctions(it) }
            else -> emptyList()
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
