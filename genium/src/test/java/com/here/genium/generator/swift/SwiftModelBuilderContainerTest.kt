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
import com.here.genium.generator.common.nameRuleSetFromConfig
import com.here.genium.model.lime.LimeAttributeType
import com.here.genium.model.lime.LimeAttributeValueType
import com.here.genium.model.lime.LimeAttributes
import com.here.genium.model.lime.LimeContainer
import com.here.genium.model.lime.LimeContainer.ContainerType
import com.here.genium.model.lime.LimePath
import com.here.genium.model.lime.LimeSignatureResolver
import com.here.genium.model.lime.LimeVisibility
import com.here.genium.model.swift.SwiftClass
import com.here.genium.model.swift.SwiftConstant
import com.here.genium.model.swift.SwiftEnum
import com.here.genium.model.swift.SwiftFile
import com.here.genium.model.swift.SwiftMethod
import com.here.genium.model.swift.SwiftModelElement
import com.here.genium.model.swift.SwiftProperty
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
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class SwiftModelBuilderContainerTest {
    @MockK private lateinit var signatureResolver: LimeSignatureResolver
    @MockK private lateinit var nameResolver: SwiftNameResolver
    @MockK private lateinit var typeMapper: SwiftTypeMapper

    private val swiftConstant = SwiftConstant("", null, SwiftType.VOID, SwiftValue(""))
    private val swiftStruct = SwiftStruct("")
    private val swiftEnum = SwiftEnum("")
    private val swiftTypeDef = SwiftTypeDef("", null, SwiftType.VOID)
    private val swiftMethod = SwiftMethod("")
    private val swiftProperty =
        SwiftProperty("", null, SwiftType.VOID, swiftMethod, swiftMethod, false)
    private val deprecatedAttributes =
        LimeAttributes.Builder().addAttribute(
            LimeAttributeType.DEPRECATED,
            LimeAttributeValueType.MESSAGE,
            "Bar"
        ).build()

    private val fooPath = LimePath(listOf("mo", "del"), listOf("foo"))
    private val contextStack = MockContextStack<SwiftModelElement>()

    private lateinit var modelBuilder: SwiftModelBuilder

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)

        val nameRuleSet = nameRuleSetFromConfig(Genium.testOptions().swiftNameRules)
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
    fun finishBuildingTypeCollectionReadsMembers() {
        val limeElement = LimeContainer(fooPath, type = ContainerType.TYPE_COLLECTION)
        contextStack.injectResult(swiftStruct)
        contextStack.injectResult(swiftEnum)
        contextStack.injectResult(swiftTypeDef)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftFile::class.java)
        assertContains(swiftStruct, result.structs)
        assertContains(swiftEnum, result.enums)
        assertContains(swiftTypeDef, result.typeDefs)
    }

    @Test
    fun finishBuildingTypeCollectionReadsConstants() {
        val limeElement = LimeContainer(fooPath, type = ContainerType.TYPE_COLLECTION)
        contextStack.injectResult(swiftConstant)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftFile::class.java)
        val swiftStruct = result.structs.first()
        assertEquals("Foo", swiftStruct.name)
        assertContains(swiftConstant, swiftStruct.constants)
    }

    @Test
    fun finishBuildingTypeCollectionReadsConstantsReadsVisibility() {
        val limeElement = LimeContainer(
            fooPath,
            type = ContainerType.TYPE_COLLECTION,
            visibility = LimeVisibility.INTERNAL
        )
        contextStack.injectResult(swiftConstant)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftFile::class.java)
        val swiftStruct = result.structs.first()
        assertEquals(SwiftVisibility.INTERNAL, swiftStruct.visibility)
    }

    @Test
    fun finishBuildingClass() {
        val limeElement =
            LimeContainer(
                fooPath,
                type = ContainerType.CLASS,
                comment = "some comment",
                attributes = deprecatedAttributes
            )

        modelBuilder.finishBuilding(limeElement)

        val resultFile = modelBuilder.getFinalResult(SwiftFile::class.java)
        val resultClass = modelBuilder.getFinalResult(SwiftClass::class.java)
        assertContains(resultClass, resultFile.classes)
        assertEquals("Foo", resultClass.name)
        assertEquals("mo_del", resultClass.nameSpace)
        assertEquals("mo_del_Foo", resultClass.getcInstance())
        assertEquals("some comment", resultClass.comment.documentation)
        assertEquals("Bar", resultClass.comment.deprecated)
    }

    @Test
    fun finishBuildingClassReadsLegacyCompatible() {
        val limeElement = LimeContainer(
            fooPath,
            type = ContainerType.CLASS,
            attributes = LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.SWIFT, LimeAttributeValueType.OBJC)
                .build()
        )

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftClass::class.java)
        assertEquals(SwiftTypeMapper.OBJC_PARENT_CLASS, result.parentClass)
        assertTrue(result.isObjcInterface)
    }

    @Test
    fun finishBuildingClassReadsParentClass() {
        val limeElement = LimeContainer(fooPath, type = ContainerType.CLASS)
        val swiftClass = SwiftClass("swiftFooName")
        contextStack.injectResult(swiftClass)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftClass::class.java)
        assertEquals("swiftFooName", result.parentClass)
        assertTrue(result.useParentCInstance)
    }

    @Test
    fun finishBuildingClassReadsParentProtocol() {
        val limeElement = LimeContainer(fooPath, type = ContainerType.CLASS)
        val swiftClass = SwiftClass("swiftFooName", isInterface = true)
        swiftClass.methods.add(swiftMethod)
        swiftClass.properties.add(swiftProperty)
        contextStack.injectResult(swiftClass)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftClass::class.java)
        assertContains("swiftFooName", result.implementsProtocols)
        assertContains(swiftMethod, result.methods)
        assertContains(swiftProperty, result.properties)
    }

    @Test
    fun finishBuildingClassReadsVisibility() {
        val limeElement =
            LimeContainer(fooPath, type = ContainerType.CLASS, visibility = LimeVisibility.INTERNAL)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftClass::class.java)
        assertEquals(SwiftVisibility.INTERNAL, result.visibility)
    }

    @Test
    fun finishBuildingClassReadsMembers() {
        val limeElement = LimeContainer(fooPath, type = ContainerType.CLASS)
        contextStack.injectResult(swiftStruct)
        contextStack.injectResult(swiftEnum)
        contextStack.injectResult(swiftTypeDef)
        contextStack.injectResult(swiftMethod)
        contextStack.injectResult(swiftProperty)
        contextStack.injectResult(swiftConstant)

        modelBuilder.finishBuilding(limeElement)

        val resultClass = modelBuilder.getFinalResult(SwiftClass::class.java)
        assertContains(swiftStruct, resultClass.structs)
        assertContains(swiftEnum, resultClass.enums)
        assertContains(swiftTypeDef, resultClass.typedefs)
        assertContains(swiftMethod, resultClass.methods)
        assertContains(swiftProperty, resultClass.properties)
        assertContains(swiftConstant, resultClass.constants)
    }

    @Test
    fun finishBuildingInterface() {
        val limeElement = LimeContainer(
            fooPath,
            type = ContainerType.INTERFACE,
            comment = "some comment",
            attributes = deprecatedAttributes
        )

        modelBuilder.finishBuilding(limeElement)

        val resultFile = modelBuilder.getFinalResult(SwiftFile::class.java)
        val resultClass = modelBuilder.getFinalResult(SwiftClass::class.java)
        assertContains(resultClass, resultFile.classes)
        assertEquals("Foo", resultClass.name)
        assertEquals("mo_del", resultClass.nameSpace)
        assertEquals("mo_del_Foo", resultClass.getcInstance())
        assertEquals("some comment", resultClass.comment.documentation)
        assertEquals("Bar", resultClass.comment.deprecated)
        assertEquals("mo_del_Foo_FunctionTable", resultClass.functionTableName)
    }

    @Test
    fun finishBuildingInterfaceReadsLegacyCompatible() {
        val limeElement = LimeContainer(
            fooPath,
            type = ContainerType.INTERFACE,
            attributes = LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.SWIFT, LimeAttributeValueType.OBJC)
                .build()
        )

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftClass::class.java)
        assertTrue(result.isObjcInterface)
    }

    @Test
    fun finishBuildingInterfaceReadsParentProtocol() {
        val limeElement = LimeContainer(fooPath, type = ContainerType.INTERFACE)
        val swiftClass = SwiftClass("swiftFooName", isInterface = true)
        swiftClass.methods.add(swiftMethod)
        swiftClass.properties.add(swiftProperty)
        contextStack.injectResult(swiftClass)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftClass::class.java)
        assertEquals("swiftFooName", result.parentClass)
        assertContains("swiftFooName", result.implementsProtocols)
        assertContains(swiftMethod, result.methods)
        assertContains(swiftProperty, result.properties)
    }

    @Test
    fun finishBuildingInterfaceReadsVisibility() {
        val limeElement = LimeContainer(
            fooPath,
            type = ContainerType.INTERFACE,
            visibility = LimeVisibility.INTERNAL
        )

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftClass::class.java)
        assertEquals(SwiftVisibility.INTERNAL, result.visibility)
    }

    @Test
    fun finishBuildingInterfaceReadsMembers() {
        val limeElement = LimeContainer(fooPath, type = ContainerType.INTERFACE)
        contextStack.injectResult(swiftStruct)
        contextStack.injectResult(swiftEnum)
        contextStack.injectResult(swiftTypeDef)
        contextStack.injectResult(swiftMethod)
        contextStack.injectResult(swiftProperty)
        contextStack.injectResult(swiftConstant)

        modelBuilder.finishBuilding(limeElement)

        val resultFile = modelBuilder.getFinalResult(SwiftFile::class.java)
        val resultClass = modelBuilder.getFinalResult(SwiftClass::class.java)
        assertContains(swiftStruct, resultFile.structs)
        assertContains(swiftEnum, resultFile.enums)
        assertContains(swiftTypeDef, resultClass.typedefs)
        assertContains(swiftMethod, resultClass.methods)
        assertContains(swiftProperty, resultClass.properties)
        assertContains(swiftConstant, resultClass.constants)
    }
}
