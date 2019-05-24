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
import org.eclipse.emf.ecore.EObject
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
import org.mockito.ArgumentMatchers.any
import org.mockito.Mock
import org.mockito.Mockito.`when`
import org.mockito.Mockito.mock
import org.mockito.MockitoAnnotations

@RunWith(JUnit4::class)
class FieldVisibilityValidatorPredicateTest {
    @Mock
    private lateinit var francaTypeRef: FTypeRef
    @Mock
    private lateinit var francaType: FType
    @Mock
    private lateinit var francaField: FField
    @Mock
    private lateinit var francaTypeCollection: FTypeCollection
    @Mock
    private lateinit var francaModel: FModel

    @Mock
    private lateinit var deploymentModel: FrancaDeploymentModel

    private val validatorPredicate = FieldVisibilityValidatorPredicate()

    @Before
    fun setUp() {
        MockitoAnnotations.initMocks(this)

        `when`(francaModel.name).thenReturn("")
        `when`(francaTypeCollection.name).thenReturn("")
        `when`(francaType.name).thenReturn("")
        `when`(francaField.name).thenReturn("")

        `when`(francaTypeCollection.eContainer()).thenReturn(francaModel)
        `when`(francaType.eContainer()).thenReturn(francaTypeCollection)
        `when`(francaField.eContainer()).thenReturn(francaTypeCollection)

        `when`(francaField.type).thenReturn(francaTypeRef)
        `when`(francaTypeRef.derived).thenReturn(francaType)
    }

    @Test
    fun validatePublicFieldWithPublicType() =
        assertNull(validatorPredicate.validate(deploymentModel, francaField))

    @Test
    fun validatePublicFieldWithInternalType() {
        `when`(deploymentModel.isInternal(francaType)).thenReturn(true)

        assertNotNull(validatorPredicate.validate(deploymentModel, francaField))
    }

    @Test
    fun validateInternalFieldWithPublicType() {
        `when`(deploymentModel.isInternal(francaField)).thenReturn(true)

        assertNull(validatorPredicate.validate(deploymentModel, francaField))
    }

    @Test
    fun validateInternalFieldWithInternalTypeSamePackage() {
        `when`(deploymentModel.isInternal(any<EObject>())).thenReturn(true)

        assertNull(validatorPredicate.validate(deploymentModel, francaField))
    }

    @Test
    fun validateInternalFieldWithInternalTypeForeignPackage() {
        val otherModel = mock(FModel::class.java)
        val otherTypeCollection = mock(FTypeCollection::class.java)
        `when`(otherModel.name).thenReturn("foo")
        `when`(otherTypeCollection.name).thenReturn("")
        `when`(otherTypeCollection.eContainer()).thenReturn(otherModel)
        `when`(francaType.eContainer()).thenReturn(otherTypeCollection)
        `when`(deploymentModel.isInternal(any<EObject>())).thenReturn(true)

        assertNotNull(validatorPredicate.validate(deploymentModel, francaField))
    }
}
