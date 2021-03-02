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

package com.here.gluecodium.generator.common

import com.here.gluecodium.Gluecodium
import com.here.gluecodium.cli.GluecodiumExecutionException
import com.here.gluecodium.model.lime.LimeModel
import java.io.File
import java.io.IOException
import java.util.ServiceLoader

/** The base interface for all the generators.  */
interface Generator {

    /** Short name of the generator. */
    val shortName: String

    /** Whether the generator expects an unfiltered model as an input. */
    val needsUnfilteredModel: Boolean
        get() = false

    /** Initialize the generator with given options. */
    fun initialize(options: Gluecodium.Options) {}

    /**
     * Generate files in the output language based on given model. The model is assumed to be valid.
     *
     * @param limeModel LIME model
     * @return a list of generated files with their relative destination paths
     */
    fun generate(limeModel: LimeModel): List<GeneratedFile>

    companion object {
        private val allGenerators = ServiceLoader.load(Generator::class.java).iterator().asSequence()
            .sortedBy { it.shortName }.associateByTo(LinkedHashMap()) { it.shortName }

        val allGeneratorShortNames
            get() = allGenerators.keys

        fun initializeGenerator(shortName: String, options: Gluecodium.Options) =
            allGenerators[shortName]?.also { it.initialize(options) }

        fun copyCommonFile(fileName: String, targetDir: String): GeneratedFile {
            val stream = Generator::class.java.classLoader.getResourceAsStream(fileName)
                    ?: throw GluecodiumExecutionException(String.format("Failed loading resource %s.", fileName))

            return try {
                GeneratedFile(
                        stream.bufferedReader().use { it.readText() },
                        if (targetDir.isNotEmpty()) targetDir + File.separator + fileName else fileName,
                        GeneratedFile.SourceSet.COMMON
                )
            } catch (e: IOException) {
                throw GluecodiumExecutionException("Copying resource file failed with error:", e)
            }
        }
    }
}
