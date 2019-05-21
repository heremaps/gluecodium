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
import io.mockk.MockKAnnotations
import io.mockk.every
import io.mockk.impl.annotations.MockK
import io.mockk.mockk
import org.franca.core.franca.FBasicTypeId
import org.franca.core.franca.FField
import org.franca.core.franca.FModel
import org.franca.core.franca.FStructType
import org.franca.core.franca.FTypeCollection
import org.franca.core.franca.FTypeDef
import org.franca.core.franca.FTypeRef
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class SerializationValidatorPredicateTest {
    @MockK
    private lateinit var fModel: FModel
    @MockK
    private lateinit var francaTypeCollection: FTypeCollection
    @MockK
    private lateinit var francaStructType: FStructType
    @MockK
    private lateinit var francaField: FField
    @MockK
    private lateinit var francaTypeRef: FTypeRef

    @MockK
    private lateinit var deploymentModel: FrancaDeploymentModel

    private val validatorPredicate = SerializationValidatorPredicate()

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)

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

        every { deploymentModel.isSerializable(francaStructType) } returns true
    }

    @Test
    fun validateWithFieldInNonSerializableStruct() {
        every { deploymentModel.isSerializable(francaStructType) } returns false

        assertNull(validatorPredicate.validate(deploymentModel, francaField))
    }

    @Test
    fun validateWithPrimitiveType() {
        every { francaTypeRef.predefined } returns FBasicTypeId.BOOLEAN

        assertNull(validatorPredicate.validate(deploymentModel, francaField))
    }

    @Test
    fun validateWithUndefined() =
        assertNotNull(validatorPredicate.validate(deploymentModel, francaField))

    @Test
    fun validateWithTypeDefToUndefined() {
        val undefinedTypeRef = mockk<FTypeRef>(relaxed = true)
        every { undefinedTypeRef.derived } returns null
        every { undefinedTypeRef.predefined } returns FBasicTypeId.UNDEFINED
        val francaTypeDef = mockk<FTypeDef>()
        every { francaTypeDef.actualType } returns undefinedTypeRef
        every { francaTypeRef.derived } returns francaTypeDef

        assertNotNull(validatorPredicate.validate(deploymentModel, francaField))
    }

    @Test
    fun validateWithStructType() {
        every { francaTypeRef.derived } returns mockk<FStructType>()

        assertNotNull(validatorPredicate.validate(deploymentModel, francaField))
    }

    @Test
    fun validateWithSerializableStructType() {
        val serializableStruct = mockk<FStructType>()
        every { deploymentModel.isSerializable(serializableStruct) } returns true
        every { francaTypeRef.derived } returns serializableStruct

        assertNull(validatorPredicate.validate(deploymentModel, francaField))
    }
}
