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

import com.here.genium.model.franca.FrancaDeploymentModel
import com.here.genium.test.ArrayEList
import org.franca.core.franca.FArgument
import org.franca.core.franca.FInterface
import org.franca.core.franca.FMethod
import org.franca.core.franca.FModel
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4
import org.mockito.ArgumentMatchers.any
import org.mockito.Mock
import org.mockito.Mockito.`when`
import org.mockito.MockitoAnnotations

@RunWith(JUnit4::class)
class NullabilityValidatorPredicateTest {
    @Mock
    private lateinit var francaModel: FModel
    @Mock
    private lateinit var francaInterface: FInterface
    @Mock
    private lateinit var francaMethod: FMethod
    @Mock
    private lateinit var francaArgument: FArgument

    @Mock
    private lateinit var deploymentModel: FrancaDeploymentModel

    private val validatorPredicate = NullabilityValidatorPredicate()

    @Before
    fun setUp() {
        MockitoAnnotations.initMocks(this)

        `when`(francaModel.name).thenReturn("Foo")
        `when`(francaInterface.name).thenReturn("Bar")
        `when`(francaMethod.name).thenReturn("Baz")

        `when`(francaInterface.eContainer()).thenReturn(francaModel)
        `when`(francaMethod.eContainer()).thenReturn(francaInterface)

        `when`(francaMethod.outArgs).thenReturn(ArrayEList(listOf(francaArgument)))
    }

    @Test
    fun validateWithNonConstructorMethod() {
        val result = validatorPredicate.validate(deploymentModel, francaMethod)

        assertNull(result)
    }

    @Test
    fun validateWithConstructorMethodNotNullable() {
        `when`(deploymentModel.isConstructor(any())).thenReturn(true)

        val result = validatorPredicate.validate(deploymentModel, francaMethod)

        assertNull(result)
    }

    @Test
    fun validateWithConstructorMethodNullable() {
        `when`(deploymentModel.isConstructor(any())).thenReturn(true)
        `when`(deploymentModel.isNullable(any())).thenReturn(true)

        val result = validatorPredicate.validate(deploymentModel, francaMethod)

        assertNotNull(result)
    }
}
