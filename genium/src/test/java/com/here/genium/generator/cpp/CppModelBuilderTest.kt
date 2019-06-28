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

package com.here.genium.generator.cpp

import com.here.genium.model.common.Comments
import com.here.genium.model.cpp.CppClass
import com.here.genium.model.cpp.CppComplexTypeRef
import com.here.genium.model.cpp.CppConstant
import com.here.genium.model.cpp.CppElement
import com.here.genium.model.cpp.CppEnum
import com.here.genium.model.cpp.CppEnumItem
import com.here.genium.model.cpp.CppField
import com.here.genium.model.cpp.CppInheritance
import com.here.genium.model.cpp.CppMethod
import com.here.genium.model.cpp.CppParameter
import com.here.genium.model.cpp.CppPrimitiveTypeRef
import com.here.genium.model.cpp.CppStruct
import com.here.genium.model.cpp.CppUsing
import com.here.genium.model.cpp.CppValue
import com.here.genium.model.lime.LimeArray
import com.here.genium.model.lime.LimeAttributeType
import com.here.genium.model.lime.LimeAttributes
import com.here.genium.model.lime.LimeBasicTypeRef
import com.here.genium.model.lime.LimeConstant
import com.here.genium.model.lime.LimeContainer
import com.here.genium.model.lime.LimeDirectTypeRef
import com.here.genium.model.lime.LimeEnumeration
import com.here.genium.model.lime.LimeEnumerator
import com.here.genium.model.lime.LimeField
import com.here.genium.model.lime.LimeLazyTypeRef
import com.here.genium.model.lime.LimeMethod
import com.here.genium.model.lime.LimeParameter
import com.here.genium.model.lime.LimePath.Companion.EMPTY_PATH
import com.here.genium.model.lime.LimeProperty
import com.here.genium.model.lime.LimeReturnType
import com.here.genium.model.lime.LimeStruct
import com.here.genium.model.lime.LimeTypeDef
import com.here.genium.model.lime.LimeValue
import com.here.genium.test.AssertHelpers.assertContains
import com.here.genium.test.MockContextStack
import io.mockk.MockKAnnotations
import io.mockk.every
import io.mockk.impl.annotations.MockK
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class CppModelBuilderTest {
    @MockK
    private lateinit var typeMapper: CppTypeMapper
    @MockK
    private lateinit var nameResolver: CppNameResolver

    private val limeEnumerator = LimeEnumerator(EMPTY_PATH)
    private val limeEnumeration = LimeEnumeration(EMPTY_PATH)
    private val limeProperty = LimeProperty(
        EMPTY_PATH,
        typeRef = LimeBasicTypeRef.DOUBLE,
        getter = LimeMethod(EMPTY_PATH),
        setter = LimeMethod(EMPTY_PATH)
    )
    private val limeField = LimeField(EMPTY_PATH, typeRef = LimeBasicTypeRef.DOUBLE)
    private val limeStruct = LimeStruct(EMPTY_PATH)
    private val limeMethod = LimeMethod(EMPTY_PATH)
    private val limeInterface = LimeContainer(
        path = EMPTY_PATH,
        type = LimeContainer.ContainerType.INTERFACE
    )

    private val cppEnum = CppEnum("", "", false, emptyList())
    private val cppUsing = CppUsing("", "", Comments(), CppPrimitiveTypeRef.BOOL)
    private val cppStruct = CppStruct("")
    private val cppConstant = CppConstant("", "", CppPrimitiveTypeRef.BOOL, CppValue(""))
    private val cppTypeRef = CppComplexTypeRef("foobarbaz")

    private val contextStack = MockContextStack<CppElement>()

    private lateinit var modelBuilder: CppModelBuilder

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)

        modelBuilder = CppModelBuilder(contextStack, typeMapper, nameResolver)

        every { nameResolver.getName(any()) } returns "Foo"
        every { nameResolver.getFullyQualifiedName(any()) } returns "Bar"
    }

    @Test
    fun finishBuildingTypeCollectionContainerPropagatesMembers() {
        contextStack.injectResult(cppEnum)
        contextStack.injectResult(cppUsing)
        contextStack.injectResult(cppStruct)
        contextStack.injectResult(cppConstant)
        val limeElement = LimeContainer(
            EMPTY_PATH,
            type = LimeContainer.ContainerType.TYPE_COLLECTION
        )

        modelBuilder.finishBuilding(limeElement)

        val results = modelBuilder.finalResults
        assertContains(cppEnum, results)
        assertContains(cppUsing, results)
        assertContains(cppStruct, results)
        assertContains(cppConstant, results)
    }

    @Test
    fun finishBuildingInterfaceContainerReadsName() {
        modelBuilder.finishBuilding(limeInterface)

        val result = modelBuilder.getFinalResult(CppClass::class.java)
        assertEquals("Foo", result.name)
        assertEquals("Bar", result.fullyQualifiedName)
    }

    @Test
    fun finishBuildingInterfaceReadsMethods() {
        val cppMethod = CppMethod("")
        contextStack.injectResult(cppMethod)

        modelBuilder.finishBuilding(limeInterface)

        val result = modelBuilder.getFinalResult(CppClass::class.java)
        assertContains(cppMethod, result.methods)
    }

    @Test
    fun finishBuildingInterfaceReadsMembers() {
        contextStack.injectResult(cppEnum)
        contextStack.injectResult(cppUsing)
        contextStack.injectResult(cppStruct)
        contextStack.injectResult(cppConstant)

        modelBuilder.finishBuilding(limeInterface)

        val result = modelBuilder.getFinalResult(CppClass::class.java)
        assertContains(cppEnum, result.members)
        assertContains(cppUsing, result.members)
        assertContains(cppStruct, result.members)
        assertContains(cppConstant, result.members)
    }

    @Test
    fun finishBuildingInterfaceReadsParent() {
        val limeParentTypeRef = LimeDirectTypeRef(limeInterface)
        val limeElement = LimeContainer(
            EMPTY_PATH,
            type = LimeContainer.ContainerType.INTERFACE,
            parent = limeParentTypeRef
        )
        every { typeMapper.mapInstanceType(limeInterface, any()) } returns cppTypeRef

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(CppClass::class.java)
        val cppInheritance = result.inheritances.first()
        assertEquals(cppTypeRef, cppInheritance.parent)
        assertEquals(CppInheritance.Type.Public, cppInheritance.visibility)
    }

    @Test
    fun finishBuildingInterfaceReadsExternalType() {
        val limeElement = LimeContainer(
            EMPTY_PATH,
            type = LimeContainer.ContainerType.INTERFACE,
            attributes = LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.EXTERNAL_TYPE)
                .build()
        )

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(CppClass::class.java)
        assertTrue(result.isExternal)
    }

    @Test
    fun finishBuildingInterfaceReadsEquatable() {
        val limeElement = LimeContainer(
            EMPTY_PATH,
            type = LimeContainer.ContainerType.INTERFACE,
            attributes = LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.EQUATABLE)
                .build()
        )

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(CppClass::class.java)
        assertTrue(result.isEquatable)
    }

    @Test
    fun finishBuildingMethodReadsNames() {
        modelBuilder.finishBuilding(limeMethod)

        val result = modelBuilder.getFinalResult(CppMethod::class.java)
        assertEquals("Foo", result.name)
        assertEquals("Bar", result.fullyQualifiedName)
    }

    @Test
    fun finishBuildingMethodReadsParameters() {
        val cppParameter = CppParameter("", cppTypeRef)
        contextStack.injectResult(cppParameter)

        modelBuilder.finishBuilding(limeMethod)

        val result = modelBuilder.getFinalResult(CppMethod::class.java)
        assertEquals(cppParameter, result.parameters.first())
    }

    @Test
    fun finishBuildingMethodReadsReturnType() {
        val limeReturnType = LimeReturnType(LimeBasicTypeRef.DOUBLE)
        val limeElement = LimeMethod(EMPTY_PATH, returnType = limeReturnType)
        every { typeMapper.mapType(any()) } returns cppTypeRef

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(CppMethod::class.java)
        assertEquals(cppTypeRef, result.returnType)
    }

    @Test
    fun finishBuildingMethodReadsErrorType() {
        contextStack.injectResult(cppTypeRef)
        every { typeMapper.mapType(any()) } returns CppPrimitiveTypeRef.VOID

        modelBuilder.finishBuilding(limeMethod)

        val result = modelBuilder.getFinalResult(CppMethod::class.java)
        assertEquals(CppTypeMapper.STD_ERROR_CODE_TYPE, result.returnType)
    }

    @Test
    fun finishBuildingMethodReadsReturnAndErrorTypes() {
        val cppErrorType = CppComplexTypeRef("")
        contextStack.injectResult(cppErrorType)
        every { typeMapper.getReturnWrapperType(any(), any()) } returns cppTypeRef

        modelBuilder.finishBuilding(limeMethod)

        val result = modelBuilder.getFinalResult(CppMethod::class.java)
        assertEquals(cppTypeRef, result.returnType)
    }

    @Test
    fun finishBuildingMethodReadsStaticFlag() {
        val limeElement = LimeMethod(EMPTY_PATH, isStatic = true)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(CppMethod::class.java)
        assertContains(CppMethod.Specifier.STATIC, result.specifiers)
    }

    @Test
    fun finishBuildingMethodReadsConstructorFlag() {
        val limeElement = LimeMethod(
            EMPTY_PATH,
            attributes = LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.CONSTRUCTOR)
                .build(),
            isStatic = true
        )

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(CppMethod::class.java)
        assertContains(CppMethod.Specifier.STATIC, result.specifiers)
    }

    @Test
    fun finishBuildingParameterReadsNameAndType() {
        contextStack.injectResult(cppTypeRef)
        val limeParameter = LimeParameter(EMPTY_PATH, typeRef = LimeBasicTypeRef.DOUBLE)

        modelBuilder.finishBuilding(limeParameter)

        val result = modelBuilder.getFinalResult(CppParameter::class.java)
        assertEquals("Foo", result.name)
        assertEquals(cppTypeRef, result.type)
    }

    @Test
    fun finishBuildingStructTypeReadsName() {
        modelBuilder.finishBuilding(limeStruct)

        val result = modelBuilder.getFinalResult(CppStruct::class.java)
        assertEquals("Foo", result.name)
        assertEquals("Bar", result.fullyQualifiedName)
    }

    @Test
    fun finishBuildingStructTypeReadsFields() {
        val cppField = CppField("nonsense", "greater::nonsense", cppTypeRef)
        contextStack.injectResult(cppField)

        modelBuilder.finishBuilding(limeStruct)

        val result = modelBuilder.getFinalResult(CppStruct::class.java)
        assertContains(cppField, result.fields)
    }

    @Test
    fun finishBuildingStructTypeReadsMethods() {
        val cppMethod = CppMethod(
            name = "nonsense",
            specifiers = setOf(CppMethod.Specifier.VIRTUAL),
            qualifiers = setOf(CppMethod.Qualifier.PURE_VIRTUAL)
        )
        contextStack.injectResult(cppMethod)

        modelBuilder.finishBuilding(limeStruct)

        val result = modelBuilder.getFinalResult(CppStruct::class.java)
        val resultMethod = result.methods.first()
        assertEquals("nonsense", resultMethod.name)
        assertTrue(resultMethod.specifiers.isEmpty())
        assertEquals(1, resultMethod.qualifiers.size)
        assertEquals(CppMethod.Qualifier.CONST, resultMethod.qualifiers.first())
    }

    @Test
    fun finishBuildingStructTypeReadsConstants() {
        contextStack.injectResult(cppConstant)

        modelBuilder.finishBuilding(limeStruct)

        val result = modelBuilder.getFinalResult(CppStruct::class.java)
        assertContains(cppConstant, result.constants)
    }

    @Test
    fun finishBuildingStructTypeReadsExternalType() {
        val limeElement = LimeStruct(
            EMPTY_PATH,
            attributes = LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.EXTERNAL_TYPE)
                .build()
        )

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(CppStruct::class.java)
        assertTrue(result.isExternal)
    }

    @Test
    fun finishBuildingStructTypeReadsEquatable() {
        val limeElement = LimeStruct(
            EMPTY_PATH,
            attributes = LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.EQUATABLE)
                .build()
        )

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(CppStruct::class.java)
        assertTrue(result.isEquatable)
    }

    @Test
    fun finishBuildingStructTypeReadsImmutable() {
        val limeElement = LimeStruct(
            EMPTY_PATH,
            attributes = LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.IMMUTABLE)
                .build()
        )

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(CppStruct::class.java)
        assertTrue(result.isImmutable)
    }

    @Test
    fun finishBuildingFieldReadsNameAndType() {
        contextStack.injectResult(cppTypeRef)

        modelBuilder.finishBuilding(limeField)

        val result = modelBuilder.getFinalResult(CppField::class.java)
        assertEquals("Foo", result.name)
        assertEquals(cppTypeRef, result.type)
    }

    @Test
    fun finishBuildingFieldReadsDefaultValue() {
        val cppValue = CppValue("")
        contextStack.injectResult(cppValue)
        contextStack.injectResult(cppTypeRef)

        modelBuilder.finishBuilding(limeField)

        val result = modelBuilder.getFinalResult(CppField::class.java)
        assertEquals(cppValue, result.initializer)
    }

    @Test
    fun finishBuildingFieldReadsNullable() {
        contextStack.injectResult(cppTypeRef)
        val limeElement = LimeField(EMPTY_PATH, typeRef = LimeBasicTypeRef.DOUBLE.asNullable())

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(CppField::class.java)
        assertTrue(result.isNullable)
    }

    @Test
    fun finishBuildingFieldReadsImmutable() {
        contextStack.injectResult(cppTypeRef)
        val structType = LimeStruct(
            EMPTY_PATH,
            attributes = LimeAttributes.Builder().addAttribute(LimeAttributeType.IMMUTABLE).build()
        )
        val structTypeRef = LimeDirectTypeRef(structType)
        val limeElement = LimeField(EMPTY_PATH, typeRef = structTypeRef)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(CppField::class.java)
        assertTrue(result.hasImmutableType)
    }

    @Test
    fun finishBuildingFieldReadsImmutableArray() {
        contextStack.injectResult(cppTypeRef)
        val structType = LimeStruct(
            EMPTY_PATH,
            attributes = LimeAttributes.Builder().addAttribute(LimeAttributeType.IMMUTABLE).build()
        )
        val limeArray = LimeArray(LimeDirectTypeRef(structType))
        val limeElement = LimeField(EMPTY_PATH, typeRef = LimeDirectTypeRef(limeArray))

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(CppField::class.java)
        assertTrue(result.hasImmutableType)
    }

    @Test
    fun finishBuildingFieldReadsNestedImmutable() {
        contextStack.injectResult(cppTypeRef)
        val structType = LimeStruct(
            EMPTY_PATH,
            attributes = LimeAttributes.Builder().addAttribute(LimeAttributeType.IMMUTABLE).build()
        )
        val nestingField =
            LimeField(EMPTY_PATH, typeRef = LimeDirectTypeRef(structType))
        val nestingStructType = LimeStruct(EMPTY_PATH, fields = listOf(nestingField))
        val limeElement = LimeField(EMPTY_PATH, typeRef = LimeDirectTypeRef(nestingStructType))

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(CppField::class.java)
        assertTrue(result.hasImmutableType)
    }

    @Test
    fun finishBuildingFieldReadsIsClassEquatable() {
        contextStack.injectResult(cppTypeRef)
        val limeInterface = LimeContainer(
            EMPTY_PATH,
            type = LimeContainer.ContainerType.INTERFACE,
            attributes = LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.EQUATABLE)
                .build()
        )

        val field = LimeField(EMPTY_PATH, typeRef = LimeDirectTypeRef(limeInterface))

        modelBuilder.finishBuilding(field)

        val result = modelBuilder.getFinalResult(CppField::class.java)
        assertTrue(result.isClassEquatable)
    }

    @Test
    fun finishBuildingFieldReadsIsClassPointerEquatable() {
        contextStack.injectResult(cppTypeRef)
        val limeInterface = LimeContainer(
            EMPTY_PATH,
            type = LimeContainer.ContainerType.INTERFACE,
            attributes = LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.POINTER_EQUATABLE)
                .build()
        )

        val field = LimeField(EMPTY_PATH, typeRef = LimeDirectTypeRef(limeInterface))

        modelBuilder.finishBuilding(field)

        val result = modelBuilder.getFinalResult(CppField::class.java)
        assertTrue(result.isClassPointerEquatable)
    }

    @Test
    fun finishBuildingTypeDefReadsName() {
        contextStack.injectResult(cppTypeRef)
        val limeElement = LimeTypeDef(EMPTY_PATH, typeRef = LimeBasicTypeRef.DOUBLE)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(CppUsing::class.java)
        assertEquals("Foo", result.name)
        assertEquals("Bar", result.fullyQualifiedName)
        assertEquals(cppTypeRef, result.definition)
    }

    @Test
    fun finishBuildingPropertyCreatesGetter() {
        contextStack.injectResult(cppTypeRef)
        every { nameResolver.getGetterName(limeProperty) } returns "baz"
        every { nameResolver.getFullyQualifiedGetterName(limeProperty) } returns "foo.bar"

        modelBuilder.finishBuilding(limeProperty)

        val result = modelBuilder.getFinalResult(CppMethod::class.java)
        assertEquals("baz", result.name)
        assertEquals("foo.bar", result.fullyQualifiedName)
        assertContains(CppMethod.Qualifier.CONST, result.qualifiers)
        assertEquals(cppTypeRef, result.returnType)
    }

    @Test
    fun finishBuildingPropertyCreatesSetter() {
        contextStack.injectResult(cppTypeRef)
        every { nameResolver.getSetterName(limeProperty) } returns "baz"
        every { nameResolver.getFullyQualifiedSetterName(limeProperty) } returns "foo.bar"

        modelBuilder.finishBuilding(limeProperty)

        val results = modelBuilder.finalResults
        assertEquals(2, results.size)
        val setterResult = results.last()
        assertEquals("baz", setterResult.name)
        assertEquals("foo.bar", setterResult.fullyQualifiedName)
        assertEquals(cppTypeRef, (setterResult as CppMethod).parameters.first().type)
    }

    @Test
    fun finishBuildingPropertyReadonly() {
        contextStack.injectResult(cppTypeRef)
        val limeElement = LimeProperty(
            EMPTY_PATH,
            typeRef = LimeBasicTypeRef.DOUBLE,
            getter = LimeMethod(EMPTY_PATH)
        )

        modelBuilder.finishBuilding(limeElement)

        val results = modelBuilder.finalResults
        assertEquals(1, results.size)
    }

    @Test
    fun finishBuildingPropertyWithStatic() {
        contextStack.injectResult(cppTypeRef)
        val limeElement = LimeProperty(
            EMPTY_PATH,
            typeRef = LimeBasicTypeRef.DOUBLE,
            getter = LimeMethod(EMPTY_PATH),
            setter = LimeMethod(EMPTY_PATH),
            isStatic = true
        )

        modelBuilder.finishBuilding(limeElement)

        val results = modelBuilder.finalResults
        assertEquals(2, results.size)
        assertContains(CppMethod.Specifier.STATIC, (results.first() as CppMethod).specifiers)
        assertContains(CppMethod.Specifier.STATIC, (results.last() as CppMethod).specifiers)
    }

    @Test
    fun finishBuildingEnumerationReadsName() {
        modelBuilder.finishBuilding(limeEnumeration)

        val result = modelBuilder.getFinalResult(CppEnum::class.java)
        assertEquals("Foo", result.name)
        assertEquals("Bar", result.fullyQualifiedName)
    }

    @Test
    fun finishBuildingEnumerationReadsEnumItems() {
        val cppEnumItem = CppEnumItem("", "", null)
        contextStack.injectResult(cppEnumItem)

        modelBuilder.finishBuilding(limeEnumeration)

        val result = modelBuilder.getFinalResult(CppEnum::class.java)
        assertContains(cppEnumItem, result.items)
    }

    @Test
    fun finishBuildingEnumerationReadsExternalType() {
        val limeElement = LimeEnumeration(
            EMPTY_PATH,
            attributes = LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.EXTERNAL_TYPE)
                .build()
        )

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(CppEnum::class.java)
        assertTrue(result.isExternal)
    }

    @Test
    fun finishBuildingEnumerator() {
        modelBuilder.finishBuilding(limeEnumerator)

        val result = modelBuilder.getFinalResult(CppEnumItem::class.java)
        assertEquals("Foo", result.name)
    }

    @Test
    fun finishBuildingEnumeratorReadsValue() {
        val cppValue = CppValue("")
        contextStack.injectResult(cppValue)

        modelBuilder.finishBuilding(limeEnumerator)

        val result = modelBuilder.getFinalResult(CppEnumItem::class.java)
        assertEquals(cppValue, result.value)
    }

    @Test
    fun finishBuildingConstantReadsNameValueAndType() {
        val cppValue = CppValue("")
        contextStack.injectResult(cppValue)
        contextStack.injectResult(cppTypeRef)
        val limeConstant = LimeConstant(
            path = EMPTY_PATH,
            typeRef = LimeBasicTypeRef.DOUBLE,
            value = LimeValue.Literal(LimeBasicTypeRef.DOUBLE, "foo")
        )

        modelBuilder.finishBuilding(limeConstant)

        val result = modelBuilder.getFinalResult(CppConstant::class.java)
        assertEquals("Foo", result.name)
        assertEquals("Bar", result.fullyQualifiedName)
        assertEquals(cppTypeRef, result.type)
        assertEquals(cppValue, result.value)
    }

    @Test
    fun finishBuildingTypeRef() {
        val limeElement = LimeLazyTypeRef("foo", emptyMap())
        every { typeMapper.mapType(limeElement) } returns cppTypeRef

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(CppComplexTypeRef::class.java)
        assertEquals(cppTypeRef, result)
    }
}
