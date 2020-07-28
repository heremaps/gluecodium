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
import com.here.gluecodium.model.java.JavaElement
import com.here.gluecodium.model.java.JavaEnum
import com.here.gluecodium.model.java.JavaEnumTypeRef
import com.here.gluecodium.model.java.JavaExceptionClass
import com.here.gluecodium.model.java.JavaImport
import com.here.gluecodium.model.java.JavaInterface
import com.here.gluecodium.model.java.JavaMethod
import com.here.gluecodium.model.java.JavaPackage
import com.here.gluecodium.model.java.JavaPrimitiveTypeRef
import com.here.gluecodium.model.java.JavaTopLevelElement
import com.here.gluecodium.model.java.JavaTypeRef
import com.here.gluecodium.model.java.JavaValue
import com.here.gluecodium.model.java.JavaVisibility
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeAttributes
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeComment
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimePath.Companion.EMPTY_PATH
import com.here.gluecodium.model.lime.LimeTypesCollection
import com.here.gluecodium.model.lime.LimeVisibility
import com.here.gluecodium.test.AssertHelpers.assertContains
import com.here.gluecodium.test.MockContextStack
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

    private val javaConstant = JavaConstant("", JavaPrimitiveTypeRef.VOID, JavaValue(""))
    private val javaEnum = JavaEnum("")
    private val javaEnumTypeRef =
        JavaEnumTypeRef("", emptyList(), emptyList(), JavaImport("", JavaPackage.DEFAULT))
    private val javaException = JavaExceptionClass("", errorTypeRef = javaEnumTypeRef)
    private val javaMethod = JavaMethod("")

    private val limeInterface = LimeInterface(LimePath(emptyList(), listOf("foo")))
    private val limeClass = LimeClass(LimePath(emptyList(), listOf("foo")))
    private val deprecatedAttributes =
        LimeAttributes.Builder().addAttribute(
            LimeAttributeType.DEPRECATED,
            LimeAttributeValueType.MESSAGE,
            LimeComment("Bar")
        ).build()

    private val contextStack = MockContextStack<JavaElement>()
    private val rootPackage = JavaPackage(listOf("pack", "age"))

    private val nameRuleSet = nameRuleSetFromConfig(Gluecodium.testOptions().javaNameRules)
    private val nameRules = JavaNameRules(nameRuleSet)

    private lateinit var modelBuilder: JavaModelBuilder

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)

        modelBuilder = JavaModelBuilder(
            rootPackage = rootPackage,
            typeMapper = typeMapper,
            valueMapper = valueMapper,
            nameRules = nameRules,
            nameResolver = JavaNameResolver(nameRules, emptyMap()),
            contextStack = contextStack,
            buildTransientModel = { listOf(JavaInterface("")) }
        )
    }

    @Test
    fun finishBuildingTypeCollectionPropagatesElements() {
        val javaTopLevelElement = object : JavaTopLevelElement("", emptyList()) {}
        contextStack.injectResult(javaTopLevelElement)
        val limeElement = LimeTypesCollection(EMPTY_PATH)

        modelBuilder.finishBuilding(limeElement)

        val results = modelBuilder.finalResults
        assertContains(javaTopLevelElement, results)
    }

    @Test
    fun finishBuildingTypeCollectionReadsConstants() {
        contextStack.injectResult(javaConstant)
        val limeElement = LimeTypesCollection(
            LimePath(emptyList(), listOf("foo")),
            comment = LimeComment("some comment"),
            attributes = deprecatedAttributes
        )

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaClass::class.java)
        assertEquals("Foo", result.name)
        assertEquals(rootPackage, result.javaPackage)
        assertTrue(result.isFinal)
        assertEquals("some comment", result.comment.documentation)
        assertEquals("Bar", result.comment.deprecated)
        assertContains(JavaModelBuilder.deprecatedAnnotation, result.annotations)
        assertContains(javaConstant, result.constants)
    }

    @Test
    fun finishBuildingTypeCollectionReadsVisibility() {
        contextStack.injectResult(JavaConstant("", JavaPrimitiveTypeRef.VOID, JavaValue("")))
        val limeElement = LimeTypesCollection(
            LimePath(emptyList(), listOf("foo")),
            visibility = LimeVisibility.INTERNAL
        )

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaClass::class.java)
        assertEquals(JavaVisibility.PACKAGE, result.visibility)
    }

    @Test
    fun finishBuildingInterface() {
        val javaElement = LimeInterface(
            LimePath(emptyList(), listOf("foo")),
            comment = LimeComment("some comment"),
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
        val limeElement = LimeInterface(
            LimePath(emptyList(), listOf("foo")),
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
    fun finishBuildingInterfaceReadsInnerClassesAndInterfaces() {
        val javaClass = JavaClass("")
        val javaInterface = JavaInterface("")
        contextStack.injectResult(javaClass)
        contextStack.injectResult(javaInterface)

        modelBuilder.finishBuilding(limeInterface)

        val result = modelBuilder.getFinalResult(JavaInterface::class.java)
        assertContains(javaClass, result.innerClasses)
        assertTrue(javaClass.isStatic)
        assertContains(javaInterface, result.innerInterfaces)
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
        assertTrue(result.methods.first().isNative)
    }

    @Test
    fun finishBuildingInterfaceImplClassReadsParentInterface() {
        contextStack.injectResult(javaMethod)

        modelBuilder.finishBuilding(limeInterface)

        val result = modelBuilder.getFinalResult(JavaClass::class.java)
        assertEquals(1, result.methods.size)
        assertTrue(result.methods.first().isNative)
    }

    @Test
    fun finishBuildingInterfaceReadsParentInterface() {
        val parentContainer = LimeInterface(LimePath(emptyList(), listOf("bar")))
        val limeElement = LimeInterface(
            LimePath(emptyList(), listOf("foo")),
            parent = LimeDirectTypeRef(parentContainer)
        )
        val javaType = object : JavaTypeRef("") {}
        every { typeMapper.mapInheritanceParent(parentContainer, any()) } returns javaType

        modelBuilder.finishBuilding(limeElement)

        val resultInterface = modelBuilder.getFinalResult(JavaInterface::class.java)
        assertContains(javaType, resultInterface.parentInterfaces)
        val resultClass = modelBuilder.getFinalResult(JavaClass::class.java)
        assertFalse(resultClass.needsDisposer)
    }

    @Test
    fun finishBuildingClass() {
        val javaElement = LimeClass(
            LimePath(emptyList(), listOf("foo")),
            comment = LimeComment("some comment"),
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
        assertTrue(result.isFinal)
    }

    @Test
    fun finishBuildingClassReadsInternalVisibility() {
        val limeElement = LimeClass(
            LimePath(emptyList(), listOf("foo")),
            visibility = LimeVisibility.INTERNAL
        )

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaClass::class.java)
        assertEquals(JavaVisibility.PACKAGE, result.visibility)
    }

    @Test
    fun finishBuildingClassReadsOpenVisibility() {
        val limeElement =
            LimeClass(LimePath(emptyList(), listOf("foo")), visibility = LimeVisibility.OPEN)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaClass::class.java)
        assertFalse(result.isFinal)
    }

    @Test
    fun finishBuildingClassReadsPointerEquatable() {
        val limeElement = LimeClass(
            LimePath(emptyList(), listOf("foo")),
            attributes =
                LimeAttributes.Builder().addAttribute(LimeAttributeType.POINTER_EQUATABLE).build()
        )

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaClass::class.java)
        assertTrue(result.hasNativeEquatable)
    }

    @Test
    fun finishBuildingClassReadsEquatable() {
        val limeElement = LimeClass(
            LimePath(emptyList(), listOf("foo")),
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
        assertTrue(javaClass.isStatic)
    }

    @Test
    fun finishBuildingClassReadsMethods() {
        contextStack.injectResult(javaMethod)

        modelBuilder.finishBuilding(limeClass)

        val result = modelBuilder.getFinalResult(JavaClass::class.java)
        assertEquals(1, result.methods.size)
        assertTrue(result.methods.first().isNative)
    }

    @Test
    fun finishBuildingClassReadsParentInterface() {
        val parentContainer = LimeInterface(LimePath(emptyList(), listOf("bar")))
        val limeElement = LimeClass(
            LimePath(emptyList(), listOf("foo")),
            parent = LimeDirectTypeRef(parentContainer)
        )
        val javaType = object : JavaTypeRef("") {}
        every { typeMapper.mapInheritanceParent(any(), any()) } returns javaType

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaClass::class.java)
        assertEquals(typeMapper.nativeBase, result.extendedClass)
        assertEquals(javaType, result.parentInterfaces.first())
        assertTrue(result.needsDisposer)
    }

    @Test
    fun finishBuildingClassReadsParentClass() {
        val parentContainer = LimeClass(LimePath(emptyList(), listOf("bar")))
        val limeElement = LimeClass(
            LimePath(emptyList(), listOf("foo")),
            parent = LimeDirectTypeRef(parentContainer)
        )
        val javaType = object : JavaTypeRef("") {}
        every { typeMapper.mapInheritanceParent(parentContainer, "Bar") } returns javaType

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(JavaClass::class.java)
        assertEquals(javaType, result.extendedClass)
        assertFalse(result.needsDisposer)
    }
}
