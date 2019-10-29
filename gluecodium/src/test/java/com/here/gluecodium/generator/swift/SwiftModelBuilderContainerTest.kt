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
import com.here.gluecodium.generator.common.nameRuleSetFromConfig
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeAttributes
import com.here.gluecodium.model.lime.LimeBasicTypeRef
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeComment
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimeSignatureResolver
import com.here.gluecodium.model.lime.LimeTypesCollection
import com.here.gluecodium.model.lime.LimeVisibility
import com.here.gluecodium.model.swift.SwiftClass
import com.here.gluecodium.model.swift.SwiftConstant
import com.here.gluecodium.model.swift.SwiftEnum
import com.here.gluecodium.model.swift.SwiftFile
import com.here.gluecodium.model.swift.SwiftMethod
import com.here.gluecodium.model.swift.SwiftModelElement
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
    private val transientModel = mutableListOf<SwiftFile>()
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

        val nameRuleSet = nameRuleSetFromConfig(Gluecodium.testOptions().swiftNameRules)
        modelBuilder =
            SwiftModelBuilder(
                limeReferenceMap = emptyMap(),
                signatureResolver = signatureResolver,
                nameResolver = nameResolver,
                typeMapper = typeMapper,
                nameRules = SwiftNameRules(nameRuleSet),
                contextStack = contextStack,
                buildTransientModel = { transientModel }
            )

        every { nameResolver.getFullName(any()) } returns "nonsense"
        every { nameResolver.getNestedNames(any()) } returns listOf("Foo")
    }

    @Test
    fun finishBuildingTypeCollectionReadsMembers() {
        val limeElement = LimeTypesCollection(fooPath)
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
    fun finishBuildingTypeCollectionReadsExtensionAttribute() {
        val limeElement = LimeTypesCollection(
            fooPath,
            attributes = LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.SWIFT, LimeAttributeValueType.EXTENSION)
                .build()
        )
        contextStack.injectResult(swiftStruct)
        contextStack.injectResult(swiftEnum)
        contextStack.injectResult(swiftTypeDef)
        contextStack.injectResult(swiftConstant)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftFile::class.java)
        val swiftExtension = result.extensions.first()
        assertContains(swiftStruct, swiftExtension.structs)
        assertContains(swiftEnum, swiftExtension.enums)
        assertContains(swiftTypeDef, swiftExtension.typeAliases)
        assertContains(swiftConstant, swiftExtension.constants)
    }

    @Test
    fun finishBuildingTypeCollectionReadsConstants() {
        val limeElement = LimeTypesCollection(fooPath)
        contextStack.injectResult(swiftConstant)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftFile::class.java)
        val swiftStruct = result.structs.first()
        assertEquals("Foo", swiftStruct.name)
        assertContains(swiftConstant, swiftStruct.constants)
    }

    @Test
    fun finishBuildingTypeCollectionReadsConstantsReadsVisibility() {
        val limeElement = LimeTypesCollection(
            fooPath,
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
        val limeElement = LimeClass(
            fooPath,
            comment = LimeComment("some comment"),
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
        val limeElement = LimeClass(
            fooPath,
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
        val limeElement = LimeClass(fooPath, parent = LimeBasicTypeRef.INT)
        val swiftFile = SwiftFile("")
        swiftFile.classes += SwiftClass(listOf("swiftFooName"))
        transientModel += swiftFile

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftClass::class.java)
        assertEquals("swiftFooName", result.parentClass)
        assertTrue(result.useParentCInstance)
    }

    @Test
    fun finishBuildingClassReadsParentProtocol() {
        val limeElement = LimeClass(fooPath, parent = LimeBasicTypeRef.INT)
        val swiftClass = SwiftClass(listOf("swiftFooName"), isInterface = true)
        swiftClass.methods.add(swiftMethod)
        swiftClass.properties.add(swiftProperty)
        val swiftFile = SwiftFile("")
        swiftFile.classes += swiftClass
        transientModel += swiftFile

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftClass::class.java)
        assertContains("swiftFooName", result.implementsProtocols)
        assertContains(swiftMethod, result.methods)
        assertContains(swiftProperty, result.properties)
    }

    @Test
    fun finishBuildingClassReadsVisibility() {
        val limeElement = LimeClass(fooPath, visibility = LimeVisibility.INTERNAL)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftClass::class.java)
        assertEquals(SwiftVisibility.INTERNAL, result.visibility)
    }

    @Test
    fun finishBuildingClassReadsMembers() {
        val limeElement = LimeClass(fooPath)
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
        val limeElement = LimeInterface(
            fooPath,
            comment = LimeComment("some comment"),
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
        val limeElement = LimeInterface(
            fooPath,
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
        val limeElement = LimeInterface(fooPath, parent = LimeBasicTypeRef.INT)
        val swiftClass = SwiftClass(listOf("swiftFooName"), isInterface = true)
        swiftClass.methods.add(swiftMethod)
        swiftClass.properties.add(swiftProperty)
        val swiftFile = SwiftFile("")
        swiftFile.classes += swiftClass
        transientModel += swiftFile

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftClass::class.java)
        assertEquals("swiftFooName", result.parentClass)
        assertContains("swiftFooName", result.implementsProtocols)
        assertContains(swiftMethod, result.methods)
        assertContains(swiftProperty, result.properties)
    }

    @Test
    fun finishBuildingInterfaceReadsVisibility() {
        val limeElement = LimeInterface(fooPath, visibility = LimeVisibility.INTERNAL)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(SwiftClass::class.java)
        assertEquals(SwiftVisibility.INTERNAL, result.visibility)
    }

    @Test
    fun finishBuildingInterfaceReadsMembers() {
        val limeElement = LimeInterface(fooPath)
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
