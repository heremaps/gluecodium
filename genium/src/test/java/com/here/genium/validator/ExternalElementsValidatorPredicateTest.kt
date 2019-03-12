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
import org.mockito.Mock
import org.mockito.Mockito.`when`
import org.mockito.MockitoAnnotations

@RunWith(JUnit4::class)
class ExternalElementsValidatorPredicateTest {
    @Mock
    private lateinit var fModel: FModel
    @Mock
    private lateinit var francaTypeCollection: FTypeCollection
    @Mock
    private lateinit var externalParent: FModelElement
    @Mock
    private lateinit var francaElement: FTypedElement
    @Mock
    private lateinit var francaAttribute: FAttribute

    @Mock
    private lateinit var deploymentModel: FrancaDeploymentModel

    private val validatorPredicate = ExternalElementsValidatorPredicate()

    @Before
    fun setUp() {
        MockitoAnnotations.initMocks(this)

        `when`(fModel.name).thenReturn("")
        `when`(francaTypeCollection.name).thenReturn("")
        `when`(externalParent.name).thenReturn("")
        `when`(francaElement.name).thenReturn("")
        `when`(francaAttribute.name).thenReturn("")

        `when`(francaTypeCollection.eContainer()).thenReturn(fModel)
        `when`(externalParent.eContainer()).thenReturn(francaTypeCollection)
        `when`(francaElement.eContainer()).thenReturn(externalParent)
        `when`(francaAttribute.eContainer()).thenReturn(externalParent)

        `when`(deploymentModel.isExternalType(externalParent)).thenReturn(true)
    }

    @Test
    fun validateWithExternalElementInNonExternalType() {
        `when`(deploymentModel.getExternalGetter(francaElement)).thenReturn("Bar")
        `when`(deploymentModel.getExternalSetter(francaElement)).thenReturn("Baz")
        `when`(deploymentModel.isExternalType(externalParent)).thenReturn(false)

        assertNotNull(validatorPredicate.validate(deploymentModel, francaElement))
    }

    @Test
    fun validateWithExternalGetterAndWithExternalSetter() {
        `when`(deploymentModel.getExternalGetter(francaElement)).thenReturn("Bar")
        `when`(deploymentModel.getExternalSetter(francaElement)).thenReturn("Baz")

        assertNull(validatorPredicate.validate(deploymentModel, francaElement))
    }

    @Test
    fun validateWithExternalGetterAndWithoutExternalSetter() {
        `when`(deploymentModel.getExternalGetter(francaElement)).thenReturn("Bar")

        assertNotNull(validatorPredicate.validate(deploymentModel, francaElement))
    }

    @Test
    fun validateWithoutExternalGetterAndWithExternalSetter() {
        `when`(deploymentModel.getExternalSetter(francaElement)).thenReturn("Baz")

        assertNotNull(validatorPredicate.validate(deploymentModel, francaElement))
    }

    @Test
    fun validateWithoutExternalGetterAndWithExternalSetterReadonly() {
        `when`(francaAttribute.isReadonly).thenReturn(true)
        `when`(deploymentModel.getExternalSetter(francaElement)).thenReturn("Baz")

        assertNotNull(validatorPredicate.validate(deploymentModel, francaElement))
    }

    @Test
    fun validateWithoutExternalGetterAndWithoutExternalSetter() =
        assertNull(validatorPredicate.validate(deploymentModel, francaElement))

    @Test
    fun validateNonExternalAttributeInExternalType() =
        assertNotNull(validatorPredicate.validate(deploymentModel, francaAttribute))
}
