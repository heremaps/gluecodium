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

package com.here.gluecodium.platform.baseapi

import com.here.gluecodium.Gluecodium
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.test.AssertHelpers.assertContains
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class BaseApiGeneratorSuiteTest {

    private lateinit var baseApiGeneratorSuite: BaseApiGeneratorSuite

    @Before
    fun setUp() {
        baseApiGeneratorSuite = BaseApiGeneratorSuite(Gluecodium.testOptions())
    }

    @Test
    fun generateFilesEmptyModel() {
        val generatedFiles = baseApiGeneratorSuite.generate(LimeModel(emptyMap(), emptyList()))
        assertNotNull(generatedFiles)
        // + 1 for Export.h
        val expectedGeneratedFiles = BaseApiGeneratorSuite.ADDITIONAL_HEADERS.size + 2
        assertEquals(
                "Expected cpp/internal files and test generated file",
                expectedGeneratedFiles,
                generatedFiles.size
        )

        val generatedFileNames = generatedFiles.map { it.targetFile.toString() }
        assertContains("cpp/include/gluecodium/Return.h", generatedFileNames)
        assertContains("cpp/include/gluecodium/Export.h", generatedFileNames)
        assertContains("cpp/include/gluecodium/Optional.h", generatedFileNames)
        assertContains("cpp/include/gluecodium/OptionalImpl.h", generatedFileNames)
        assertContains("cpp/include/gluecodium/Export.h", generatedFileNames)
    }
}
