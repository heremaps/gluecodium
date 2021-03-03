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
import com.here.gluecodium.generator.common.GeneratedFile.SourceSet.COMMON
import com.here.gluecodium.generator.common.GeneratedFile.SourceSet.MAIN
import com.here.gluecodium.generator.common.Generator
import java.io.File

/**
 * Cache for split common/main source set. It detects if one is nested inside the other and only creates one cache in that case
 */
class SplitSourceSetCache(
    private val outputDir: String,
    private val commonOutputDir: String,
    private val isEnableCaching: Boolean
) {
    // Cache for the main source set, can be null if main directory is nested inside common
    private var mainCacheStrategy: CachingStrategy? = null
    // Cache for common code, can be null if common code resides inside main directory
    private var commonCacheStrategy: CachingStrategy? = null
    // Subdirectory of the nested source set in case it is nested
    private var prefix: String = ""

    init {
        val mainDir = File(outputDir).canonicalPath + File.separator
        val commonDir = File(commonOutputDir).canonicalPath + File.separator

        when {
            mainDir == commonDir -> initMain()
            mainDir.startsWith(commonDir) -> {
                prefix = mainDir.removePrefix(commonDir)
                initCommon()
            }
            commonDir.startsWith(mainDir) -> {
                prefix = commonDir.removePrefix(mainDir)
                initMain()
            }
            else -> {
                initCommon()
                initMain()
            }
        }
    }

    private fun initMain() {
        mainCacheStrategy = CachingStrategyCreator.initializeCaching(
            isEnableCaching,
            outputDir,
            Generator.allGeneratorShortNames
        )
    }

    private fun initCommon() {
        commonCacheStrategy = CachingStrategyCreator.initializeCaching(
            isEnableCaching,
            commonOutputDir,
            Generator.allGeneratorShortNames
        )
    }

    fun write(executionSucceeded: Boolean): Boolean {
        val success = mainCacheStrategy?.write(executionSucceeded) ?: true
        return commonCacheStrategy?.write(executionSucceeded) ?: true && success
    }

    fun updateCache(generatorName: String, files: List<GeneratedFile>) =
        when {
            mainCacheStrategy == null -> unprefix(
                commonCacheStrategy?.updateCache(
                    generatorName,
                    prefix(files, MAIN)
                ),
                MAIN
            )
            commonCacheStrategy == null -> unprefix(
                mainCacheStrategy?.updateCache(
                    generatorName,
                    prefix(files, COMMON)
                ),
                COMMON
            )
            else -> {
                val mainFiles = files.filter { it.sourceSet == MAIN }
                val commonFiles = files.filter { it.sourceSet == COMMON }
                (
                    commonCacheStrategy?.updateCache(generatorName, commonFiles)
                        ?: emptyList()
                    ) + (
                    mainCacheStrategy?.updateCache(generatorName, mainFiles)
                        ?: emptyList()
                    )
            }
        } ?: emptyList()

    private fun prefix(files: List<GeneratedFile>, sourceSet: GeneratedFile.SourceSet) =
        files.map {
            if (it.sourceSet == sourceSet)
                GeneratedFile(it.content, prefix + it.targetFile, it.sourceSet)
            else it
        }

    private fun unprefix(files: List<GeneratedFile>?, sourceSet: GeneratedFile.SourceSet) =
        files?.map {
            if (it.sourceSet == sourceSet)
                GeneratedFile(it.content, it.targetFile.path.removePrefix(prefix), it.sourceSet)
            else it
        }
}
