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
import org.franca.core.franca.FField
import org.franca.core.franca.FModel
import org.franca.core.franca.FType
import org.franca.core.franca.FTypeCollection
import org.franca.core.franca.FTypeRef
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class FieldVisibilityValidatorPredicateTest {
    @MockK
    private lateinit var francaTypeRef: FTypeRef
    @MockK
    private lateinit var francaType: FType
    @MockK
    private lateinit var francaField: FField
    @MockK
    private lateinit var francaTypeCollection: FTypeCollection
    @MockK
    private lateinit var francaModel: FModel

    @MockK
    private lateinit var deploymentModel: FrancaDeploymentModel

    private val validatorPredicate = FieldVisibilityValidatorPredicate()

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)

        every { francaModel.name } returns ""
        every { francaTypeCollection.name } returns ""
        every { francaType.name } returns ""
        every { francaField.name } returns ""

        every { francaTypeCollection.eContainer() } returns francaModel
        every { francaType.eContainer() } returns francaTypeCollection
        every { francaField.eContainer() } returns francaTypeCollection

        every { francaField.type } returns francaTypeRef
        every { francaTypeRef.derived } returns francaType
    }

    @Test
    fun validatePublicFieldWithPublicType() =
        assertNull(validatorPredicate.validate(deploymentModel, francaField))

    @Test
    fun validatePublicFieldWithInternalType() {
        every { deploymentModel.isInternal(francaType) } returns true

        assertNotNull(validatorPredicate.validate(deploymentModel, francaField))
    }

    @Test
    fun validateInternalFieldWithPublicType() {
        every { deploymentModel.isInternal(francaField) } returns true

        assertNull(validatorPredicate.validate(deploymentModel, francaField))
    }

    @Test
    fun validateInternalFieldWithInternalTypeSamePackage() {
        every { deploymentModel.isInternal(any()) } returns true

        assertNull(validatorPredicate.validate(deploymentModel, francaField))
    }

    @Test
    fun validateInternalFieldWithInternalTypeForeignPackage() {
        val otherModel = mockk<FModel>()
        val otherTypeCollection = mockk<FTypeCollection>()
        every { otherModel.name } returns "foo"
        every { otherTypeCollection.name } returns ""
        every { otherTypeCollection.eContainer() } returns otherModel
        every { francaType.eContainer() } returns otherTypeCollection
        every { deploymentModel.isInternal(any()) } returns true

        assertNotNull(validatorPredicate.validate(deploymentModel, francaField))
    }
}
