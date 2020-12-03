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
import com.here.gluecodium.generator.cpp.CppGeneratorSuite
import com.here.gluecodium.generator.dart.DartGeneratorSuite
import com.here.gluecodium.generator.java.JavaGeneratorSuite
import com.here.gluecodium.generator.lime.LimeGeneratorSuite
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.platform.swift.SwiftGeneratorSuite
import java.io.File
import java.io.IOException
import java.nio.charset.Charset
import org.apache.commons.io.IOUtils

/** The base interface for all the generators.  */
interface GeneratorSuite {

    /**
     * Triggers the generation. The model is assumed to be valid.
     *
     * @param limeModel LIME model
     * @return a list of generated files with their relative destination paths
     */
    fun generate(limeModel: LimeModel): List<GeneratedFile>

    companion object {
        /** Creates a new instance of a generator suite by its short identifier  */
        fun instantiateByShortName(shortName: String, options: Gluecodium.Options) =
            when (shortName) {
                JavaGeneratorSuite.GENERATOR_NAME -> JavaGeneratorSuite(options)
                CppGeneratorSuite.GENERATOR_NAME -> CppGeneratorSuite(options)
                SwiftGeneratorSuite.GENERATOR_NAME -> SwiftGeneratorSuite(options)
                LimeGeneratorSuite.GENERATOR_NAME -> LimeGeneratorSuite()
                DartGeneratorSuite.GENERATOR_NAME -> DartGeneratorSuite(options)
                else -> null
            }

        /** @return all available generators */
        fun generatorShortNames() = setOf(
                JavaGeneratorSuite.GENERATOR_NAME,
                CppGeneratorSuite.GENERATOR_NAME,
                SwiftGeneratorSuite.GENERATOR_NAME,
                LimeGeneratorSuite.GENERATOR_NAME,
                DartGeneratorSuite.GENERATOR_NAME
        )

        fun copyCommonFile(fileName: String, targetDir: String): GeneratedFile {
            val stream = GeneratorSuite::class.java.classLoader.getResourceAsStream(fileName)
                    ?: throw GluecodiumExecutionException(String.format("Failed loading resource %s.", fileName))

            return try {
                GeneratedFile(
                        IOUtils.toString(stream, Charset.defaultCharset()),
                        if (targetDir.isNotEmpty()) targetDir + File.separator + fileName else fileName,
                        GeneratedFile.SourceSet.COMMON
                )
            } catch (e: IOException) {
                throw GluecodiumExecutionException("Copying resource file failed with error:", e)
            }
        }
    }
}
