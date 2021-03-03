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

import java.io.File
import java.io.FileNotFoundException
import java.io.IOException
import java.nio.file.Files
import java.nio.file.Path
import java.util.logging.Logger

internal class FileRemove(private val rootDir: File?) {

    @Throws(FileNotFoundException::class)
    fun removeFiles(absolutePaths: List<Path>?): Boolean {
        if (rootDir?.exists() == false || rootDir?.isDirectory == false) {
            throw FileNotFoundException(
                "Accessing root directory '" + rootDir.path + "' failed"
            )
        }

        absolutePaths?.forEach {
            try {
                // only remove regular files located below root dir
                if (Files.isRegularFile(it) && it.toFile().canonicalPath
                    .startsWith(rootDir?.canonicalPath + File.separator)
                ) {
                    Files.delete(it)
                }
            } catch (e: IOException) {
                LOGGER.severe("deletion of '$it' failed")
                return false
            }
        }
        return true
    }

    companion object {
        private val LOGGER = Logger.getLogger(FileRemove::class.java.name)
    }
}
