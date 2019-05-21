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
import org.franca.core.franca.FModel
import org.franca.core.franca.FModelElement
import org.franca.core.franca.FTypeCollection
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class ExternalTypesValidatorPredicateTest {
    @MockK
    private lateinit var fModel: FModel
    @MockK
    private lateinit var francaTypeCollection: FTypeCollection
    @MockK
    private lateinit var francaElement: FModelElement

    @MockK
    private lateinit var deploymentModel: FrancaDeploymentModel

    private val validatorPredicate = ExternalTypesValidatorPredicate()

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)

        every { fModel.name } returns ""
        every { francaTypeCollection.name } returns ""
        every { francaElement.name } returns ""

        every { francaTypeCollection.eContainer() } returns fModel
        every { francaElement.eContainer() } returns francaTypeCollection
    }

    @Test
    fun validateWithExternalNameAndWithExternalType() {
        every { deploymentModel.getExternalName(francaElement) } returns "Bar"
        every { deploymentModel.isExternalType(francaElement) } returns true

        assertNull(validatorPredicate.validate(deploymentModel, francaElement))
    }

    @Test
    fun validateWithExternalNameAndWithoutExternalType() {
        every { deploymentModel.getExternalName(francaElement) } returns "Bar"

        assertNotNull(validatorPredicate.validate(deploymentModel, francaElement))
    }

    @Test
    fun validateWithoutExternalNameAndWithExternalType() {
        every { deploymentModel.isExternalType(francaElement) } returns true

        assertNull(validatorPredicate.validate(deploymentModel, francaElement))
    }

    @Test
    fun validateWithoutExternalNameAndWithoutExternalType() {
        every { deploymentModel.getExternalName(francaElement) } returns null

        assertNull(validatorPredicate.validate(deploymentModel, francaElement))
    }
}
