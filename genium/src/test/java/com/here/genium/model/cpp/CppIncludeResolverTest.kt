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

package com.here.genium.model.cpp

import com.here.genium.model.franca.FrancaDeploymentModel
import org.franca.core.franca.FInterface
import org.franca.core.franca.FModel
import org.franca.core.franca.FModelElement
import org.franca.core.franca.FStructType
import org.franca.core.franca.FTypeCollection
import org.junit.Assert.assertEquals
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4
import org.mockito.ArgumentMatchers.any
import org.mockito.Mock
import org.mockito.Mockito.`when`
import org.mockito.Mockito.verify
import org.mockito.MockitoAnnotations

@RunWith(JUnit4::class)
class CppIncludeResolverTest {
    @Mock
    private lateinit var francaModel: FModel
    @Mock
    private lateinit var francaTypeCollection: FTypeCollection
    @Mock
    private lateinit var francaInterface: FInterface
    @Mock
    private lateinit var francaStruct: FStructType

    @Mock
    private lateinit var deploymentModel: FrancaDeploymentModel

    private lateinit var includeResolver: CppIncludeResolver

    @Before
    fun setUp() {
        MockitoAnnotations.initMocks(this)

        includeResolver = CppIncludeResolver(deploymentModel, emptyList())

        `when`(francaStruct.eContainer()).thenReturn(francaTypeCollection)
        `when`(francaTypeCollection.eContainer()).thenReturn(francaModel)
        `when`(francaInterface.eContainer()).thenReturn(francaModel)

        `when`(francaTypeCollection.name).thenReturn(TYPE_COLLECTION_NAME)
        `when`(francaModel.name).thenReturn(MODEL_NAME)
    }

    @Test
    fun resolveExternalType() {
        `when`(deploymentModel.getExternalType(any<FModelElement>())).thenReturn(EXTERNAL_INCLUDE)

        val result = includeResolver.resolveIncludes(francaStruct)

        assertEquals(EXTERNAL_INCLUDE, result.first().fileName)
        verify(deploymentModel).getExternalType(francaStruct)
    }

    @Test
    fun resolveRegularInclude() {
        val result = includeResolver.resolveIncludes(francaStruct)

        assertEquals("SomeModel/SomeTypeCollection.h", result.first().fileName)
    }

    @Test
    fun getOutputFilePathForInterface() {
        `when`(francaModel.name).thenReturn("my.fancy.package")
        `when`(francaInterface.name).thenReturn("FancyName")

        val filePath = includeResolver.getOutputFilePath(francaInterface)

        assertEquals("my/fancy/package/FancyName", filePath)
    }

    @Test
    fun getOutputFilePathForTypeCollection() {
        `when`(francaModel.name).thenReturn("my.fancy.package")

        val filePath = includeResolver.getOutputFilePath(francaTypeCollection)

        assertEquals("my/fancy/package/SomeTypeCollection", filePath)
    }

    companion object {
        private const val MODEL_NAME = "SomeModel"
        private const val TYPE_COLLECTION_NAME = "SomeTypeCollection"
        private const val EXTERNAL_INCLUDE = "foo/Bar.h"
    }
}
