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

package com.here.genium.validator.visibility

import com.here.genium.franca.FrancaDeploymentModel
import io.mockk.MockKAnnotations
import io.mockk.every
import io.mockk.impl.annotations.MockK
import io.mockk.mockk
import org.franca.core.franca.FInterface
import org.franca.core.franca.FModel
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class InheritanceVisibilityValidatorPredicateTest {
    @MockK
    private lateinit var francaInterface: FInterface
    @MockK
    private lateinit var parentInterface: FInterface
    @MockK
    private lateinit var francaModel: FModel

    @MockK
    private lateinit var deploymentModel: FrancaDeploymentModel

    private val validatorPredicate = InheritanceVisibilityValidatorPredicate()

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)

        every { francaModel.name } returns ""
        every { francaInterface.name } returns ""
        every { parentInterface.name } returns ""

        every { francaInterface.eContainer() } returns francaModel
        every { parentInterface.eContainer() } returns francaModel

        every { francaInterface.base } returns parentInterface
    }

    @Test
    fun validatePublicStructWithPublicParent() =
        assertNull(validatorPredicate.validate(deploymentModel, francaInterface))

    @Test
    fun validatePublicStructWithInternalParent() {
        every { deploymentModel.isInternal(parentInterface) } returns true

        assertNotNull(validatorPredicate.validate(deploymentModel, francaInterface))
    }

    @Test
    fun validateInternalStructWithPublicParent() {
        every { deploymentModel.isInternal(francaInterface) } returns true

        assertNull(validatorPredicate.validate(deploymentModel, francaInterface))
    }

    @Test
    fun validateInternalStructWithInternalParentSamePackage() {
        every { deploymentModel.isInternal(any()) } returns true

        assertNull(validatorPredicate.validate(deploymentModel, francaInterface))
    }

    @Test
    fun validateInternalStructWithInternalParentForeignPackage() {
        val otherModel = mockk<FModel>()
        every { otherModel.name } returns "foo"
        every { parentInterface.eContainer() } returns otherModel
        every { deploymentModel.isInternal(any()) } returns true

        assertNotNull(validatorPredicate.validate(deploymentModel, francaInterface))
    }
}
