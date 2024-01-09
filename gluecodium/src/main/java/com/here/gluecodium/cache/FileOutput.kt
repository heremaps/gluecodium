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

package com.here.gluecodium.cache

import com.here.gluecodium.generator.common.GeneratedFile
import java.io.BufferedWriter
import java.io.File
import java.io.FileNotFoundException
import java.io.FileWriter
import java.io.IOException
import java.nio.file.Files
import java.nio.file.Paths
import java.util.logging.Logger

/** Write the generated files to disk. */
internal class FileOutput
    @Throws(IOException::class)
    constructor(private val rootPath: File) {
        init {
            if (!rootPath.exists() && !rootPath.mkdir()) {
                throw FileNotFoundException(rootPath.path + " (Can't create output directory)")
            }
        }

        @Throws(IOException::class)
        fun output(files: List<GeneratedFile>) = files.forEach { output(it) }

        @Throws(IOException::class)
        fun output(file: GeneratedFile) {
            val targetFile = File(rootPath, file.targetFile.path)
            LOGGER.fine("Writing $targetFile")

            val path = Paths.get(targetFile.parent)
            if (Files.notExists(path)) {
                Files.createDirectories(path)
            }

            BufferedWriter(FileWriter(targetFile)).apply {
                write(file.content)
                close()
            }
        }

        companion object {
            private val LOGGER = Logger.getLogger(FileOutput::class.java.name)
        }
    }
