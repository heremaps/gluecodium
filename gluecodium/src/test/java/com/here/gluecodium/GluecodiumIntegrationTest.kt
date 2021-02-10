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

package com.here.gluecodium

import com.here.gluecodium.Gluecodium.Options
import com.here.gluecodium.generator.common.GeneratedFile
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class GluecodiumIntegrationTest {

    @Rule
    @JvmField
    val outputFolder = TemporaryFolder()

    private val mainFile = GeneratedFile("I'm a main file", "mainsubdir/mainfile", GeneratedFile.SourceSet.MAIN)
    private val commonFile = GeneratedFile(
        "I'm a common file",
        "commonsubdir/commonfile",
        GeneratedFile.SourceSet.COMMON
    )

    @Test
    fun `output with common code in subdirectory writes all files`() {
        val mainDir = outputFolder.root.path
        val commonDir = "$mainDir/common"
        val expectedMainFile = File("$mainDir/${mainFile.targetFile}")
        val expectedCommonFile = File("$commonDir/${commonFile.targetFile}")

        val options = Options(
            cppInternalNamespace = listOf("gluecodium"),
            javaNonNullAnnotation = Pair("NonNull", listOf("android", "support", "annotation")),
            javaNullableAnnotation = Pair("Nullable", listOf("android", "support", "annotation")),
            outputDir = mainDir,
            commonOutputDir = commonDir,
            isEnableCaching = true
        )
        val gluecodium = Gluecodium(options)

        gluecodium.output("cpp", listOf(mainFile, commonFile))
        gluecodium.cache.write(true)

        assertTrue(expectedMainFile.exists())
        assertTrue(expectedCommonFile.exists())
        assertEquals(mainFile.content, expectedMainFile.readText())
        assertEquals(commonFile.content, expectedCommonFile.readText())
    }
}
