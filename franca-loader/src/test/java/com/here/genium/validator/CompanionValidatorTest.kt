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
import com.here.genium.test.ArrayEList
import io.mockk.MockKAnnotations
import io.mockk.every
import io.mockk.impl.annotations.MockK
import org.franca.core.franca.FConstantDef
import org.franca.core.franca.FField
import org.franca.core.franca.FInterface
import org.franca.core.franca.FMethod
import org.franca.core.franca.FModel
import org.franca.core.franca.FStructType
import org.franca.core.franca.FTypeCollection
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class CompanionValidatorTest {
    @MockK private lateinit var francaModel: FModel
    @MockK private lateinit var francaTypeCollection: FTypeCollection
    @MockK private lateinit var francaInterface: FInterface
    @MockK private lateinit var francaStruct: FStructType
    @MockK private lateinit var francaField: FField
    @MockK private lateinit var francaConstant: FConstantDef
    @MockK private lateinit var francaMethod: FMethod

    @MockK private lateinit var deploymentModel: FrancaDeploymentModel

    private lateinit var interfaces: Map<String, FInterface>

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)
        interfaces = mapOf("foo" to francaInterface)

        every { francaTypeCollection.eContainer() } returns francaModel
        every { francaInterface.eContainer() } returns francaModel
        every { francaStruct.eContainer() } returns francaTypeCollection

        every { francaStruct.elements } returns ArrayEList(listOf(francaField))
        every { francaInterface.methods } returns ArrayEList(listOf(francaMethod))

        every { deploymentModel.getCompanion(francaStruct) } returns "foo"
    }

    @Test
    fun validateCompanionNameEmpty() {
        every { deploymentModel.getCompanion(francaStruct) } returns null

        val result =
            CompanionValidator.validateCompanion(francaStruct, deploymentModel, interfaces )

        assertTrue(result.isEmpty())
    }

    @Test
    fun validateCompanionNameValid() {
        val result =
            CompanionValidator.validateCompanion(francaStruct, deploymentModel, interfaces )

        assertTrue(result.isEmpty())
    }

    @Test
    fun validateCompanionNameInvalid() {
        every { deploymentModel.getCompanion(francaStruct) } returns "bar"

        val result =
            CompanionValidator.validateCompanion(francaStruct, deploymentModel, interfaces )

        assertFalse(result.isEmpty())
    }

    @Test
    fun validateCompanionConstantsValid() {
        every { francaInterface.constants } returns ArrayEList(listOf(francaConstant))
        every { francaField.name } returns "bar"
        every { francaConstant.name } returns "baz"

        val result =
            CompanionValidator.validateCompanion(francaStruct, deploymentModel, interfaces )

        assertTrue(result.isEmpty())
    }

    @Test
    fun validateCompanionConstantsInvalid() {
        every { francaInterface.constants } returns ArrayEList(listOf(francaConstant))
        every { francaField.name } returns "bar"
        every { francaConstant.name } returns "bar"

        val result =
            CompanionValidator.validateCompanion(francaStruct, deploymentModel, interfaces )

        assertFalse(result.isEmpty())
    }

    @Test
    fun validateCompanionWithJavaBuilderNoConstructor() {
        every { deploymentModel.hasJavaBuilder(francaStruct) } returns true

        val result =
            CompanionValidator.validateCompanion(francaStruct, deploymentModel, interfaces )

        assertTrue(result.isEmpty())
    }

    @Test
    fun validateCompanionWithJavaBuilderAndConstructor() {
        every { deploymentModel.hasJavaBuilder(francaStruct) } returns true
        every { deploymentModel.isConstructor(francaMethod) } returns true

        val result =
            CompanionValidator.validateCompanion(francaStruct, deploymentModel, interfaces )

        assertFalse(result.isEmpty())
    }
}
