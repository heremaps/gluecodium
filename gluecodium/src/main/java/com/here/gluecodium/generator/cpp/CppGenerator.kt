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

package com.here.gluecodium.generator.cpp

import com.here.gluecodium.generator.common.GeneratedFile
import com.here.gluecodium.generator.common.GeneratedFile.SourceSet.COMMON
import com.here.gluecodium.generator.common.templates.TemplateEngine
import com.here.gluecodium.model.common.Include
import com.here.gluecodium.model.cpp.CppConstant
import com.here.gluecodium.model.cpp.CppExternableElement
import com.here.gluecodium.model.cpp.CppFile
import com.here.gluecodium.model.cpp.CppUsing
import java.nio.file.Paths

class CppGenerator(private val pathPrefix: String, private val internalNamespace: List<String>) {

    fun generateCode(cppModel: CppFile): List<GeneratedFile> {

        val hasConstants = cppModel.members.any { it is CppConstant }
        val hasTypedefs = cppModel.members.any { it is CppUsing }
        val externableElements = cppModel.members.filterIsInstance<CppExternableElement>()
        val hasErrorEnums = cppModel.errorEnums.isNotEmpty()

        val needsHeader =
            hasConstants || hasErrorEnums || hasTypedefs || externableElements.any { !it.isExternal }
        val needsImplementation = needsHeader || externableElements.isNotEmpty()
        if (!needsHeader && !needsImplementation) {
            return emptyList()
        }

        val result = mutableListOf<GeneratedFile>()
        if (needsHeader) {
            val absoluteHeaderPath = Paths.get(
                pathPrefix,
                PACKAGE_NAME_SPECIFIER_INCLUDE,
                cppModel.filename
            ).toString() + HEADER_FILE_SUFFIX

            // Filter out self-includes
            cppModel.includes.removeIf { it.fileName == cppModel.filename + HEADER_FILE_SUFFIX }

            val headerContent = TemplateEngine.render("cpp/CppHeader", cppModel)
            result.add(GeneratedFile(headerContent, absoluteHeaderPath))

            cppModel.implementationIncludes +=
                Include.createInternalInclude(cppModel.filename + HEADER_FILE_SUFFIX)
        }
        if (needsImplementation) {
            val absoluteImplPath = Paths.get(
                pathPrefix,
                PACKAGE_NAME_SPECIFIER_SRC,
                cppModel.filename
            ).toString() + IMPLEMENTATION_FILE_SUFFIX

            val externalElements = externableElements.filter { it.isExternal }
            if (externalElements.isNotEmpty()) {
                cppModel.implementationIncludes += CppLibraryIncludes.TYPE_TRAITS
                cppModel.implementationIncludes += externalElements.flatMap { it.includes }
            }

            val implementationContent = TemplateEngine.render("cpp/CppImplementation", cppModel)
            result.add(GeneratedFile(implementationContent, absoluteImplPath))
        }

        return result
    }

    fun generateHelperImpl(fileName: String, extraInfo: Any): GeneratedFile {
        val content = TemplateEngine.render("cpp/$fileName", extraInfo)
        val resultFileName = Paths.get(
            pathPrefix,
            PACKAGE_NAME_SPECIFIER_SRC,
            internalNamespace.joinToString("/"),
            fileName
        ).toString() + IMPLEMENTATION_FILE_SUFFIX
        return GeneratedFile(content, resultFileName, COMMON)
    }

    fun generateHelperHeader(headerName: String, extraInfo: Any): GeneratedFile {
        val content = TemplateEngine.render("cpp/$headerName", extraInfo)
        val resultFileName = Paths.get(
            pathPrefix,
            PACKAGE_NAME_SPECIFIER_INCLUDE,
            internalNamespace.joinToString("/"),
            headerName
        ).toString() + HEADER_FILE_SUFFIX
        return GeneratedFile(content, resultFileName, COMMON)
    }

    companion object {
        const val HEADER_FILE_SUFFIX = ".h"
        private const val IMPLEMENTATION_FILE_SUFFIX = ".cpp"
        private const val PACKAGE_NAME_SPECIFIER_INCLUDE = "include"
        private const val PACKAGE_NAME_SPECIFIER_SRC = "src"
    }
}
