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

import com.here.genium.Genium
import com.here.genium.generator.common.nameRuleSetFromConfig
import com.here.genium.model.java.JavaClass
import com.here.genium.model.java.JavaConstant
import com.here.genium.model.java.JavaElement
import com.here.genium.model.java.JavaEnum
import com.here.genium.model.java.JavaEnumType
import com.here.genium.model.java.JavaExceptionClass
import com.here.genium.model.java.JavaImport
import com.here.genium.model.java.JavaInterface
import com.here.genium.model.java.JavaMethod
import com.here.genium.model.java.JavaPackage
import com.here.genium.model.java.JavaPrimitiveType
import com.here.genium.model.java.JavaTopLevelElement
import com.here.genium.model.java.JavaType
import com.here.genium.model.java.JavaValue
import com.here.genium.model.java.JavaVisibility
import com.here.genium.model.lime.LimeAttributeType
import com.here.genium.model.lime.LimeAttributeValueType
import com.here.genium.model.lime.LimeAttributes
import com.here.genium.model.lime.LimeContainer
import com.here.genium.model.lime.LimeContainer.ContainerType
import com.here.genium.model.lime.LimeDirectTypeRef
import com.here.genium.model.lime.LimePath
import com.here.genium.model.lime.LimePath.Companion.EMPTY_PATH
import com.here.genium.model.lime.LimeVisibility
import com.here.genium.test.AssertHelpers.assertContains
import com.here.genium.test.MockContextStack
import io.mockk.MockKAnnotations
import io.mockk.every
import io.mockk.impl.annotations.MockK
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class JavaModelBuilderContainersTest {
    @MockK private lateinit var typeMapper: JavaTypeMapper
    @MockK private lateinit var valueMapper: JavaValueMapper

    private val javaConstant = JavaConstant("", JavaPrimitiveType.VOID, JavaValue(""))
    private val javaEnum = JavaEnum("")
    private val javaEnumTypeRef =
        JavaEnumType("", emptyList(), emptyList(), JavaImport("", JavaPackage.DEFAULT))
    private val javaException = JavaExceptionClass("", javaEnumTypeRef)
    private val javaMethod = JavaMethod("")

    private val limeInterface =
        LimeContainer(LimePath(emptyList(), listOf("foo")), type = ContainerType.INTERFACE)
    private val limeClass =
        LimeContainer(LimePath(emptyList(), listOf("foo")), type = ContainerType.CLASS)
    private val deprecatedAttributes =
        LimeAttributes.Builder().addAttribute(
            LimeAttributeType.DEPRECATED,
            LimeAttributeValueType.MESSAGE,
            "Bar"
        ).build()

    private val contextStack = MockContextStack<JavaElement>()
    private val rootPackage = JavaPackage(listOf("pack", "age"))

    private val nameRuleSet = nameRuleSetFromConfig(Genium.testOptions().javaNameRules)
    private val nameRules = JavaNameRules(nameRuleSet)

    private lateinit var modelBuilder: JavaModelBuilder

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)

        modelBuilder = JavaModelBuilder(
            rootPackage = rootPackage,
            typeMapper = typeMapper,
            valueMapper = valueMapper,
            errorEnums = emptySet(),
            nameRules = nameRules,
            contextStack = contextStack
        )
    }

    @Test
    fun finishBuildingTypeCollectionPropagatesElements() {
        val javaTopLevelElement = object : JavaTopLevelElement("") {}
        contextStack.injectResult(javaTopLevelElement)
        val limeElement = LimeContainer(EMPTY_PATH, type = ContainerType.TYPE_COLLECTION)

        modelBuilder.finishBuilding(limeElement)

        val results = modelBuilder.finalResults
        assertContains(javaTopLevelElement, results)
    }

    @Test
    fun finishBuildingTypeCollectionReadsConstants() {
        contextStack.injectResult(javaConstant)
        val limeElement = LimeContainer(
            LimePath(emptyList(), listOf("foo")),
            type = ContainerType.TYPE_COLLECTION,
            comment = "some comment",
            attributes = deprecatedAttributes
        )

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaClass::class.java)
        assertEquals("Foo", result.name)
        assertEquals(rootPackage, result.javaPackage)
        assertContains(JavaTopLevelElement.Qualifier.FINAL, result.qualifiers)
        assertEquals("some comment", result.comment.documentation)
        assertEquals("Bar", result.comment.deprecated)
        assertContains(JavaModelBuilder.deprecatedAnnotation, result.annotations)
        assertContains(javaConstant, result.constants)
    }

    @Test
    fun finishBuildingTypeCollectionReadsVisibility() {
        contextStack.injectResult(JavaConstant("", JavaPrimitiveType.VOID, JavaValue("")))
        val limeElement = LimeContainer(
            LimePath(emptyList(), listOf("foo")),
            type = ContainerType.TYPE_COLLECTION,
            visibility = LimeVisibility.INTERNAL
        )

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaClass::class.java)
        assertEquals(JavaVisibility.PACKAGE, result.visibility)
    }

    @Test
    fun finishBuildingInterface() {
        val javaElement = LimeContainer(
            LimePath(emptyList(), listOf("foo")),
            type = ContainerType.INTERFACE,
            comment = "some comment",
            attributes = deprecatedAttributes
        )

        modelBuilder.finishBuilding(javaElement)

        val result = modelBuilder.getFinalResult(JavaInterface::class.java)
        assertEquals("Foo", result.name)
        assertEquals(rootPackage, result.javaPackage)
        assertEquals("some comment", result.comment.documentation)
        assertEquals("Bar", result.comment.deprecated)
        assertContains(JavaModelBuilder.deprecatedAnnotation, result.annotations)
    }

    @Test
    fun finishBuildingInterfaceReadsVisibility() {
        val limeElement = LimeContainer(
            LimePath(emptyList(), listOf("foo")),
            type = ContainerType.INTERFACE,
            visibility = LimeVisibility.INTERNAL
        )

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaInterface::class.java)
        assertEquals(JavaVisibility.PACKAGE, result.visibility)
    }

    @Test
    fun finishBuildingInterfaceReadsElements() {
        contextStack.injectResult(javaConstant)
        contextStack.injectResult(javaEnum)
        contextStack.injectResult(javaException)

        modelBuilder.finishBuilding(limeInterface)

        val result = modelBuilder.getFinalResult(JavaInterface::class.java)
        assertContains(javaConstant, result.constants)
        assertContains(javaEnum, result.enums)
        assertContains(javaException, result.exceptions)
    }

    @Test
    fun finishBuildingInterfaceReadsInnerClasses() {
        val javaClass = JavaClass("")
        contextStack.injectResult(javaClass)

        modelBuilder.finishBuilding(limeInterface)

        val result = modelBuilder.getFinalResult(JavaInterface::class.java)
        assertContains(javaClass, result.innerClasses)
        assertContains(JavaTopLevelElement.Qualifier.STATIC, javaClass.qualifiers)
    }

    @Test
    fun finishBuildingInterfaceCreatesImplClass() {
        modelBuilder.finishBuilding(limeInterface)

        val result = modelBuilder.getFinalResult(JavaClass::class.java)
        assertEquals("FooImpl", result.name)
        assertEquals(rootPackage, result.javaPackage)
        assertEquals(JavaVisibility.PACKAGE, result.visibility)
        assertTrue(result.isImplClass)
        assertTrue(result.needsDisposer)
        assertEquals(1, result.parentInterfaces.size)
        assertEquals("Foo", result.parentInterfaces.first().name)
    }

    @Test
    fun finishBuildingInterfaceImplClassReadsMethods() {
        contextStack.injectResult(javaMethod)

        modelBuilder.finishBuilding(limeInterface)

        val result = modelBuilder.getFinalResult(JavaClass::class.java)
        assertEquals(1, result.methods.size)
        assertContains(JavaMethod.MethodQualifier.NATIVE, result.methods.first().qualifiers)
    }

    @Test
    fun finishBuildingInterfaceImplClassReadsParentInterface() {
        contextStack.injectResult(javaMethod)

        modelBuilder.finishBuilding(limeInterface)

        val result = modelBuilder.getFinalResult(JavaClass::class.java)
        assertEquals(1, result.methods.size)
        assertContains(JavaMethod.MethodQualifier.NATIVE, result.methods.first().qualifiers)
    }

    @Test
    fun finishBuildingInterfaceReadsParentInterface() {
        val parentContainer = LimeContainer(
            LimePath(emptyList(), listOf("bar")),
            type = ContainerType.INTERFACE
        )
        val limeElement = LimeContainer(
            LimePath(emptyList(), listOf("foo")),
            type = ContainerType.INTERFACE,
            parent = LimeDirectTypeRef(parentContainer)
        )
        val javaType = object : JavaType("") {}
        every { typeMapper.mapCustomType(parentContainer, null) } returns javaType

        modelBuilder.finishBuilding(limeElement)

        val resultInterface = modelBuilder.getFinalResult(JavaInterface::class.java)
        assertContains(javaType, resultInterface.parentInterfaces)
        val resultClass = modelBuilder.getFinalResult(JavaClass::class.java)
        assertFalse(resultClass.needsDisposer)
    }

    @Test
    fun finishBuildingClass() {
        val javaElement = LimeContainer(
            LimePath(emptyList(), listOf("foo")),
            type = ContainerType.CLASS,
            comment = "some comment",
            attributes = deprecatedAttributes
        )

        modelBuilder.finishBuilding(javaElement)

        val result = modelBuilder.getFinalResult(JavaClass::class.java)
        assertEquals("Foo", result.name)
        assertEquals(rootPackage, result.javaPackage)
        assertEquals("some comment", result.comment.documentation)
        assertEquals("Bar", result.comment.deprecated)
        assertContains(JavaModelBuilder.deprecatedAnnotation, result.annotations)
        assertTrue(result.needsDisposer)
    }

    @Test
    fun finishBuildingClassReadsVisibility() {
        val limeElement = LimeContainer(
            LimePath(emptyList(), listOf("foo")),
            type = ContainerType.CLASS,
            visibility = LimeVisibility.INTERNAL
        )

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaClass::class.java)
        assertEquals(JavaVisibility.PACKAGE, result.visibility)
    }

    @Test
    fun finishBuildingClassReadsPointerEquatable() {
        val limeElement = LimeContainer(
            LimePath(emptyList(), listOf("foo")),
            type = ContainerType.CLASS,
            attributes = LimeAttributes.Builder().addAttribute(LimeAttributeType.POINTER_EQUATABLE).build()
        )

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaClass::class.java)
        assertTrue(result.hasNativeEquatable)
    }

    @Test
    fun finishBuildingClassReadsEquatable() {
        val limeElement = LimeContainer(
            LimePath(emptyList(), listOf("foo")),
            type = ContainerType.CLASS,
            attributes = LimeAttributes.Builder().addAttribute(LimeAttributeType.EQUATABLE).build()
        )

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaClass::class.java)
        assertTrue(result.hasNativeEquatable)
    }

    @Test
    fun finishBuildingClassReadsElements() {
        contextStack.injectResult(javaConstant)
        contextStack.injectResult(javaEnum)
        contextStack.injectResult(javaException)
        contextStack.injectResult(javaMethod)

        modelBuilder.finishBuilding(limeClass)

        val result = modelBuilder.getFinalResult(JavaClass::class.java)
        assertContains(javaConstant, result.constants)
        assertContains(javaEnum, result.enums)
        assertContains(javaException, result.exceptions)
        assertContains(javaMethod, result.methods)
    }

    @Test
    fun finishBuildingClassReadsInnerClasses() {
        val javaClass = JavaClass("")
        contextStack.injectResult(javaClass)

        modelBuilder.finishBuilding(limeClass)

        val result = modelBuilder.getFinalResult(JavaClass::class.java)
        assertContains(javaClass, result.innerClasses)
        assertContains(JavaTopLevelElement.Qualifier.STATIC, javaClass.qualifiers)
    }

    @Test
    fun finishBuildingClassReadsMethods() {
        contextStack.injectResult(javaMethod)

        modelBuilder.finishBuilding(limeClass)

        val result = modelBuilder.getFinalResult(JavaClass::class.java)
        assertEquals(1, result.methods.size)
        assertContains(JavaMethod.MethodQualifier.NATIVE, result.methods.first().qualifiers)
    }

    @Test
    fun finishBuildingClassReadsParentInterface() {
        val parentContainer = LimeContainer(
            LimePath(emptyList(), listOf("bar")),
            type = ContainerType.INTERFACE
        )
        val limeElement = LimeContainer(
            LimePath(emptyList(), listOf("foo")),
            type = ContainerType.CLASS,
            parent = LimeDirectTypeRef(parentContainer)
        )
        val javaType = object : JavaType("") {}
        every { typeMapper.mapCustomType(parentContainer, "BarImpl") } returns javaType

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaClass::class.java)
        assertEquals(javaType, result.extendedClass)
        assertFalse(result.needsDisposer)
    }

    @Test
    fun finishBuildingClassReadsParentClass() {
        val parentContainer = LimeContainer(
            LimePath(emptyList(), listOf("bar")),
            type = ContainerType.CLASS
        )
        val limeElement = LimeContainer(
            LimePath(emptyList(), listOf("foo")),
            type = ContainerType.CLASS,
            parent = LimeDirectTypeRef(parentContainer)
        )
        val javaType = object : JavaType("") {}
        every { typeMapper.mapCustomType(parentContainer, "Bar") } returns javaType

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaClass::class.java)
        assertEquals(javaType, result.extendedClass)
        assertFalse(result.needsDisposer)
    }
}
