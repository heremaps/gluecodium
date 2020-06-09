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

package com.here.gluecodium.generator.swift

import com.here.gluecodium.Gluecodium
import com.here.gluecodium.generator.cbridge.CBridgeNameRules
import com.here.gluecodium.generator.common.nameRuleSetFromConfig
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeAttributes
import com.here.gluecodium.model.lime.LimeBasicTypeRef
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeComment
import com.here.gluecodium.model.lime.LimeConstant
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeEnumerator
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeLazyEnumeratorRef
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimePath.Companion.EMPTY_PATH
import com.here.gluecodium.model.lime.LimeProperty
import com.here.gluecodium.model.lime.LimeReturnType
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeSignatureResolver
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeValue
import com.here.gluecodium.model.lime.LimeVisibility
import com.here.gluecodium.model.swift.SwiftClass
import com.here.gluecodium.model.swift.SwiftConstant
import com.here.gluecodium.model.swift.SwiftEnum
import com.here.gluecodium.model.swift.SwiftEnumItem
import com.here.gluecodium.model.swift.SwiftError
import com.here.gluecodium.model.swift.SwiftField
import com.here.gluecodium.model.swift.SwiftMethod
import com.here.gluecodium.model.swift.SwiftModelElement
import com.here.gluecodium.model.swift.SwiftParameter
import com.here.gluecodium.model.swift.SwiftProperty
import com.here.gluecodium.model.swift.SwiftStruct
import com.here.gluecodium.model.swift.SwiftType
import com.here.gluecodium.model.swift.SwiftTypeDef
import com.here.gluecodium.model.swift.SwiftValue
import com.here.gluecodium.model.swift.SwiftVisibility
import com.here.gluecodium.test.AssertHelpers.assertContains
import com.here.gluecodium.test.MockContextStack
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
    private val deprecatedAttributes =
        LimeAttributes.Builder().addAttribute(
            LimeAttributeType.DEPRECATED,
            LimeAttributeValueType.MESSAGE,
            LimeComment("Bar")
        ).build()

    private val contextStack = MockContextStack<SwiftModelElement>()

    private lateinit var modelBuilder: SwiftModelBuilder

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)

        val nameRuleSet = nameRuleSetFromConfig(Gluecodium.testOptions().swiftNameRules)
        modelBuilder =
            SwiftModelBuilder(
                limeReferenceMap = emptyMap(),
                signatureResolver = signatureResolver,
                nameResolver = nameResolver,
                typeMapper = typeMapper,
                nameRules = SwiftNameRules(nameRuleSet),
                contextStack = contextStack,
                buildTransientModel = { emptyList() }
            )

        every { nameResolver.getFullName(any()) } returns "nonsense"
    }

    @Test
    fun finishBuildingMethod() {
        val limeTypeRef = LimeDirectTypeRef(object : LimeType(EMPTY_PATH) {})
        val limeReturnType = LimeReturnType(limeTypeRef, LimeComment("returnComment"))
        val limeElement = LimeFunction(
            fooPath.child("buzz"),
            comment = LimeComment("some comment"),
            attributes = deprecatedAttributes,
            returnType = limeReturnType
        )
        every { typeMapper.mapType(limeTypeRef) } returns swiftType

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftMethod::class.java)
        assertEquals("buzz", result.name)
        assertEquals("some comment", result.comment.documentation)
        assertEquals("Bar", result.comment.deprecated)
        assertEquals(swiftType, result.returnType)
        assertEquals("returnComment", result.returnComment)
        assertEquals("mo_del", result.cNestedSpecifier)
        assertEquals("buzz", result.cShortName)
    }

    @Test
    fun finishBuildingMethodReadsConstructor() {
        val limeElement = LimeFunction(fooPath, isConstructor = true, isStatic = true)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftMethod::class.java)
        assertEquals(CBridgeNameRules.BASE_REF_NAME, result.returnType.name)
        assertTrue(result.isStatic)
        assertTrue(result.isConstructor)
    }

    @Test
    fun finishBuildingMethodReadsConstructorSignatureClash() {
        val limeElement = LimeFunction(fooPath, isConstructor = true, isStatic = true)
        every { signatureResolver.hasSignatureClash(limeElement) } returns true

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftMethod::class.java)
        assertTrue(result.isOverriding)
    }

    @Test
    fun finishBuildingExceptionReadsErrorType() {
        val limeException =
            LimeException(LimePath(emptyList(), listOf("bar")), errorType = LimeBasicTypeRef.FLOAT)
        val swiftEnum = SwiftEnum("EnumName")
        contextStack.injectResult(swiftEnum)

        modelBuilder.finishBuilding(limeException)

        val result = modelBuilder.getFinalResult(SwiftError::class.java)
        assertEquals("BarError", result.name)
        assertEquals("EnumName", result.type.publicName)
    }

    @Test
    fun finishBuildingMethodReadsVisibility() {
        val limeElement = LimeFunction(fooPath, visibility = LimeVisibility.INTERNAL)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftMethod::class.java)
        assertEquals(SwiftVisibility.INTERNAL, result.visibility)
    }

    @Test
    fun finishBuildingMethodReadsStatic() {
        val limeElement = LimeFunction(fooPath, isStatic = true)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftMethod::class.java)
        assertTrue(result.isStatic)
    }

    @Test
    fun finishBuildingMethodReadsParameters() {
        val limeElement = LimeFunction(fooPath)
        val swiftParameter = SwiftParameter("", SwiftType.VOID)
        contextStack.injectResult(swiftParameter)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftMethod::class.java)
        assertContains(swiftParameter, result.parameters)
    }

    @Test
    fun finishBuildingParameter() {
        val limeElement =
            LimeParameter(fooPath, comment = LimeComment("some comment"), typeRef = LimeBasicTypeRef.FLOAT)
        contextStack.injectResult(swiftType)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftParameter::class.java)
        assertEquals("foo", result.name)
        assertEquals("some comment", result.comment.documentation)
        assertEquals(swiftType, result.type)
    }

    @Test
    fun finishBuildingParameterReadsArgumentLabel() {
        val limeElement = LimeParameter(
            fooPath,
            typeRef = LimeBasicTypeRef.FLOAT,
            attributes = LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.SWIFT, LimeAttributeValueType.LABEL, "foo_label")
                .build()
        )
        contextStack.injectResult(swiftType)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftParameter::class.java)
        assertEquals("foo_label", result.argumentLabel)
    }

    @Test
    fun finishBuildingStruct() {
        val limeElement = LimeStruct(
            fooPath,
            comment = LimeComment("some comment"),
            attributes = deprecatedAttributes,
            constructorComment = LimeComment("other comment")
        )

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftStruct::class.java)
        assertEquals("nonsense", result.name)
        assertEquals("some comment", result.comment.documentation)
        assertEquals("Bar", result.comment.deprecated)
        assertEquals("other comment", result.generatedConstructorComment)
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
        val swiftField = SwiftField("", null, SwiftType.VOID, null)
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
        val limeElement = LimeField(
            fooPath,
            comment = LimeComment("some comment"),
            attributes = deprecatedAttributes,
            typeRef = LimeBasicTypeRef.FLOAT
        )
        contextStack.injectResult(swiftType)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftField::class.java)
        assertEquals("foo", result.name)
        assertEquals("some comment", result.comment.documentation)
        assertEquals("Bar", result.comment.deprecated)
        assertEquals(swiftType, result.type)
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
        val limeElement =
            LimeEnumeration(fooPath, comment = LimeComment("some comment"), attributes = deprecatedAttributes)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftEnum::class.java)
        assertEquals("nonsense", result.name)
        assertEquals("some comment", result.comment.documentation)
        assertEquals("Bar", result.comment.deprecated)
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
        val limeElement =
            LimeEnumerator(fooPath, comment = LimeComment("some comment"), attributes = deprecatedAttributes)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftEnumItem::class.java)
        assertEquals("foo", result.name)
        assertEquals("some comment", result.comment.documentation)
        assertEquals("Bar", result.comment.deprecated)
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
        val limeElement = LimeTypeAlias(
            fooPath,
            comment = LimeComment("some comment"),
            attributes = deprecatedAttributes,
            typeRef = LimeBasicTypeRef.FLOAT
        )
        contextStack.injectResult(swiftType)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftTypeDef::class.java)
        assertEquals("nonsense", result.name)
        assertEquals("some comment", result.comment.documentation)
        assertEquals("Bar", result.comment.deprecated)
        assertEquals(swiftType, result.type)
    }

    @Test
    fun finishBuildingTypeDefReadsVisibility() {
        val limeElement = LimeTypeAlias(
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
    fun finishBuildingConstant() {
        val limeElement = LimeConstant(
            fooPath,
            comment = LimeComment("some comment"),
            attributes = deprecatedAttributes,
            typeRef = LimeBasicTypeRef.FLOAT,
            value = LimeValue.Special.FLOAT_NAN
        )
        contextStack.injectResult(swiftType)
        contextStack.injectResult(swiftValue)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftConstant::class.java)
        assertEquals("foo", result.name)
        assertEquals("some comment", result.comment.documentation)
        assertEquals("Bar", result.comment.deprecated)
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
            LimeLazyEnumeratorRef(mapOf("bar" to LimeEnumerator(fooPath)), "bar")
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
            LimeDirectTypeRef(LimeList(LimeBasicTypeRef.FLOAT)),
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
    fun finishBuildingValueEmptySet() {
        val limeElement = LimeValue.InitializerList(
            LimeDirectTypeRef(LimeSet(LimeBasicTypeRef.FLOAT)),
            emptyList()
        )

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftValue::class.java)
        assertEquals("[]", result.name)
    }

    @Test
    fun finishBuildingValueStructInitializer() {
        val limeElement = LimeValue.InitializerList(
            LimeDirectTypeRef(LimeStruct(fooPath, fields = listOf(
                LimeField(LimePath(emptyList(), listOf("bar")), typeRef = LimeBasicTypeRef.DOUBLE),
                LimeField(LimePath(emptyList(), listOf("baz")), typeRef = LimeBasicTypeRef.FLOAT)
            ))),
            listOf(
                LimeValue.Null(LimeBasicTypeRef.DOUBLE),
                LimeValue.InitializerList(
                    LimeDirectTypeRef(LimeStruct(LimePath(emptyList(), listOf("fizz")))),
                    emptyList()
                )
            )
        )
        every { nameResolver.getFullName(any()) }.returnsMany("nonsense", "moreNonsense")

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftValue::class.java)
        assertEquals("moreNonsense(bar: nil, baz: nonsense())", result.name)
    }

    @Test
    fun finishBuildingProperty() {
        val limeElement = LimeProperty(
            fooPath,
            typeRef = LimeBasicTypeRef.FLOAT,
            comment = LimeComment("some comment"),
            attributes = deprecatedAttributes,
            getter = LimeFunction(EMPTY_PATH),
            setter = LimeFunction(EMPTY_PATH)
        )
        contextStack.injectResult(swiftType)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftProperty::class.java)
        assertEquals("foo", result.name)
        assertEquals("some comment", result.comment.documentation)
        assertEquals("Bar", result.comment.deprecated)
        assertEquals(swiftType, result.getter.returnType)
        assertEquals("mo_del", result.getter.cNestedSpecifier)
        assertEquals("foo_get", result.getter.cShortName)
        assertEquals(swiftType, result.setter?.parameters?.first()?.type)
        assertEquals("mo_del", result.setter?.cNestedSpecifier)
        assertEquals("foo_set", result.setter?.cShortName)
    }

    @Test
    fun finishBuildingPropertyReadsVisibility() {
        val limeElement = LimeProperty(
            fooPath,
            typeRef = LimeBasicTypeRef.FLOAT,
            visibility = LimeVisibility.INTERNAL,
            getter = LimeFunction(EMPTY_PATH, visibility = LimeVisibility.INTERNAL),
            setter = LimeFunction(EMPTY_PATH, visibility = LimeVisibility.INTERNAL)
        )
        contextStack.injectResult(swiftType)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftProperty::class.java)
        assertEquals(SwiftVisibility.INTERNAL, result.visibility)
        assertEquals(SwiftVisibility.INTERNAL, result.getter.visibility)
        assertEquals(SwiftVisibility.INTERNAL, result.setter?.visibility)
    }

    @Test
    fun finishBuildingPropertyReadsReadonly() {
        val limeElement =
            LimeProperty(fooPath, typeRef = LimeBasicTypeRef.FLOAT, getter = LimeFunction(EMPTY_PATH))
        contextStack.injectResult(swiftType)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftProperty::class.java)
        assertNull(result.setter)
    }

    @Test
    fun finishBuildingPropertyReadsStatic() {
        val limeElement = LimeProperty(
            fooPath,
            typeRef = LimeBasicTypeRef.FLOAT,
            getter = LimeFunction(EMPTY_PATH),
            setter = LimeFunction(EMPTY_PATH),
            isStatic = true
        )
        contextStack.injectResult(swiftType)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftProperty::class.java)
        assertTrue(result.isStatic)
        assertTrue(result.getter.isStatic)
        assertEquals(true, result.setter?.isStatic)
    }

    @Test
    fun finishBuildingClassReadsEquatable() {
        val limeElement = LimeClass(
            fooPath,
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
        val limeElement = LimeClass(
            fooPath,
            attributes = LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.POINTER_EQUATABLE)
                .build()
        )

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftClass::class.java)
        assertTrue(result.hasEquatableType)
    }
}
