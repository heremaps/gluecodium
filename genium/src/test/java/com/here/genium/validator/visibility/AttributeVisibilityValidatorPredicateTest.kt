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

import com.here.genium.common.FrancaTypeHelper
import com.here.genium.model.franca.FrancaDeploymentModel
import org.eclipse.emf.ecore.EObject
import org.franca.core.franca.FAttribute
import org.franca.core.franca.FType
import org.franca.core.franca.FTypeRef
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.mockito.ArgumentMatchers.any
import org.mockito.Mock
import org.mockito.Mockito.`when`
import org.mockito.MockitoAnnotations
import org.powermock.api.mockito.PowerMockito
import org.powermock.core.classloader.annotations.PrepareForTest
import org.powermock.modules.junit4.PowerMockRunner

@RunWith(PowerMockRunner::class)
@PrepareForTest(FrancaTypeHelper::class)
class AttributeVisibilityValidatorPredicateTest {
    @Mock
    private lateinit var francaTypeRef: FTypeRef
    @Mock
    private lateinit var francaType: FType
    @Mock
    private lateinit var francaAttribute: FAttribute

    @Mock
    private lateinit var deploymentModel: FrancaDeploymentModel

    private val validatorPredicate = AttributeVisibilityValidatorPredicate()

    @Before
    fun setUp() {
        MockitoAnnotations.initMocks(this)
        PowerMockito.mockStatic(FrancaTypeHelper::class.java)

        `when`(FrancaTypeHelper.getFullName(any())).thenReturn("")

        `when`(francaAttribute.type).thenReturn(francaTypeRef)
        `when`(francaTypeRef.derived).thenReturn(francaType)
    }

    @Test
    fun validatePublicAttributeWithPublicType() =
        assertNull(validatorPredicate.validate(deploymentModel, francaAttribute))

    @Test
    fun validatePublicAttributeWithInternalType() {
        `when`(deploymentModel.isInternal(francaType)).thenReturn(true)

        assertNotNull(validatorPredicate.validate(deploymentModel, francaAttribute))
    }

    @Test
    fun validateInternalAttributeWithPublicType() {
        `when`(deploymentModel.isInternal(francaAttribute)).thenReturn(true)

        assertNull(validatorPredicate.validate(deploymentModel, francaAttribute))
    }

    @Test
    fun validateInternalAttributeWithInternalTypeSamePackage() {
        `when`(deploymentModel.isInternal(any<EObject>())).thenReturn(true)
        `when`(FrancaTypeHelper.haveSamePackage(any(), any())).thenReturn(true)

        assertNull(validatorPredicate.validate(deploymentModel, francaAttribute))
    }

    @Test
    fun validateInternalAttributeWithInternalTypeForeignPackage() {
        `when`(deploymentModel.isInternal(any<EObject>())).thenReturn(true)
        `when`(FrancaTypeHelper.haveSamePackage(any(), any())).thenReturn(false)

        assertNotNull(validatorPredicate.validate(deploymentModel, francaAttribute))
    }
}
