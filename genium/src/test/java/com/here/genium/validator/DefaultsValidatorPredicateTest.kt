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

import com.here.genium.model.franca.FrancaDeploymentModel
import com.here.genium.test.ArrayEList
import org.franca.core.franca.FBasicTypeId
import org.franca.core.franca.FEnumerationType
import org.franca.core.franca.FEnumerator
import org.franca.core.franca.FField
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
import org.mockito.ArgumentMatchers.any
import org.mockito.Mock
import org.mockito.Mockito.`when`
import org.mockito.Mockito.mock
import org.mockito.Mockito.verify
import org.mockito.MockitoAnnotations
import java.util.Arrays

@RunWith(JUnit4::class)
class DefaultsValidatorPredicateTest {
    @Mock
    private lateinit var francaModel: FModel
    @Mock
    private lateinit var francaTypeCollection: FTypeCollection
    @Mock
    private lateinit var francaStruct: FStructType
    @Mock
    private lateinit var francaField: FField
    @Mock
    private lateinit var francaTypeRef: FTypeRef
    @Mock
    private lateinit var francaEnum: FEnumerationType

    @Mock
    private lateinit var deploymentModel: FrancaDeploymentModel

    private val validatorPredicate = DefaultsValidatorPredicate()

    @Before
    fun setUp() {
        MockitoAnnotations.initMocks(this)

        `when`(francaModel.name).thenReturn("Foo")
        `when`(francaTypeCollection.name).thenReturn("Bar")
        `when`(francaStruct.name).thenReturn("Baz")
        `when`(francaField.name).thenReturn("Fizz")

        `when`(francaTypeCollection.eContainer()).thenReturn(francaModel)
        `when`(francaStruct.eContainer()).thenReturn(francaTypeCollection)
        `when`(francaField.eContainer()).thenReturn(francaStruct)
        `when`(francaField.type).thenReturn(francaTypeRef)

        val enumerator1 = mock(FEnumerator::class.java)
        `when`(enumerator1.name).thenReturn("SomeEnumItem")
        val enumerator2 = mock(FEnumerator::class.java)
        `when`(enumerator2.name).thenReturn("SomeOtherEnumItem")
        `when`(francaEnum.enumerators)
            .thenReturn(ArrayEList(Arrays.asList(enumerator1, enumerator2)))
    }

    @Test
    fun validateForStringNone() {
        `when`(francaTypeRef.predefined).thenReturn(FBasicTypeId.STRING)

        val result = validatorPredicate.validate(deploymentModel, francaField)

        assertNull(result)
    }

    @Test
    fun validateForBooleanNone() {
        `when`(francaTypeRef.predefined).thenReturn(FBasicTypeId.BOOLEAN)

        val result = validatorPredicate.validate(deploymentModel, francaField)

        assertNull(result)
        verify(deploymentModel).getDefaultValue(francaField)
    }

    @Test
    fun validateForBooleanValid() {
        `when`(francaTypeRef.predefined).thenReturn(FBasicTypeId.BOOLEAN)
        `when`(deploymentModel.getDefaultValue(any())).thenReturn("false")

        val result = validatorPredicate.validate(deploymentModel, francaField)

        assertNull(result)
        verify(deploymentModel).getDefaultValue(francaField)
    }

    @Test
    fun validateForBooleanInvalid() {
        `when`(francaTypeRef.predefined).thenReturn(FBasicTypeId.BOOLEAN)
        `when`(deploymentModel.getDefaultValue(any())).thenReturn("nonsense")

        val result = validatorPredicate.validate(deploymentModel, francaField)

        assertNotNull(result)
        verify(deploymentModel).getDefaultValue(francaField)
    }

    @Test
    fun validateForFloatNone() {
        `when`(francaTypeRef.predefined).thenReturn(FBasicTypeId.FLOAT)

        val result = validatorPredicate.validate(deploymentModel, francaField)

        assertNull(result)
        verify(deploymentModel).getDefaultValue(francaField)
    }

    @Test
    fun validateForFloatValid() {
        `when`(francaTypeRef.predefined).thenReturn(FBasicTypeId.FLOAT)
        `when`(deploymentModel.getDefaultValue(any())).thenReturn("3.14")

        val result = validatorPredicate.validate(deploymentModel, francaField)

        assertNull(result)
        verify(deploymentModel).getDefaultValue(francaField)
    }

    @Test
    fun validateForFloatInvalid() {
        `when`(francaTypeRef.predefined).thenReturn(FBasicTypeId.FLOAT)
        `when`(deploymentModel.getDefaultValue(any())).thenReturn("nonsense")

        val result = validatorPredicate.validate(deploymentModel, francaField)

        assertNotNull(result)
        verify(deploymentModel).getDefaultValue(francaField)
    }

    @Test
    fun validateForIntegerNone() {
        `when`(francaTypeRef.predefined).thenReturn(FBasicTypeId.INT8)

        val result = validatorPredicate.validate(deploymentModel, francaField)

        assertNull(result)
        verify(deploymentModel).getDefaultValue(francaField)
    }

    @Test
    fun validateForIntegerValid() {
        `when`(francaTypeRef.predefined).thenReturn(FBasicTypeId.INT8)
        `when`(deploymentModel.getDefaultValue(any())).thenReturn("42")

        val result = validatorPredicate.validate(deploymentModel, francaField)

        assertNull(result)
        verify(deploymentModel).getDefaultValue(francaField)
    }

    @Test
    fun validateForIntegerValidBig() {
        `when`(francaTypeRef.predefined).thenReturn(FBasicTypeId.UINT32)
        `when`(deploymentModel.getDefaultValue(any())).thenReturn("4294967295")

        val result = validatorPredicate.validate(deploymentModel, francaField)

        assertNull(result)
        verify(deploymentModel).getDefaultValue(francaField)
    }

    @Test
    fun validateForIntegerInvalid() {
        `when`(francaTypeRef.predefined).thenReturn(FBasicTypeId.INT8)
        `when`(deploymentModel.getDefaultValue(any())).thenReturn("nonsense")

        val result = validatorPredicate.validate(deploymentModel, francaField)

        assertNotNull(result)
        verify(deploymentModel).getDefaultValue(francaField)
    }

    @Test
    fun validateForIntegerInvalidBig() {
        `when`(francaTypeRef.predefined).thenReturn(FBasicTypeId.UINT32)
        `when`(deploymentModel.getDefaultValue(any())).thenReturn("109223372036854775807")

        val result = validatorPredicate.validate(deploymentModel, francaField)

        assertNotNull(result)
        verify(deploymentModel).getDefaultValue(francaField)
    }

    @Test
    fun validateForEnumNone() {
        `when`(francaTypeRef.derived).thenReturn(francaEnum)

        val result = validatorPredicate.validate(deploymentModel, francaField)

        assertNull(result)
        verify(deploymentModel).getDefaultValue(francaField)
    }

    @Test
    fun validateForEnumValid() {
        `when`(francaTypeRef.derived).thenReturn(francaEnum)
        `when`(deploymentModel.getDefaultValue(any())).thenReturn("SomeOtherEnumItem")

        val result = validatorPredicate.validate(deploymentModel, francaField)

        assertNull(result)
        verify(deploymentModel).getDefaultValue(francaField)
    }

    @Test
    fun validateForEnumInvalid() {
        `when`(francaTypeRef.derived).thenReturn(francaEnum)
        `when`(deploymentModel.getDefaultValue(any())).thenReturn("nonsense")

        val result = validatorPredicate.validate(deploymentModel, francaField)

        assertNotNull(result)
        verify(deploymentModel).getDefaultValue(francaField)
    }
}
