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

package com.here.gluecodium.generator.cpp

import com.here.gluecodium.model.cpp.CppClass
import com.here.gluecodium.model.cpp.CppComplexTypeRef
import com.here.gluecodium.model.cpp.CppConstant
import com.here.gluecodium.model.cpp.CppElement
import com.here.gluecodium.model.cpp.CppEnum
import com.here.gluecodium.model.cpp.CppEnumItem
import com.here.gluecodium.model.cpp.CppField
import com.here.gluecodium.model.cpp.CppMethod
import com.here.gluecodium.model.cpp.CppParameter
import com.here.gluecodium.model.cpp.CppPrimitiveTypeRef
import com.here.gluecodium.model.cpp.CppStruct
import com.here.gluecodium.model.cpp.CppUsing
import com.here.gluecodium.model.cpp.CppValue
import com.here.gluecodium.model.lime.LimeAttributeType.DEPRECATED
import com.here.gluecodium.model.lime.LimeAttributeValueType.MESSAGE
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
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimePath.Companion.EMPTY_PATH
import com.here.gluecodium.model.lime.LimeProperty
import com.here.gluecodium.model.lime.LimeReturnType
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeThrownType
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeValue
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
class CppModelBuilderCommentsTest {
    @MockK private lateinit var typeMapper: CppTypeMapper
    @MockK private lateinit var nameResolver: CppNameResolver
    @MockK private lateinit var includeResolver: CppIncludeResolver

    private val limeContainer = LimeInterface(EMPTY_PATH)
    private val limeContainerTypeRef = LimeDirectTypeRef(limeContainer)
    private val deprecatedAttributes =
        LimeAttributes.Builder().addAttribute(DEPRECATED, MESSAGE, "Bar").build()

    private val contextStack = MockContextStack<CppElement>()

    private lateinit var modelBuilder: CppModelBuilder

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)

        modelBuilder =
            CppModelBuilder(contextStack, typeMapper, nameResolver, includeResolver, emptyMap())
    }

    @Test
    fun finishBuildingContainerReadsComment() {
        val limeElement = LimeInterface(
            EMPTY_PATH,
            comment = LimeComment("Foo"),
            attributes = deprecatedAttributes
        )

        modelBuilder.finishBuilding(limeElement)

        val cppClass = modelBuilder.getFinalResult(CppClass::class.java)
        assertEquals("Foo", cppClass.comment.documentation)
        assertEquals("Bar", cppClass.comment.deprecated)
    }

    @Test
    fun finishBuildingMethodReadsComment() {
        val limeElement = LimeFunction(EMPTY_PATH, comment = LimeComment("Foo"), attributes = deprecatedAttributes)

        modelBuilder.finishBuilding(limeElement)

        val cppMethod = modelBuilder.getFinalResult(CppMethod::class.java)
        assertEquals("Foo", cppMethod.comment.documentation)
        assertEquals("Bar", cppMethod.comment.deprecated)
    }

    @Test
    fun finishBuildingMethodReadsReturnTypeComment() {
        val limeReturnType = LimeReturnType(
            LimeBasicTypeRef.DOUBLE,
            comment = LimeComment("Foo"),
            attributes = deprecatedAttributes
        )
        val limeElement = LimeFunction(EMPTY_PATH, returnType = limeReturnType)

        modelBuilder.finishBuilding(limeElement)

        val cppMethod = modelBuilder.getFinalResult(CppMethod::class.java)
        assertEquals("Foo", cppMethod.returnComment)
    }

    @Test
    fun finishBuildingMethodReadsErrorEnumName() {
        val limeErrorTypeRef = LimeDirectTypeRef(LimeEnumeration(EMPTY_PATH))
        val limeException = LimeException(EMPTY_PATH, errorType = limeErrorTypeRef)
        val limeElement =
            LimeFunction(EMPTY_PATH, thrownType = LimeThrownType(LimeDirectTypeRef(limeException)))
        every { typeMapper.mapType(limeErrorTypeRef) } returns CppComplexTypeRef("::foo::bar")

        modelBuilder.finishBuilding(limeElement)

        val cppMethod = modelBuilder.getFinalResult(CppMethod::class.java)
        assertEquals("::foo::bar", cppMethod.errorType?.name)
    }

    @Test
    fun finishBuildingMethodReadsReturnTypeNotNull() {
        val limeReturnType = LimeReturnType(limeContainerTypeRef)
        val limeElement = LimeFunction(EMPTY_PATH, returnType = limeReturnType)

        modelBuilder.finishBuilding(limeElement)

        val cppMethod = modelBuilder.getFinalResult(CppMethod::class.java)
        assertTrue(cppMethod.isNotNull)
    }

    @Test
    fun finishBuildingParameterReadsComment() {
        contextStack.injectResult(CppPrimitiveTypeRef.BOOL)
        val limeElement = LimeParameter(
            LimePath(emptyList(), listOf("foo")),
            typeRef = LimeBasicTypeRef.DOUBLE,
            comment = LimeComment("Foo"),
            attributes = deprecatedAttributes
        )

        modelBuilder.finishBuilding(limeElement)

        val cppParameter = modelBuilder.getFinalResult(CppParameter::class.java)
        assertEquals("Foo", cppParameter.comment.documentation)
        assertEquals("Bar", cppParameter.comment.deprecated)
    }

    @Test
    fun finishBuildingParameterReadsNotNull() {
        contextStack.injectResult(CppPrimitiveTypeRef.BOOL)
        val limeElement =
            LimeParameter(LimePath(emptyList(), listOf("foo")), typeRef = limeContainerTypeRef)

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
            comment = LimeComment("Foo"),
            attributes = deprecatedAttributes
        )

        modelBuilder.finishBuilding(limeElement)

        val cppConstant = modelBuilder.getFinalResult(CppConstant::class.java)
        assertEquals("Foo", cppConstant.comment.documentation)
        assertEquals("Bar", cppConstant.comment.deprecated)
    }

    @Test
    fun finishBuildingFieldReadsComment() {
        contextStack.injectResult(CppPrimitiveTypeRef.BOOL)
        val limeElement = LimeField(
            EMPTY_PATH,
            typeRef = LimeBasicTypeRef.DOUBLE,
            comment = LimeComment("Foo"),
            attributes = deprecatedAttributes
        )

        modelBuilder.finishBuilding(limeElement)

        val cppField = modelBuilder.getFinalResult(CppField::class.java)
        assertEquals("Foo", cppField.comment.documentation)
        assertEquals("Bar", cppField.comment.deprecated)
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
        val limeElement = LimeStruct(
            EMPTY_PATH,
            comment = LimeComment("Foo"),
            attributes = deprecatedAttributes,
            constructorComment = LimeComment("Baz")
        )

        modelBuilder.finishBuilding(limeElement)

        val cppStruct = modelBuilder.getFinalResult(CppStruct::class.java)
        assertEquals("Foo", cppStruct.comment.documentation)
        assertEquals("Bar", cppStruct.comment.deprecated)
        assertEquals("Baz", cppStruct.constructorComment)
    }

    @Test
    fun finishBuildingTypeDefReadsComment() {
        contextStack.injectResult(CppPrimitiveTypeRef.BOOL)
        val limeElement = LimeTypeAlias(
            EMPTY_PATH,
            typeRef = LimeBasicTypeRef.DOUBLE,
            comment = LimeComment("Foo"),
            attributes = deprecatedAttributes
        )

        modelBuilder.finishBuilding(limeElement)

        val cppUsing = modelBuilder.getFinalResult(CppUsing::class.java)
        assertEquals("Foo", cppUsing.comment.documentation)
        assertEquals("Bar", cppUsing.comment.deprecated)
    }

    @Test
    fun finishBuildingEnumerationTypeReadsComment() {
        val limeElement =
            LimeEnumeration(EMPTY_PATH, comment = LimeComment("Foo"), attributes = deprecatedAttributes)

        modelBuilder.finishBuilding(limeElement)

        val cppEnum = modelBuilder.getFinalResult(CppEnum::class.java)
        assertEquals("Foo", cppEnum.comment.documentation)
        assertEquals("Bar", cppEnum.comment.deprecated)
    }

    @Test
    fun finishBuildingEnumeratorReadsComment() {
        val limeElement =
            LimeEnumerator(EMPTY_PATH, comment = LimeComment("Foo"), attributes = deprecatedAttributes)

        modelBuilder.finishBuilding(limeElement)

        val cppEnumItem = modelBuilder.getFinalResult(CppEnumItem::class.java)
        assertEquals("Foo", cppEnumItem.comment.documentation)
        assertEquals("Bar", cppEnumItem.comment.deprecated)
    }

    @Test
    fun finishBuildingPropertyReadsComment() {
        contextStack.injectResult(CppPrimitiveTypeRef.BOOL)
        val limeElement = LimeProperty(
            EMPTY_PATH,
            typeRef = LimeBasicTypeRef.DOUBLE,
            comment = LimeComment("Foo"),
            getter = LimeFunction(EMPTY_PATH, comment = LimeComment("Gets foo"), attributes = deprecatedAttributes),
            setter = LimeFunction(EMPTY_PATH, comment = LimeComment("Sets foo"), attributes = deprecatedAttributes)
        )

        modelBuilder.finishBuilding(limeElement)

        val results = modelBuilder.finalResults
        assertEquals(2, results.size)
        val cppGetter = results.first() as CppMethod
        assertEquals("Gets foo", cppGetter.comment.documentation)
        assertEquals("Bar", cppGetter.comment.deprecated)
        assertEquals("Foo", cppGetter.returnComment)
        val cppSetter = results.last() as CppMethod
        assertEquals("Sets foo", cppSetter.comment.documentation)
        assertEquals("Bar", cppSetter.comment.deprecated)
        assertEquals("Foo", cppSetter.parameters.first().comment.documentation)
    }

    @Test
    fun finishBuildingPropertyReadsNotNull() {
        contextStack.injectResult(CppPrimitiveTypeRef.BOOL)
        val limeElement = LimeProperty(
            EMPTY_PATH,
            typeRef = limeContainerTypeRef,
            getter = LimeFunction(EMPTY_PATH),
            setter = LimeFunction(EMPTY_PATH)
        )

        modelBuilder.finishBuilding(limeElement)

        val results = modelBuilder.finalResults
        assertEquals(2, results.size)
        assertTrue((results.first() as CppMethod).isNotNull)
        assertTrue((results.last() as CppMethod).parameters.first().isNotNull)
    }
}
