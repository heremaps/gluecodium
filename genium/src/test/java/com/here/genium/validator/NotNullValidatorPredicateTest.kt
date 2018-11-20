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
import org.franca.core.franca.FField
import org.franca.core.franca.FModel
import org.franca.core.franca.FStructType
import org.franca.core.franca.FTypeCollection
import org.franca.core.franca.FTypeRef
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
class NotNullValidatorPredicateTest {
    @Mock
    private lateinit var francaModel: FModel
    @Mock
    private lateinit var francaTypeCollection: FTypeCollection
    @Mock
    private lateinit var francaStruct: FStructType
    @Mock
    private lateinit var francaField: FField
    @Mock
    private lateinit var francaTypeRef: FTypeRef

    @Mock
    private lateinit var deploymentModel: FrancaDeploymentModel

    private val validatorPredicate = NotNullValidatorPredicate()

    @Before
    fun setUp() {
        MockitoAnnotations.initMocks(this)
        PowerMockito.mockStatic(InstanceRules::class.java)

        `when`(francaModel.name).thenReturn("Foo")
        `when`(francaTypeCollection.name).thenReturn("Bar")
        `when`(francaStruct.name).thenReturn("Baz")
        `when`(francaField.name).thenReturn("Fizz")

        `when`(francaTypeCollection.eContainer()).thenReturn(francaModel)
        `when`(francaStruct.eContainer()).thenReturn(francaTypeCollection)
        `when`(francaField.eContainer()).thenReturn(francaStruct)

        `when`(francaField.type).thenReturn(francaTypeRef)

        `when`(deploymentModel.isNotNull(any())).thenReturn(true)
    }

    @Test
    fun validateWithNotNullFalse() {
        `when`(deploymentModel.isNotNull(any())).thenReturn(false)

        val result = validatorPredicate.validate(deploymentModel, francaField)

        assertNull(result)
    }

    @Test
    fun validateWithInstanceType() {
        `when`(InstanceRules.isInstanceId(any(FTypeRef::class.java))).thenReturn(true)

        val result = validatorPredicate.validate(deploymentModel, francaField)

        assertNull(result)
    }

    @Test
    fun validateWithNonInstanceType() {
        val result = validatorPredicate.validate(deploymentModel, francaField)

        assertNotNull(result)
    }
}
