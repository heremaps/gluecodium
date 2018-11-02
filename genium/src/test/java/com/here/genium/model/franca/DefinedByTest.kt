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

package com.here.genium.model.franca

import org.eclipse.emf.ecore.EObject
import org.junit.Assert.assertEquals
import org.mockito.Mockito.`when`
import org.mockito.MockitoAnnotations.initMocks

import org.franca.core.franca.FModelElement
import org.franca.core.franca.FQualifiedElementRef
import org.franca.core.franca.FTypeCollection
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4
import org.mockito.Mock

@RunWith(JUnit4::class)
class DefinedByTest {
    @Mock
    private lateinit var francaModelElement: FModelElement
    @Mock
    private lateinit var francaQualifiedElementRef: FQualifiedElementRef
    @Mock
    private lateinit var francaTypeCollection: FTypeCollection

    @Before
    fun setUp() = initMocks(this)

    @Test
    fun findDefiningTypeCollectionReturnsTypeCollection() {
        // Arrange
        `when`(francaTypeCollection.name).thenReturn("MyFTypeCollection")

        // Act
        val definingTypeCollection = DefinedBy.findDefiningTypeCollection(francaTypeCollection)

        // Assert
        assertEquals("MyFTypeCollection", definingTypeCollection.name)
    }

    @Test
    fun findDefiningTypeCollection_returnsParentTypeCollection() {
        // Arrange
        `when`(francaTypeCollection.name).thenReturn("MyFTypeCollection")
        `when`<EObject>(francaModelElement.eContainer()).thenReturn(francaTypeCollection)

        // Act
        val definingTypeCollection = DefinedBy.findDefiningTypeCollection(francaModelElement)

        // Assert
        assertEquals("MyFTypeCollection", definingTypeCollection.name)
    }

    @Test
    fun findDefiningTypeCollection_forQualifiedRef_returnsParentTypeCollection() {
        // Arrange
        `when`(francaTypeCollection.name).thenReturn("MyFTypeCollection")
        `when`<EObject>(francaQualifiedElementRef.eContainer()).thenReturn(francaTypeCollection)

        // Act
        val definingTypeCollection = DefinedBy.findDefiningTypeCollection(francaQualifiedElementRef)

        // Assert
        assertEquals("MyFTypeCollection", definingTypeCollection.name)
    }
}
