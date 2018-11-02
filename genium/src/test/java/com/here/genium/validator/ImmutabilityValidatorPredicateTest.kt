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
import org.eclipse.emf.ecore.EObject
import org.franca.core.franca.FModel
import org.franca.core.franca.FStructType
import org.franca.core.franca.FTypeCollection
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4
import org.mockito.Mock
import org.mockito.Mockito.`when`
import org.mockito.MockitoAnnotations

@RunWith(JUnit4::class)
class ImmutabilityValidatorPredicateTest {
    @Mock
    private lateinit var francaModel: FModel
    @Mock
    private lateinit var francaTypeCollection: FTypeCollection
    @Mock
    private lateinit var francaStruct: FStructType
    @Mock
    private lateinit var parentStruct: FStructType

    @Mock
    private lateinit var deploymentModel: FrancaDeploymentModel

    private val validatorPredicate = ImmutabilityValidatorPredicate()

    @Before
    fun setUp() {
        MockitoAnnotations.initMocks(this)

        `when`(francaModel.name).thenReturn("Foo")
        `when`(francaTypeCollection.name).thenReturn("Bar")
        `when`(francaStruct.name).thenReturn("Baz")

        `when`<EObject>(francaTypeCollection.eContainer()).thenReturn(francaModel)
        `when`<EObject>(francaStruct.eContainer()).thenReturn(francaTypeCollection)
        `when`<EObject>(parentStruct.eContainer()).thenReturn(parentStruct)

        `when`(francaStruct.base).thenReturn(parentStruct)
    }

    @Test
    fun validateWithNoParent() {
        `when`(francaStruct.base).thenReturn(null)

        val result = validatorPredicate.validate(deploymentModel, francaStruct)

        assertNull(result)
    }

    @Test
    fun validateImmutableWithNoParent() {
        `when`(francaStruct.base).thenReturn(null)
        `when`(deploymentModel.isImmutable(francaStruct)).thenReturn(true)

        val result = validatorPredicate.validate(deploymentModel, francaStruct)

        assertNull(result)
    }

    @Test
    fun validateWithParent() {
        val result = validatorPredicate.validate(deploymentModel, francaStruct)

        assertNull(result)
    }

    @Test
    fun validateWithImmutableParent() {
        `when`(deploymentModel.isImmutable(parentStruct)).thenReturn(true)

        val result = validatorPredicate.validate(deploymentModel, francaStruct)

        assertNotNull(result)
    }

    @Test
    fun validateImmutableWithParent() {
        `when`(deploymentModel.isImmutable(francaStruct)).thenReturn(true)

        val result = validatorPredicate.validate(deploymentModel, francaStruct)

        assertNotNull(result)
    }

    @Test
    fun validateImmutableWithImmutableParent() {
        `when`(deploymentModel.isImmutable(francaStruct)).thenReturn(true)
        `when`(deploymentModel.isImmutable(parentStruct)).thenReturn(true)

        val result = validatorPredicate.validate(deploymentModel, francaStruct)

        assertNotNull(result)
    }
}
