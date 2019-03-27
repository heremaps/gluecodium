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

package com.here.genium.generator.lime

import com.here.genium.generator.common.StringValueMapper
import com.here.genium.model.common.InstanceRules
import com.here.genium.model.franca.CommentHelper
import com.here.genium.model.franca.FrancaDeploymentModel
import com.here.genium.model.lime.LimeAttributeType
import com.here.genium.model.lime.LimeBasicType
import com.here.genium.model.lime.LimeBasicTypeRef
import com.here.genium.model.lime.LimeConstant
import com.here.genium.model.lime.LimeContainer
import com.here.genium.model.lime.LimeContainer.ContainerType
import com.here.genium.model.lime.LimeElement
import com.here.genium.model.lime.LimeEnumeration
import com.here.genium.model.lime.LimeEnumerator
import com.here.genium.model.lime.LimeField
import com.here.genium.model.lime.LimePath.Companion.EMPTY_PATH
import com.here.genium.model.lime.LimeStruct
import com.here.genium.model.lime.LimeTypeDef
import com.here.genium.model.lime.LimeTypeRef
import com.here.genium.model.lime.LimeValue
import com.here.genium.model.lime.LimeVisibility
import com.here.genium.test.AssertHelpers.assertAttributeEquals
import com.here.genium.test.AssertHelpers.assertContains
import com.here.genium.test.AssertHelpers.assertHasAttribute
import com.here.genium.test.MockContextStack
import io.mockk.MockKAnnotations
import io.mockk.every
import io.mockk.impl.annotations.MockK
import io.mockk.mockk
import io.mockk.mockkStatic
import org.franca.core.franca.FArrayType
import org.franca.core.franca.FBasicTypeId
import org.franca.core.franca.FConstant
import org.franca.core.franca.FConstantDef
import org.franca.core.franca.FEnumerationType
import org.franca.core.franca.FEnumerator
import org.franca.core.franca.FField
import org.franca.core.franca.FMapType
import org.franca.core.franca.FModel
import org.franca.core.franca.FQualifiedElementRef
import org.franca.core.franca.FStructType
import org.franca.core.franca.FTypeCollection
import org.franca.core.franca.FTypeDef
import org.franca.core.franca.FTypeRef
import org.franca.core.franca.FUnaryOperation
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class LimeModelBuilderTest {
    @MockK private lateinit var francaModel: FModel
    @MockK private lateinit var francaTypeCollection: FTypeCollection
    @MockK private lateinit var francaStruct: FStructType
    @MockK private lateinit var francaField: FField
    @MockK private lateinit var francaTypeRef: FTypeRef
    @MockK private lateinit var francaEnumeration: FEnumerationType
    @MockK private lateinit var francaEnumerator: FEnumerator
    @MockK private lateinit var francaConstant: FConstantDef
    @MockK private lateinit var francaTypeDef: FTypeDef
    @MockK private lateinit var francaArray: FArrayType
    @MockK private lateinit var francaMap: FMapType

    @MockK private lateinit var deploymentModel: FrancaDeploymentModel
    @MockK private lateinit var referenceResolver: LimeReferenceResolver

    private val limeTypeRef = LimeBasicTypeRef.DOUBLE
    private val limeValue = LimeValue.Literal(limeTypeRef, "")
    private val limeStruct = LimeStruct(EMPTY_PATH)
    private val limeEnumeration = LimeEnumeration(EMPTY_PATH)
    private val limeEnumerator = LimeEnumerator(EMPTY_PATH)
    private val limeConstant = LimeConstant(EMPTY_PATH, typeRef = limeTypeRef, value = limeValue)
    private val limeTypeDef = LimeTypeDef(EMPTY_PATH, typeRef = limeTypeRef)
    private val limeField = LimeField(EMPTY_PATH, typeRef = limeTypeRef)

    private val contextStack = MockContextStack<LimeElement>()

    private lateinit var modelBuilder: LimeModelBuilder

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)
        mockkStatic(CommentHelper::class, InstanceRules::class, StringValueMapper::class)

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
        every { francaEnumerator.name } returns "SomeEnumItem"
        every { francaConstant.name } returns "SomeConstant"
        every { francaTypeDef.name } returns "SomeTypeDef"
        every { francaArray.name } returns "SomeArray"
        every { francaMap.name } returns "SomeMap"

        every { francaTypeCollection.eContainer() } returns francaModel
        every { francaStruct.eContainer() } returns francaTypeCollection
        every { francaField.eContainer() } returns francaStruct
        every { francaEnumeration.eContainer() } returns francaTypeCollection
        every { francaEnumerator.eContainer() } returns francaEnumeration
        every { francaConstant.eContainer() } returns francaTypeCollection
        every { francaTypeDef.eContainer() } returns francaTypeCollection
        every { francaArray.eContainer() } returns francaTypeCollection
        every { francaMap.eContainer() } returns francaTypeCollection
    }

    @Test
    fun finishBuildingTypeCollection() {
        modelBuilder.finishBuilding(francaTypeCollection)

        val result = modelBuilder.getFinalResult(LimeContainer::class.java)
        assertEquals(ContainerType.TYPE_COLLECTION, result.type)
        assertEquals("SomeTypeCollection", result.name)
        assertEquals("the.model.SomeTypeCollection", result.fullName)
        assertEquals("some comment", result.comment)
    }

    @Test
    fun finishBuildingTypeCollectionReadsVisibility() {
        every { deploymentModel.isInternal(francaTypeCollection) } returns true

        modelBuilder.finishBuilding(francaTypeCollection)

        val result = modelBuilder.getFinalResult(LimeContainer::class.java)
        assertEquals(LimeVisibility.INTERNAL, result.visibility)
    }

    @Test
    fun finishBuildingTypeCollectionReadsMembers() {
        contextStack.injectResult(limeStruct)
        contextStack.injectResult(limeEnumeration)
        contextStack.injectResult(limeConstant)
        contextStack.injectResult(limeTypeDef)

        modelBuilder.finishBuilding(francaTypeCollection)

        val result = modelBuilder.getFinalResult(LimeContainer::class.java)
        assertContains(limeStruct, result.structs)
        assertContains(limeEnumeration, result.enumerations)
        assertContains(limeConstant, result.constants)
        assertContains(limeTypeDef, result.typeDefs)
    }

    @Test
    fun finishBuildingStruct() {
        modelBuilder.finishBuilding(francaStruct)

        val result = modelBuilder.getFinalResult(LimeStruct::class.java)
        assertEquals("SomeStruct", result.name)
        assertEquals("the.model.SomeTypeCollection.SomeStruct", result.fullName)
        assertEquals("some comment", result.comment)
    }

    @Test
    fun finishBuildingStructReadsVisibility() {
        every { deploymentModel.isInternal(francaStruct) } returns true

        modelBuilder.finishBuilding(francaStruct)

        val result = modelBuilder.getFinalResult(LimeStruct::class.java)
        assertEquals(LimeVisibility.INTERNAL, result.visibility)
    }

    @Test
    fun finishBuildingStructReadsFields() {
        contextStack.injectResult(limeField)

        modelBuilder.finishBuilding(francaStruct)

        val result = modelBuilder.getFinalResult(LimeStruct::class.java)
        assertContains(limeField, result.fields)
    }

    @Test
    fun finishBuildingStructReadsExternalAttributes() {
        every { deploymentModel.isExternalType(francaStruct) } returns true
        every { deploymentModel.getExternalType(francaStruct) } returns "foo/Bar.h"
        every { deploymentModel.getExternalName(francaStruct) } returns "::foo::Bar"

        modelBuilder.finishBuilding(francaStruct)

        val result = modelBuilder.getFinalResult(LimeStruct::class.java)
        assertAttributeEquals("foo/Bar.h", LimeAttributeType.EXTERNAL_TYPE, result)
        assertAttributeEquals("::foo::Bar", LimeAttributeType.EXTERNAL_NAME, result)
    }

    @Test
    fun finishBuildingStructReadsSerializable() {
        every { deploymentModel.isSerializable(francaStruct) } returns true

        modelBuilder.finishBuilding(francaStruct)

        val result = modelBuilder.getFinalResult(LimeStruct::class.java)
        assertHasAttribute(LimeAttributeType.SERIALIZABLE, result)
    }

    @Test
    fun finishBuildingStructReadsEquatable() {
        every { deploymentModel.isEquatable(francaStruct) } returns true

        modelBuilder.finishBuilding(francaStruct)

        val result = modelBuilder.getFinalResult(LimeStruct::class.java)
        assertHasAttribute(LimeAttributeType.EQUATABLE, result)
    }

    @Test
    fun finishBuildingStructReadsImmutable() {
        every { deploymentModel.isImmutable(francaStruct) } returns true

        modelBuilder.finishBuilding(francaStruct)

        val result = modelBuilder.getFinalResult(LimeStruct::class.java)
        assertHasAttribute(LimeAttributeType.IMMUTABLE, result)
    }

    @Test
    fun finishBuildingField() {
        contextStack.injectResult(limeTypeRef)

        modelBuilder.finishBuilding(francaField)

        val result = modelBuilder.getFinalResult(LimeField::class.java)
        assertEquals("SomeField", result.name)
        assertEquals("the.model.SomeTypeCollection.SomeStruct.SomeField", result.fullName)
        assertEquals("some comment", result.comment)
        assertEquals(limeTypeRef, result.typeRef)
    }

    @Test
    fun finishBuildingFieldReadsVisibility() {
        contextStack.injectResult(limeTypeRef)
        every { deploymentModel.isInternal(francaField) } returns true

        modelBuilder.finishBuilding(francaField)

        val result = modelBuilder.getFinalResult(LimeField::class.java)
        assertEquals(LimeVisibility.INTERNAL, result.visibility)
    }

    @Test
    fun finishBuildingFieldReadsExternalAttributes() {
        contextStack.injectResult(limeTypeRef)
        every { deploymentModel.getExternalGetter(francaField) } returns "get_foo"
        every { deploymentModel.getExternalSetter(francaField) } returns "set_foo"

        modelBuilder.finishBuilding(francaField)

        val result = modelBuilder.getFinalResult(LimeField::class.java)
        assertAttributeEquals("get_foo", LimeAttributeType.EXTERNAL_GETTER, result)
        assertAttributeEquals("set_foo", LimeAttributeType.EXTERNAL_SETTER, result)
    }

    @Test
    fun finishBuildingFieldReadsNullable() {
        contextStack.injectResult(limeTypeRef)
        every { deploymentModel.isNullable(francaField) } returns true

        modelBuilder.finishBuilding(francaField)

        val result = modelBuilder.getFinalResult(LimeField::class.java)
        assertHasAttribute(LimeAttributeType.NULLABLE, result)
    }

    @Test
    fun finishBuildingFieldReadsInlineArray() {
        contextStack.injectResult(limeTypeRef)
        every { francaField.isArray } returns true

        modelBuilder.finishBuilding(francaField)

        val result = modelBuilder.getFinalResult(LimeField::class.java)
        assertEquals("[DOUBLE]", result.typeRef.elementFullName)
    }

    @Test
    fun finishBuildingTypeRefPredefined() {
        every { francaTypeRef.derived } returns null
        every { francaTypeRef.predefined } returns FBasicTypeId.DOUBLE

        modelBuilder.finishBuilding(francaTypeRef)

        val result = modelBuilder.getFinalResult(LimeTypeRef::class.java)
        assertEquals("DOUBLE", result.elementFullName)
    }

    @Test
    fun finishBuildingTypeRefDerived() {
        every { francaTypeRef.derived } returns francaStruct

        modelBuilder.finishBuilding(francaTypeRef)

        val result = modelBuilder.getFinalResult(LimeTypeRef::class.java)
        assertEquals("the.model.SomeTypeCollection.SomeStruct", result.elementFullName)
    }

    @Test
    fun finishBuildingEnumeration() {
        modelBuilder.finishBuilding(francaEnumeration)

        val result = modelBuilder.getFinalResult(LimeEnumeration::class.java)
        assertEquals("SomeEnum", result.name)
        assertEquals("the.model.SomeTypeCollection.SomeEnum", result.fullName)
        assertEquals("some comment", result.comment)
    }

    @Test
    fun finishBuildingEnumerationReadsVisibility() {
        every { deploymentModel.isInternal(francaEnumeration) } returns true

        modelBuilder.finishBuilding(francaEnumeration)

        val result = modelBuilder.getFinalResult(LimeEnumeration::class.java)
        assertEquals(LimeVisibility.INTERNAL, result.visibility)
    }

    @Test
    fun finishBuildingEnumerationReadsExternalAttributes() {
        every { deploymentModel.isExternalType(francaEnumeration) } returns true
        every { deploymentModel.getExternalType(francaEnumeration) } returns "foo/Bar.h"
        every { deploymentModel.getExternalName(francaEnumeration) } returns "::foo::Bar"

        modelBuilder.finishBuilding(francaEnumeration)

        val result = modelBuilder.getFinalResult(LimeEnumeration::class.java)
        assertAttributeEquals("foo/Bar.h", LimeAttributeType.EXTERNAL_TYPE, result)
        assertAttributeEquals("::foo::Bar", LimeAttributeType.EXTERNAL_NAME, result)
    }

    @Test
    fun finishBuildingEnumerationReadsEnumerators() {
        contextStack.injectResult(limeEnumerator)

        modelBuilder.finishBuilding(francaEnumeration)

        val result = modelBuilder.getFinalResult(LimeEnumeration::class.java)
        assertContains(limeEnumerator, result.enumerators)
    }

    @Test
    fun finishBuildingEnumerator() {
        modelBuilder.finishBuilding(francaEnumerator)

        val result = modelBuilder.getFinalResult(LimeEnumerator::class.java)
        assertEquals("SomeEnumItem", result.name)
        assertEquals("the.model.SomeTypeCollection.SomeEnum.SomeEnumItem", result.fullName)
        assertEquals("some comment", result.comment)
    }

    @Test
    fun finishBuildingExpressionConstant() {
        contextStack.injectParentResult(limeTypeRef)
        val francaConstantExpression = mockk<FConstant>()
        every { StringValueMapper.map(francaConstantExpression) } returns "foo"

        modelBuilder.finishBuilding(francaConstantExpression)

        val result = modelBuilder.getFinalResult(LimeValue::class.java)
        assertEquals(limeTypeRef, result.typeRef)
        assertEquals("foo", (result as LimeValue.Literal).value)
    }

    @Test
    fun finishBuildingExpressionConstantUnmapped() {
        val francaConstantExpression = mockk<FConstant>()
        every { StringValueMapper.map(francaConstantExpression) } returns null

        modelBuilder.finishBuilding(francaConstantExpression)

        val results = modelBuilder.finalResults
        assertTrue(results.isEmpty())
    }

    @Test
    fun finishBuildingExpressionUnaryOperation() {
        contextStack.injectParentResult(limeTypeRef)
        val francaUnaryOperation = mockk<FUnaryOperation>()
        every { StringValueMapper.map(francaUnaryOperation) } returns "foo"

        modelBuilder.finishBuilding(francaUnaryOperation)

        val result = modelBuilder.getFinalResult(LimeValue::class.java)
        assertEquals(limeTypeRef, result.typeRef)
        assertEquals("foo", (result as LimeValue.Literal).value)
    }

    @Test
    fun finishBuildingExpressionElementRef() {
        contextStack.injectParentResult(limeTypeRef)
        val francaElementRef = mockk<FQualifiedElementRef>()
        every { francaElementRef.element } returns francaConstant

        modelBuilder.finishBuilding(francaElementRef)

        val result = modelBuilder.getFinalResult(LimeValue::class.java)
        assertEquals(limeTypeRef, result.typeRef)
        assertEquals(
            "the.model.SomeTypeCollection.SomeConstant",
            (result as LimeValue.Enumerator).valueRef.elementFullName
        )
    }

    @Test
    fun finishBuildingConstant() {
        contextStack.injectResult(limeTypeRef)
        contextStack.injectResult(limeValue)

        modelBuilder.finishBuilding(francaConstant)

        val result = modelBuilder.getFinalResult(LimeConstant::class.java)
        assertEquals("SomeConstant", result.name)
        assertEquals("the.model.SomeTypeCollection.SomeConstant", result.fullName)
        assertEquals("some comment", result.comment)
        assertEquals(limeTypeRef, result.typeRef)
        assertEquals(limeValue, result.value)
    }

    @Test
    fun finishBuildingConstantReadsVisibility() {
        contextStack.injectResult(limeTypeRef)
        contextStack.injectResult(limeValue)
        every { deploymentModel.isInternal(francaConstant) } returns true

        modelBuilder.finishBuilding(francaConstant)

        val result = modelBuilder.getFinalResult(LimeConstant::class.java)
        assertEquals(LimeVisibility.INTERNAL, result.visibility)
    }

    @Test
    fun finishBuildingConstantReadsInlineArray() {
        contextStack.injectResult(limeTypeRef)
        contextStack.injectResult(limeValue)
        every { francaConstant.isArray } returns true

        modelBuilder.finishBuilding(francaConstant)

        val result = modelBuilder.getFinalResult(LimeConstant::class.java)
        assertEquals("[DOUBLE]", result.typeRef.elementFullName)
    }

    @Test
    fun finishBuildingTypeDef() {
        contextStack.injectResult(limeTypeRef)

        modelBuilder.finishBuilding(francaTypeDef)

        val result = modelBuilder.getFinalResult(LimeTypeDef::class.java)
        assertEquals("SomeTypeDef", result.name)
        assertEquals("the.model.SomeTypeCollection.SomeTypeDef", result.fullName)
        assertEquals("some comment", result.comment)
        assertEquals(limeTypeRef, result.typeRef)
    }

    @Test
    fun finishBuildingTypeDefReadsVisibility() {
        contextStack.injectResult(limeTypeRef)
        every { deploymentModel.isInternal(francaTypeDef) } returns true

        modelBuilder.finishBuilding(francaTypeDef)

        val result = modelBuilder.getFinalResult(LimeTypeDef::class.java)
        assertEquals(LimeVisibility.INTERNAL, result.visibility)
    }

    @Test
    fun finishBuildingTypeDefInstanceUnmapped() {
        every { InstanceRules.isInstanceId(francaTypeDef) } returns true

        modelBuilder.finishBuilding(francaTypeDef)

        val results = modelBuilder.finalResults
        assertTrue(results.isEmpty())
    }

    @Test
    fun finishBuildingArray() {
        contextStack.injectResult(limeTypeRef)

        modelBuilder.finishBuilding(francaArray)

        val result = modelBuilder.getFinalResult(LimeTypeDef::class.java)
        assertEquals("SomeArray", result.name)
        assertEquals("the.model.SomeTypeCollection.SomeArray", result.fullName)
        assertEquals("some comment", result.comment)
        assertEquals("[DOUBLE]", result.typeRef.elementFullName)
    }

    @Test
    fun finishBuildingArrayReadsVisibility() {
        contextStack.injectResult(limeTypeRef)
        every { deploymentModel.isInternal(francaArray) } returns true

        modelBuilder.finishBuilding(francaArray)

        val result = modelBuilder.getFinalResult(LimeTypeDef::class.java)
        assertEquals(LimeVisibility.INTERNAL, result.visibility)
    }

    @Test
    fun finishBuildingMap() {
        contextStack.injectResult(limeTypeRef)
        contextStack.injectResult(LimeBasicTypeRef(LimeBasicType.TypeId.STRING))

        modelBuilder.finishBuilding(francaMap)

        val result = modelBuilder.getFinalResult(LimeTypeDef::class.java)
        assertEquals("SomeMap", result.name)
        assertEquals("the.model.SomeTypeCollection.SomeMap", result.fullName)
        assertEquals("some comment", result.comment)
        assertEquals("[DOUBLE:STRING]", result.typeRef.elementFullName)
    }

    @Test
    fun finishBuildingMapReadsVisibility() {
        contextStack.injectResult(limeTypeRef)
        contextStack.injectResult(LimeBasicTypeRef(LimeBasicType.TypeId.STRING))
        every { deploymentModel.isInternal(francaMap) } returns true

        modelBuilder.finishBuilding(francaMap)

        val result = modelBuilder.getFinalResult(LimeTypeDef::class.java)
        assertEquals(LimeVisibility.INTERNAL, result.visibility)
    }
}
