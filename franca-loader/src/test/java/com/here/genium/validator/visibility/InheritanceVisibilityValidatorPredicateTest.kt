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
import org.franca.core.franca.FInterface
import org.franca.core.franca.FModel
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
class InheritanceVisibilityValidatorPredicateTest {
    @Mock
    private lateinit var francaInterface: FInterface
    @Mock
    private lateinit var parentInterface: FInterface
    @Mock
    private lateinit var francaModel: FModel

    @Mock
    private lateinit var deploymentModel: FrancaDeploymentModel

    private val validatorPredicate = InheritanceVisibilityValidatorPredicate()

    @Before
    fun setUp() {
        MockitoAnnotations.initMocks(this)

        `when`(francaModel.name).thenReturn("")
        `when`(francaInterface.name).thenReturn("")
        `when`(parentInterface.name).thenReturn("")

        `when`(francaInterface.eContainer()).thenReturn(francaModel)
        `when`(parentInterface.eContainer()).thenReturn(francaModel)

        `when`(francaInterface.base).thenReturn(parentInterface)
    }

    @Test
    fun validatePublicStructWithPublicParent() =
        assertNull(validatorPredicate.validate(deploymentModel, francaInterface))

    @Test
    fun validatePublicStructWithInternalParent() {
        `when`(deploymentModel.isInternal(parentInterface)).thenReturn(true)

        assertNotNull(validatorPredicate.validate(deploymentModel, francaInterface))
    }

    @Test
    fun validateInternalStructWithPublicParent() {
        `when`(deploymentModel.isInternal(francaInterface)).thenReturn(true)

        assertNull(validatorPredicate.validate(deploymentModel, francaInterface))
    }

    @Test
    fun validateInternalStructWithInternalParentSamePackage() {
        `when`(deploymentModel.isInternal(any<EObject>())).thenReturn(true)

        assertNull(validatorPredicate.validate(deploymentModel, francaInterface))
    }

    @Test
    fun validateInternalStructWithInternalParentForeignPackage() {
        val otherModel = mock(FModel::class.java)
        `when`(otherModel.name).thenReturn("foo")
        `when`(parentInterface.eContainer()).thenReturn(otherModel)
        `when`(deploymentModel.isInternal(any<EObject>())).thenReturn(true)

        assertNotNull(validatorPredicate.validate(deploymentModel, francaInterface))
    }
}
