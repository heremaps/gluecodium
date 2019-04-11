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

package com.here.genium.validator

import com.here.genium.test.ArrayEList
import org.franca.core.franca.FInterface
import org.franca.core.franca.FModel
import org.franca.core.franca.FType
import org.franca.core.franca.FTypeCollection
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4
import org.mockito.Mock
import org.mockito.Mockito.`when`
import org.mockito.Mockito.mock
import org.mockito.MockitoAnnotations
import java.util.LinkedList

@RunWith(JUnit4::class)
class NameValidatorTest {
    @Mock
    private lateinit var fModel: FModel

    @Mock
    private lateinit var francaInterface: FInterface
    @Mock
    private lateinit var francaTypeCollection: FTypeCollection

    private val typeCollections = LinkedList<FTypeCollection>()

    @Before
    fun setUp() {
        MockitoAnnotations.initMocks(this)

        `when`(fModel.name).thenReturn(MODEL_NAME)
        `when`(francaInterface.name).thenReturn(INTERFACE_NAME)

        `when`(francaInterface.eContainer()).thenReturn(fModel)
        `when`(francaTypeCollection.eContainer()).thenReturn(fModel)
    }

    @Test
    fun checkTypeNamesWithSingleTypeCollection() {
        typeCollections.add(mockTypeCollectionContainingType(TYPE_NAME, fModel))

        assertTrue(
            NameValidator.checkTypeNamesInTypeCollection(
                typeCollections
            )
        )
    }

    @Test
    fun checkTypeNamesWithMultipleTypeCollectionsUniqueTypeNames() {
        typeCollections.add(mockTypeCollectionContainingType(TYPE_NAME, fModel))
        typeCollections.add(mockTypeCollectionContainingType(TYPE_NAME + "2", fModel))

        assertTrue(
            NameValidator.checkTypeNamesInTypeCollection(
                typeCollections
            )
        )
    }

    @Test
    fun checkTypeNamesWithMultipleTypeCollectionsNonUniqueTypeNames() {
        typeCollections.add(mockTypeCollectionContainingType(TYPE_NAME, fModel))
        typeCollections.add(mockTypeCollectionContainingType(TYPE_NAME, fModel))

        assertFalse(
            NameValidator.checkTypeNamesInTypeCollection(
                typeCollections
            )
        )
    }

    @Test
    fun checkTypeNamesWithMultipleTypeCollectionsNonUniqueTypeNamesDifferentPackages() {
        val fModel2 = mock(FModel::class.java)
        `when`(fModel2.name).thenReturn("$MODEL_NAME.xtra")

        typeCollections.add(mockTypeCollectionContainingType(TYPE_NAME, fModel))
        typeCollections.add(mockTypeCollectionContainingType(TYPE_NAME, fModel2))

        assertTrue(
            NameValidator.checkTypeNamesInTypeCollection(
                typeCollections
            )
        )
    }

    @Test
    fun checkTypeCollectionNamesWithSingleInterface() {
        typeCollections.add(francaInterface)

        assertTrue(NameValidator.checkTypeCollectionNames(typeCollections))
    }

    @Test
    fun checkTypeCollectionNamesWithSingleTypeCollection() {
        typeCollections.add(francaTypeCollection)

        assertTrue(NameValidator.checkTypeCollectionNames(typeCollections))
    }

    @Test
    fun checkTypeCollectionNamesWithTwoUniqueNames() {
        `when`(francaTypeCollection.name).thenReturn(INTERFACE_NAME + "Off")
        typeCollections.add(francaInterface)
        typeCollections.add(francaTypeCollection)

        assertTrue(NameValidator.checkTypeCollectionNames(typeCollections))
    }

    @Test
    fun checkTypeCollectionNamesWithTwoNonUniqueNames() {
        `when`(francaTypeCollection.name).thenReturn(INTERFACE_NAME)
        typeCollections.add(francaInterface)
        typeCollections.add(francaTypeCollection)

        assertFalse(NameValidator.checkTypeCollectionNames(typeCollections))
    }

    @Test
    fun checkTypeCollectionNamesWithTwoNonUniqueNamesDifferentPackages() {
        val anotherFModel = mock(FModel::class.java)
        `when`(anotherFModel.name).thenReturn("$MODEL_NAME.xtra")
        `when`(francaTypeCollection.eContainer()).thenReturn(anotherFModel)

        `when`(francaTypeCollection.name).thenReturn(INTERFACE_NAME)
        typeCollections.add(francaInterface)
        typeCollections.add(francaTypeCollection)

        assertTrue(NameValidator.checkTypeCollectionNames(typeCollections))
    }

    private fun mockTypeCollectionContainingType(
        typeName: String,
        fModelParam: FModel?
    ): FTypeCollection {
        val type = mock(FType::class.java)
        `when`(type.name).thenReturn(typeName)

        val fTypeCollection = mock(FTypeCollection::class.java)

        `when`(fTypeCollection.eContainer()).thenReturn(fModelParam)
        `when`(fTypeCollection.eContainer()).thenReturn(fModelParam)

        val types = ArrayEList<FType>()
        types.add(type)
        `when`(fTypeCollection.types).thenReturn(types)
        return fTypeCollection
    }

    companion object {
        private const val MODEL_NAME = "my.package.name"
        private const val TYPE_NAME = "myFancyType"
        private const val INTERFACE_NAME = "Face"
    }
}
