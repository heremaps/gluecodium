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

package com.here.genium.loader

import com.here.genium.franca.CommentHelper
import com.here.genium.franca.FrancaDeploymentModel
import com.here.genium.model.lime.LimeBasicTypeRef
import com.here.genium.model.lime.LimeElement
import com.here.genium.model.lime.LimeField
import com.here.genium.model.lime.LimeValue
import com.here.genium.test.MockContextStack
import io.mockk.MockKAnnotations
import io.mockk.every
import io.mockk.impl.annotations.MockK
import io.mockk.mockkStatic
import org.franca.core.franca.FBasicTypeId
import org.franca.core.franca.FEnumerationType
import org.franca.core.franca.FField
import org.franca.core.franca.FModel
import org.franca.core.franca.FStructType
import org.franca.core.franca.FTypeCollection
import org.franca.core.franca.FTypeRef
import org.junit.Assert.assertEquals
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class LimeModelBuilderDefaultValuesTest {
    @MockK private lateinit var francaModel: FModel
    @MockK private lateinit var francaTypeCollection: FTypeCollection
    @MockK private lateinit var francaStruct: FStructType
    @MockK private lateinit var francaField: FField
    @MockK private lateinit var francaTypeRef: FTypeRef
    @MockK private lateinit var francaEnumeration: FEnumerationType

    @MockK private lateinit var deploymentModel: FrancaDeploymentModel
    @MockK private lateinit var referenceResolver: LimeReferenceResolver

    private val limeTypeRef = LimeBasicTypeRef.DOUBLE

    private val contextStack = MockContextStack<LimeElement>()

    private lateinit var modelBuilder: LimeModelBuilder

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)
        mockkStatic(CommentHelper::class)

        modelBuilder = LimeModelBuilder(
            contextStack,
            deploymentModel,
            referenceResolver
        )

        every { CommentHelper.getDescription(any()) } returns "some comment"

        every { francaModel.name } returns "the.model"
        every { francaTypeCollection.name } returns "SomeTypeCollection"
        every { francaStruct.name } returns "SomeStruct"
        every { francaField.name } returns "SomeField"
        every { francaEnumeration.name } returns "SomeEnum"

        every { francaTypeCollection.eContainer() } returns francaModel
        every { francaStruct.eContainer() } returns francaTypeCollection
        every { francaField.eContainer() } returns francaStruct
        every { francaEnumeration.eContainer() } returns francaTypeCollection

        every { francaField.type } returns francaTypeRef
    }

    @Test
    fun finishBuildingFieldReadsDefaultValueString() {
        contextStack.injectResult(limeTypeRef)
        every { deploymentModel.getDefaultValue(francaField) } returns "foo"
        every { francaTypeRef.predefined } returns FBasicTypeId.STRING

        modelBuilder.finishBuilding(francaField)

        val result = modelBuilder.getFinalResult(LimeField::class.java)
        assertEquals("\"foo\"", (result.defaultValue as LimeValue.Literal).value)
    }

    @Test
    fun finishBuildingFieldReadsDefaultValueFloat() {
        contextStack.injectResult(limeTypeRef)
        every { deploymentModel.getDefaultValue(francaField) } returns "3.14"
        every { francaTypeRef.predefined } returns FBasicTypeId.FLOAT

        modelBuilder.finishBuilding(francaField)

        val result = modelBuilder.getFinalResult(LimeField::class.java)
        assertEquals("3.14", (result.defaultValue as LimeValue.Literal).value)
    }

    @Test
    fun finishBuildingFieldReadsDefaultValueFloatNan() {
        contextStack.injectResult(limeTypeRef)
        every { deploymentModel.getDefaultValue(francaField) } returns "NaN"
        every { francaTypeRef.predefined } returns FBasicTypeId.FLOAT

        modelBuilder.finishBuilding(francaField)

        val result = modelBuilder.getFinalResult(LimeField::class.java)
        assertEquals(LimeValue.Special.FLOAT_NAN, result.defaultValue)
    }

    @Test
    fun finishBuildingFieldReadsDefaultValueFloatInfinity() {
        contextStack.injectResult(limeTypeRef)
        every { deploymentModel.getDefaultValue(francaField) } returns "Infinity"
        every { francaTypeRef.predefined } returns FBasicTypeId.FLOAT

        modelBuilder.finishBuilding(francaField)

        val result = modelBuilder.getFinalResult(LimeField::class.java)
        assertEquals(LimeValue.Special.FLOAT_INFINITY, result.defaultValue)
    }

    @Test
    fun finishBuildingFieldReadsDefaultValueFloatNegativeInfinity() {
        contextStack.injectResult(limeTypeRef)
        every { deploymentModel.getDefaultValue(francaField) } returns "-Infinity"
        every { francaTypeRef.predefined } returns FBasicTypeId.FLOAT

        modelBuilder.finishBuilding(francaField)

        val result = modelBuilder.getFinalResult(LimeField::class.java)
        assertEquals(LimeValue.Special.FLOAT_NEGATIVE_INFINITY, result.defaultValue)
    }

    @Test
    fun finishBuildingFieldReadsDefaultValueDouble() {
        contextStack.injectResult(limeTypeRef)
        every { deploymentModel.getDefaultValue(francaField) } returns "-1.4142"
        every { francaTypeRef.predefined } returns FBasicTypeId.FLOAT

        modelBuilder.finishBuilding(francaField)

        val result = modelBuilder.getFinalResult(LimeField::class.java)
        assertEquals("-1.4142", (result.defaultValue as LimeValue.Literal).value)
    }

    @Test
    fun finishBuildingFieldReadsDefaultValueDoubleNan() {
        contextStack.injectResult(limeTypeRef)
        every { deploymentModel.getDefaultValue(francaField) } returns "NaN"
        every { francaTypeRef.predefined } returns FBasicTypeId.DOUBLE

        modelBuilder.finishBuilding(francaField)

        val result = modelBuilder.getFinalResult(LimeField::class.java)
        assertEquals(LimeValue.Special.DOUBLE_NAN, result.defaultValue)
    }

    @Test
    fun finishBuildingFieldReadsDefaultValueDoubleInfinity() {
        contextStack.injectResult(limeTypeRef)
        every { deploymentModel.getDefaultValue(francaField) } returns "Infinity"
        every { francaTypeRef.predefined } returns FBasicTypeId.DOUBLE

        modelBuilder.finishBuilding(francaField)

        val result = modelBuilder.getFinalResult(LimeField::class.java)
        assertEquals(LimeValue.Special.DOUBLE_INFINITY, result.defaultValue)
    }

    @Test
    fun finishBuildingFieldReadsDefaultValueDoubleNegativeInfinity() {
        contextStack.injectResult(limeTypeRef)
        every { deploymentModel.getDefaultValue(francaField) } returns "-Infinity"
        every { francaTypeRef.predefined } returns FBasicTypeId.DOUBLE

        modelBuilder.finishBuilding(francaField)

        val result = modelBuilder.getFinalResult(LimeField::class.java)
        assertEquals(LimeValue.Special.DOUBLE_NEGATIVE_INFINITY, result.defaultValue)
    }

    @Test
    fun finishBuildingFieldReadsDefaultValueEnumerator() {
        contextStack.injectResult(limeTypeRef)
        every { deploymentModel.getDefaultValue(francaField) } returns "foo"
        every { francaTypeRef.derived } returns francaEnumeration

        modelBuilder.finishBuilding(francaField)

        val result = modelBuilder.getFinalResult(LimeField::class.java)
        assertEquals(
            "the.model.SomeTypeCollection.SomeEnum.foo",
            (result.defaultValue as LimeValue.Enumerator).valueRef.elementFullName
        )
    }

    @Test
    fun finishBuildingFieldReadsDefaultValue() {
        contextStack.injectResult(limeTypeRef)
        every { deploymentModel.getDefaultValue(francaField) } returns "foo"

        modelBuilder.finishBuilding(francaField)

        val result = modelBuilder.getFinalResult(LimeField::class.java)
        assertEquals("foo", (result.defaultValue as LimeValue.Literal).value)
    }
}