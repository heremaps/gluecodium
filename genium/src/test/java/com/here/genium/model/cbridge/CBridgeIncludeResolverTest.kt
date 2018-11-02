/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
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

package com.here.genium.model.cbridge

import org.eclipse.emf.ecore.EObject
import org.franca.core.franca.FModel
import org.franca.core.franca.FModelElement
import org.franca.core.franca.FTypeCollection
import org.junit.Assert.assertEquals
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4
import org.mockito.Mock
import org.mockito.Mockito.`when`
import org.mockito.MockitoAnnotations

@RunWith(JUnit4::class)
class CBridgeIncludeResolverTest {
    @Mock
    private lateinit var francaModel: FModel
    @Mock
    private lateinit var francaTypeCollection: FTypeCollection
    @Mock
    private lateinit var francaElement: FModelElement

    private var includeResolver = CBridgeIncludeResolver(listOf("ro", "ot"))

    @Before
    fun setUp() {
        MockitoAnnotations.initMocks(this)

        `when`<EObject>(francaElement.eContainer()).thenReturn(francaTypeCollection)
        `when`<EObject>(francaTypeCollection.eContainer()).thenReturn(francaModel)

        `when`(francaTypeCollection.name).thenReturn("SomeTypeCollection")
        `when`(francaModel.name).thenReturn("my.fancy.package")
    }

    @Test
    fun resolveInclude() {
        val result = includeResolver.resolveInclude(francaElement)

        assertEquals(
            "cbridge/include/ro/ot/my/fancy/package/cbridge_SomeTypeCollection.h", result.fileName
        )
    }

    @Test
    fun getHeaderFilePath() {
        val filePath = includeResolver.getHeaderFileNameWithPath(francaTypeCollection)

        assertEquals(
            "cbridge/include/ro/ot/my/fancy/package/cbridge_SomeTypeCollection.h",
            filePath
        )
    }

    @Test
    fun getImplementationFilePath() {
        `when`(francaModel.name).thenReturn("my.fancy.package")

        val filePath = includeResolver.getImplementationFileNameWithPath(francaTypeCollection)

        assertEquals("cbridge/src/ro/ot/my/fancy/package/cbridge_SomeTypeCollection.cpp", filePath)
    }
}
