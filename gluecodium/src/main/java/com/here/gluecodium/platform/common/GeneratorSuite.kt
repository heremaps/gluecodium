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

package com.here.gluecodium.platform.common

import com.here.gluecodium.Gluecodium
import com.here.gluecodium.cli.GluecodiumExecutionException
import com.here.gluecodium.generator.common.GeneratedFile
import com.here.gluecodium.generator.dart.DartGeneratorSuite
import com.here.gluecodium.generator.lime.LimeGeneratorSuite
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.platform.android.AndroidGeneratorSuite
import com.here.gluecodium.platform.android.JavaGeneratorSuite
import com.here.gluecodium.platform.baseapi.BaseApiGeneratorSuite
import com.here.gluecodium.platform.swift.SwiftGeneratorSuite
import org.apache.commons.io.IOUtils
import java.io.File
import java.io.IOException
import java.nio.charset.Charset

/** The base interface for all the generators.  */
abstract class GeneratorSuite {

    /** @return the human readable name of this generator */
    abstract val name: String

    /**
     * Triggers the generation. The model is assumed to be valid.
     *
     * @param limeModel LIME model
     * @return a list of generated files with their relative destination paths
     */
    abstract fun generate(limeModel: LimeModel): List<GeneratedFile>

    companion object {
        /** Creates a new instance of a generator suite by its short identifier  */
        fun instantiateByShortName(shortName: String, options: Gluecodium.Options): GeneratorSuite? {

            when (shortName) {
                AndroidGeneratorSuite.GENERATOR_NAME -> return AndroidGeneratorSuite(options)
                JavaGeneratorSuite.GENERATOR_NAME -> return JavaGeneratorSuite(options)
                BaseApiGeneratorSuite.GENERATOR_NAME -> return BaseApiGeneratorSuite(options)
                SwiftGeneratorSuite.GENERATOR_NAME -> return SwiftGeneratorSuite(options)
                LimeGeneratorSuite.GENERATOR_NAME -> return LimeGeneratorSuite()
                DartGeneratorSuite.GENERATOR_NAME -> return DartGeneratorSuite(options)
            }

            return null
        }

        /** @return all available generators */
        fun generatorShortNames() = setOf(
                AndroidGeneratorSuite.GENERATOR_NAME,
                JavaGeneratorSuite.GENERATOR_NAME,
                BaseApiGeneratorSuite.GENERATOR_NAME,
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
