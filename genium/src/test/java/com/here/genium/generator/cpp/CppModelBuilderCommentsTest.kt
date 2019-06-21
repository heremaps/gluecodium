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

import com.here.genium.model.cpp.CppClass
import com.here.genium.model.cpp.CppComplexTypeRef
import com.here.genium.model.cpp.CppConstant
import com.here.genium.model.cpp.CppElement
import com.here.genium.model.cpp.CppEnum
import com.here.genium.model.cpp.CppEnumItem
import com.here.genium.model.cpp.CppField
import com.here.genium.model.cpp.CppMethod
import com.here.genium.model.cpp.CppParameter
import com.here.genium.model.cpp.CppPrimitiveTypeRef
import com.here.genium.model.cpp.CppStruct
import com.here.genium.model.cpp.CppUsing
import com.here.genium.model.cpp.CppValue
import com.here.genium.model.lime.LimeBasicTypeRef
import com.here.genium.model.lime.LimeConstant
import com.here.genium.model.lime.LimeContainer
import com.here.genium.model.lime.LimeDirectTypeRef
import com.here.genium.model.lime.LimeEnumeration
import com.here.genium.model.lime.LimeEnumerator
import com.here.genium.model.lime.LimeField
import com.here.genium.model.lime.LimeMethod
import com.here.genium.model.lime.LimeParameter
import com.here.genium.model.lime.LimePath.Companion.EMPTY_PATH
import com.here.genium.model.lime.LimeProperty
import com.here.genium.model.lime.LimeReturnType
import com.here.genium.model.lime.LimeStruct
import com.here.genium.model.lime.LimeTypeDef
import com.here.genium.model.lime.LimeValue
import com.here.genium.test.MockContextStack
import io.mockk.MockKAnnotations
import io.mockk.impl.annotations.MockK
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class CppModelBuilderCommentsTest {
    @MockK private lateinit var typeMapper: CppTypeMapper
    @MockK private lateinit var nameResolver: CppNameResolver

    private val limeContainer = LimeContainer(
        EMPTY_PATH,
        type = LimeContainer.ContainerType.TYPE_COLLECTION
    )
    private val limeContainerTypeRef = LimeDirectTypeRef(limeContainer)

    private val contextStack = MockContextStack<CppElement>()

    private lateinit var modelBuilder: CppModelBuilder

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)

        modelBuilder = CppModelBuilder(contextStack, typeMapper, nameResolver)
    }

    @Test
    fun finishBuildingContainerReadsComment() {
        val limeElement = LimeContainer(
            EMPTY_PATH,
            type = LimeContainer.ContainerType.INTERFACE,
            comment = "Foo"
        )

        modelBuilder.finishBuilding(limeElement)

        val cppClass = modelBuilder.getFinalResult(CppClass::class.java)
        assertEquals("Foo", cppClass.comment.documentation)
    }

    @Test
    fun finishBuildingMethodReadsComment() {
        val limeElement = LimeMethod(EMPTY_PATH, comment = "Foo")

        modelBuilder.finishBuilding(limeElement)

        val cppMethod = modelBuilder.getFinalResult(CppMethod::class.java)
        assertEquals("Foo", cppMethod.comment.documentation)
    }

    @Test
    fun finishBuildingMethodReadsReturnTypeComment() {
        val limeReturnType = LimeReturnType(LimeBasicTypeRef.DOUBLE, comment = "Foo")
        val limeElement = LimeMethod(EMPTY_PATH, returnType = limeReturnType)

        modelBuilder.finishBuilding(limeElement)

        val cppMethod = modelBuilder.getFinalResult(CppMethod::class.java)
        assertEquals("Foo", cppMethod.returnComment)
    }

    @Test
    fun finishBuildingMethodReadsErrorEnumName() {
        contextStack.injectResult(CppComplexTypeRef("::foo::bar"))
        val limeElement = LimeMethod(EMPTY_PATH)

        modelBuilder.finishBuilding(limeElement)

        val cppMethod = modelBuilder.getFinalResult(CppMethod::class.java)
        assertEquals("::foo::bar", cppMethod.errorEnumName)
    }

    @Test
    fun finishBuildingMethodReadsReturnTypeNotNull() {
        val limeReturnType = LimeReturnType(limeContainerTypeRef)
        val limeElement = LimeMethod(EMPTY_PATH, returnType = limeReturnType)

        modelBuilder.finishBuilding(limeElement)

        val cppMethod = modelBuilder.getFinalResult(CppMethod::class.java)
        assertTrue(cppMethod.isNotNull)
    }

    @Test
    fun finishBuildingParameterReadsComment() {
        contextStack.injectResult(CppPrimitiveTypeRef.BOOL)
        val limeElement = LimeParameter(
            EMPTY_PATH,
            typeRef = LimeBasicTypeRef.DOUBLE,
            comment = "Foo"
        )

        modelBuilder.finishBuilding(limeElement)

        val cppParameter = modelBuilder.getFinalResult(CppParameter::class.java)
        assertEquals("Foo", cppParameter.comment.documentation)
    }

    @Test
    fun finishBuildingParameterReadsNotNull() {
        contextStack.injectResult(CppPrimitiveTypeRef.BOOL)
        val limeElement = LimeParameter(EMPTY_PATH, typeRef = limeContainerTypeRef)

        modelBuilder.finishBuilding(limeElement)

        val cppParameter = modelBuilder.getFinalResult(CppParameter::class.java)
        assertTrue(cppParameter.isNotNull)
    }

    @Test
    fun finishBuildingConstantReadsComment() {
        contextStack.injectResult(CppPrimitiveTypeRef.BOOL)
        contextStack.injectResult(CppValue(""))
        val limeElement = LimeConstant(
            path = EMPTY_PATH,
            typeRef = LimeBasicTypeRef.DOUBLE,
            value = LimeValue.Literal(LimeBasicTypeRef.DOUBLE, ""),
            comment = "Foo"
        )

        modelBuilder.finishBuilding(limeElement)

        val cppConstant = modelBuilder.getFinalResult(CppConstant::class.java)
        assertEquals("Foo", cppConstant.comment.documentation)
    }

    @Test
    fun finishBuildingFieldReadsComment() {
        contextStack.injectResult(CppPrimitiveTypeRef.BOOL)
        val limeElement = LimeField(EMPTY_PATH, typeRef = LimeBasicTypeRef.DOUBLE, comment = "Foo")

        modelBuilder.finishBuilding(limeElement)

        val cppField = modelBuilder.getFinalResult(CppField::class.java)
        assertEquals("Foo", cppField.comment.documentation)
    }

    @Test
    fun finishBuildingFieldReadsNotNull() {
        contextStack.injectResult(CppPrimitiveTypeRef.BOOL)
        val limeElement = LimeField(EMPTY_PATH, typeRef = limeContainerTypeRef)

        modelBuilder.finishBuilding(limeElement)

        val cppField = modelBuilder.getFinalResult(CppField::class.java)
        assertTrue(cppField.isNotNull)
    }

    @Test
    fun finishBuildingStructReadsComment() {
        val limeElement = LimeStruct(EMPTY_PATH, comment = "Foo")

        modelBuilder.finishBuilding(limeElement)

        val cppStruct = modelBuilder.getFinalResult(CppStruct::class.java)
        assertEquals("Foo", cppStruct.comment.documentation)
    }

    @Test
    fun finishBuildingTypeDefReadsComment() {
        contextStack.injectResult(CppPrimitiveTypeRef.BOOL)
        val limeElement = LimeTypeDef(
            EMPTY_PATH,
            typeRef = LimeBasicTypeRef.DOUBLE,
            comment = "Foo"
        )

        modelBuilder.finishBuilding(limeElement)

        val cppUsing = modelBuilder.getFinalResult(CppUsing::class.java)
        assertEquals("Foo", cppUsing.comment.documentation)
    }

    @Test
    fun finishBuildingEnumerationTypeReadsComment() {
        val limeElement = LimeEnumeration(EMPTY_PATH, comment = "Foo")

        modelBuilder.finishBuilding(limeElement)

        val cppEnum = modelBuilder.getFinalResult(CppEnum::class.java)
        assertEquals("Foo", cppEnum.comment.documentation)
    }

    @Test
    fun finishBuildingEnumeratorReadsComment() {
        val limeElement = LimeEnumerator(EMPTY_PATH, comment = "Foo")

        modelBuilder.finishBuilding(limeElement)

        val cppEnumItem = modelBuilder.getFinalResult(CppEnumItem::class.java)
        assertEquals("Foo", cppEnumItem.comment.documentation)
    }

    @Test
    fun finishBuildingPropertyReadsComment() {
        contextStack.injectResult(CppPrimitiveTypeRef.BOOL)
        val limeElement = LimeProperty(
            EMPTY_PATH,
            typeRef = LimeBasicTypeRef.DOUBLE,
            comment = "Foo",
            getter = LimeMethod(EMPTY_PATH),
            setter = LimeMethod(EMPTY_PATH)
        )

        modelBuilder.finishBuilding(limeElement)

        val results = modelBuilder.finalResults
        assertEquals(2, results.size)
        assertEquals("Gets foo", (results.first() as CppMethod).comment.documentation)
        assertEquals("Sets foo", (results.last() as CppMethod).comment.documentation)
    }

    @Test
    fun finishBuildingPropertyReadsNotNull() {
        contextStack.injectResult(CppPrimitiveTypeRef.BOOL)
        val limeElement = LimeProperty(
            EMPTY_PATH,
            typeRef = limeContainerTypeRef,
            getter = LimeMethod(EMPTY_PATH),
            setter = LimeMethod(EMPTY_PATH)
        )

        modelBuilder.finishBuilding(limeElement)

        val results = modelBuilder.finalResults
        assertEquals(2, results.size)
        assertTrue((results.first() as CppMethod).isNotNull)
        assertTrue((results.last() as CppMethod).parameters.first().isNotNull)
    }
}
