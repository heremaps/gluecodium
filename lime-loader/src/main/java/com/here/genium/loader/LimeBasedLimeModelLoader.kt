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

package com.here.genium.loader

import com.here.genium.antlr.LimeLexer
import com.here.genium.antlr.LimeParser
import com.here.genium.model.lime.LimeContainer
import com.here.genium.model.lime.LimeModel
import com.here.genium.model.lime.LimeModelLoader
import com.here.genium.model.lime.LimeReferenceResolver
import org.antlr.v4.runtime.CharStreams
import org.antlr.v4.runtime.CommonTokenStream
import org.antlr.v4.runtime.misc.ParseCancellationException
import org.antlr.v4.runtime.tree.ParseTreeWalker
import java.io.File
import java.util.logging.Logger

internal object LimeBasedLimeModelLoader : LimeModelLoader {
    private val logger = Logger.getLogger(LimeBasedLimeModelLoader::class.java.name)

    override fun loadModel(fileNames: List<String>): LimeModel {
        val referenceResolver = AntlrLimeReferenceResolver()
        val containerLists = fileNames
            .flatMap { listFilesRecursively(it) }
            .map { loadFile(it, referenceResolver) }

        if (containerLists.any { it == null }) {
            throw LimeLoadingException("Syntax errors found, see log for details.")
        }

        return LimeModel(referenceResolver.referenceMap, containerLists.filterNotNull().flatten())
    }

    private fun loadFile(
        fileName: String,
        referenceResolver: LimeReferenceResolver
    ): List<LimeContainer>? {
        val lexer = LimeLexer(CharStreams.fromFileName(fileName))
        val parser = LimeParser(CommonTokenStream(lexer))
        parser.removeErrorListeners()
        parser.addErrorListener(ThrowingErrorListener)

        val modelBuilder = AntlrLimeModelBuilder(referenceResolver)
        try {
            ParseTreeWalker.DEFAULT.walk(modelBuilder, parser.limeFile())
        } catch (e: ParseCancellationException) {
            logger.severe("File $fileName, ${e.message}")
            return null
        }

        return modelBuilder.finalResults.filterIsInstance<LimeContainer>()
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
            file.isFile && file.name.endsWith(".lime") -> listOf(file.absolutePath)
            file.isDirectory ->
                file.listFiles()
                    ?.toList()
                    ?.flatMap { listFilesRecursively(it.absolutePath) }
                    ?: emptyList()
            else -> emptyList()
        }
    }
}

fun LimeModelLoader.Companion.getLoader(): LimeModelLoader = LimeBasedLimeModelLoader
