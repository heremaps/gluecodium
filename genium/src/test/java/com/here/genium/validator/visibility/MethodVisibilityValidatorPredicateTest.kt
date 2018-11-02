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
import com.here.genium.test.ArrayEList
import org.eclipse.emf.ecore.EObject
import org.franca.core.franca.FArgument
import org.franca.core.franca.FEnumerationType
import org.franca.core.franca.FMethod
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
class MethodVisibilityValidatorPredicateTest {
    @Mock
    private lateinit var francaMethod: FMethod
    @Mock
    private lateinit var francaArgument: FArgument
    @Mock
    private lateinit var francaTypeRef: FTypeRef
    @Mock
    private lateinit var francaType: FType
    @Mock
    private lateinit var francaEnum: FEnumerationType

    @Mock
    private lateinit var deploymentModel: FrancaDeploymentModel

    private val inArgs = ArrayEList<FArgument>()
    private val outArgs = ArrayEList<FArgument>()

    private val validatorPredicate = MethodVisibilityValidatorPredicate()

    @Before
    fun setUp() {
        MockitoAnnotations.initMocks(this)
        PowerMockito.mockStatic(FrancaTypeHelper::class.java)

        `when`(FrancaTypeHelper.getFullName(any())).thenReturn("")

        `when`(francaArgument.type).thenReturn(francaTypeRef)
        `when`(francaTypeRef.derived).thenReturn(francaType)

        `when`(francaMethod.inArgs).thenReturn(inArgs)
        `when`(francaMethod.outArgs).thenReturn(outArgs)
    }

    // Input arguments

    @Test
    fun validatePublicMethodWithPublicInArg() {
        inArgs.add(francaArgument)

        assertNull(validatorPredicate.validate(deploymentModel, francaMethod))
    }

    @Test
    fun validatePublicMethodWithInternalInArg() {
        inArgs.add(francaArgument)
        `when`(deploymentModel.isInternal(francaArgument)).thenReturn(true)

        assertNotNull(validatorPredicate.validate(deploymentModel, francaMethod))
    }

    @Test
    fun validateInternalMethodWithPublicInArg() {
        inArgs.add(francaArgument)
        `when`(deploymentModel.isInternal(francaMethod)).thenReturn(true)

        assertNull(validatorPredicate.validate(deploymentModel, francaMethod))
    }

    @Test
    fun validateInternalMethodWithInternalInArgSamePackage() {
        inArgs.add(francaArgument)
        `when`(deploymentModel.isInternal(any<EObject>())).thenReturn(true)
        `when`(FrancaTypeHelper.haveSamePackage(any(), any())).thenReturn(true)

        assertNull(validatorPredicate.validate(deploymentModel, francaMethod))
    }

    @Test
    fun validateInternalMethodWithInternalInArgForeignPackage() {
        inArgs.add(francaArgument)
        `when`(deploymentModel.isInternal(any<EObject>())).thenReturn(true)
        `when`(FrancaTypeHelper.haveSamePackage(any(), any())).thenReturn(false)

        assertNotNull(validatorPredicate.validate(deploymentModel, francaMethod))
    }

    // Output arguments

    @Test
    fun validatePublicMethodWithPublicOutArg() {
        outArgs.add(francaArgument)

        assertNull(validatorPredicate.validate(deploymentModel, francaMethod))
    }

    @Test
    fun validatePublicMethodWithInternalOutArg() {
        outArgs.add(francaArgument)
        `when`(deploymentModel.isInternal(francaArgument)).thenReturn(true)

        assertNotNull(validatorPredicate.validate(deploymentModel, francaMethod))
    }

    @Test
    fun validateInternalMethodWithPublicOutArg() {
        outArgs.add(francaArgument)
        `when`(deploymentModel.isInternal(francaMethod)).thenReturn(true)

        assertNull(validatorPredicate.validate(deploymentModel, francaMethod))
    }

    @Test
    fun validateInternalMethodWithInternalOutArgSamePackage() {
        outArgs.add(francaArgument)
        `when`(deploymentModel.isInternal(any<EObject>())).thenReturn(true)
        `when`(FrancaTypeHelper.haveSamePackage(any(), any())).thenReturn(true)

        assertNull(validatorPredicate.validate(deploymentModel, francaMethod))
    }

    @Test
    fun validateInternalMethodWithInternalOutArgForeignPackage() {
        outArgs.add(francaArgument)
        `when`(deploymentModel.isInternal(any<EObject>())).thenReturn(true)
        `when`(FrancaTypeHelper.haveSamePackage(any(), any())).thenReturn(false)

        assertNotNull(validatorPredicate.validate(deploymentModel, francaMethod))
    }

    // Error enum

    @Test
    fun validatePublicMethodWithPublicErrorEnum() {
        `when`(francaMethod.errorEnum).thenReturn(francaEnum)

        assertNull(validatorPredicate.validate(deploymentModel, francaMethod))
    }

    @Test
    fun validatePublicMethodWithInternalErrorEnum() {
        `when`(francaMethod.errorEnum).thenReturn(francaEnum)
        `when`(deploymentModel.isInternal(francaEnum)).thenReturn(true)

        assertNotNull(validatorPredicate.validate(deploymentModel, francaMethod))
    }

    @Test
    fun validateInternalMethodWithPublicErrorEnum() {
        `when`(francaMethod.errorEnum).thenReturn(francaEnum)
        `when`(deploymentModel.isInternal(francaMethod)).thenReturn(true)

        assertNull(validatorPredicate.validate(deploymentModel, francaMethod))
    }

    @Test
    fun validateInternalMethodWithInternalErrorEnumSamePackage() {
        `when`(francaMethod.errorEnum).thenReturn(francaEnum)
        `when`(deploymentModel.isInternal(any<EObject>())).thenReturn(true)
        `when`(FrancaTypeHelper.haveSamePackage(any(), any())).thenReturn(true)

        assertNull(validatorPredicate.validate(deploymentModel, francaMethod))
    }

    @Test
    fun validateInternalMethodWithInternalErrorEnumForeignPackage() {
        `when`(francaMethod.errorEnum).thenReturn(francaEnum)
        `when`(deploymentModel.isInternal(any<EObject>())).thenReturn(true)
        `when`(FrancaTypeHelper.haveSamePackage(any(), any())).thenReturn(false)

        assertNotNull(validatorPredicate.validate(deploymentModel, francaMethod))
    }
}
