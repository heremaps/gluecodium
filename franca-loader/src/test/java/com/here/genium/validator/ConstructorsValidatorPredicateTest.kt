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
import com.here.genium.test.ArrayEList
import io.mockk.MockKAnnotations
import io.mockk.every
import io.mockk.impl.annotations.MockK
import io.mockk.mockk
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

@RunWith(JUnit4::class)
class ConstructorsValidatorPredicateTest {
    @MockK
    private lateinit var francaModel: FModel
    @MockK
    private lateinit var francaInterface: FInterface
    @MockK
    private lateinit var francaMethod: FMethod
    @MockK
    private lateinit var otherMethod: FMethod

    @MockK
    private lateinit var deploymentModel: FrancaDeploymentModel

    private val methods = ArrayEList<FMethod>()
    private val arguments = ArrayEList<FArgument>()
    private val otherArguments = ArrayEList<FArgument>()

    private val validatorPredicate = ConstructorsValidatorPredicate()

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)

        methods.add(francaMethod)
        every { francaInterface.methods } returns methods
        every { francaMethod.inArgs } returns arguments
        every { otherMethod.inArgs } returns otherArguments

        every { francaModel.name } returns ""
        every { francaInterface.name } returns ""
        every { francaMethod.name } returns "foo"
        every { otherMethod.name } returns "bar"

        every { francaInterface.eContainer() } returns francaModel
        every { francaMethod.eContainer() } returns francaInterface
        every { otherMethod.eContainer() } returns francaInterface
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
        every { deploymentModel.isConstructor(any()) } returns true

        assertNull(validatorPredicate.validate(deploymentModel, francaInterface))
    }

    @Test
    fun validateWithTwoConstructors() {
        every { deploymentModel.isConstructor(any()) } returns true
        methods.add(otherMethod)

        assertNotNull(validatorPredicate.validate(deploymentModel, francaInterface))
    }

    @Test
    fun validateWithOneConstructorAndOneRegularMethod() {
        every { deploymentModel.isConstructor(francaMethod) } returns true
        methods.add(otherMethod)

        assertNull(validatorPredicate.validate(deploymentModel, francaInterface))
    }

    @Test
    fun validateWithTwoConstructorsDifferentSignatures() {
        every { deploymentModel.isConstructor(any()) } returns true
        methods.add(otherMethod)
        val francaArgument = mockk<FArgument>(relaxed = true)
        every { francaArgument.type.derived } returns null
        every { francaArgument.type.predefined } returns FBasicTypeId.BOOLEAN
        arguments.add(francaArgument)

        assertNull(validatorPredicate.validate(deploymentModel, francaInterface))
    }

    @Test
    fun validateWithConstructorOverloading() {
        every { deploymentModel.isConstructor(any()) } returns true
        val parentInterface = mockk<FInterface>()
        val parentMethods = ArrayEList(listOf(otherMethod))
        every { parentInterface.methods } returns parentMethods
        every { francaInterface.base } returns parentInterface

        assertNull(validatorPredicate.validate(deploymentModel, francaInterface))
    }
}
