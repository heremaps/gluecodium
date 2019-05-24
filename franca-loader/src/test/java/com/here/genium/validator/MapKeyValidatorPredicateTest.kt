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
import org.mockito.Mock
import org.mockito.Mockito.`when`
import org.mockito.Mockito.mock
import org.mockito.MockitoAnnotations
import java.util.Arrays

@RunWith(Parameterized::class)
class MapKeyValidatorPredicateTest(
    private val typeId: FBasicTypeId?,
    private val derivedType: FType?,
    private val expectNull: Boolean
) {
    @Mock
    private lateinit var mapType: FMapType
    @Mock
    private lateinit var keyTypeRef: FTypeRef
    @Mock
    private lateinit var typeDef: FTypeDef
    @Mock
    private lateinit var typeDefRef: FTypeRef
    @Mock
    private lateinit var typeCollection: FTypeCollection
    @Mock
    private lateinit var francaModel: FModel

    @Mock
    private lateinit var deploymentModel: FrancaDeploymentModel

    @Before
    fun setUp() {
        MockitoAnnotations.initMocks(this)

        `when`(typeCollection.eContainer()).thenReturn(francaModel)
        `when`(mapType.eContainer()).thenReturn(typeCollection)
        `when`(typeDef.eContainer()).thenReturn(typeCollection)

        `when`(francaModel.name).thenReturn("")
        `when`(typeCollection.name).thenReturn("")
        `when`(mapType.name).thenReturn("MyMap")
        `when`(typeDef.name).thenReturn("")

        `when`(typeDefRef.derived).thenReturn(typeDef)
        `when`(typeDef.actualType).thenReturn(keyTypeRef)
    }

    @Test
    fun validateKeyType() {
        `when`(keyTypeRef.predefined).thenReturn(typeId)
        `when`(keyTypeRef.derived).thenReturn(derivedType)
        `when`(mapType.keyType).thenReturn(keyTypeRef)

        // act & assert
        if (expectNull) {
            assertNull(MapKeyValidatorPredicate().validate(deploymentModel, mapType))
        } else {
            assertNotNull(MapKeyValidatorPredicate().validate(deploymentModel, mapType))
        }
    }

    @Test
    fun validateTypeDefToKeyType() {
        `when`(keyTypeRef.predefined).thenReturn(typeId)
        `when`(keyTypeRef.derived).thenReturn(derivedType)
        `when`(mapType.keyType).thenReturn(typeDefRef)

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
        fun testData() = Arrays.asList(
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
            arrayOf(null, mock(FEnumerationType::class.java), true),
            arrayOf(null, mock(FStructType::class.java), false)
        )
    }
}
