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

package com.here.genium.generator.cbridge

import com.google.common.annotations.VisibleForTesting
import com.here.genium.common.FrancaSignatureResolver
import com.here.genium.generator.cbridge.CBridgeNameRules.BASE_HANDLE_IMPL_FILE
import com.here.genium.generator.cbridge.CBridgeNameRules.CBRIDGE_PUBLIC
import com.here.genium.generator.cbridge.CBridgeNameRules.INCLUDE_DIR
import com.here.genium.generator.cbridge.CBridgeNameRules.SRC_DIR
import com.here.genium.generator.common.GeneratedFile
import com.here.genium.generator.common.modelbuilder.FrancaTreeWalker
import com.here.genium.generator.common.templates.TemplateEngine
import com.here.genium.generator.cpp.CppModelBuilder
import com.here.genium.generator.cpp.CppNameResolver
import com.here.genium.generator.cpp.CppTypeMapper
import com.here.genium.generator.cpp.CppValueMapper
import com.here.genium.generator.swift.SwiftModelBuilder
import com.here.genium.generator.swift.SwiftTypeMapper
import com.here.genium.model.cbridge.CBridgeIncludeResolver
import com.here.genium.model.cbridge.CInterface
import com.here.genium.model.common.Include
import com.here.genium.model.cpp.CppIncludeResolver
import com.here.genium.model.franca.FrancaDeploymentModel
import com.here.genium.platform.common.GeneratorSuite
import org.franca.core.franca.FTypeCollection
import java.nio.file.Paths

class CBridgeGenerator(
    private val deploymentModel: FrancaDeploymentModel,
    private val cppIncludeResolver: CppIncludeResolver,
    private val includeResolver: CBridgeIncludeResolver,
    private val cppNameResolver: CppNameResolver,
    private val internalNamespace: List<String>
) {
    private val signatureResolver: FrancaSignatureResolver
    private val swiftTypeMapper: SwiftTypeMapper
    val arrayGenerator: CArrayGenerator

    init {
        this.signatureResolver = FrancaSignatureResolver()
        this.swiftTypeMapper = SwiftTypeMapper(deploymentModel)
        this.arrayGenerator = CArrayGenerator(internalNamespace)
    }

    fun generate(francaTypeCollection: FTypeCollection): List<GeneratedFile> {
        val cModel = buildCBridgeModel(francaTypeCollection)
        return listOf(
            GeneratedFile(
                generateHeaderContent(cModel),
                includeResolver.getHeaderFileNameWithPath(francaTypeCollection)
            ),
            GeneratedFile(
                generateImplementationContent(cModel),
                includeResolver.getImplementationFileNameWithPath(francaTypeCollection)
            )
        ).filterNot { it.content.isEmpty() }
    }

    fun generateHelpers() =
        listOf(
            generateHelperContent("BaseHandleImpl", BASE_HANDLE_IMPL_FILE),
            generateHelperContent(
                "StringHandle", Paths.get(CBRIDGE_PUBLIC, SRC_DIR, "StringHandle.cpp").toString()
            ),
            generateHelperContent(
                "BuiltinHandle", Paths.get(CBRIDGE_PUBLIC, SRC_DIR, "BuildintHandle.cpp").toString()
            )
        )

    private fun generateHelperContent(template: String, path: String) =
        GeneratedFile(TemplateEngine.render("cbridge/$template", internalNamespace), path)

    fun buildCBridgeModel(francaTypeCollection: FTypeCollection): CInterface {

        val cppTypeMapper =
            CppTypeMapper(cppIncludeResolver, cppNameResolver, internalNamespace, deploymentModel)
        val valueMapper = CppValueMapper(deploymentModel, cppNameResolver)
        val cppBuilder =
            CppModelBuilder(deploymentModel, cppTypeMapper, valueMapper, cppNameResolver)
        val swiftBuilder = SwiftModelBuilder(deploymentModel, signatureResolver, swiftTypeMapper)
        val typeMapper = CBridgeTypeMapper(
            cppIncludeResolver,
            cppNameResolver,
            includeResolver,
            cppTypeMapper.enumHashType.name,
            cppTypeMapper.byteBufferType.name
        )

        val modelBuilder = CBridgeModelBuilder(
            deploymentModel,
            cppIncludeResolver,
            includeResolver,
            cppBuilder,
            swiftBuilder,
            typeMapper,
            internalNamespace
        )
        val treeWalker = FrancaTreeWalker(listOf(cppBuilder, swiftBuilder, modelBuilder))

        treeWalker.walkTree(francaTypeCollection)
        val cModel = modelBuilder.getFinalResult(CInterface::class.java)

        removeRedundantIncludes(francaTypeCollection, cModel!!)
        arrayGenerator.collect(modelBuilder.arraysCollector)

        return cModel
    }

    private fun removeRedundantIncludes(francaTypeCollection: FTypeCollection, cModel: CInterface) {
        cModel.headerIncludes.remove(
            Include.createInternalInclude(
                includeResolver.getHeaderFileNameWithPath(francaTypeCollection)
            )
        )
        cModel.implementationIncludes.removeAll(cModel.headerIncludes)
        cModel.privateHeaderIncludes.removeAll(cModel.headerIncludes)
    }

    companion object {
        val STATIC_FILES = listOf(
            GeneratorSuite.copyTarget(CBridgeNameRules.BASE_HANDLE_FILE, ""),
            GeneratorSuite.copyTarget(CBridgeNameRules.STRING_HANDLE_FILE, ""),
            GeneratorSuite.copyTarget(CBridgeNameRules.EXPORT_FILE, ""),
            GeneratorSuite.copyTarget(
                Paths.get(CBRIDGE_PUBLIC, INCLUDE_DIR, "BuiltinHandle.h").toString(), ""
            ),
            GeneratorSuite.copyTarget(
                Paths.get(CBRIDGE_PUBLIC, INCLUDE_DIR, "ByteArrayHandle.h").toString(), ""
            ),
            GeneratorSuite.copyTarget(
                Paths.get(CBRIDGE_PUBLIC, SRC_DIR, "ByteArrayHandle.cpp").toString(), ""
            ),
            GeneratorSuite.copyTarget(CBridgeComponents.PROXY_CACHE_FILENAME, "")
        )

        @VisibleForTesting
        fun generateHeaderContent(model: CInterface) =
            TemplateEngine.render("cbridge/Header", model)

        @VisibleForTesting
        fun generateImplementationContent(model: CInterface) =
            TemplateEngine.render("cbridge/Implementation", model)
    }
}
