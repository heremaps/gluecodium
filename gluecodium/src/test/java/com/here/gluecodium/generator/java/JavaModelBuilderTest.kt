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

package com.here.gluecodium.generator.java

import com.here.gluecodium.Gluecodium
import com.here.gluecodium.generator.common.nameRuleSetFromConfig
import com.here.gluecodium.model.java.JavaClass
import com.here.gluecodium.model.java.JavaConstant
import com.here.gluecodium.model.java.JavaCustomTypeRef
import com.here.gluecodium.model.java.JavaElement
import com.here.gluecodium.model.java.JavaEnum
import com.here.gluecodium.model.java.JavaEnumItem
import com.here.gluecodium.model.java.JavaEnumTypeRef
import com.here.gluecodium.model.java.JavaExceptionClass
import com.here.gluecodium.model.java.JavaExceptionTypeRef
import com.here.gluecodium.model.java.JavaField
import com.here.gluecodium.model.java.JavaImport
import com.here.gluecodium.model.java.JavaMethod
import com.here.gluecodium.model.java.JavaPackage
import com.here.gluecodium.model.java.JavaParameter
import com.here.gluecodium.model.java.JavaPrimitiveTypeRef
import com.here.gluecodium.model.java.JavaTopLevelElement
import com.here.gluecodium.model.java.JavaTypeRef
import com.here.gluecodium.model.java.JavaValue
import com.here.gluecodium.model.java.JavaVisibility
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeAttributes
import com.here.gluecodium.model.lime.LimeBasicTypeRef
import com.here.gluecodium.model.lime.LimeComment
import com.here.gluecodium.model.lime.LimeConstant
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeEnumerator
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimeProperty
import com.here.gluecodium.model.lime.LimeReturnType
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeThrownType
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeValue
import com.here.gluecodium.model.lime.LimeVisibility
import com.here.gluecodium.test.AssertHelpers.assertContains
import com.here.gluecodium.test.MockContextStack
import io.mockk.MockKAnnotations
import io.mockk.every
import io.mockk.impl.annotations.MockK
import io.mockk.mockkObject
import io.mockk.unmockkAll
import org.junit.After
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

    private val javaType = object : JavaTypeRef("") {}
    private val anotherJavaType = object : JavaTypeRef("Nonsense") {}
    private val javaValue = JavaValue("")

    private val fooPath = LimePath(listOf("mo", "del"), listOf("foo"))
    private val limeTypeRef = LimeBasicTypeRef.DOUBLE
    private val deprecatedAttributes =
        LimeAttributes.Builder().addAttribute(
            LimeAttributeType.DEPRECATED,
            LimeAttributeValueType.MESSAGE,
            "Bar"
        ).build()

    private val contextStack = MockContextStack<JavaElement>()
    private val rootPackage = JavaPackage(listOf("pack", "age"))
    private val nameRuleSet = nameRuleSetFromConfig(Gluecodium.testOptions().javaNameRules)
    private val nameRules = JavaNameRules(nameRuleSet)

    private lateinit var modelBuilder: JavaModelBuilder

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)
        mockkObject(JavaValueMapper.Companion)

        modelBuilder = JavaModelBuilder(
            contextStack = contextStack,
            rootPackage = rootPackage,
            typeMapper = typeMapper,
            valueMapper = valueMapper,
            nameRules = nameRules,
            nameResolver = JavaNameResolver(nameRules, emptyMap())
        )
    }

    @After
    fun tearDown() {
        unmockkAll()
    }

    @Test
    fun finishBuildingMethod() {
        val limeElement = LimeFunction(
            fooPath,
            comment = LimeComment("some comment"),
            attributes = deprecatedAttributes
        )

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaMethod::class.java)
        assertEquals("foo", result.name)
        assertEquals("some comment", result.comment.documentation)
        assertEquals("Bar", result.comment.deprecated)
        assertContains(JavaModelBuilder.deprecatedAnnotation, result.annotations)
    }

    @Test
    fun finishBuildingMethodReadsVisibility() {
        val limeElement = LimeFunction(fooPath, visibility = LimeVisibility.INTERNAL)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaMethod::class.java)
        assertEquals(JavaVisibility.PACKAGE, result.visibility)
    }

    @Test
    fun finishBuildingMethodReadsReturnType() {
        every { typeMapper.mapType(any()) } returns javaType
        every { typeMapper.applyNullability(javaType, any()) } returns anotherJavaType
        val limeElement = LimeFunction(fooPath)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaMethod::class.java)
        assertEquals(anotherJavaType, result.returnType)
    }

    @Test
    fun finishBuildingMethodReadsReturnTypeComment() {
        val limeReturnType = LimeReturnType(
            LimeBasicTypeRef.FLOAT,
            comment = LimeComment("some comment")
        )
        val limeElement = LimeFunction(fooPath, returnType = limeReturnType)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaMethod::class.java)
        assertEquals("some comment", result.returnComment)
    }

    @Test
    fun finishBuildingMethodReadsErrorType() {
        val limeErrorType = object : LimeType(fooPath) {}
        val limeException = LimeException(fooPath, errorType = LimeDirectTypeRef(limeErrorType))
        val limeElement = LimeFunction(fooPath, thrownType = LimeThrownType(LimeDirectTypeRef(limeException)))
        val javaExceptionType =
            JavaExceptionTypeRef("", JavaImport("", JavaPackage.DEFAULT), emptyList(), javaType)
        every { typeMapper.mapExceptionType(any()) } returns javaExceptionType

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaMethod::class.java)
        assertEquals(javaExceptionType, result.exception)
    }

    @Test
    fun finishBuildingMethodReadsParameters() {
        val javaParameter = JavaParameter("", javaType)
        contextStack.injectResult(javaParameter)
        val limeElement = LimeFunction(fooPath)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaMethod::class.java)
        assertContains(javaParameter, result.parameters)
    }

    @Test
    fun finishBuildingMethodReadsConstructor() {
        val limeElement = LimeFunction(fooPath, isConstructor = true, isStatic = true)
        every {
            typeMapper.mapParentType(limeElement)
        } returns JavaCustomTypeRef("", isInterface = true)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaMethod::class.java)
        assertTrue(result.isConstructor)
        assertContains(JavaMethod.MethodQualifier.STATIC, result.qualifiers)
        assertEquals(JavaPrimitiveTypeRef.LONG, result.returnType)
    }

    @Test
    fun finishBuildingMethodReadsStructConstructor() {
        val limeElement = LimeFunction(fooPath, isConstructor = true, isStatic = true)
        val parentType = JavaCustomTypeRef("")
        every { typeMapper.mapParentType(limeElement) } returns parentType

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaMethod::class.java)
        assertEquals(parentType, result.returnType)
    }

    @Test
    fun finishBuildingMethodReadsStatic() {
        val limeElement = LimeFunction(fooPath, isStatic = true)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaMethod::class.java)
        assertContains(JavaMethod.MethodQualifier.STATIC, result.qualifiers)
    }

    @Test
    fun finishBuildingParameter() {
        contextStack.injectResult(javaType)
        val limeElement = LimeParameter(fooPath, comment = LimeComment("some comment"), typeRef = limeTypeRef)
        every { typeMapper.applyNullability(javaType, any()) } returns anotherJavaType

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaParameter::class.java)
        assertEquals("foo", result.name)
        assertEquals("some comment", result.comment.documentation)
        assertEquals(anotherJavaType, result.type)
    }

    @Test
    fun finishBuildingValue() {
        val limeElement = LimeValue.Special.FLOAT_NAN
        every { valueMapper.mapValue(limeElement, javaType) } returns javaValue
        contextStack.injectResult(javaType)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaValue::class.java)
        assertEquals(javaValue, result)
    }

    @Test
    fun finishBuildingTypeRef() {
        every { typeMapper.mapType(limeTypeRef) } returns javaType

        modelBuilder.finishBuilding(limeTypeRef)

        val result = modelBuilder.getFinalResult(JavaTypeRef::class.java)
        assertEquals(javaType, result)
    }

    @Test
    fun finishBuildingConstant() {
        contextStack.injectResult(javaType)
        contextStack.injectResult(javaValue)
        val limeElement = LimeConstant(
            path = fooPath,
            comment = LimeComment("some comment"),
            attributes = deprecatedAttributes,
            typeRef = limeTypeRef,
            value = LimeValue.Special.FLOAT_NAN
        )

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaConstant::class.java)
        assertEquals("FOO", result.name)
        assertEquals("some comment", result.comment.documentation)
        assertEquals("Bar", result.comment.deprecated)
        assertContains(JavaModelBuilder.deprecatedAnnotation, result.annotations)
        assertEquals(javaType, result.type)
        assertEquals(javaValue, result.value)
    }

    @Test
    fun finishBuildingConstantReadsVisibility() {
        contextStack.injectResult(javaType)
        contextStack.injectResult(javaValue)
        val limeElement = LimeConstant(
            path = fooPath,
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
            path = fooPath,
            comment = LimeComment("some comment"),
            attributes = deprecatedAttributes,
            constructorComment = LimeComment("other comment")
        )

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaClass::class.java)
        assertEquals("Foo", result.name)
        assertEquals("some comment", result.comment.documentation)
        assertEquals("Bar", result.comment.deprecated)
        assertContains(JavaModelBuilder.deprecatedAnnotation, result.annotations)
        assertEquals(rootPackage, result.javaPackage)
        assertEquals("other comment", result.generatedConstructorComment)
        assertContains(JavaTopLevelElement.Qualifier.FINAL, result.qualifiers)
    }

    @Test
    fun finishBuildingStructReadsVisibility() {
        val limeElement = LimeStruct(fooPath, visibility = LimeVisibility.INTERNAL)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaClass::class.java)
        assertEquals(JavaVisibility.PACKAGE, result.visibility)
    }

    @Test
    fun finishBuildingStructReadsFields() {
        val javaField = JavaField("", javaType, javaValue)
        contextStack.injectResult(javaField)
        val limeElement = LimeStruct(fooPath)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaClass::class.java)
        assertContains(javaField, result.fields)
    }

    @Test
    fun finishBuildingStructReadsMethods() {
        val javaMethod = JavaMethod("bar")
        contextStack.injectResult(javaMethod)
        val limeElement = LimeStruct(fooPath)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaClass::class.java)
        val resultMethod = result.methods.first()
        assertEquals("bar", resultMethod.name)
        assertContains(JavaMethod.MethodQualifier.NATIVE, resultMethod.qualifiers)
    }

    @Test
    fun finishBuildingStructReadsCosntants() {
        val javaConstant = JavaConstant("bar", JavaPrimitiveTypeRef.BOOL, JavaValue(""))
        contextStack.injectResult(javaConstant)
        val limeElement = LimeStruct(fooPath)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaClass::class.java)
        assertContains(javaConstant, result.constants)
    }

    @Test
    fun finishBuildingStructReadsSerializable() {
        val limeElement = LimeStruct(
            fooPath,
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
            fooPath,
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
            fooPath,
            attributes = LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.IMMUTABLE)
                .build()
        )

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaClass::class.java)
        assertTrue(result.isImmutable)
    }

    @Test
    fun finishBuildingStructReadsBuilder() {
        val limeElement = LimeStruct(
            fooPath,
            attributes = LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.JAVA, LimeAttributeValueType.BUILDER)
                .build()
        )

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaClass::class.java)
        assertTrue(result.needsBuilder)
    }

    @Test
    fun finishBuildingField() {
        contextStack.injectResult(javaType)
        val limeElement = LimeField(
            fooPath,
            comment = LimeComment("some comment"),
            attributes = deprecatedAttributes,
            typeRef = limeTypeRef
        )
        every { typeMapper.applyNullability(javaType, any()) } returns anotherJavaType

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaField::class.java)
        assertEquals("foo", result.name)
        assertEquals("some comment", result.comment.documentation)
        assertEquals("Bar", result.comment.deprecated)
        assertContains(JavaModelBuilder.deprecatedAnnotation, result.annotations)
        assertEquals(anotherJavaType, result.type)
    }

    @Test
    fun finishBuildingFieldReadsVisibility() {
        contextStack.injectResult(javaType)
        val limeElement =
            LimeField(fooPath, typeRef = limeTypeRef, visibility = LimeVisibility.INTERNAL)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaField::class.java)
        assertEquals(JavaVisibility.PACKAGE, result.visibility)
    }

    @Test
    fun finishBuildingFieldReadsDefaultValue() {
        contextStack.injectResult(javaType)
        val limeElement = LimeField(
            fooPath,
            typeRef = limeTypeRef,
            defaultValue = LimeValue.Special.FLOAT_NAN
        )
        every { valueMapper.mapValue(any(), any()) } returns javaValue

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaField::class.java)
        assertEquals(javaValue, result.initial)
    }

    @Test
    fun finishBuildingFieldCreatesNullableValue() {
        contextStack.injectResult(javaType)
        val limeElement = LimeField(fooPath, typeRef = limeTypeRef.asNullable())
        every { JavaValueMapper.mapNullValue(any()) } returns javaValue

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaField::class.java)
        assertEquals(javaValue, result.initial)
    }

    @Test
    fun finishBuildingFieldCreatesDefaultValue() {
        contextStack.injectResult(javaType)
        val limeElement = LimeField(fooPath, typeRef = limeTypeRef)
        every { JavaValueMapper.mapDefaultValue(any()) } returns javaValue

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaField::class.java)
        assertEquals(javaValue, result.initial)
    }

    @Test
    fun finishBuildingEnumeration() {
        val limeElement =
            LimeEnumeration(fooPath, comment = LimeComment("some comment"), attributes = deprecatedAttributes)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaEnum::class.java)
        assertEquals("Foo", result.name)
        assertEquals("some comment", result.comment.documentation)
        assertEquals("Bar", result.comment.deprecated)
        assertContains(JavaModelBuilder.deprecatedAnnotation, result.annotations)
        assertEquals(rootPackage, result.javaPackage)
    }

    @Test
    fun finishBuildingEnumerationReadsVisibility() {
        val limeElement = LimeEnumeration(fooPath, visibility = LimeVisibility.INTERNAL)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaEnum::class.java)
        assertEquals(JavaVisibility.PACKAGE, result.visibility)
    }

    @Test
    fun finishBuildingEnumerationReadsEnumItems() {
        val javaEnumItem = JavaEnumItem("")
        contextStack.injectResult(javaEnumItem)
        val limeElement = LimeEnumeration(fooPath)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaEnum::class.java)
        assertContains(javaEnumItem, result.items)
    }

    @Test
    fun finishBuildingExceptionCreatesJavaException() {
        val limeEnumRef = LimeDirectTypeRef(LimeEnumeration(LimePath.EMPTY_PATH))
        val limeException = LimeException(fooPath, errorType = limeEnumRef)
        val javaEnumTypeRef = JavaEnumTypeRef(
            "",
            emptyList(),
            emptyList(),
            JavaImport("", JavaPackage.DEFAULT)
        )
        every { typeMapper.mapType(limeEnumRef) } returns javaEnumTypeRef

        modelBuilder.finishBuilding(limeException)

        val result = modelBuilder.getFinalResult(JavaExceptionClass::class.java)
        assertEquals("FooException", result.name)
        assertEquals(javaEnumTypeRef, result.errorTypeRef)
        assertContains(JavaTopLevelElement.Qualifier.FINAL, result.qualifiers)
    }

    @Test
    fun finishBuildingEnumerationCreatesJavaExceptionReadsVisibility() {
        val limeEnumeration = LimeEnumeration(LimePath.EMPTY_PATH)
        val limeException = LimeException(
            fooPath,
            visibility = LimeVisibility.INTERNAL,
            errorType = LimeDirectTypeRef(limeEnumeration)
        )
        val javaEnumTypeRef = JavaEnumTypeRef(
            "",
            emptyList(),
            emptyList(),
            JavaImport("", JavaPackage.DEFAULT)
        )
        every { typeMapper.mapCustomType(limeEnumeration) } returns javaEnumTypeRef

        modelBuilder.finishBuilding(limeException)

        val result = modelBuilder.getFinalResult(JavaExceptionClass::class.java)
        assertEquals(JavaVisibility.PACKAGE, result.visibility)
    }

    @Test
    fun finishBuildingEnumerator() {
        val limeElement = LimeEnumerator(
            fooPath,
            comment = LimeComment("some comment"),
            attributes = deprecatedAttributes
        )

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaEnumItem::class.java)
        assertEquals("FOO", result.name)
        assertEquals("some comment", result.comment.documentation)
        assertEquals("Bar", result.comment.deprecated)
        assertContains(JavaModelBuilder.deprecatedAnnotation, result.annotations)
    }

    @Test
    fun finishBuildingEnumeratorReadsValue() {
        contextStack.injectResult(javaValue)
        val limeElement = LimeEnumerator(fooPath)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaEnumItem::class.java)
        assertEquals(javaValue, result.value)
    }

    @Test
    fun finishBuildingProperty() {
        contextStack.injectResult(javaType)
        val limeElement = LimeProperty(
            fooPath,
            typeRef = limeTypeRef,
            comment = LimeComment("Some comment"),
            getter = LimeFunction(
                fooPath,
                comment = LimeComment("Gets some comment"),
                attributes = deprecatedAttributes
            ),
            setter = LimeFunction(
                fooPath,
                comment = LimeComment("Sets some comment"),
                attributes = deprecatedAttributes
            )
        )
        every { typeMapper.applyNullability(javaType, any()) } returns anotherJavaType

        modelBuilder.finishBuilding(limeElement)

        val results = modelBuilder.finalResults.filterIsInstance<JavaMethod>()
        assertEquals(2, results.size)
        val javaGetter = results.first()
        assertEquals("getFoo", javaGetter.name)
        assertEquals("Gets some comment", javaGetter.comment.documentation)
        assertEquals("Bar", javaGetter.comment.deprecated)
        assertEquals("Some comment", javaGetter.returnComment)
        assertContains(JavaModelBuilder.deprecatedAnnotation, javaGetter.annotations)
        assertEquals(anotherJavaType, javaGetter.returnType)
        val javaSetter = results.last()
        assertEquals("setFoo", javaSetter.name)
        assertEquals("Sets some comment", javaSetter.comment.documentation)
        assertEquals("Bar", javaSetter.comment.deprecated)
        assertEquals("Some comment", javaSetter.parameters.first().comment.documentation)
        assertContains(JavaModelBuilder.deprecatedAnnotation, javaSetter.annotations)
        assertEquals(anotherJavaType, javaSetter.parameters.first().type)
    }

    @Test
    fun finishBuildingPropertyReadsReadonly() {
        contextStack.injectResult(javaType)
        val limeElement =
            LimeProperty(fooPath, typeRef = limeTypeRef, getter = LimeFunction(fooPath))

        modelBuilder.finishBuilding(limeElement)

        val results = modelBuilder.finalResults.filterIsInstance<JavaMethod>()
        assertEquals(1, results.size)
    }

    @Test
    fun finishBuildingPropertyReadsStatic() {
        contextStack.injectResult(javaType)
        val limeElement = LimeProperty(
            fooPath,
            typeRef = limeTypeRef,
            getter = LimeFunction(fooPath),
            setter = LimeFunction(fooPath),
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
            fooPath,
            typeRef = limeTypeRef,
            getter = LimeFunction(fooPath, visibility = LimeVisibility.INTERNAL),
            setter = LimeFunction(fooPath, visibility = LimeVisibility.INTERNAL)
        )

        modelBuilder.finishBuilding(limeElement)

        val results = modelBuilder.finalResults.filterIsInstance<JavaMethod>()
        assertEquals(2, results.size)
        assertEquals(JavaVisibility.PACKAGE, results.first().visibility)
        assertEquals(JavaVisibility.PACKAGE, results.last().visibility)
    }
}
