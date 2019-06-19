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

package com.here.genium.loader

import com.here.genium.franca.SpecialTypeRules
import com.here.genium.franca.CommentHelper
import com.here.genium.franca.FrancaDeploymentModel
import com.here.genium.model.lime.LimeAttributeType
import com.here.genium.model.lime.LimeBasicTypeRef
import com.here.genium.model.lime.LimeConstant
import com.here.genium.model.lime.LimeContainer
import com.here.genium.model.lime.LimeContainer.ContainerType
import com.here.genium.model.lime.LimeElement
import com.here.genium.model.lime.LimeEnumeration
import com.here.genium.model.lime.LimeMethod
import com.here.genium.model.lime.LimeParameter
import com.here.genium.model.lime.LimePath
import com.here.genium.model.lime.LimePath.Companion.EMPTY_PATH
import com.here.genium.model.lime.LimeProperty
import com.here.genium.model.lime.LimeReturnType
import com.here.genium.model.lime.LimeStruct
import com.here.genium.model.lime.LimeTypeDef
import com.here.genium.model.lime.LimeTypeRef
import com.here.genium.model.lime.LimeValue
import com.here.genium.model.lime.LimeVisibility
import com.here.genium.test.AssertHelpers.assertAttributeEquals
import com.here.genium.test.AssertHelpers.assertContains
import com.here.genium.test.AssertHelpers.assertHasAttribute
import com.here.genium.test.MockContextStack
import io.mockk.MockKAnnotations
import io.mockk.every
import io.mockk.impl.annotations.MockK
import io.mockk.mockkObject
import io.mockk.mockkStatic
import io.mockk.unmockkAll
import org.franca.core.franca.FArgument
import org.franca.core.franca.FAttribute
import org.franca.core.franca.FInterface
import org.franca.core.franca.FMethod
import org.franca.core.franca.FModel
import org.franca.core.franca.FStructType
import org.franca.core.franca.FTypeRef
import org.junit.After
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class LimeModelBuilderInterfaceTest {
    @MockK private lateinit var francaModel: FModel
    @MockK private lateinit var francaInterface: FInterface
    @MockK private lateinit var francaTypeRef: FTypeRef
    @MockK private lateinit var francaMethod: FMethod
    @MockK private lateinit var francaArgument: FArgument
    @MockK private lateinit var francaAttribute: FAttribute
    @MockK private lateinit var francaStruct: FStructType

    @MockK private lateinit var deploymentModel: FrancaDeploymentModel
    @MockK private lateinit var referenceResolver: LimeReferenceResolver
    @MockK private lateinit var companionHelper: FrancaCompanionHelper

    private val limeTypeRef = LimeBasicTypeRef.DOUBLE
    private val limeValue = LimeValue.Literal(limeTypeRef, "")
    private val limeStruct = LimeStruct(EMPTY_PATH)
    private val limeEnumeration = LimeEnumeration(EMPTY_PATH)
    private val limeConstant = LimeConstant(EMPTY_PATH, typeRef = limeTypeRef, value = limeValue)
    private val limeTypeDef = LimeTypeDef(EMPTY_PATH, typeRef = limeTypeRef)
    private val limeMethod = LimeMethod(EMPTY_PATH)
    private val limeProperty = LimeProperty(EMPTY_PATH, typeRef = limeTypeRef, getter = limeMethod)
    private val limeReturnType = LimeReturnType(limeTypeRef, comment = "Foo comment")
    private val limeParameter = LimeParameter(EMPTY_PATH, typeRef = limeTypeRef)

    private val contextStack = MockContextStack<LimeElement>()

    private lateinit var modelBuilder: LimeModelBuilder

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)
        mockkStatic(SpecialTypeRules::class, StringValueMapper::class)
        mockkObject(CommentHelper)

        modelBuilder =
            LimeModelBuilder(contextStack, deploymentModel, referenceResolver, companionHelper)

        every { CommentHelper.getDescription(any()) } returns "some comment"
        every { referenceResolver.referenceMap } returns emptyMap()
        every { companionHelper.getStructForCompanion(any()) } returns null

        every { francaModel.name } returns "the.model"
        every { francaInterface.name } returns "SomeInterface"
        every { francaMethod.name } returns "SomeMethod"
        every { francaArgument.name } returns "SomeArg"
        every { francaAttribute.name } returns "SomeAttribute"
        every { francaStruct.name } returns "SomeStruct"

        every { francaInterface.eContainer() } returns francaModel
        every { francaMethod.eContainer() } returns francaInterface
        every { francaArgument.eContainer() } returns francaMethod
        every { francaAttribute.eContainer() } returns francaInterface
        every { francaStruct.eContainer() } returns francaInterface

        every { francaMethod.selector } returns null
    }

    @After
    fun tearDown() {
        unmockkAll()
    }

    @Test
    fun finishBuildingInterface() {
        modelBuilder.finishBuilding(francaInterface)

        val result = modelBuilder.getFinalResult(LimeContainer::class.java)
        assertEquals(ContainerType.CLASS, result.type)
        assertEquals("SomeInterface", result.name)
        assertEquals("the.model.SomeInterface", result.fullName)
        assertEquals("some comment", result.comment)
    }

    @Test
    fun finishBuildingInterfaceReadsVisibility() {
        every { deploymentModel.isInternal(francaInterface) } returns true

        modelBuilder.finishBuilding(francaInterface)

        val result = modelBuilder.getFinalResult(LimeContainer::class.java)
        assertEquals(LimeVisibility.INTERNAL, result.visibility)
    }

    @Test
    fun finishBuildingInterfaceReadsMembers() {
        contextStack.injectResult(limeStruct)
        contextStack.injectResult(limeEnumeration)
        contextStack.injectResult(limeConstant)
        contextStack.injectResult(limeTypeDef)
        contextStack.injectResult(limeMethod)
        contextStack.injectResult(limeProperty)

        modelBuilder.finishBuilding(francaInterface)

        val result = modelBuilder.getFinalResult(LimeContainer::class.java)
        assertContains(limeStruct, result.structs)
        assertContains(limeEnumeration, result.enumerations)
        assertContains(limeConstant, result.constants)
        assertContains(limeTypeDef, result.typeDefs)
        assertContains(limeMethod, result.methods)
        assertContains(limeProperty, result.properties)
    }

    @Test
    fun finishBuildingInterfaceReadsExternalAttributes() {
        every { deploymentModel.isExternalType(francaInterface) } returns true
        every { deploymentModel.getExternalType(francaInterface) } returns "foo/Bar.h"
        every { deploymentModel.getExternalName(francaInterface) } returns "::foo::Bar"

        modelBuilder.finishBuilding(francaInterface)

        val result = modelBuilder.getFinalResult(LimeContainer::class.java)
        assertAttributeEquals("foo/Bar.h", LimeAttributeType.EXTERNAL_TYPE, result)
        assertAttributeEquals("::foo::Bar", LimeAttributeType.EXTERNAL_NAME, result)
    }

    @Test
    fun finishBuildingInterfaceReadsIsObjcInterface() {
        every { deploymentModel.isObjcInterface(francaInterface) } returns true

        modelBuilder.finishBuilding(francaInterface)

        val result = modelBuilder.getFinalResult(LimeContainer::class.java)
        assertHasAttribute(LimeAttributeType.LEGACY_COMPATIBLE, result)
    }

    @Test
    fun finishBuildingInterfaceReadsIsInterface() {
        every { deploymentModel.isInterface(francaInterface) } returns true

        modelBuilder.finishBuilding(francaInterface)

        val result = modelBuilder.getFinalResult(LimeContainer::class.java)
        assertEquals(ContainerType.INTERFACE, result.type)
    }

    @Test
    fun finishBuildingInterfaceReadsParent() {
        contextStack.injectResult(
            LimeContainer(
            LimePath(listOf("foo"), listOf("bar")),
            type = ContainerType.TYPE_COLLECTION
        )
        )

        modelBuilder.finishBuilding(francaInterface)

        val result = modelBuilder.getFinalResult(LimeContainer::class.java)
        assertEquals("foo.bar", result.parent?.elementFullName)
    }

    @Test
    fun finishBuildingTypeRefInstance() {
        every { SpecialTypeRules.isInstanceId(any<FTypeRef>()) } returns true
        every { francaTypeRef.derived.eContainer() } returns francaInterface

        modelBuilder.finishBuilding(francaTypeRef)

        val result = modelBuilder.getFinalResult(LimeTypeRef::class.java)
        assertEquals("the.model.SomeInterface", result.elementFullName)
    }

    @Test
    fun finishBuildingMethod() {
        modelBuilder.finishBuilding(francaMethod)

        val result = modelBuilder.getFinalResult(LimeMethod::class.java)
        assertEquals("SomeMethod", result.name)
        assertEquals("the.model.SomeInterface.SomeMethod", result.fullName)
        assertEquals("some comment", result.comment)
    }

    @Test
    fun finishBuildingCompanionMethod() {
        every { companionHelper.getStructForCompanion(francaInterface) } returns francaStruct

        modelBuilder.finishBuilding(francaMethod)

        val result = modelBuilder.getFinalResult(LimeMethod::class.java)
        assertEquals("the.model.SomeInterface.SomeStruct.SomeMethod", result.fullName)
    }

    @Test
    fun finishBuildingMethodReadsReturnType() {
        contextStack.injectResult(limeReturnType)

        modelBuilder.finishBuilding(francaMethod)

        val result = modelBuilder.getFinalResult(LimeMethod::class.java)
        assertEquals(limeReturnType, result.returnType)
    }

    @Test
    fun finishBuildingMethodReadsVisibility() {
        every { deploymentModel.isInternal(francaMethod) } returns true

        modelBuilder.finishBuilding(francaMethod)

        val result = modelBuilder.getFinalResult(LimeMethod::class.java)
        assertEquals(LimeVisibility.INTERNAL, result.visibility)
    }

    @Test
    fun finishBuildingMethodReadsParentVisibility() {
        every { deploymentModel.isInternal(francaInterface) } returns true

        modelBuilder.finishBuilding(francaMethod)

        val result = modelBuilder.getFinalResult(LimeMethod::class.java)
        assertEquals(LimeVisibility.INTERNAL, result.visibility)
    }

    @Test
    fun finishBuildingMethodReadsParameters() {
        contextStack.injectResult(limeParameter)

        modelBuilder.finishBuilding(francaMethod)

        val result = modelBuilder.getFinalResult(LimeMethod::class.java)
        assertContains(limeParameter, result.parameters)
    }

    @Test
    fun finishBuildingMethodReadsConst() {
        every { deploymentModel.isConst(francaMethod) } returns true

        modelBuilder.finishBuilding(francaMethod)

        val result = modelBuilder.getFinalResult(LimeMethod::class.java)
        assertHasAttribute(LimeAttributeType.CONST, result)
    }

    @Test
    fun finishBuildingMethodReadsConstructor() {
        contextStack.injectResult(limeReturnType)
        every { deploymentModel.isConstructor(francaMethod) } returns true

        modelBuilder.finishBuilding(francaMethod)

        val result = modelBuilder.getFinalResult(LimeMethod::class.java)
        assertHasAttribute(LimeAttributeType.CONSTRUCTOR, result)
        assertTrue(result.isStatic)
        assertEquals("the.model.SomeInterface", result.returnType.typeRef.elementFullName)
        assertEquals("Foo comment", result.returnType.comment)
    }

    @Test
    fun finishBuildingMethodReadsStatic() {
        every { deploymentModel.isStatic(francaMethod) } returns true

        modelBuilder.finishBuilding(francaMethod)

        val result = modelBuilder.getFinalResult(LimeMethod::class.java)
        assertTrue(result.isStatic)
    }

    @Test
    fun finishBuildingMethodReadsErrorEnum() {
        contextStack.injectResult(limeEnumeration)

        modelBuilder.finishBuilding(francaMethod)

        val result = modelBuilder.getFinalResult(LimeMethod::class.java)
        assertEquals(limeEnumeration.fullName, result.errorType?.elementFullName)
    }

    @Test
    fun finishBuildingInputArgument() {
        contextStack.injectResult(limeTypeRef)

        modelBuilder.finishBuildingInputArgument(francaArgument)

        val result = modelBuilder.getFinalResult(LimeParameter::class.java)
        assertEquals("SomeArg", result.name)
        assertEquals("the.model.SomeInterface.SomeMethod.SomeArg", result.fullName)
        assertEquals("some comment", result.comment)
        assertEquals(limeTypeRef, result.typeRef)
    }

    @Test
    fun finishBuildingInputArgumentReadsNullable() {
        contextStack.injectResult(limeTypeRef)
        every { deploymentModel.isNullable(francaArgument) } returns true

        modelBuilder.finishBuildingInputArgument(francaArgument)

        val result = modelBuilder.getFinalResult(LimeParameter::class.java)
        assertTrue(result.typeRef.isNullable)
    }

    @Test
    fun finishBuildingInputArgumentReadsInlineArray() {
        contextStack.injectResult(limeTypeRef)
        every { francaArgument.isArray } returns true

        modelBuilder.finishBuildingInputArgument(francaArgument)

        val result = modelBuilder.getFinalResult(LimeParameter::class.java)
        assertEquals("[DOUBLE]", result.typeRef.elementFullName)
    }

    @Test
    fun finishBuildingOutputArgument() {
        contextStack.injectResult(limeTypeRef)

        modelBuilder.finishBuildingOutputArgument(francaArgument)

        val result = modelBuilder.getFinalResult(LimeReturnType::class.java)
        assertEquals("some comment", result.comment)
        assertEquals(limeTypeRef, result.typeRef)
    }

    @Test
    fun finishBuildingOutputArgumentReadsNullable() {
        contextStack.injectResult(limeTypeRef)
        every { deploymentModel.isNullable(francaArgument) } returns true

        modelBuilder.finishBuildingOutputArgument(francaArgument)

        val result = modelBuilder.getFinalResult(LimeReturnType::class.java)
        assertTrue(result.typeRef.isNullable)
    }

    @Test
    fun finishBuildingOutputArgumentReadsInlineArray() {
        contextStack.injectResult(limeTypeRef)
        every { francaArgument.isArray } returns true

        modelBuilder.finishBuildingOutputArgument(francaArgument)

        val result = modelBuilder.getFinalResult(LimeReturnType::class.java)
        assertEquals("[DOUBLE]", result.typeRef.elementFullName)
    }

    @Test
    fun finishBuildingAttribute() {
        contextStack.injectResult(limeTypeRef)

        modelBuilder.finishBuilding(francaAttribute)

        val result = modelBuilder.getFinalResult(LimeProperty::class.java)
        assertEquals("SomeAttribute", result.name)
        assertEquals("the.model.SomeInterface.SomeAttribute", result.fullName)
        assertEquals("some comment", result.comment)
        assertEquals(limeTypeRef, result.typeRef)
    }

    @Test
    fun finishBuildingAttributeReadsVisibility() {
        contextStack.injectResult(limeTypeRef)
        every { deploymentModel.isInternal(francaAttribute) } returns true

        modelBuilder.finishBuilding(francaAttribute)

        val result = modelBuilder.getFinalResult(LimeProperty::class.java)
        assertEquals(LimeVisibility.INTERNAL, result.visibility)
    }

    @Test
    fun finishBuildingAttributeReadsNullable() {
        contextStack.injectResult(limeTypeRef)
        every { deploymentModel.isNullable(francaAttribute) } returns true

        modelBuilder.finishBuilding(francaAttribute)

        val result = modelBuilder.getFinalResult(LimeProperty::class.java)
        assertTrue(result.typeRef.isNullable)
    }

    @Test
    fun finishBuildingAttributeReadsInternalSetter() {
        contextStack.injectResult(limeTypeRef)
        every { deploymentModel.hasInternalSetter(francaAttribute) } returns true

        modelBuilder.finishBuilding(francaAttribute)

        val result = modelBuilder.getFinalResult(LimeProperty::class.java)
        assertEquals(LimeVisibility.INTERNAL, result.setter?.visibility)
    }

    @Test
    fun finishBuildingAttributeReadsInlineArray() {
        contextStack.injectResult(limeTypeRef)
        every { francaAttribute.isArray } returns true

        modelBuilder.finishBuilding(francaAttribute)

        val result = modelBuilder.getFinalResult(LimeProperty::class.java)
        assertEquals("[DOUBLE]", result.typeRef.elementFullName)
    }

    @Test
    fun finishBuildingAttributeReadsExternalAttributes() {
        contextStack.injectResult(limeTypeRef)
        every { deploymentModel.getExternalGetter(francaAttribute) } returns "get_foo"
        every { deploymentModel.getExternalSetter(francaAttribute) } returns "set_foo"

        modelBuilder.finishBuilding(francaAttribute)

        val result = modelBuilder.getFinalResult(LimeProperty::class.java)
        assertAttributeEquals("get_foo", LimeAttributeType.EXTERNAL_NAME, result.getter)
        assertAttributeEquals("set_foo", LimeAttributeType.EXTERNAL_NAME, result.setter!!)
    }

    @Test
    fun finishBuildingAttributeReadsStatic() {
        contextStack.injectResult(limeTypeRef)
        every { deploymentModel.isStatic(francaAttribute) } returns true

        modelBuilder.finishBuilding(francaAttribute)

        val result = modelBuilder.getFinalResult(LimeProperty::class.java)
        assertTrue(result.isStatic)
    }

    @Test
    fun finishBuildingAttributeReadsReadonly() {
        contextStack.injectResult(limeTypeRef)
        every { francaAttribute.isReadonly } returns true

        modelBuilder.finishBuilding(francaAttribute)

        val result = modelBuilder.getFinalResult(LimeProperty::class.java)
        assertNull(result.setter)
    }
}
