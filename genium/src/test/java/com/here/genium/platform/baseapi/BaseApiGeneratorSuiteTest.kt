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

package com.here.genium.platform.baseapi

import com.here.genium.Genium
import com.here.genium.model.franca.FrancaDeploymentModel
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertThat
import org.junit.Before
import org.junit.Test
import org.junit.matchers.JUnitMatchers.hasItems
import org.junit.runner.RunWith
import org.junit.runners.JUnit4
import org.mockito.Mock
import org.mockito.MockitoAnnotations

@RunWith(JUnit4::class)
class BaseApiGeneratorSuiteTest {
    @Mock
    private lateinit var deploymentModel: FrancaDeploymentModel

    private lateinit var baseApiGeneratorSuite: BaseApiGeneratorSuite

    @Before
    fun setUp() {
        MockitoAnnotations.initMocks(this)
        baseApiGeneratorSuite = BaseApiGeneratorSuite(Genium.DEFAULT_OPTIONS, deploymentModel)
    }

    @Test
    fun generateFilesEmptyModel() {
        val generatedFiles = baseApiGeneratorSuite.generate(emptyList())
        assertNotNull(generatedFiles)
        // + 1 for Export.h
        val expectedGeneratedFiles = BaseApiGeneratorSuite.ADDITIONAL_HEADERS.size + 1
        assertEquals(
                "Expected cpp/internal files and test generated file",
                expectedGeneratedFiles,
                generatedFiles.size
        )

        assertThat(generatedFiles.map { it.targetFile.toString() }, hasItems(
                "cpp/include/EnumHash.h",
                "cpp/include/Return.h",
                "cpp/include/Export.h",
                "cpp/include/Optional.h",
                "cpp/include/OptionalImpl.h",
                "cpp/include/Export.h"))
    }
}
