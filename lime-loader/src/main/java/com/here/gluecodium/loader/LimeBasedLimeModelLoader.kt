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

package com.here.gluecodium.loader

import com.here.gluecodium.antlr.LimeLexer
import com.here.gluecodium.antlr.LimeParser
import com.here.gluecodium.common.LimeLogger
import com.here.gluecodium.model.lime.LimeComment
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeModelLoader
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimeReferenceResolver
import com.here.gluecodium.validator.LimeImportsValidator
import org.antlr.v4.runtime.CharStreams
import org.antlr.v4.runtime.CommonTokenStream
import org.antlr.v4.runtime.misc.ParseCancellationException
import org.antlr.v4.runtime.tree.ParseTreeWalker
import java.io.File
import java.util.logging.Logger

class LimeBasedLimeModelLoader : LimeModelLoader {
    private val logger = Logger.getLogger(LimeBasedLimeModelLoader::class.java.name)

    override fun loadModel(
        idlSources: List<String>,
        auxiliaryIdlSources: List<String>,
        docsPlaceholders: Map<String, String>,
    ): LimeModel {
        val resolvedIdlSources = idlSources.flatMap { listFilesRecursively(it) }.toSet()
        val resolvedAuxSources = auxiliaryIdlSources.flatMap { listFilesRecursively(it) }.toSet()
        val commentPlaceholders = parsePlaceholders(docsPlaceholders)

        val referenceResolver = AntlrLimeReferenceResolver()
        val elementNameToFileName = mutableMapOf<String, String>()
        val fileNameToImports = mutableMapOf<String, List<LimePath>>()
        val loadedElements =
            (resolvedIdlSources + resolvedAuxSources)
                .map { fileName ->
                    loadFile(fileName, referenceResolver, fileNameToImports, commentPlaceholders)
                        ?.onEach { elementNameToFileName[it.fullName] = fileName }
                }

        if (loadedElements.any { it == null }) {
            throw LimeLoadingException("Syntax errors found, see log for details.")
        }

        val excludedIdlFiles = resolvedAuxSources - resolvedIdlSources
        val filteredElements =
            loadedElements.filterNotNull().flatten()
                .groupBy { excludedIdlFiles.contains(elementNameToFileName[it.fullName]) }
        val limeModel =
            LimeModel(
                referenceResolver.referenceMap,
                filteredElements[false] ?: emptyList(),
                filteredElements[true] ?: emptyList(),
                elementNameToFileName,
            )
        validateModel(limeModel, fileNameToImports)

        return limeModel
    }

    private fun parsePlaceholders(docsPlaceholders: Map<String, String>): Map<String, LimeComment> {
        return docsPlaceholders.map {
            try {
                it.key to AntlrLimeConverter.parseStructuredComment(it.value).description
            } catch (e: ParseCancellationException) {
                throw LimeLoadingException("Could not parse placeholder: ${it.key} = '${it.value}'")
            }
        }.toMap()
    }

    private fun validateModel(
        limeModel: LimeModel,
        fileNameToImports: Map<String, List<LimePath>>,
    ) {
        val limeLogger = LimeLogger(logger, limeModel.fileNameMap)
        val validationResult =
            LimeImportsValidator(limeLogger).validate(limeModel, fileNameToImports)
        if (!validationResult) {
            throw LimeLoadingException("Validation errors found, see log for details.")
        }
    }

    private fun loadFile(
        fileName: String,
        referenceResolver: LimeReferenceResolver,
        fileNameToImports: MutableMap<String, List<LimePath>>,
        commentPlaceholders: Map<String, LimeComment>,
    ): List<LimeNamedElement>? {
        val errorListener = ThrowingErrorListener()

        val lexer = LimeLexer(CharStreams.fromFileName(fileName))
        lexer.removeErrorListeners()
        lexer.addErrorListener(errorListener)

        val parser = LimeParser(CommonTokenStream(lexer))
        parser.removeErrorListeners()
        parser.addErrorListener(errorListener)

        val modelBuilder = AntlrLimeModelBuilder(referenceResolver, commentPlaceholders)
        return try {
            ParseTreeWalker.DEFAULT.walk(modelBuilder, parser.limeFile())
            fileNameToImports[fileName] = modelBuilder.collectedImports
            modelBuilder.finalResults
        } catch (e: ParseCancellationException) {
            logger.severe("File $fileName, ${e.message}")
            null
        }
    }

    private fun listFilesRecursively(filePath: String): List<String> {
        val normalizedPath =
            when {
                filePath.startsWith("~" + File.separator) ->
                    System.getProperty("user.home") + filePath.substring(1)
                else -> filePath
            }
        val file = File(normalizedPath)
        return when {
            file.isDirectory ->
                file.listFiles()
                    ?.toList()
                    ?.flatMap { listFilesRecursively(it.absolutePath) }
                    ?: emptyList()
            file.name.endsWith(".lime") -> listOf(file.absolutePath)
            else -> emptyList()
        }
    }
}
