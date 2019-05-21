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
import io.mockk.MockKAnnotations
import io.mockk.every
import io.mockk.impl.annotations.MockK
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
class StaticMethodsValidatorPredicateTest {
    @MockK
    private lateinit var francaModel: FModel
    @MockK
    private lateinit var francaInterface: FInterface
    @MockK
    private lateinit var francaMethod: FMethod

    @MockK
    private lateinit var deploymentModel: FrancaDeploymentModel

    private val validatorPredicate = StaticMethodsValidatorPredicate()

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)

        every { francaModel.name } returns ""
        every { francaInterface.name } returns ""
        every { francaMethod.name } returns ""

        every { francaInterface.eContainer() } returns francaModel
        every { francaMethod.eContainer() } returns francaInterface
    }

    @Test
    fun validateWithInstanceMethod() =
        assertNull(validatorPredicate.validate(deploymentModel, francaMethod))

    @Test
    fun validateWithStaticMethod() {
        every { deploymentModel.isStatic(francaMethod) } returns true

        assertNull(validatorPredicate.validate(deploymentModel, francaMethod))
    }

    @Test
    fun validateWithConstructorMethod() {
        every { deploymentModel.isConstructor(francaMethod) } returns true

        assertNull(validatorPredicate.validate(deploymentModel, francaMethod))
    }

    @Test
    fun validateWithIsInterfaceAndInstanceMethod() {
        every { deploymentModel.isInterface(francaInterface) } returns true

        assertNull(validatorPredicate.validate(deploymentModel, francaMethod))
    }

    @Test
    fun validateWithIsInterfaceAndStaticMethod() {
        every { deploymentModel.isInterface(francaInterface) } returns true
        every { deploymentModel.isStatic(francaMethod) } returns true

        assertNotNull(validatorPredicate.validate(deploymentModel, francaMethod))
    }

    @Test
    fun validateWithIsInterfaceAndConstructorMethod() {
        every { deploymentModel.isInterface(francaInterface) } returns true
        every { deploymentModel.isConstructor(francaMethod) } returns true

        assertNotNull(validatorPredicate.validate(deploymentModel, francaMethod))
    }
}
