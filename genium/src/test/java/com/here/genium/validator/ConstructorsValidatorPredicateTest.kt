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
import org.franca.core.franca.FBasicTypeId
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
import org.mockito.Mockito.RETURNS_DEEP_STUBS
import org.mockito.Mockito.`when`
import org.mockito.Mockito.mock
import org.mockito.MockitoAnnotations
import java.util.Arrays.asList

@RunWith(JUnit4::class)
class ConstructorsValidatorPredicateTest {
    @Mock
    private lateinit var francaModel: FModel
    @Mock
    private lateinit var francaInterface: FInterface
    @Mock
    private lateinit var francaMethod: FMethod
    @Mock
    private lateinit var otherMethod: FMethod

    @Mock
    private lateinit var deploymentModel: FrancaDeploymentModel

    private val methods = ArrayEList<FMethod>()
    private val arguments = ArrayEList<FArgument>()
    private val otherArguments = ArrayEList<FArgument>()

    private val validatorPredicate = ConstructorsValidatorPredicate()

    @Before
    fun setUp() {
        MockitoAnnotations.initMocks(this)

        methods.add(francaMethod)
        `when`(francaInterface.methods).thenReturn(methods)
        `when`(francaMethod.inArgs).thenReturn(arguments)
        `when`(otherMethod.inArgs).thenReturn(otherArguments)

        `when`(francaModel.name).thenReturn("")
        `when`(francaInterface.name).thenReturn("")
        `when`(francaMethod.name).thenReturn("")

        `when`(francaInterface.eContainer()).thenReturn(francaModel)
        `when`(francaMethod.eContainer()).thenReturn(francaInterface)
        `when`(otherMethod.eContainer()).thenReturn(francaInterface)
    }

    @Test
    fun validateWithOneRegularMethod() {
        assertNull(validatorPredicate.validate(deploymentModel, francaInterface))
    }

    @Test
    fun validateWithTwoRegularMethods() {
        methods.add(otherMethod)

        assertNull(validatorPredicate.validate(deploymentModel, francaInterface))
    }

    @Test
    fun validateWithOneConstructor() {
        `when`(deploymentModel.isConstructor(any())).thenReturn(true)

        assertNull(validatorPredicate.validate(deploymentModel, francaInterface))
    }

    @Test
    fun validateWithTwoConstructors() {
        `when`(deploymentModel.isConstructor(any())).thenReturn(true)
        methods.add(otherMethod)

        assertNotNull(validatorPredicate.validate(deploymentModel, francaInterface))
    }

    @Test
    fun validateWithOneConstructorAndOneRegularMethod() {
        `when`(deploymentModel.isConstructor(francaMethod)).thenReturn(true)
        methods.add(otherMethod)

        assertNull(validatorPredicate.validate(deploymentModel, francaInterface))
    }

    @Test
    fun validateWithTwoConstructorsDifferentSignatures() {
        `when`(deploymentModel.isConstructor(any())).thenReturn(true)
        methods.add(otherMethod)
        val francaArgument = mock(FArgument::class.java, RETURNS_DEEP_STUBS)
        `when`(francaArgument.type.predefined).thenReturn(FBasicTypeId.BOOLEAN)
        arguments.add(francaArgument)

        assertNull(validatorPredicate.validate(deploymentModel, francaInterface))
    }

    @Test
    fun validateWithConstructorOverloading() {
        `when`(deploymentModel.isConstructor(any())).thenReturn(true)
        val parentInterface = mock(FInterface::class.java)
        val parentMethods = ArrayEList<FMethod>(asList(otherMethod))
        `when`(parentInterface.methods).thenReturn(parentMethods)
        `when`(francaInterface.base).thenReturn(parentInterface)

        assertNull(validatorPredicate.validate(deploymentModel, francaInterface))
    }
}
