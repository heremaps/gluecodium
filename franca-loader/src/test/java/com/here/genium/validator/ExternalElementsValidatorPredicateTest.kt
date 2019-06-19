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
import org.franca.core.franca.FAttribute
import org.franca.core.franca.FModel
import org.franca.core.franca.FModelElement
import org.franca.core.franca.FTypeCollection
import org.franca.core.franca.FTypedElement
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class ExternalElementsValidatorPredicateTest {
    @MockK
    private lateinit var fModel: FModel
    @MockK
    private lateinit var francaTypeCollection: FTypeCollection
    @MockK
    private lateinit var externalParent: FModelElement
    @MockK
    private lateinit var francaElement: FTypedElement
    @MockK
    private lateinit var francaAttribute: FAttribute

    @MockK
    private lateinit var deploymentModel: FrancaDeploymentModel

    private val validatorPredicate = ExternalElementsValidatorPredicate()

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)

        every { fModel.name } returns ""
        every { francaTypeCollection.name } returns ""
        every { externalParent.name } returns ""
        every { francaElement.name } returns ""
        every { francaAttribute.name } returns ""

        every { francaTypeCollection.eContainer() } returns fModel
        every { externalParent.eContainer() } returns francaTypeCollection
        every { francaElement.eContainer() } returns externalParent
        every { francaAttribute.eContainer() } returns externalParent

        every { deploymentModel.isExternalType(externalParent) } returns true
        every { deploymentModel.getExternalGetter(any()) } returns null
        every { deploymentModel.getExternalSetter(any()) } returns null
        every { deploymentModel.getCppGetterName(any()) } returns null
        every { deploymentModel.getCppSetterName(any()) } returns null
    }

    @Test
    fun validateWithExternalElementInNonExternalType() {
        every { deploymentModel.getExternalGetter(francaElement) } returns "Bar"
        every { deploymentModel.getExternalSetter(francaElement) } returns "Baz"
        every { deploymentModel.isExternalType(externalParent) } returns false

        assertNotNull(validatorPredicate.validate(deploymentModel, francaElement))
    }

    @Test
    fun validateWithExternalGetterAndWithExternalSetter() {
        every { deploymentModel.getExternalGetter(francaElement) } returns "Bar"
        every { deploymentModel.getExternalSetter(francaElement) } returns "Baz"

        assertNull(validatorPredicate.validate(deploymentModel, francaElement))
    }

    @Test
    fun validateWithExternalGetterAndWithoutExternalSetter() {
        every { deploymentModel.getExternalGetter(francaElement) } returns "Bar"

        assertNotNull(validatorPredicate.validate(deploymentModel, francaElement))
    }

    @Test
    fun validateWithoutExternalGetterAndWithExternalSetter() {
        every { deploymentModel.getExternalSetter(francaElement) } returns "Baz"

        assertNotNull(validatorPredicate.validate(deploymentModel, francaElement))
    }

    @Test
    fun validateWithExternalGetterAndWithoutExternalSetterReadonly() {
        every { francaAttribute.isReadonly } returns true
        every { deploymentModel.getExternalGetter(francaAttribute) } returns "Bar"

        assertNull(validatorPredicate.validate(deploymentModel, francaAttribute))
    }

    @Test
    fun validateWithoutExternalGetterAndWithExternalSetterReadonly() {
        every { francaAttribute.isReadonly } returns true
        every { deploymentModel.getExternalSetter(francaAttribute) } returns "Baz"

        assertNotNull(validatorPredicate.validate(deploymentModel, francaAttribute))
    }

    @Test
    fun validateWithoutExternalGetterAndWithoutExternalSetter() =
        assertNull(validatorPredicate.validate(deploymentModel, francaElement))

    @Test
    fun validateNonExternalAttributeInExternalType() =
        assertNotNull(validatorPredicate.validate(deploymentModel, francaAttribute))

    @Test
    fun validateWithExternalGetterAndSetterAndCppGetterName() {
        every { deploymentModel.getExternalGetter(francaAttribute) } returns "Bar"
        every { deploymentModel.getExternalSetter(francaAttribute) } returns "Baz"
        every { deploymentModel.getCppGetterName(francaAttribute) } returns "Foo"

        assertNotNull(validatorPredicate.validate(deploymentModel, francaAttribute))
    }

    @Test
    fun validateWithExternalGetterAndSetterAndCppSetterName() {
        every { deploymentModel.getExternalGetter(francaAttribute) } returns "Bar"
        every { deploymentModel.getExternalSetter(francaAttribute) } returns "Baz"
        every { deploymentModel.getCppSetterName(francaAttribute) } returns "Foo"

        assertNotNull(validatorPredicate.validate(deploymentModel, francaAttribute))
    }
}
