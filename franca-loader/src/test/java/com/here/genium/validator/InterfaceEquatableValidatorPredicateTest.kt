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

import com.here.genium.franca.FrancaDeploymentModel
import org.franca.core.franca.FInterface
import org.franca.core.franca.FModel
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
class InterfaceEquatableValidatorPredicateTest {
    @Mock
    private lateinit var francaModel: FModel
    @Mock
    private lateinit var francaInterface: FInterface

    @Mock
    private lateinit var deploymentModel: FrancaDeploymentModel

    private val validatorPredicate = InterfaceEquatableValidatorPredicate()

    @Before
    fun setUp() {
        MockitoAnnotations.initMocks(this)

        `when`(francaModel.name).thenReturn("")
        `when`(francaInterface.name).thenReturn("")
        `when`(francaInterface.eContainer()).thenReturn(francaModel)
    }

    @Test
    fun validateWithNeitherEquatableType() =
        assertNull(validatorPredicate.validate(deploymentModel, francaInterface))

    @Test
    fun validateWithEquatable() {
        `when`(deploymentModel.isEquatable(francaInterface)).thenReturn(true)
        assertNull(validatorPredicate.validate(deploymentModel, francaInterface))
    }

    @Test
    fun validateWithPointerEquatable() {
        `when`(deploymentModel.isPointerEquatable(francaInterface)).thenReturn(true)
        assertNull(validatorPredicate.validate(deploymentModel, francaInterface))
    }

    @Test
    fun validateWithEquatableAndIsInterface() {
        `when`(deploymentModel.isEquatable(francaInterface)).thenReturn(true)
        `when`(deploymentModel.isInterface(francaInterface)).thenReturn(true)
        assertNotNull(validatorPredicate.validate(deploymentModel, francaInterface))
    }

    @Test
    fun validateWithPointerEquatableAndIsInterface() {
        `when`(deploymentModel.isPointerEquatable(francaInterface)).thenReturn(true)
        `when`(deploymentModel.isInterface(francaInterface)).thenReturn(true)
        assertNotNull(validatorPredicate.validate(deploymentModel, francaInterface))
    }

    @Test
    fun validateWithPointerEquatableAndEquatable() {
        `when`(deploymentModel.isPointerEquatable(francaInterface)).thenReturn(true)
        `when`(deploymentModel.isEquatable(francaInterface)).thenReturn(true)
        assertNotNull(validatorPredicate.validate(deploymentModel, francaInterface))
    }
}
