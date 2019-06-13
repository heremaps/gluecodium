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

package com.here.genium.generator.swift

import com.here.genium.Genium
import com.here.genium.generator.cbridge.CBridgeNameRules
import com.here.genium.generator.common.nameRuleSetFromConfig
import com.here.genium.model.lime.LimeArray
import com.here.genium.model.lime.LimeAttributeType
import com.here.genium.model.lime.LimeAttributes
import com.here.genium.model.lime.LimeBasicType
import com.here.genium.model.lime.LimeBasicTypeRef
import com.here.genium.model.lime.LimeConstant
import com.here.genium.model.lime.LimeContainer
import com.here.genium.model.lime.LimeDirectTypeRef
import com.here.genium.model.lime.LimeEnumeration
import com.here.genium.model.lime.LimeEnumerator
import com.here.genium.model.lime.LimeEnumeratorRef
import com.here.genium.model.lime.LimeField
import com.here.genium.model.lime.LimeMap
import com.here.genium.model.lime.LimeMethod
import com.here.genium.model.lime.LimeParameter
import com.here.genium.model.lime.LimePath
import com.here.genium.model.lime.LimePath.Companion.EMPTY_PATH
import com.here.genium.model.lime.LimeProperty
import com.here.genium.model.lime.LimeReturnType
import com.here.genium.model.lime.LimeSet
import com.here.genium.model.lime.LimeSignatureResolver
import com.here.genium.model.lime.LimeStruct
import com.here.genium.model.lime.LimeType
import com.here.genium.model.lime.LimeTypeDef
import com.here.genium.model.lime.LimeValue
import com.here.genium.model.lime.LimeVisibility
import com.here.genium.model.swift.SwiftArray
import com.here.genium.model.swift.SwiftClass
import com.here.genium.model.swift.SwiftConstant
import com.here.genium.model.swift.SwiftDictionary
import com.here.genium.model.swift.SwiftEnum
import com.here.genium.model.swift.SwiftEnumItem
import com.here.genium.model.swift.SwiftField
import com.here.genium.model.swift.SwiftMethod
import com.here.genium.model.swift.SwiftModelElement
import com.here.genium.model.swift.SwiftParameter
import com.here.genium.model.swift.SwiftProperty
import com.here.genium.model.swift.SwiftSet
import com.here.genium.model.swift.SwiftStruct
import com.here.genium.model.swift.SwiftType
import com.here.genium.model.swift.SwiftTypeDef
import com.here.genium.model.swift.SwiftValue
import com.here.genium.model.swift.SwiftVisibility
import com.here.genium.test.AssertHelpers.assertContains
import com.here.genium.test.MockContextStack
import io.mockk.MockKAnnotations
import io.mockk.every
import io.mockk.impl.annotations.MockK
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class SwiftModelBuilderTest {
    @MockK private lateinit var signatureResolver: LimeSignatureResolver
    @MockK private lateinit var nameResolver: SwiftNameResolver
    @MockK private lateinit var typeMapper: SwiftTypeMapper

    private val swiftType = SwiftType("", "")
    private val swiftValue = SwiftValue("")

    private val fooPath = LimePath(listOf("mo", "del"), listOf("foo"))
    private val limeStruct = LimeStruct(fooPath)

    private val contextStack = MockContextStack<SwiftModelElement>()

    private lateinit var modelBuilder: SwiftModelBuilder

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)

        val nameRuleSet = nameRuleSetFromConfig(Genium.defaultOptions().swiftNameRules)
        modelBuilder =
            SwiftModelBuilder(
                limeReferenceMap = emptyMap(),
                signatureResolver = signatureResolver,
                nameResolver = nameResolver,
                typeMapper = typeMapper,
                nameRules = SwiftNameRules(nameRuleSet),
                contextStack = contextStack
            )

        every { nameResolver.getFullName(any()) } returns "nonsense"
    }

    @Test
    fun finishBuildingMethod() {
        val limeType = object : LimeType(EMPTY_PATH) {}
        val limeReturnType =
            LimeReturnType(LimeDirectTypeRef(limeType), "returnComment")
        val limeElement = LimeMethod(fooPath, comment = "some comment", returnType = limeReturnType)
        every { typeMapper.mapType(limeType) } returns swiftType

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftMethod::class.java)
        assertEquals("foo", result.name)
        assertEquals("some comment", result.comment)
        assertEquals(swiftType, result.returnType)
        assertEquals("returnComment", result.returnComment)
        assertEquals("mo_del_Foo", result.cNestedSpecifier)
        assertEquals("foo", result.cShortName)
    }

    @Test
    fun finishBuildingMethodReadsConstructor() {
        val limeElement = LimeMethod(
            fooPath,
            attributes = LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.CONSTRUCTOR)
                .build()
        )

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftMethod::class.java)
        assertEquals(CBridgeNameRules.BASE_REF_NAME, result.returnType.name)
        assertTrue(result.isStatic)
        assertTrue(result.isConstructor)
    }

    @Test
    fun finishBuildingMethodReadsConstructorSignatureClash() {
        val limeElement = LimeMethod(
            fooPath,
            attributes = LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.CONSTRUCTOR)
                .build()
        )
        every { signatureResolver.hasSignatureClash(limeElement) } returns true

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftMethod::class.java)
        assertTrue(result.isOverriding)
    }

    @Test
    fun finishBuildingMethodReadsNullableReturnType() {
        val limeType = object : LimeType(EMPTY_PATH) {}
        val limeReturnType = LimeReturnType(
            LimeDirectTypeRef(limeType),
            attributes = LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.NULLABLE)
                .build()
        )
        val limeElement = LimeMethod(fooPath, returnType = limeReturnType)
        every { typeMapper.mapType(limeType) } returns swiftType

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftMethod::class.java)
        assertTrue(result.returnType.optional)
    }

    @Test
    fun finishBuildingMethodReadsArrayReturnType() {
        val limeArray = LimeArray(LimeBasicTypeRef.DOUBLE)
        val limeReturnType = LimeReturnType(LimeDirectTypeRef(limeArray))
        val swiftArray = SwiftArray(SwiftType.VOID, "")
        val limeElement = LimeMethod(fooPath, returnType = limeReturnType)
        every { typeMapper.mapType(limeArray) } returns swiftArray
        every { typeMapper.getActualTypeKey(any()) } returns "bazKey"

        modelBuilder.finishBuilding(limeElement)

        assertEquals("[Void]", modelBuilder.arraysCollector["bazKey"]?.publicName)
    }

    @Test
    fun finishBuildingMethodReadsErrorType() {
        val limeElement = LimeMethod(fooPath, errorType = LimeBasicTypeRef.FLOAT)

        modelBuilder.finishBuilding(limeElement)

        assertContains("nonsense", modelBuilder.enumsAsErrors)
    }

    @Test
    fun finishBuildingMethodReadsVisibility() {
        val limeElement = LimeMethod(fooPath, visibility = LimeVisibility.INTERNAL)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftMethod::class.java)
        assertEquals(SwiftVisibility.INTERNAL, result.visibility)
    }

    @Test
    fun finishBuildingMethodReadsStatic() {
        val limeElement = LimeMethod(fooPath, isStatic = true)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftMethod::class.java)
        assertTrue(result.isStatic)
    }

    @Test
    fun finishBuildingMethodReadsParameters() {
        val limeElement = LimeMethod(fooPath)
        val swiftParameter = SwiftParameter("", SwiftType.VOID)
        contextStack.injectResult(swiftParameter)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftMethod::class.java)
        assertContains(swiftParameter, result.parameters)
    }

    @Test
    fun finishBuildingParameter() {
        val limeElement =
            LimeParameter(fooPath, comment = "some comment", typeRef = LimeBasicTypeRef.FLOAT)
        contextStack.injectResult(swiftType)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftParameter::class.java)
        assertEquals("foo", result.name)
        assertEquals("some comment", result.comment)
        assertEquals(swiftType, result.type)
    }

    @Test
    fun finishBuildingParameterReadsNullable() {
        val limeElement =
            LimeParameter(
                fooPath,
                typeRef = LimeBasicTypeRef.FLOAT,
                attributes = LimeAttributes.Builder()
                    .addAttribute(LimeAttributeType.NULLABLE)
                    .build()
            )
        contextStack.injectResult(swiftType)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftParameter::class.java)
        assertTrue(result.type.optional)
    }

    @Test
    fun finishBuildingStruct() {
        val limeElement = LimeStruct(fooPath, comment = "some comment")

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftStruct::class.java)
        assertEquals("nonsense", result.name)
        assertEquals("some comment", result.comment)
    }

    @Test
    fun finishBuildingStructReadsVisibility() {
        val limeElement = LimeStruct(fooPath, visibility = LimeVisibility.INTERNAL)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftStruct::class.java)
        assertEquals(SwiftVisibility.INTERNAL, result.visibility)
    }

    @Test
    fun finishBuildingStructReadsEquatable() {
        val limeElement = LimeStruct(
            fooPath,
            attributes = LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.EQUATABLE)
                .build()
        )

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftStruct::class.java)
        assertTrue(result.isEquatable)
    }

    @Test
    fun finishBuildingStructReadsImmutable() {
        val limeElement = LimeStruct(
            fooPath,
            attributes = LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.IMMUTABLE)
                .build()
        )

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftStruct::class.java)
        assertTrue(result.isImmutable)
    }

    @Test
    fun finishBuildingStructReadsFields() {
        val swiftField = SwiftField("", null, null, null)
        contextStack.injectResult(swiftField)

        modelBuilder.finishBuilding(limeStruct)

        val result = modelBuilder.getFinalResult(SwiftStruct::class.java)
        assertContains(swiftField, result.fields)
    }

    @Test
    fun finishBuildingStructReadsMethods() {
        val swiftMethod = SwiftMethod("")
        contextStack.injectResult(swiftMethod)

        modelBuilder.finishBuilding(limeStruct)

        val result = modelBuilder.getFinalResult(SwiftStruct::class.java)
        assertContains(swiftMethod, result.methods)
    }

    @Test
    fun finishBuildingStructReadsConstants() {
        val swiftConstant = SwiftConstant("", null, SwiftType.VOID, SwiftValue(""))
        contextStack.injectResult(swiftConstant)

        modelBuilder.finishBuilding(limeStruct)

        val result = modelBuilder.getFinalResult(SwiftStruct::class.java)
        assertContains(swiftConstant, result.constants)
    }

    @Test
    fun finishBuildingField() {
        val limeElement =
            LimeField(fooPath, comment = "some comment", typeRef = LimeBasicTypeRef.FLOAT)
        contextStack.injectResult(swiftType)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftField::class.java)
        assertEquals("foo", result.name)
        assertEquals("some comment", result.comment)
        assertEquals(swiftType, result.type)
    }

    @Test
    fun finishBuildingFieldReadsNullable() {
        val limeElement = LimeField(
            fooPath,
            typeRef = LimeBasicTypeRef.FLOAT,
            attributes = LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.NULLABLE)
                .build()
        )
        contextStack.injectResult(swiftType)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftField::class.java)
        assertTrue(result.type.optional)
        assertEquals("nil", result.defaultValue.name)
    }

    @Test
    fun finishBuildingFieldReadsValue() {
        val limeElement = LimeField(fooPath, typeRef = LimeBasicTypeRef.FLOAT)
        contextStack.injectResult(swiftType)
        contextStack.injectResult(swiftValue)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftField::class.java)
        assertEquals(swiftValue, result.defaultValue)
    }

    @Test
    fun finishBuildingFieldReadsVisibility() {
        val limeElement = LimeField(
            fooPath,
            typeRef = LimeBasicTypeRef.FLOAT,
            visibility = LimeVisibility.INTERNAL
        )
        contextStack.injectResult(swiftType)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftField::class.java)
        assertEquals(SwiftVisibility.INTERNAL, result.visibility)
    }

    @Test
    fun finishBuildingEnumeration() {
        val limeElement = LimeEnumeration(fooPath, comment = "some comment")

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftEnum::class.java)
        assertEquals("nonsense", result.name)
        assertEquals("some comment", result.comment)
    }

    @Test
    fun finishBuildingEnumerationReadsVisibility() {
        val limeElement = LimeEnumeration(fooPath, visibility = LimeVisibility.INTERNAL)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftEnum::class.java)
        assertEquals(SwiftVisibility.INTERNAL, result.visibility)
    }

    @Test
    fun finishBuildingEnumerationReadsEnumerators() {
        val limeElement = LimeEnumeration(fooPath)
        val swiftEnumItem = SwiftEnumItem("", null)
        contextStack.injectResult(swiftEnumItem)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftEnum::class.java)
        assertContains(swiftEnumItem, result.items)
    }

    @Test
    fun finishBuildingEnumerator() {
        val limeElement = LimeEnumerator(fooPath, comment = "some comment")

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftEnumItem::class.java)
        assertEquals("foo", result.name)
        assertEquals("some comment", result.comment)
    }

    @Test
    fun finishBuildingEnumeratorReadsValue() {
        val limeElement = LimeEnumerator(fooPath)
        contextStack.injectResult(swiftValue)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftEnumItem::class.java)
        assertEquals(swiftValue, result.value)
    }

    @Test
    fun finishBuildingTypeDef() {
        val limeElement =
            LimeTypeDef(fooPath, comment = "some comment", typeRef = LimeBasicTypeRef.FLOAT)
        contextStack.injectResult(swiftType)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftTypeDef::class.java)
        assertEquals("nonsense", result.name)
        assertEquals("some comment", result.comment)
        assertEquals(swiftType, result.type)
    }

    @Test
    fun finishBuildingTypeDefReadsVisibility() {
        val limeElement = LimeTypeDef(
            fooPath,
            typeRef = LimeBasicTypeRef.FLOAT,
            visibility = LimeVisibility.INTERNAL
        )
        contextStack.injectResult(swiftType)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftTypeDef::class.java)
        assertEquals(SwiftVisibility.INTERNAL, result.visibility)
    }

    @Test
    fun finishBuildingTypeDefReadsMap() {
        val limeMap = LimeMap(LimeBasicTypeRef(LimeBasicType.TypeId.STRING), LimeBasicTypeRef.FLOAT)
        val limeElement = LimeTypeDef(fooPath, typeRef = LimeDirectTypeRef(limeMap))
        val swiftValueType = SwiftType("baz", "")
        every { nameResolver.getMapName(limeElement) } returns "barMap"
        every { typeMapper.mapType(any()) }.returnsMany(swiftType, swiftValueType)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftDictionary::class.java)
        assertContains(result, modelBuilder.mapCollector.values)
        assertEquals("barMap", result.name)
        assertEquals("nonsense", result.publicName)
        assertEquals(swiftType, result.keyType)
        assertEquals(swiftValueType, result.valueType)
    }

    @Test
    fun finishBuildingTypeDefReadsSet() {
        val limeSet = LimeSet(LimeBasicTypeRef.FLOAT)
        val limeElement = LimeTypeDef(fooPath, typeRef = LimeDirectTypeRef(limeSet))
        val swiftBazType = SwiftType("Baz", "")
        every { typeMapper.mapType(any()) } returns swiftBazType

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftSet::class.java)
        assertEquals("Set<Baz>", result.name)
        assertEquals("Set<Baz>", result.publicName)
        assertEquals(swiftBazType, result.elementType)
    }

    @Test
    fun finishBuildingConstant() {
        val limeElement = LimeConstant(
            fooPath,
            comment = "some comment",
            typeRef = LimeBasicTypeRef.FLOAT,
            value = LimeValue.Special.FLOAT_NAN
        )
        contextStack.injectResult(swiftType)
        contextStack.injectResult(swiftValue)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftConstant::class.java)
        assertEquals("foo", result.name)
        assertEquals("some comment", result.comment)
        assertEquals(swiftType, result.type)
        assertEquals(swiftValue, result.value)
    }

    @Test
    fun finishBuildingConstantReadsVisibility() {
        val limeElement = LimeConstant(
            fooPath,
            visibility = LimeVisibility.INTERNAL,
            typeRef = LimeBasicTypeRef.FLOAT,
            value = LimeValue.Special.FLOAT_NAN
        )
        contextStack.injectResult(swiftType)
        contextStack.injectResult(swiftValue)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftConstant::class.java)
        assertEquals(SwiftVisibility.INTERNAL, result.visibility)
    }

    @Test
    fun finishBuildingValueLiteral() {
        val limeElement = LimeValue.Literal(LimeBasicTypeRef.FLOAT, "foo")

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftValue::class.java)
        assertEquals("foo", result.name)
    }

    @Test
    fun finishBuildingValueEnumerator() {
        val limeElement = LimeValue.Enumerator(
            LimeBasicTypeRef.FLOAT,
            LimeEnumeratorRef(mapOf("bar" to LimeEnumerator(fooPath)), "bar")
        )

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftValue::class.java)
        assertEquals("nonsense.foo", result.name)
    }

    @Test
    fun finishBuildingValueNull() {
        val limeElement = LimeValue.Null(LimeBasicTypeRef.FLOAT)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftValue::class.java)
        assertEquals("nil", result.name)
    }

    @Test
    fun finishBuildingValueEmptyArray() {
        val limeElement = LimeValue.InitializerList(
            LimeDirectTypeRef(LimeArray(LimeBasicTypeRef.FLOAT)),
            emptyList()
        )

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftValue::class.java)
        assertEquals("[]", result.name)
    }

    @Test
    fun finishBuildingValueEmptyMap() {
        val limeElement = LimeValue.InitializerList(
            LimeDirectTypeRef(LimeMap(LimeBasicTypeRef.DOUBLE, LimeBasicTypeRef.FLOAT)),
            emptyList()
        )

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftValue::class.java)
        assertEquals("[:]", result.name)
    }

    @Test
    fun finishBuildingValueEmptyStruct() {
        val limeElement =
            LimeValue.InitializerList(LimeDirectTypeRef(LimeStruct(EMPTY_PATH)), emptyList())

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftValue::class.java)
        assertEquals("nonsense()", result.name)
    }

    @Test
    fun finishBuildingProperty() {
        val limeElement =
            LimeProperty(fooPath, typeRef = LimeBasicTypeRef.FLOAT, comment = "some comment")
        contextStack.injectResult(swiftType)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftProperty::class.java)
        assertEquals("foo", result.name)
        assertEquals("some comment", result.comment)
        assertEquals(swiftType, result.getter.returnType)
        assertEquals("mo_del_Foo", result.getter.cNestedSpecifier)
        assertEquals("foo_get", result.getter.cShortName)
        assertEquals(swiftType, result.setter.parameters.first().type)
        assertEquals("mo_del_Foo", result.setter.cNestedSpecifier)
        assertEquals("foo_set", result.setter.cShortName)
    }

    @Test
    fun finishBuildingPropertyReadsVisibility() {
        val limeElement = LimeProperty(
            fooPath,
            typeRef = LimeBasicTypeRef.FLOAT,
            visibility = LimeVisibility.INTERNAL
        )
        contextStack.injectResult(swiftType)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftProperty::class.java)
        assertEquals(SwiftVisibility.INTERNAL, result.visibility)
        assertEquals(SwiftVisibility.INTERNAL, result.getter.visibility)
        assertEquals(SwiftVisibility.INTERNAL, result.setter.visibility)
    }

    @Test
    fun finishBuildingPropertyReadsInternalSetter() {
        val limeElement = LimeProperty(
            fooPath,
            typeRef = LimeBasicTypeRef.FLOAT,
            attributes = LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.INTERNAL_SETTER)
                .build()
        )
        contextStack.injectResult(swiftType)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftProperty::class.java)
        assertEquals(SwiftVisibility.PUBLIC, result.visibility)
        assertEquals(SwiftVisibility.PUBLIC, result.getter.visibility)
        assertEquals(SwiftVisibility.INTERNAL, result.setter.visibility)
    }

    @Test
    fun finishBuildingPropertyReadsReadonly() {
        val limeElement = LimeProperty(fooPath, typeRef = LimeBasicTypeRef.FLOAT, isReadonly = true)
        contextStack.injectResult(swiftType)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftProperty::class.java)
        assertNull(result.setter)
    }

    @Test
    fun finishBuildingPropertyReadsNullable() {
        val limeElement = LimeProperty(
            fooPath,
            typeRef = LimeBasicTypeRef.FLOAT,
            attributes = LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.NULLABLE)
                .build()
        )
        contextStack.injectResult(swiftType)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftProperty::class.java)
        assertTrue(result.getter.returnType.optional)
        assertTrue(result.setter.parameters.first().type.optional)
    }

    @Test
    fun finishBuildingPropertyReadsStatic() {
        val limeElement = LimeProperty(fooPath, typeRef = LimeBasicTypeRef.FLOAT, isStatic = true)
        contextStack.injectResult(swiftType)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftProperty::class.java)
        assertTrue(result.isStatic)
        assertTrue(result.getter.isStatic)
        assertTrue(result.setter.isStatic)
    }

    @Test
    fun finishBuildingClassReadsEquatable() {
        val limeElement = LimeContainer(
            fooPath,
            type = LimeContainer.ContainerType.CLASS,
            attributes = LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.EQUATABLE)
                .build()
        )

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftClass::class.java)
        assertTrue(result.hasEquatableType)
    }

    @Test
    fun finishBuildingClassReadsPointerEquatable() {
        val limeElement = LimeContainer(
            fooPath,
            type = LimeContainer.ContainerType.CLASS,
            attributes = LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.POINTER_EQUATABLE)
                .build()
        )

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftClass::class.java)
        assertTrue(result.hasEquatableType)
    }
}
