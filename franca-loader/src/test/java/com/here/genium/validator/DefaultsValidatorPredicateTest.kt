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
import io.mockk.mockk
import org.franca.core.franca.FArrayType
import org.franca.core.franca.FBasicTypeId
import org.franca.core.franca.FEnumerationType
import org.franca.core.franca.FEnumerator
import org.franca.core.franca.FField
import org.franca.core.franca.FMapType
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
class DefaultsValidatorPredicateTest {
    @MockK
    private lateinit var francaModel: FModel
    @MockK
    private lateinit var francaTypeCollection: FTypeCollection
    @MockK
    private lateinit var francaStruct: FStructType
    @MockK
    private lateinit var francaField: FField
    @MockK
    private lateinit var francaTypeRef: FTypeRef
    @MockK
    private lateinit var francaEnum: FEnumerationType

    @MockK
    private lateinit var deploymentModel: FrancaDeploymentModel

    private val validatorPredicate = DefaultsValidatorPredicate()

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)

        every { francaModel.name } returns "Foo"
        every { francaTypeCollection.name } returns "Bar"
        every { francaStruct.name } returns "Baz"
        every { francaField.name } returns "Fizz"

        every { francaModel.name } returns "Foo"
        every { francaTypeCollection.name } returns "Bar"
        every { francaStruct.name } returns "Baz"
        every { francaField.name } returns "Fizz"

        every { francaTypeCollection.eContainer() } returns francaModel
        every { francaStruct.eContainer() } returns francaTypeCollection
        every { francaField.eContainer() } returns francaStruct
        every { francaField.type } returns francaTypeRef

        every { deploymentModel.getDefaultValue(any()) } returns null

        val enumerator1 = mockk<FEnumerator>()
        every { enumerator1.name } returns "SomeEnumItem"
        val enumerator2 = mockk<FEnumerator>()
        every { enumerator2.name } returns "SomeOtherEnumItem"
        every { francaEnum.enumerators } returns ArrayEList(listOf(enumerator1, enumerator2))
    }

    @Test
    fun validateForStringNone() {
        every { francaTypeRef.predefined } returns FBasicTypeId.STRING

        val result = validatorPredicate.validate(deploymentModel, francaField)

        assertNull(result)
    }

    @Test
    fun validateForBooleanNone() {
        every { francaTypeRef.predefined } returns FBasicTypeId.BOOLEAN

        val result = validatorPredicate.validate(deploymentModel, francaField)

        assertNull(result)
    }

    @Test
    fun validateForBooleanValid() {
        every { francaTypeRef.predefined } returns FBasicTypeId.BOOLEAN
        every { deploymentModel.getDefaultValue(any()) } returns "false"

        val result = validatorPredicate.validate(deploymentModel, francaField)

        assertNull(result)
    }

    @Test
    fun validateForBooleanInvalid() {
        every { francaTypeRef.predefined } returns FBasicTypeId.BOOLEAN
        every { deploymentModel.getDefaultValue(any()) } returns "nonsense"

        val result = validatorPredicate.validate(deploymentModel, francaField)

        assertNotNull(result)
    }

    @Test
    fun validateForFloatNone() {
        every { francaTypeRef.predefined } returns FBasicTypeId.FLOAT

        val result = validatorPredicate.validate(deploymentModel, francaField)

        assertNull(result)
    }

    @Test
    fun validateForFloatValid() {
        every { francaTypeRef.predefined } returns FBasicTypeId.FLOAT
        every { deploymentModel.getDefaultValue(any()) } returns "3.14"

        val result = validatorPredicate.validate(deploymentModel, francaField)

        assertNull(result)
    }

    @Test
    fun validateForFloatInvalid() {
        every { francaTypeRef.predefined } returns FBasicTypeId.FLOAT
        every { deploymentModel.getDefaultValue(any()) } returns "nonsense"

        val result = validatorPredicate.validate(deploymentModel, francaField)

        assertNotNull(result)
    }

    @Test
    fun validateForIntegerNone() {
        every { francaTypeRef.predefined } returns FBasicTypeId.INT8

        val result = validatorPredicate.validate(deploymentModel, francaField)

        assertNull(result)
    }

    @Test
    fun validateForIntegerValid() {
        every { francaTypeRef.predefined } returns FBasicTypeId.INT8
        every { deploymentModel.getDefaultValue(any()) } returns "42"

        val result = validatorPredicate.validate(deploymentModel, francaField)

        assertNull(result)
    }

    @Test
    fun validateForIntegerValidBig() {
        every { francaTypeRef.predefined } returns FBasicTypeId.UINT32
        every { deploymentModel.getDefaultValue(any()) } returns "4294967295"

        val result = validatorPredicate.validate(deploymentModel, francaField)

        assertNull(result)
    }

    @Test
    fun validateForIntegerInvalid() {
        every { francaTypeRef.predefined } returns FBasicTypeId.INT8
        every { deploymentModel.getDefaultValue(any()) } returns "nonsense"

        val result = validatorPredicate.validate(deploymentModel, francaField)

        assertNotNull(result)
    }

    @Test
    fun validateForIntegerInvalidBig() {
        every { francaTypeRef.predefined } returns FBasicTypeId.UINT32
        every { deploymentModel.getDefaultValue(any()) } returns "109223372036854775807"

        val result = validatorPredicate.validate(deploymentModel, francaField)

        assertNotNull(result)
    }

    @Test
    fun validateForEnumNone() {
        every { francaTypeRef.derived } returns francaEnum

        val result = validatorPredicate.validate(deploymentModel, francaField)

        assertNull(result)
    }

    @Test
    fun validateForEnumValid() {
        every { francaTypeRef.derived } returns francaEnum
        every { deploymentModel.getDefaultValue(any()) } returns "SomeOtherEnumItem"

        val result = validatorPredicate.validate(deploymentModel, francaField)

        assertNull(result)
    }

    @Test
    fun validateForEnumInvalid() {
        every { francaTypeRef.derived } returns francaEnum
        every { deploymentModel.getDefaultValue(any()) } returns "nonsense"

        val result = validatorPredicate.validate(deploymentModel, francaField)

        assertNotNull(result)
    }

    @Test
    fun validateForNullableNull() {
        every { deploymentModel.isNullable(any()) } returns true
        every { deploymentModel.hasNullDefaultValue(any()) } returns true

        val result = validatorPredicate.validate(deploymentModel, francaField)

        assertNull(result)
    }

    @Test
    fun validateForNonNullableNull() {
        every { deploymentModel.hasNullDefaultValue(any()) } returns true

        val result = validatorPredicate.validate(deploymentModel, francaField)

        assertNotNull(result)
    }

    @Test
    fun validateForNullWithDefaultValue() {
        every { deploymentModel.hasNullDefaultValue(any()) } returns true
        every { deploymentModel.getDefaultValue(any()) } returns "nonsense"

        val result = validatorPredicate.validate(deploymentModel, francaField)

        assertNotNull(result)
    }

    @Test
    fun validateForImplicitArrayEmpty() {
        every { francaField.isArray } returns true
        every { deploymentModel.hasEmptyDefaultValue(any()) } returns true

        val result = validatorPredicate.validate(deploymentModel, francaField)

        assertNull(result)
    }

    @Test
    fun validateForExplicitArrayEmpty() {
        every { francaTypeRef.derived } returns mockk<FArrayType>()
        every { deploymentModel.hasEmptyDefaultValue(any()) } returns true

        val result = validatorPredicate.validate(deploymentModel, francaField)

        assertNull(result)
    }

    @Test
    fun validateForMapTypeEmpty() {
        every { francaTypeRef.derived } returns mockk<FMapType>()
        every { deploymentModel.hasEmptyDefaultValue(any()) } returns true

        val result = validatorPredicate.validate(deploymentModel, francaField)

        assertNull(result)
    }

    @Test
    fun validateForNonCollectionEmpty() {
        every { francaTypeRef.derived } returns mockk<FStructType>()
        every { deploymentModel.hasEmptyDefaultValue(any()) } returns true

        val result = validatorPredicate.validate(deploymentModel, francaField)

        assertNull(result)
    }

    @Test
    fun validateForInvalidTypeEmpty() {
        every { deploymentModel.hasEmptyDefaultValue(any()) } returns true

        val result = validatorPredicate.validate(deploymentModel, francaField)

        assertNotNull(result)
    }

    @Test
    fun validateForEmptyWithDefaultValue() {
        every { deploymentModel.hasEmptyDefaultValue(any()) } returns true
        every { deploymentModel.getDefaultValue(any()) } returns "nonsense"

        val result = validatorPredicate.validate(deploymentModel, francaField)

        assertNotNull(result)
    }

    @Test
    fun validateForNullWithEmpty() {
        every { deploymentModel.hasNullDefaultValue(any()) } returns true
        every { deploymentModel.hasEmptyDefaultValue(any()) } returns true

        val result = validatorPredicate.validate(deploymentModel, francaField)

        assertNotNull(result)
    }
}
