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
import io.mockk.MockKAnnotations
import io.mockk.every
import io.mockk.impl.annotations.MockK
import io.mockk.mockk
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

@RunWith(JUnit4::class)
class MethodVisibilityValidatorPredicateTest {
    @MockK
    private lateinit var francaMethod: FMethod
    @MockK
    private lateinit var francaArgument: FArgument
    @MockK
    private lateinit var francaTypeRef: FTypeRef
    @MockK
    private lateinit var francaType: FType
    @MockK
    private lateinit var francaEnum: FEnumerationType
    @MockK
    private lateinit var francaTypeCollection: FTypeCollection
    @MockK
    private lateinit var francaModel: FModel

    @MockK
    private lateinit var deploymentModel: FrancaDeploymentModel

    private val inArgs = ArrayEList<FArgument>()
    private val outArgs = ArrayEList<FArgument>()

    private val validatorPredicate = MethodVisibilityValidatorPredicate()

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)

        every { francaModel.name } returns ""
        every { francaTypeCollection.name } returns ""
        every { francaEnum.name } returns ""
        every { francaType.name } returns ""
        every { francaArgument.name } returns ""
        every { francaMethod.name } returns ""

        every { francaTypeCollection.eContainer() } returns francaModel
        every { francaEnum.eContainer() } returns francaTypeCollection
        every { francaType.eContainer() } returns francaTypeCollection
        every { francaArgument.eContainer() } returns francaMethod
        every { francaMethod.eContainer() } returns francaTypeCollection

        every { francaArgument.type } returns francaTypeRef
        every { francaTypeRef.derived } returns francaType

        every { francaMethod.inArgs } returns inArgs
        every { francaMethod.outArgs } returns outArgs
        every { francaMethod.errorEnum } returns francaEnum
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
        every { deploymentModel.isInternal(francaArgument) } returns true

        assertNotNull(validatorPredicate.validate(deploymentModel, francaMethod))
    }

    @Test
    fun validateInternalMethodWithPublicInArg() {
        inArgs.add(francaArgument)
        every { deploymentModel.isInternal(francaMethod) } returns true

        assertNull(validatorPredicate.validate(deploymentModel, francaMethod))
    }

    @Test
    fun validateInternalMethodWithInternalInArgSamePackage() {
        inArgs.add(francaArgument)
        every { deploymentModel.isInternal(any()) } returns true

        assertNull(validatorPredicate.validate(deploymentModel, francaMethod))
    }

    @Test
    fun validateInternalMethodWithInternalInArgForeignPackage() {
        val otherModel = mockk<FModel>()
        val otherTypeCollection = mockk<FTypeCollection>()
        every { otherModel.name } returns "foo"
        every { otherTypeCollection.name } returns ""
        every { otherTypeCollection.eContainer() } returns otherModel
        every { francaArgument.eContainer() } returns otherTypeCollection
        inArgs.add(francaArgument)
        every { deploymentModel.isInternal(any()) } returns true

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
        every { deploymentModel.isInternal(francaArgument) } returns true

        assertNotNull(validatorPredicate.validate(deploymentModel, francaMethod))
    }

    @Test
    fun validateInternalMethodWithPublicOutArg() {
        outArgs.add(francaArgument)
        every { deploymentModel.isInternal(francaMethod) } returns true

        assertNull(validatorPredicate.validate(deploymentModel, francaMethod))
    }

    @Test
    fun validateInternalMethodWithInternalOutArgSamePackage() {
        outArgs.add(francaArgument)
        every { deploymentModel.isInternal(any()) } returns true

        assertNull(validatorPredicate.validate(deploymentModel, francaMethod))
    }

    @Test
    fun validateInternalMethodWithInternalOutArgForeignPackage() {
        val otherModel = mockk<FModel>()
        val otherTypeCollection = mockk<FTypeCollection>()
        every { otherModel.name } returns "foo"
        every { otherTypeCollection.name } returns ""
        every { otherTypeCollection.eContainer() } returns otherModel
        every { francaArgument.eContainer() } returns otherTypeCollection
        outArgs.add(francaArgument)
        every { deploymentModel.isInternal(any()) } returns true

        assertNotNull(validatorPredicate.validate(deploymentModel, francaMethod))
    }

    // Error enum

    @Test
    fun validatePublicMethodWithPublicErrorEnum() {
        every { francaMethod.errorEnum } returns francaEnum

        assertNull(validatorPredicate.validate(deploymentModel, francaMethod))
    }

    @Test
    fun validatePublicMethodWithInternalErrorEnum() {
        every { francaMethod.errorEnum } returns francaEnum
        every { deploymentModel.isInternal(francaEnum) } returns true

        assertNotNull(validatorPredicate.validate(deploymentModel, francaMethod))
    }

    @Test
    fun validateInternalMethodWithPublicErrorEnum() {
        every { francaMethod.errorEnum } returns francaEnum
        every { deploymentModel.isInternal(francaMethod) } returns true

        assertNull(validatorPredicate.validate(deploymentModel, francaMethod))
    }

    @Test
    fun validateInternalMethodWithInternalErrorEnumSamePackage() {
        every { francaMethod.errorEnum } returns francaEnum
        every { deploymentModel.isInternal(any()) } returns true

        assertNull(validatorPredicate.validate(deploymentModel, francaMethod))
    }

    @Test
    fun validateInternalMethodWithInternalErrorEnumForeignPackage() {
        val otherModel = mockk<FModel>()
        val otherTypeCollection = mockk<FTypeCollection>()
        every { otherModel.name } returns "foo"
        every { otherTypeCollection.name } returns ""
        every { otherTypeCollection.eContainer() } returns otherModel
        every { francaEnum.eContainer() } returns otherTypeCollection
        every { deploymentModel.isInternal(any()) } returns true

        assertNotNull(validatorPredicate.validate(deploymentModel, francaMethod))
    }
}
