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
import org.franca.core.franca.FArrayType
import org.franca.core.franca.FBasicTypeId
import org.franca.core.franca.FEnumerationType
import org.franca.core.franca.FModel
import org.franca.core.franca.FStructType
import org.franca.core.franca.FTypeCollection
import org.franca.core.franca.FTypeRef
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class SetElementValidatorPredicateTest {
    @MockK private lateinit var francaModel: FModel
    @MockK private lateinit var francaTypeCollection: FTypeCollection
    @MockK private lateinit var francaArray: FArrayType
    @MockK private lateinit var francaTypeRef: FTypeRef

    @MockK private lateinit var deploymentModel: FrancaDeploymentModel

    private val validatorPredicate = SetElementValidatorPredicate()

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)

        every { francaModel.name } returns ""
        every { francaTypeCollection.name } returns ""
        every { francaArray.name } returns ""

        every { francaTypeCollection.eContainer() } returns francaModel
        every { francaArray.eContainer() } returns francaTypeCollection

        every { francaArray.elementType } returns francaTypeRef
        every { francaTypeRef.derived } returns null
        every { deploymentModel.isSetType(francaArray) } returns true
    }

    @Test
    fun validateRegularArray() {
        every { deploymentModel.isSetType(francaArray) } returns false
        every { francaTypeRef.derived } returns mockk<FStructType>()

        val result = validatorPredicate.validate(deploymentModel, francaArray)

        assertNull(result)
    }

    @Test
    fun validateSetOfPrimitives() {
        every { francaTypeRef.predefined } returns FBasicTypeId.BOOLEAN

        val result = validatorPredicate.validate(deploymentModel, francaArray)

        assertNull(result)
    }

    @Test
    fun validateSetOfEnums() {
        every { francaTypeRef.derived } returns mockk<FEnumerationType>()

        val result = validatorPredicate.validate(deploymentModel, francaArray)

        assertNull(result)
    }

    @Test
    fun validateSetOfStructs() {
        every { francaTypeRef.derived } returns mockk<FStructType>()

        val result = validatorPredicate.validate(deploymentModel, francaArray)

        assertNotNull(result)
    }

    @Test
    fun validateSetOfByteBuffers() {
        every { francaTypeRef.predefined } returns FBasicTypeId.BYTE_BUFFER

        val result = validatorPredicate.validate(deploymentModel, francaArray)

        assertNotNull(result)
    }

    @Test
    fun validateSetOfInstances() {
        every { francaTypeRef.predefined } returns FBasicTypeId.UNDEFINED

        val result = validatorPredicate.validate(deploymentModel, francaArray)

        assertNotNull(result)
    }
}
