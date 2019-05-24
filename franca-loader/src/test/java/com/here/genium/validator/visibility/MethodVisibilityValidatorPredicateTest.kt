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
import com.here.genium.test.ArrayEList
import org.eclipse.emf.ecore.EObject
import org.franca.core.franca.FArgument
import org.franca.core.franca.FEnumerationType
import org.franca.core.franca.FMethod
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
    private lateinit var francaTypeCollection: FTypeCollection
    @Mock
    private lateinit var francaModel: FModel

    @Mock
    private lateinit var deploymentModel: FrancaDeploymentModel

    private val inArgs = ArrayEList<FArgument>()
    private val outArgs = ArrayEList<FArgument>()

    private val validatorPredicate =
        MethodVisibilityValidatorPredicate()

    @Before
    fun setUp() {
        MockitoAnnotations.initMocks(this)

        `when`(francaModel.name).thenReturn("")
        `when`(francaTypeCollection.name).thenReturn("")
        `when`(francaEnum.name).thenReturn("")
        `when`(francaType.name).thenReturn("")
        `when`(francaArgument.name).thenReturn("")
        `when`(francaMethod.name).thenReturn("")

        `when`(francaTypeCollection.eContainer()).thenReturn(francaModel)
        `when`(francaEnum.eContainer()).thenReturn(francaTypeCollection)
        `when`(francaType.eContainer()).thenReturn(francaTypeCollection)
        `when`(francaArgument.eContainer()).thenReturn(francaMethod)
        `when`(francaMethod.eContainer()).thenReturn(francaTypeCollection)

        `when`(francaArgument.type).thenReturn(francaTypeRef)
        `when`(francaTypeRef.derived).thenReturn(francaType)

        `when`(francaMethod.inArgs).thenReturn(inArgs)
        `when`(francaMethod.outArgs).thenReturn(outArgs)
        `when`(francaMethod.errorEnum).thenReturn(francaEnum)
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

        assertNull(validatorPredicate.validate(deploymentModel, francaMethod))
    }

    @Test
    fun validateInternalMethodWithInternalInArgForeignPackage() {
        val otherModel = mock(FModel::class.java)
        val otherTypeCollection = mock(FTypeCollection::class.java)
        `when`(otherModel.name).thenReturn("foo")
        `when`(otherTypeCollection.name).thenReturn("")
        `when`(otherTypeCollection.eContainer()).thenReturn(otherModel)
        `when`(francaArgument.eContainer()).thenReturn(otherTypeCollection)
        inArgs.add(francaArgument)
        `when`(deploymentModel.isInternal(any<EObject>())).thenReturn(true)

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

        assertNull(validatorPredicate.validate(deploymentModel, francaMethod))
    }

    @Test
    fun validateInternalMethodWithInternalOutArgForeignPackage() {
        val otherModel = mock(FModel::class.java)
        val otherTypeCollection = mock(FTypeCollection::class.java)
        `when`(otherModel.name).thenReturn("foo")
        `when`(otherTypeCollection.name).thenReturn("")
        `when`(otherTypeCollection.eContainer()).thenReturn(otherModel)
        `when`(francaArgument.eContainer()).thenReturn(otherTypeCollection)
        outArgs.add(francaArgument)
        `when`(deploymentModel.isInternal(any<EObject>())).thenReturn(true)

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

        assertNull(validatorPredicate.validate(deploymentModel, francaMethod))
    }

    @Test
    fun validateInternalMethodWithInternalErrorEnumForeignPackage() {
        val otherModel = mock(FModel::class.java)
        val otherTypeCollection = mock(FTypeCollection::class.java)
        `when`(otherModel.name).thenReturn("foo")
        `when`(otherTypeCollection.name).thenReturn("")
        `when`(otherTypeCollection.eContainer()).thenReturn(otherModel)
        `when`(francaEnum.eContainer()).thenReturn(otherTypeCollection)
        `when`(francaMethod.errorEnum).thenReturn(francaEnum)
        `when`(deploymentModel.isInternal(any<EObject>())).thenReturn(true)

        assertNotNull(validatorPredicate.validate(deploymentModel, francaMethod))
    }
}
