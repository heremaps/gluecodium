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
import com.here.genium.franca.SpecialTypeRules
import io.mockk.MockKAnnotations
import io.mockk.every
import io.mockk.impl.annotations.MockK
import io.mockk.mockk
import io.mockk.mockkStatic
import io.mockk.unmockkAll
import org.franca.core.franca.FBasicTypeId
import org.franca.core.franca.FField
import org.franca.core.franca.FInterface
import org.franca.core.franca.FModel
import org.franca.core.franca.FStructType
import org.franca.core.franca.FTypeCollection
import org.franca.core.franca.FTypeDef
import org.franca.core.franca.FTypeRef
import org.junit.After
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class EquatableValidatorPredicateTest {
    @MockK
    private lateinit var fModel: FModel
    @MockK
    private lateinit var francaTypeCollection: FTypeCollection
    @MockK
    private lateinit var francaInterface: FInterface
    @MockK
    private lateinit var francaStructType: FStructType
    @MockK
    private lateinit var francaField: FField
    @MockK
    private lateinit var francaTypeRef: FTypeRef

    @MockK
    private lateinit var deploymentModel: FrancaDeploymentModel

    private val validatorPredicate = EquatableValidatorPredicate()

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)
        mockkStatic(SpecialTypeRules::class)

        every { fModel.name } returns ""
        every { francaTypeCollection.name } returns ""
        every { francaStructType.name } returns ""
        every { francaField.name } returns ""

        every { francaTypeCollection.eContainer() } returns fModel
        every { francaStructType.eContainer() } returns francaTypeCollection
        every { francaField.eContainer() } returns francaStructType

        every { francaField.type } returns francaTypeRef
        every { francaTypeRef.derived } returns null
        every { francaTypeRef.predefined } returns FBasicTypeId.UNDEFINED

        every { deploymentModel.isEquatable(francaStructType) } returns true
    }

    @After
    fun tearDown() {
        unmockkAll()
    }

    @Test
    fun validateWithFieldInNonEquatableStruct() {
        every { deploymentModel.isEquatable(francaStructType) } returns false

        assertNull(validatorPredicate.validate(deploymentModel, francaField))
    }

    @Test
    fun validateWithPrimitiveType() {
        every { francaTypeRef.predefined } returns FBasicTypeId.BOOLEAN

        assertNull(validatorPredicate.validate(deploymentModel, francaField))
    }

    @Test
    fun validateWithInterface() {
        mockInterface()

        assertNotNull(validatorPredicate.validate(deploymentModel, francaField))
    }

    @Test
    fun validateWithEquatableInterface() {
        mockInterface()
        every { deploymentModel.isEquatable(francaInterface) } returns true

        assertNull(validatorPredicate.validate(deploymentModel, francaField))
    }

    @Test
    fun validateWithPointerEquatableInterface() {
        mockInterface()
        every { deploymentModel.isPointerEquatable(francaInterface) } returns true

        assertNull(validatorPredicate.validate(deploymentModel, francaField))
    }

    @Test
    fun validateWithStructType() {
        every { francaTypeRef.derived } returns mockk<FStructType>()

        assertNotNull(validatorPredicate.validate(deploymentModel, francaField))
    }

    @Test
    fun validateWithEquatableStructType() {
        val equatableStruct = mockk<FStructType>()
        every { deploymentModel.isEquatable(equatableStruct) } returns true
        every { francaTypeRef.derived } returns equatableStruct

        assertNull(validatorPredicate.validate(deploymentModel, francaField))
    }

    private fun mockInterface() {
        val undefinedTypeRef = mockk<FTypeRef>()
        val francaTypeDef = mockk<FTypeDef>()
        every { undefinedTypeRef.derived } returns null
        every { undefinedTypeRef.predefined } returns FBasicTypeId.UNDEFINED
        every { francaTypeDef.actualType } returns undefinedTypeRef
        every { francaTypeRef.derived } returns francaTypeDef
        every { francaTypeDef.eContainer() } returns francaInterface
        every { SpecialTypeRules.isInstanceId(francaTypeRef) } returns true
    }
}
