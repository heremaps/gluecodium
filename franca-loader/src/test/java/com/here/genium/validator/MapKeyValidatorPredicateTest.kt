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
import org.franca.core.franca.FEnumerationType
import org.franca.core.franca.FMapType
import org.franca.core.franca.FModel
import org.franca.core.franca.FStructType
import org.franca.core.franca.FType
import org.franca.core.franca.FTypeCollection
import org.franca.core.franca.FTypeDef
import org.franca.core.franca.FTypeRef
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

@RunWith(Parameterized::class)
class MapKeyValidatorPredicateTest(
    private val typeId: FBasicTypeId?,
    private val derivedType: FType?,
    private val expectNull: Boolean
) {
    @MockK
    private lateinit var mapType: FMapType
    @MockK
    private lateinit var keyTypeRef: FTypeRef
    @MockK
    private lateinit var typeDef: FTypeDef
    @MockK
    private lateinit var typeDefRef: FTypeRef
    @MockK
    private lateinit var typeCollection: FTypeCollection
    @MockK
    private lateinit var francaModel: FModel

    @MockK
    private lateinit var deploymentModel: FrancaDeploymentModel

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)

        every { typeCollection.eContainer() } returns francaModel
        every { mapType.eContainer() } returns typeCollection
        every { typeDef.eContainer() } returns typeCollection

        every { francaModel.name } returns ""
        every { typeCollection.name } returns ""
        every { mapType.name } returns "MyMap"
        every { typeDef.name } returns ""

        every { typeDefRef.derived } returns typeDef
        every { typeDef.actualType } returns keyTypeRef
    }

    @Test
    fun validateKeyType() {
        every { keyTypeRef.predefined } returns typeId
        every { keyTypeRef.derived } returns derivedType
        every { mapType.keyType } returns keyTypeRef

        // act & assert
        if (expectNull) {
            assertNull(MapKeyValidatorPredicate().validate(deploymentModel, mapType))
        } else {
            assertNotNull(MapKeyValidatorPredicate().validate(deploymentModel, mapType))
        }
    }

    @Test
    fun validateTypeDefToKeyType() {
        every { keyTypeRef.predefined } returns typeId
        every { keyTypeRef.derived } returns derivedType
        every { mapType.keyType } returns typeDefRef

        // act & assert
        if (expectNull) {
            assertNull(MapKeyValidatorPredicate().validate(deploymentModel, mapType))
        } else {
            assertNotNull(MapKeyValidatorPredicate().validate(deploymentModel, mapType))
        }
    }

    companion object {
        @JvmStatic
        @Parameterized.Parameters
        fun testData() = listOf(
            arrayOf(FBasicTypeId.BOOLEAN, null, true),
            arrayOf(FBasicTypeId.FLOAT, null, true),
            arrayOf(FBasicTypeId.DOUBLE, null, true),
            arrayOf(FBasicTypeId.INT8, null, true),
            arrayOf(FBasicTypeId.INT16, null, true),
            arrayOf(FBasicTypeId.INT32, null, true),
            arrayOf(FBasicTypeId.INT64, null, true),
            arrayOf(FBasicTypeId.UINT8, null, true),
            arrayOf(FBasicTypeId.UINT16, null, true),
            arrayOf(FBasicTypeId.UINT32, null, true),
            arrayOf(FBasicTypeId.UINT64, null, true),
            arrayOf(FBasicTypeId.STRING, null, true),
            arrayOf(FBasicTypeId.BYTE_BUFFER, null, false),
            arrayOf(FBasicTypeId.UNDEFINED, null, false),
            arrayOf(null, mockk<FEnumerationType>(), true),
            arrayOf(null, mockk<FStructType>(), false)
        )
    }
}
