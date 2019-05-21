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

package com.here.genium.franca

import io.mockk.MockKAnnotations
import io.mockk.every
import io.mockk.impl.annotations.MockK
import org.franca.core.franca.FModelElement
import org.franca.core.franca.FTypeCollection
import org.junit.Assert.assertEquals
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class DefinedByTest {
    @MockK
    private lateinit var francaModelElement: FModelElement
    @MockK
    private lateinit var francaTypeCollection: FTypeCollection

    @Before
    fun setUp() = MockKAnnotations.init(this, relaxed = true)

    @Test
    fun findDefiningTypeCollectionReturnsTypeCollection() {
        // Arrange
        every { francaTypeCollection.name } returns "MyFTypeCollection"

        // Act
        val definingTypeCollection = DefinedBy.findDefiningTypeCollection(francaTypeCollection)

        // Assert
        assertEquals("MyFTypeCollection", definingTypeCollection.name)
    }

    @Test
    fun findDefiningTypeCollectionReturnsParentTypeCollection() {
        // Arrange
        every { francaTypeCollection.name } returns "MyFTypeCollection"
        every { francaModelElement.eContainer() } returns francaTypeCollection

        // Act
        val definingTypeCollection = DefinedBy.findDefiningTypeCollection(francaModelElement)

        // Assert
        assertEquals("MyFTypeCollection", definingTypeCollection.name)
    }
}
