/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
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
import org.franca.core.franca.FArrayType
import org.franca.core.franca.FModelElement
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
class ArrayVisibilityValidatorPredicateTest {
    @Mock
    private lateinit var francaTypeRef: FTypeRef
    @Mock
    private lateinit var francaType: FType
    @Mock
    private lateinit var francaArray: FArrayType

    @Mock
    private lateinit var deploymentModel: FrancaDeploymentModel

    private val validatorPredicate = ArrayVisibilityValidatorPredicate()

    @Before
    fun setUp() {
        MockitoAnnotations.initMocks(this)
        PowerMockito.mockStatic(FrancaTypeHelper::class.java)

        `when`(FrancaTypeHelper.getFullName(any<FModelElement>())).thenReturn("")

        `when`(francaArray.elementType).thenReturn(francaTypeRef)
        `when`(francaTypeRef.derived).thenReturn(francaType)
    }

    @Test
    fun validatePublicArrayWithPublicElementType() =
        assertNull(validatorPredicate.validate(deploymentModel, francaArray))

    @Test
    fun validatePublicArrayWithInternalElementType() {
        `when`(deploymentModel.isInternal(francaType)).thenReturn(true)

        assertNotNull(validatorPredicate.validate(deploymentModel, francaArray))
    }

    @Test
    fun validateInternalArrayWithPublicElementType() {
        `when`(deploymentModel.isInternal(francaArray)).thenReturn(true)

        assertNull(validatorPredicate.validate(deploymentModel, francaArray))
    }

    @Test
    fun validateInternalArrayWithInternalElementTypeSamePackage() {
        `when`(deploymentModel.isInternal(any<EObject>())).thenReturn(true)
        `when`(
            FrancaTypeHelper.haveSamePackage(
                any<FModelElement>(),
                any<FModelElement>()
            )
        ).thenReturn(true)

        assertNull(validatorPredicate.validate(deploymentModel, francaArray))
    }

    @Test
    fun validateInternalArrayWithInternalElementTypeForeignPackage() {
        `when`(deploymentModel.isInternal(any<EObject>())).thenReturn(true)
        `when`(
            FrancaTypeHelper.haveSamePackage(
                any<FModelElement>(),
                any<FModelElement>()
            )
        ).thenReturn(false)

        assertNotNull(validatorPredicate.validate(deploymentModel, francaArray))
    }
}
