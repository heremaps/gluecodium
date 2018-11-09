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

package com.here.genium.validator

import com.here.genium.model.franca.FrancaDeploymentModel
import org.franca.core.franca.FBasicTypeId
import org.franca.core.franca.FField
import org.franca.core.franca.FModel
import org.franca.core.franca.FStructType
import org.franca.core.franca.FTypeCollection
import org.franca.core.franca.FTypeDef
import org.franca.core.franca.FTypeRef
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4
import org.mockito.Mock
import org.mockito.Mockito.`when`
import org.mockito.Mockito.mock
import org.mockito.MockitoAnnotations

@RunWith(JUnit4::class)
class EquatableValidatorPredicateTest {
    @Mock
    private lateinit var fModel: FModel
    @Mock
    private lateinit var francaTypeCollection: FTypeCollection
    @Mock
    private lateinit var francaStructType: FStructType
    @Mock
    private lateinit var francaField: FField
    @Mock
    private lateinit var francaTypeRef: FTypeRef

    @Mock
    private lateinit var deploymentModel: FrancaDeploymentModel

    private val validatorPredicate = EquatableValidatorPredicate()

    @Before
    fun setUp() {
        MockitoAnnotations.initMocks(this)

        `when`(fModel.name).thenReturn("")
        `when`(francaTypeCollection.name).thenReturn("")
        `when`(francaStructType.name).thenReturn("")
        `when`(francaField.name).thenReturn("")

        `when`(francaTypeCollection.eContainer()).thenReturn(fModel)
        `when`(francaStructType.eContainer()).thenReturn(francaTypeCollection)
        `when`(francaField.eContainer()).thenReturn(francaStructType)

        `when`(francaField.type).thenReturn(francaTypeRef)
        `when`(francaTypeRef.predefined).thenReturn(FBasicTypeId.UNDEFINED)

        `when`(deploymentModel.isEquatable(francaStructType)).thenReturn(true)
    }

    @Test
    fun validateWithFieldInNonEquatableStruct() {
        `when`(deploymentModel.isEquatable(francaStructType)).thenReturn(false)

        assertNull(validatorPredicate.validate(deploymentModel, francaField))
    }

    @Test
    fun validateWithPrimitiveType() {
        `when`(francaTypeRef.predefined).thenReturn(FBasicTypeId.BOOLEAN)

        assertNull(validatorPredicate.validate(deploymentModel, francaField))
    }

    @Test
    fun validateWithUndefined() =
        assertNotNull(validatorPredicate.validate(deploymentModel, francaField))

    @Test
    fun validateWithTypeDefToUndefined() {
        val undefinedTypeRef = mock(FTypeRef::class.java)
        `when`(undefinedTypeRef.predefined).thenReturn(FBasicTypeId.UNDEFINED)
        val francaTypeDef = mock(FTypeDef::class.java)
        `when`(francaTypeDef.actualType).thenReturn(undefinedTypeRef)
        `when`(francaTypeRef.derived).thenReturn(francaTypeDef)

        assertNotNull(validatorPredicate.validate(deploymentModel, francaField))
    }

    @Test
    fun validateWithStructType() {
        `when`(francaTypeRef.derived).thenReturn(mock(FStructType::class.java))

        assertNotNull(validatorPredicate.validate(deploymentModel, francaField))
    }

    @Test
    fun validateWithEquatableStructType() {
        val equatableStruct = mock(FStructType::class.java)
        `when`(deploymentModel.isEquatable(equatableStruct)).thenReturn(true)
        `when`(francaTypeRef.derived).thenReturn(equatableStruct)

        assertNull(validatorPredicate.validate(deploymentModel, francaField))
    }
}
