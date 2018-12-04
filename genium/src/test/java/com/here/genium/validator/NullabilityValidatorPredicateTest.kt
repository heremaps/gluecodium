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

import com.here.genium.model.common.InstanceRules
import com.here.genium.model.franca.FrancaDeploymentModel
import org.franca.core.franca.FModel
import org.franca.core.franca.FTypeCollection
import org.franca.core.franca.FTypeRef
import org.franca.core.franca.FTypedElement
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.mockito.ArgumentMatchers.any
import org.mockito.Mock
import org.mockito.Mockito.`when`
import org.mockito.MockitoAnnotations
import org.powermock.api.mockito.PowerMockito
import org.powermock.core.classloader.annotations.PrepareForTest
import org.powermock.modules.junit4.PowerMockRunner

@RunWith(PowerMockRunner::class)
@PrepareForTest(InstanceRules::class)
class NullabilityValidatorPredicateTest {
    @Mock
    private lateinit var francaModel: FModel
    @Mock
    private lateinit var francaTypeCollection: FTypeCollection
    @Mock
    private lateinit var francaTypedElement: FTypedElement
    @Mock
    private lateinit var francaTypeRef: FTypeRef

    @Mock
    private lateinit var deploymentModel: FrancaDeploymentModel

    private val validatorPredicate = NullabilityValidatorPredicate()

    @Before
    fun setUp() {
        MockitoAnnotations.initMocks(this)
        PowerMockito.mockStatic(InstanceRules::class.java)

        `when`(francaModel.name).thenReturn("Foo")
        `when`(francaTypeCollection.name).thenReturn("Bar")
        `when`(francaTypedElement.name).thenReturn("Baz")

        `when`(francaTypeCollection.eContainer()).thenReturn(francaModel)
        `when`(francaTypedElement.eContainer()).thenReturn(francaTypeCollection)

        `when`(francaTypedElement.type).thenReturn(francaTypeRef)
    }

    @Test
    fun validateWithNonInstanceTypeNoProperties() {
        val result = validatorPredicate.validate(deploymentModel, francaTypedElement)

        assertNull(result)
    }

    @Test
    fun validateWithNonInstanceTypeNotNull() {
        `when`(deploymentModel.isNotNull(any())).thenReturn(true)

        val result = validatorPredicate.validate(deploymentModel, francaTypedElement)

        assertNotNull(result)
    }

    @Test
    fun validateWithNonInstanceTypeNullable() {
        `when`(deploymentModel.isNullable(any())).thenReturn(true)

        val result = validatorPredicate.validate(deploymentModel, francaTypedElement)

        assertNull(result)
    }

    @Test
    fun validateWithNonInstanceTypeBothProperties() {
        `when`(deploymentModel.isNotNull(any())).thenReturn(true)
        `when`(deploymentModel.isNullable(any())).thenReturn(true)

        val result = validatorPredicate.validate(deploymentModel, francaTypedElement)

        assertNotNull(result)
    }

    @Test
    fun validateWithInstanceTypeNoProperties() {
        `when`(InstanceRules.isInstanceId(any(FTypeRef::class.java))).thenReturn(true)

        val result = validatorPredicate.validate(deploymentModel, francaTypedElement)

        assertNull(result)
    }

    @Test
    fun validateWithInstanceTypeNotNull() {
        `when`(InstanceRules.isInstanceId(any(FTypeRef::class.java))).thenReturn(true)
        `when`(deploymentModel.isNotNull(any())).thenReturn(true)

        val result = validatorPredicate.validate(deploymentModel, francaTypedElement)

        assertNull(result)
    }

    @Test
    fun validateWithInstanceTypeNullable() {
        `when`(InstanceRules.isInstanceId(any(FTypeRef::class.java))).thenReturn(true)
        `when`(deploymentModel.isNullable(any())).thenReturn(true)

        val result = validatorPredicate.validate(deploymentModel, francaTypedElement)

        assertNotNull(result)
    }

    @Test
    fun validateWithInstanceTypeBothProperties() {
        `when`(InstanceRules.isInstanceId(any(FTypeRef::class.java))).thenReturn(true)
        `when`(deploymentModel.isNotNull(any())).thenReturn(true)
        `when`(deploymentModel.isNullable(any())).thenReturn(true)

        val result = validatorPredicate.validate(deploymentModel, francaTypedElement)

        assertNotNull(result)
    }
}
