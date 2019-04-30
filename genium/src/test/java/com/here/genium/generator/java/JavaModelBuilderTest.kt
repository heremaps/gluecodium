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

package com.here.genium.generator.java

import com.here.genium.model.java.JavaClass
import com.here.genium.model.java.JavaConstant
import com.here.genium.model.java.JavaElement
import com.here.genium.model.java.JavaEnum
import com.here.genium.model.java.JavaEnumItem
import com.here.genium.model.java.JavaEnumType
import com.here.genium.model.java.JavaExceptionClass
import com.here.genium.model.java.JavaExceptionType
import com.here.genium.model.java.JavaField
import com.here.genium.model.java.JavaImport
import com.here.genium.model.java.JavaMethod
import com.here.genium.model.java.JavaPackage
import com.here.genium.model.java.JavaParameter
import com.here.genium.model.java.JavaPrimitiveType
import com.here.genium.model.java.JavaType
import com.here.genium.model.java.JavaValue
import com.here.genium.model.java.JavaVisibility
import com.here.genium.model.lime.LimeAttributeType
import com.here.genium.model.lime.LimeAttributes
import com.here.genium.model.lime.LimeBasicTypeRef
import com.here.genium.model.lime.LimeConstant
import com.here.genium.model.lime.LimeEnumeration
import com.here.genium.model.lime.LimeEnumerator
import com.here.genium.model.lime.LimeField
import com.here.genium.model.lime.LimeMethod
import com.here.genium.model.lime.LimeParameter
import com.here.genium.model.lime.LimePath
import com.here.genium.model.lime.LimePath.Companion.EMPTY_PATH
import com.here.genium.model.lime.LimeProperty
import com.here.genium.model.lime.LimeReturnType
import com.here.genium.model.lime.LimeStruct
import com.here.genium.model.lime.LimeType
import com.here.genium.model.lime.LimeTypeRef
import com.here.genium.model.lime.LimeValue
import com.here.genium.model.lime.LimeVisibility
import com.here.genium.test.AssertHelpers.assertContains
import com.here.genium.test.MockContextStack
import io.mockk.MockKAnnotations
import io.mockk.every
import io.mockk.impl.annotations.MockK
import io.mockk.mockkObject
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class JavaModelBuilderTest {
    @MockK private lateinit var typeMapper: JavaTypeMapper
    @MockK private lateinit var valueMapper: JavaValueMapper
    @MockK private lateinit var methodNameResolver: JavaMethodNameResolver

    private val javaType = object : JavaType("") {}
    private val anotherJavaType = object : JavaType("Nonsense") {}
    private val javaValue = JavaValue("")

    private val limeTypeRef = object : LimeTypeRef("") {}

    private val contextStack = MockContextStack<JavaElement>()
    private val rootPackage = JavaPackage(listOf("pack", "age"))
    private val errorEnums = mutableSetOf<String>()

    private lateinit var modelBuilder: JavaModelBuilder

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)
        mockkObject(JavaValueMapper.Companion)

        modelBuilder = JavaModelBuilder(
            contextStack,
            rootPackage,
            typeMapper,
            valueMapper,
            methodNameResolver,
            errorEnums
        )
    }

    @Test
    fun finishBuildingMethod() {
        val limeElement = LimeMethod(EMPTY_PATH, comment = "some comment")
        every { methodNameResolver.getName(limeElement) } returns "foo"

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaMethod::class.java)
        assertEquals("foo", result.name)
        assertEquals("some comment", result.comment)
    }

    @Test
    fun finishBuildingMethodReadsVisibility() {
        val limeElement = LimeMethod(EMPTY_PATH, visibility = LimeVisibility.INTERNAL)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaMethod::class.java)
        assertEquals(JavaVisibility.PACKAGE, result.visibility)
    }

    @Test
    fun finishBuildingMethodReadsReturnType() {
        every { typeMapper.mapType(any()) } returns javaType
        every { typeMapper.applyNullability(javaType, any()) } returns anotherJavaType
        val limeElement = LimeMethod(EMPTY_PATH)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaMethod::class.java)
        assertEquals(anotherJavaType, result.returnType)
    }

    @Test
    fun finishBuildingMethodReadsReturnTypeComment() {
        val limeReturnType = LimeReturnType(LimeBasicTypeRef.FLOAT, comment = "some comment")
        val limeElement = LimeMethod(EMPTY_PATH, returnType = limeReturnType)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaMethod::class.java)
        assertEquals("some comment", result.returnComment)
    }

    @Test
    fun finishBuildingMethodReadsErrorType() {
        val limeType = object : LimeType(EMPTY_PATH) {}
        val limeTypeRef = LimeTypeRef(mapOf("bar" to limeType), "bar")
        val limeElement = LimeMethod(EMPTY_PATH, errorType = limeTypeRef)
        val javaExceptionType =
            JavaExceptionType("", emptyList(), JavaImport("", JavaPackage.DEFAULT))
        every { typeMapper.mapExceptionType(limeType) } returns javaExceptionType

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaMethod::class.java)
        assertEquals(javaExceptionType, result.exception)
    }

    @Test
    fun finishBuildingMethodReadsParameters() {
        val javaParameter = JavaParameter("", javaType)
        contextStack.injectResult(javaParameter)
        val limeElement = LimeMethod(EMPTY_PATH)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaMethod::class.java)
        assertContains(javaParameter, result.parameters)
    }

    @Test
    fun finishBuildingMethodReadsConstructor() {
        val limeElement = LimeMethod(
            EMPTY_PATH,
            attributes = LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.CONSTRUCTOR)
                .build()
        )

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaMethod::class.java)
        assertTrue(result.isConstructor)
        assertContains(JavaMethod.MethodQualifier.STATIC, result.qualifiers)
        assertEquals(JavaPrimitiveType.LONG, result.returnType)
    }

    @Test
    fun finishBuildingMethodReadsStatic() {
        val limeElement = LimeMethod(EMPTY_PATH, isStatic = true)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaMethod::class.java)
        assertContains(JavaMethod.MethodQualifier.STATIC, result.qualifiers)
    }

    @Test
    fun finishBuildingParameter() {
        contextStack.injectResult(javaType)
        val limeElement = LimeParameter(
            LimePath(emptyList(), listOf("Foo")),
            comment = "some comment",
            typeRef = limeTypeRef
        )
        every { typeMapper.applyNullability(javaType, any()) } returns anotherJavaType

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaParameter::class.java)
        assertEquals("foo", result.name)
        assertEquals("some comment", result.comment)
        assertEquals(anotherJavaType, result.type)
    }

    @Test
    fun finishBuildingValue() {
        val limeElement = LimeValue.Special.FLOAT_NAN
        every { valueMapper.mapValue(limeElement) } returns javaValue

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaValue::class.java)
        assertEquals(javaValue, result)
    }

    @Test
    fun finishBuildingTypeRef() {
        every { typeMapper.mapType(limeTypeRef) } returns javaType

        modelBuilder.finishBuilding(limeTypeRef)

        val result = modelBuilder.getFinalResult(JavaType::class.java)
        assertEquals(javaType, result)
    }

    @Test
    fun finishBuildingConstant() {
        contextStack.injectResult(javaType)
        contextStack.injectResult(javaValue)
        val limeElement = LimeConstant(
            LimePath(emptyList(), listOf("foo")),
            comment = "some comment",
            typeRef = limeTypeRef,
            value = LimeValue.Special.FLOAT_NAN
        )

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaConstant::class.java)
        assertEquals("FOO", result.name)
        assertEquals("some comment", result.comment)
        assertEquals(javaType, result.type)
        assertEquals(javaValue, result.value)
    }

    @Test
    fun finishBuildingConstantReadsVisibility() {
        contextStack.injectResult(javaType)
        contextStack.injectResult(javaValue)
        val limeElement = LimeConstant(
            LimePath(emptyList(), listOf("foo")),
            comment = "some comment",
            typeRef = limeTypeRef,
            value = LimeValue.Special.FLOAT_NAN,
            visibility = LimeVisibility.INTERNAL
        )

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaConstant::class.java)
        assertEquals(JavaVisibility.PACKAGE, result.visibility)
    }

    @Test
    fun finishBuildingStruct() {
        val limeElement = LimeStruct(
            LimePath(emptyList(), listOf("foo")),
            comment = "some comment"
        )

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaClass::class.java)
        assertEquals("Foo", result.name)
        assertEquals("some comment", result.comment)
        assertEquals(rootPackage, result.javaPackage)
    }

    @Test
    fun finishBuildingStructReadsVisibility() {
        val limeElement = LimeStruct(
            LimePath(emptyList(), listOf("foo")),
            visibility = LimeVisibility.INTERNAL
        )

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaClass::class.java)
        assertEquals(JavaVisibility.PACKAGE, result.visibility)
    }

    @Test
    fun finishBuildingStructReadsFields() {
        val javaField = JavaField("", javaType, javaValue)
        contextStack.injectResult(javaField)
        val limeElement = LimeStruct(LimePath(emptyList(), listOf("foo")))

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaClass::class.java)
        assertContains(javaField, result.fields)
    }

    @Test
    fun finishBuildingStructReadsMethods() {
        val javaMethod = JavaMethod("bar")
        contextStack.injectResult(javaMethod)
        val limeElement = LimeStruct(LimePath(emptyList(), listOf("foo")))

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaClass::class.java)
        val resultMethod = result.methods.first()
        assertEquals("bar", resultMethod.name)
        assertContains(JavaMethod.MethodQualifier.NATIVE, resultMethod.qualifiers)
    }

    @Test
    fun finishBuildingStructReadsSerializable() {
        val limeElement = LimeStruct(
            LimePath(emptyList(), listOf("foo")),
            attributes = LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.SERIALIZABLE)
                .build()
        )
        every { typeMapper.serializationBase } returns javaType

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaClass::class.java)
        assertTrue(result.isParcelable)
        assertContains(javaType, result.parentInterfaces)
    }

    @Test
    fun finishBuildingStructReadsEquatable() {
        val limeElement = LimeStruct(
            LimePath(emptyList(), listOf("foo")),
            attributes = LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.EQUATABLE)
                .build()
        )

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaClass::class.java)
        assertTrue(result.isEquatable)
    }

    @Test
    fun finishBuildingStructReadsImmutable() {
        val limeElement = LimeStruct(
            LimePath(emptyList(), listOf("foo")),
            attributes = LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.IMMUTABLE)
                .build()
        )

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaClass::class.java)
        assertTrue(result.isImmutable)
    }

    @Test
    fun finishBuildingField() {
        contextStack.injectResult(javaType)
        val limeElement = LimeField(
            LimePath(emptyList(), listOf("Foo")),
            comment = "some comment",
            typeRef = limeTypeRef
        )
        every { typeMapper.applyNullability(javaType, any()) } returns anotherJavaType

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaField::class.java)
        assertEquals("foo", result.name)
        assertEquals("some comment", result.comment)
        assertEquals(anotherJavaType, result.type)
    }

    @Test
    fun finishBuildingFieldReadsVisibility() {
        contextStack.injectResult(javaType)
        val limeElement = LimeField(
            LimePath(emptyList(), listOf("Foo")),
            typeRef = limeTypeRef,
            visibility = LimeVisibility.INTERNAL
        )

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaField::class.java)
        assertEquals(JavaVisibility.PACKAGE, result.visibility)
    }

    @Test
    fun finishBuildingFieldReadsDefaultValue() {
        contextStack.injectResult(javaType)
        val limeElement = LimeField(
            LimePath(emptyList(), listOf("Foo")),
            typeRef = limeTypeRef,
            defaultValue = LimeValue.Special.FLOAT_NAN
        )
        every { valueMapper.mapValue(any()) } returns javaValue

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaField::class.java)
        assertEquals(javaValue, result.initial)
    }

    @Test
    fun finishBuildingFieldCreatesNullableValue() {
        contextStack.injectResult(javaType)
        val limeElement = LimeField(
            LimePath(emptyList(), listOf("Foo")),
            typeRef = limeTypeRef,
            attributes = LimeAttributes.Builder().addAttribute(LimeAttributeType.NULLABLE).build()
        )
        every { JavaValueMapper.mapNullValue(any()) } returns javaValue

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaField::class.java)
        assertEquals(javaValue, result.initial)
    }

    @Test
    fun finishBuildingFieldCreatesDefaultValue() {
        contextStack.injectResult(javaType)
        val limeElement = LimeField(
            LimePath(emptyList(), listOf("Foo")),
            typeRef = limeTypeRef
        )
        every { JavaValueMapper.mapDefaultValue(any()) } returns javaValue

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaField::class.java)
        assertEquals(javaValue, result.initial)
    }

    @Test
    fun finishBuildingEnumeration() {
        val limeElement =
            LimeEnumeration(LimePath(emptyList(), listOf("foo")), comment = "some comment")

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaEnum::class.java)
        assertEquals("Foo", result.name)
        assertEquals("some comment", result.comment)
        assertEquals(rootPackage, result.javaPackage)
    }

    @Test
    fun finishBuildingEnumerationReadsVisibility() {
        val limeElement = LimeEnumeration(
            LimePath(emptyList(), listOf("foo")),
            visibility = LimeVisibility.INTERNAL
        )

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaEnum::class.java)
        assertEquals(JavaVisibility.PACKAGE, result.visibility)
    }

    @Test
    fun finishBuildingEnumerationReadsEnumItems() {
        val javaEnumItem = JavaEnumItem("")
        contextStack.injectResult(javaEnumItem)
        val limeElement = LimeEnumeration(LimePath(emptyList(), listOf("foo")))

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaEnum::class.java)
        assertContains(javaEnumItem, result.items)
    }

    @Test
    fun finishBuildingEnumerationCreatesJavaException() {
        errorEnums.add("foo")
        val limeElement = LimeEnumeration(LimePath(emptyList(), listOf("foo")))
        val javaEnumTypeRef = JavaEnumType(
            "",
            emptyList(),
            emptyList(),
            JavaImport("", JavaPackage.DEFAULT)
        )
        every { typeMapper.mapCustomType(limeElement, any()) } returns javaEnumTypeRef

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaExceptionClass::class.java)
        assertEquals("FooException", result.name)
        assertEquals(javaEnumTypeRef, result.enumTypeRef)
    }

    @Test
    fun finishBuildingEnumerationCreatesJavaExceptionReadsVisibility() {
        errorEnums.add("foo")
        val limeElement = LimeEnumeration(
            LimePath(emptyList(), listOf("foo")),
            visibility = LimeVisibility.INTERNAL
        )
        val javaEnumTypeRef = JavaEnumType(
            "",
            emptyList(),
            emptyList(),
            JavaImport("", JavaPackage.DEFAULT)
        )
        every { typeMapper.mapCustomType(limeElement, any()) } returns javaEnumTypeRef

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaExceptionClass::class.java)
        assertEquals(JavaVisibility.PACKAGE, result.visibility)
    }

    @Test
    fun finishBuildingEnumerator() {
        val limeElement =
            LimeEnumerator(LimePath(emptyList(), listOf("foo")), comment = "some comment")

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaEnumItem::class.java)
        assertEquals("FOO", result.name)
        assertEquals("some comment", result.comment)
    }

    @Test
    fun finishBuildingEnumeratorReadsValue() {
        contextStack.injectResult(javaValue)
        val limeElement = LimeEnumerator(LimePath(emptyList(), listOf("foo")))

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaEnumItem::class.java)
        assertEquals(javaValue, result.value)
    }

    @Test
    fun finishBuildingProperty() {
        contextStack.injectResult(javaType)
        val limeElement = LimeProperty(
            LimePath(emptyList(), listOf("foo")),
            typeRef = limeTypeRef,
            comment = "Some comment"
        )
        every { typeMapper.applyNullability(javaType, any()) } returns anotherJavaType

        modelBuilder.finishBuilding(limeElement)

        val results = modelBuilder.finalResults.filterIsInstance<JavaMethod>()
        assertEquals(2, results.size)
        assertEquals("getFoo", results.first().name)
        assertEquals("Gets some comment", results.first().comment)
        assertEquals(anotherJavaType, results.first().returnType)
        assertEquals("setFoo", results.last().name)
        assertEquals("Sets some comment", results.last().comment)
        assertEquals(anotherJavaType, results.last().parameters.first().type)
    }

    @Test
    fun finishBuildingPropertyReadsReadonly() {
        contextStack.injectResult(javaType)
        val limeElement = LimeProperty(
            LimePath(emptyList(), listOf("foo")),
            typeRef = limeTypeRef,
            isReadonly = true
        )

        modelBuilder.finishBuilding(limeElement)

        val results = modelBuilder.finalResults.filterIsInstance<JavaMethod>()
        assertEquals(1, results.size)
    }

    @Test
    fun finishBuildingPropertyReadsStatic() {
        contextStack.injectResult(javaType)
        val limeElement = LimeProperty(
            LimePath(emptyList(), listOf("foo")),
            typeRef = limeTypeRef,
            isStatic = true
        )

        modelBuilder.finishBuilding(limeElement)

        val results = modelBuilder.finalResults.filterIsInstance<JavaMethod>()
        assertEquals(2, results.size)
        assertContains(JavaMethod.MethodQualifier.STATIC, results.first().qualifiers)
        assertContains(JavaMethod.MethodQualifier.STATIC, results.last().qualifiers)
    }

    @Test
    fun finishBuildingPropertyReadsVisibility() {
        contextStack.injectResult(javaType)
        val limeElement = LimeProperty(
            LimePath(emptyList(), listOf("foo")),
            typeRef = limeTypeRef,
            visibility = LimeVisibility.INTERNAL
        )

        modelBuilder.finishBuilding(limeElement)

        val results = modelBuilder.finalResults.filterIsInstance<JavaMethod>()
        assertEquals(2, results.size)
        assertEquals(JavaVisibility.PACKAGE, results.first().visibility)
        assertEquals(JavaVisibility.PACKAGE, results.last().visibility)
    }

    @Test
    fun finishBuildingPropertyReadsInternalSetter() {
        contextStack.injectResult(javaType)
        val limeElement = LimeProperty(
            LimePath(emptyList(), listOf("foo")),
            typeRef = limeTypeRef,
            attributes = LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.INTERNAL_SETTER)
                .build()
        )

        modelBuilder.finishBuilding(limeElement)

        val results = modelBuilder.finalResults.filterIsInstance<JavaMethod>()
        assertEquals(2, results.size)
        assertEquals(JavaVisibility.PUBLIC, results.first().visibility)
        assertEquals(JavaVisibility.PACKAGE, results.last().visibility)
    }
}
