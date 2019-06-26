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

import com.here.genium.test.ArrayEList
import io.mockk.MockKAnnotations
import io.mockk.every
import io.mockk.impl.annotations.MockK
import io.mockk.mockk
import io.mockk.verify
import org.franca.core.franca.FArgument
import org.franca.core.franca.FArrayType
import org.franca.core.franca.FAttribute
import org.franca.core.franca.FConstantDef
import org.franca.core.franca.FEnumerationType
import org.franca.core.franca.FEnumerator
import org.franca.core.franca.FExpression
import org.franca.core.franca.FField
import org.franca.core.franca.FInitializerExpression
import org.franca.core.franca.FInterface
import org.franca.core.franca.FMapType
import org.franca.core.franca.FMethod
import org.franca.core.franca.FStructType
import org.franca.core.franca.FType
import org.franca.core.franca.FTypeCollection
import org.franca.core.franca.FTypeDef
import org.franca.core.franca.FTypeRef
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class FrancaTreeWalkerTest {

    @MockK private lateinit var modelBuilder: ModelBuilder
    @MockK private lateinit var companionHelper: FrancaCompanionHelper

    @MockK private lateinit var francaTypeCollection: FTypeCollection
    @MockK private lateinit var francaInterface: FInterface
    @MockK private lateinit var francaMethod: FMethod
    @MockK private lateinit var francaArgument: FArgument
    @MockK private lateinit var anotherFrancaArgument: FArgument
    @MockK private lateinit var francaTypeRef: FTypeRef
    @MockK private lateinit var francaConstant: FConstantDef
    @MockK private lateinit var anotherFrancaConstant: FConstantDef
    @MockK private lateinit var francaAttribute: FAttribute
    @MockK private lateinit var francaField: FField
    @MockK private lateinit var francaStructType: FStructType
    @MockK private lateinit var francaArrayType: FArrayType
    @MockK private lateinit var francaEnumerationType: FEnumerationType
    @MockK private lateinit var francaMapType: FMapType
    @MockK private lateinit var francaTypeDef: FTypeDef
    @MockK private lateinit var francaEnumerator: FEnumerator
    @MockK private lateinit var francaExpression: FExpression
    @MockK private lateinit var francaInitializerExpression: FInitializerExpression

    private val methods = ArrayEList<FMethod>()
    private val arguments = ArrayEList<FArgument>()
    private val constants = ArrayEList<FConstantDef>()
    private val attributes = ArrayEList<FAttribute>()
    private val types = ArrayEList<FType>()
    private val fields = ArrayEList<FField>()
    private val enumerators = ArrayEList<FEnumerator>()

    private lateinit var treeWalker: FrancaTreeWalker

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)

        treeWalker = FrancaTreeWalker(listOf(modelBuilder), companionHelper)

        methods.add(francaMethod)
        arguments.add(francaArgument)
        constants.add(francaConstant)
        attributes.add(francaAttribute)
        fields.add(francaField)
        enumerators.add(francaEnumerator)

        types.add(francaStructType)
        types.add(francaArrayType)
        types.add(francaEnumerationType)
        types.add(francaMapType)
        types.add(francaTypeDef)

        every { francaInterface.methods } returns methods
        every { francaInterface.constants } returns constants
        every { francaInterface.attributes } returns attributes
        every { francaInterface.types } returns types
        every { francaInterface.base } returns null

        every { francaMethod.inArgs } returns arguments
        every { francaEnumerationType.enumerators } returns enumerators
    }

    @Test
    fun walkFrancaTypeCollection() {
        treeWalker.walkTree(francaTypeCollection)

        verify { modelBuilder.startBuilding(francaTypeCollection) }
        verify { modelBuilder.finishBuilding(francaTypeCollection) }
    }

    @Test
    fun walkFrancaInterface() {
        treeWalker.walkTree(francaInterface)

        verify { modelBuilder.startBuilding(francaInterface) }
        verify { modelBuilder.finishBuilding(francaInterface) }
    }

    @Test
    fun walkFrancaInterfaceWithParent() {
        val parentInterface = mockk<FInterface>()
        every { parentInterface.base } returns null
        every { parentInterface.methods } returns null
        every { parentInterface.attributes } returns null
        every { parentInterface.constants } returns null
        every { parentInterface.types } returns null
        every { francaInterface.base } returns parentInterface

        treeWalker.walkTree(francaInterface)

        verify { modelBuilder.startBuilding(parentInterface) }
        verify { modelBuilder.finishBuilding(parentInterface) }
    }

    @Test
    fun walkWithOneMethod() {
        treeWalker.walkTree(francaInterface)

        verify { modelBuilder.startBuilding(francaMethod) }
        verify { modelBuilder.finishBuilding(francaMethod) }
    }

    @Test
    fun walkWithTwoMethods() {
        val anotherFrancaMethod = mockk<FMethod>()
        every { anotherFrancaMethod.inArgs } returns null
        every { anotherFrancaMethod.outArgs } returns null
        every { anotherFrancaMethod.errorEnum } returns null
        methods.add(anotherFrancaMethod)

        treeWalker.walkTree(francaInterface)

        verify { modelBuilder.startBuilding(francaMethod) }
        verify { modelBuilder.finishBuilding(francaMethod) }
        verify { modelBuilder.startBuilding(anotherFrancaMethod) }
        verify { modelBuilder.finishBuilding(anotherFrancaMethod) }
    }

    @Test
    fun walkWithOneInArg() {
        treeWalker.walkTree(francaInterface)

        verify { modelBuilder.startBuildingInputArgument(francaArgument) }
        verify { modelBuilder.finishBuildingInputArgument(francaArgument) }
    }

    @Test
    fun walkWithTwoInArgs() {
        arguments.add(anotherFrancaArgument)

        treeWalker.walkTree(francaInterface)

        verify { modelBuilder.startBuildingInputArgument(francaArgument) }
        verify { modelBuilder.finishBuildingInputArgument(francaArgument) }
        verify { modelBuilder.startBuildingInputArgument(anotherFrancaArgument) }
        verify { modelBuilder.finishBuildingInputArgument(anotherFrancaArgument) }
    }

    @Test
    fun walkWithOneOutArg() {
        every { francaMethod.inArgs } returns null
        every { francaMethod.outArgs } returns arguments

        treeWalker.walkTree(francaInterface)

        verify { modelBuilder.startBuildingOutputArgument(francaArgument) }
        verify { modelBuilder.finishBuildingOutputArgument(francaArgument) }
    }

    @Test
    fun walkWithTwoOutArgs() {
        arguments.add(anotherFrancaArgument)
        every { francaMethod.inArgs } returns null
        every { francaMethod.outArgs } returns arguments

        treeWalker.walkTree(francaInterface)

        verify { modelBuilder.startBuildingOutputArgument(francaArgument) }
        verify { modelBuilder.finishBuildingOutputArgument(francaArgument) }
        verify { modelBuilder.startBuildingOutputArgument(anotherFrancaArgument) }
        verify { modelBuilder.finishBuildingOutputArgument(anotherFrancaArgument) }
    }

    @Test
    fun walkWithInAndOutArgs() {
        val outArguments = ArrayEList<FArgument>()
        outArguments.add(anotherFrancaArgument)
        every { francaMethod.outArgs } returns outArguments

        treeWalker.walkTree(francaInterface)

        verify { modelBuilder.startBuildingInputArgument(francaArgument) }
        verify { modelBuilder.finishBuildingInputArgument(francaArgument) }
        verify { modelBuilder.startBuildingOutputArgument(anotherFrancaArgument) }
        verify { modelBuilder.finishBuildingOutputArgument(anotherFrancaArgument) }
    }

    @Test
    fun walkWithErrorEnum() {
        types.remove(francaEnumerationType)
        every { francaMethod.errorEnum } returns francaEnumerationType

        treeWalker.walkTree(francaInterface)

        verify { modelBuilder.startBuilding(francaEnumerationType) }
        verify { modelBuilder.finishBuilding(francaEnumerationType) }
    }

    @Test
    fun walkWithOneConstant() {
        treeWalker.walkTree(francaInterface)

        verify { modelBuilder.startBuilding(francaConstant) }
        verify { modelBuilder.finishBuilding(francaConstant) }
    }

    @Test
    fun walkWithTwoConstants() {
        constants.add(anotherFrancaConstant)

        treeWalker.walkTree(francaInterface)

        verify { modelBuilder.startBuilding(francaConstant) }
        verify { modelBuilder.finishBuilding(francaConstant) }
        verify { modelBuilder.startBuilding(anotherFrancaConstant) }
        verify { modelBuilder.finishBuilding(anotherFrancaConstant) }
    }

    @Test
    fun walkWithOneAttribute() {
        treeWalker.walkTree(francaInterface)

        verify { modelBuilder.startBuilding(francaAttribute) }
        verify { modelBuilder.finishBuilding(francaAttribute) }
    }

    @Test
    fun walkWithTwoAttributes() {
        val anotherFrancaAttribute = mockk<FAttribute>()
        every { anotherFrancaAttribute.type } returns null
        attributes.add(anotherFrancaAttribute)

        treeWalker.walkTree(francaInterface)

        verify { modelBuilder.startBuilding(francaAttribute) }
        verify { modelBuilder.finishBuilding(francaAttribute) }
        verify { modelBuilder.startBuilding(anotherFrancaAttribute) }
        verify { modelBuilder.finishBuilding(anotherFrancaAttribute) }
    }

    @Test
    fun walkWithOneFieldInStruct() {
        every { francaStructType.elements } returns fields

        treeWalker.walkTree(francaInterface)

        verify { modelBuilder.startBuilding(francaField) }
        verify { modelBuilder.finishBuilding(francaField) }
    }

    @Test
    fun walkWithTwoFields() {
        every { francaStructType.elements } returns fields
        val anotherFrancaField = mockk<FField>()
        every { anotherFrancaField.type } returns null
        fields.add(anotherFrancaField)

        treeWalker.walkTree(francaInterface)

        verify { modelBuilder.startBuilding(francaField) }
        verify { modelBuilder.finishBuilding(francaField) }
        verify { modelBuilder.startBuilding(anotherFrancaField) }
        verify { modelBuilder.finishBuilding(anotherFrancaField) }
    }

    @Test
    fun walkWithOneStructType() {
        treeWalker.walkTree(francaInterface)

        verify { modelBuilder.startBuilding(francaStructType) }
        verify { modelBuilder.finishBuilding(francaStructType) }
    }

    @Test
    fun walkWithTwoStructTypes() {
        val anotherFrancaStructType = mockk<FStructType>()
        every { anotherFrancaStructType.elements } returns null
        types.add(anotherFrancaStructType)

        treeWalker.walkTree(francaInterface)

        verify { modelBuilder.startBuilding(francaStructType) }
        verify { modelBuilder.finishBuilding(francaStructType) }
        verify { modelBuilder.startBuilding(anotherFrancaStructType) }
        verify { modelBuilder.finishBuilding(anotherFrancaStructType) }
    }

    @Test
    fun walkWithOneArrayType() {
        treeWalker.walkTree(francaInterface)

        verify { modelBuilder.startBuilding(francaArrayType) }
        verify { modelBuilder.finishBuilding(francaArrayType) }
    }

    @Test
    fun walkWithTwoArrayTypes() {
        val anotherFrancaArrayType = mockk<FArrayType>()
        every { anotherFrancaArrayType.elementType } returns null
        types.add(anotherFrancaArrayType)

        treeWalker.walkTree(francaInterface)

        verify { modelBuilder.startBuilding(francaArrayType) }
        verify { modelBuilder.finishBuilding(francaArrayType) }
        verify { modelBuilder.startBuilding(anotherFrancaArrayType) }
        verify { modelBuilder.finishBuilding(anotherFrancaArrayType) }
    }

    @Test
    fun walkWithOneEnumerationType() {
        treeWalker.walkTree(francaInterface)

        verify { modelBuilder.startBuilding(francaEnumerationType) }
        verify { modelBuilder.finishBuilding(francaEnumerationType) }
    }

    @Test
    fun walkWithTwoEnumerationTypes() {
        val anotherFrancaEnumerationType = mockk<FEnumerationType>()
        every { anotherFrancaEnumerationType.enumerators } returns null
        types.add(anotherFrancaEnumerationType)

        treeWalker.walkTree(francaInterface)

        verify { modelBuilder.startBuilding(francaEnumerationType) }
        verify { modelBuilder.finishBuilding(francaEnumerationType) }
        verify { modelBuilder.startBuilding(anotherFrancaEnumerationType) }
        verify { modelBuilder.finishBuilding(anotherFrancaEnumerationType) }
    }

    @Test
    fun walkWithOneMapType() {
        treeWalker.walkTree(francaInterface)

        verify { modelBuilder.startBuilding(francaMapType) }
        verify { modelBuilder.finishBuilding(francaMapType) }
    }

    @Test
    fun walkWithTwoMapTypes() {
        val anotherFrancaMapType = mockk<FMapType>()
        every { anotherFrancaMapType.keyType } returns null
        every { anotherFrancaMapType.valueType } returns null
        types.add(anotherFrancaMapType)

        treeWalker.walkTree(francaInterface)

        verify { modelBuilder.startBuilding(francaMapType) }
        verify { modelBuilder.finishBuilding(francaMapType) }
        verify { modelBuilder.startBuilding(anotherFrancaMapType) }
        verify { modelBuilder.finishBuilding(anotherFrancaMapType) }
    }

    @Test
    fun walkWithOneTypeDef() {
        treeWalker.walkTree(francaInterface)

        verify { modelBuilder.startBuilding(francaTypeDef) }
        verify { modelBuilder.finishBuilding(francaTypeDef) }
    }

    @Test
    fun walkWithTwoTypeDefs() {
        val anotherFrancaTypeDef = mockk<FTypeDef>()
        every { anotherFrancaTypeDef.actualType } returns null
        types.add(anotherFrancaTypeDef)

        treeWalker.walkTree(francaInterface)

        verify { modelBuilder.startBuilding(francaTypeDef) }
        verify { modelBuilder.finishBuilding(francaTypeDef) }
        verify { modelBuilder.startBuilding(anotherFrancaTypeDef) }
        verify { modelBuilder.finishBuilding(anotherFrancaTypeDef) }
    }

    @Test
    fun walkWithTypeRefInArgument() {
        every { francaArgument.type } returns francaTypeRef

        treeWalker.walkTree(francaInterface)

        verify { modelBuilder.startBuilding(francaTypeRef) }
        verify { modelBuilder.finishBuilding(francaTypeRef) }
    }

    @Test
    fun walkWithTypeRefInField() {
        every { francaStructType.elements } returns fields
        every { francaField.type } returns francaTypeRef

        treeWalker.walkTree(francaInterface)

        verify { modelBuilder.startBuilding(francaTypeRef) }
        verify { modelBuilder.finishBuilding(francaTypeRef) }
    }

    @Test
    fun walkWithTypeRefInAttribute() {
        every { francaAttribute.type } returns francaTypeRef

        treeWalker.walkTree(francaInterface)

        verify { modelBuilder.startBuilding(francaTypeRef) }
        verify { modelBuilder.finishBuilding(francaTypeRef) }
    }

    @Test
    fun walkWithTypeRefInConstant() {
        every { francaConstant.type } returns francaTypeRef

        treeWalker.walkTree(francaInterface)

        verify { modelBuilder.startBuilding(francaTypeRef) }
        verify { modelBuilder.finishBuilding(francaTypeRef) }
    }

    @Test
    fun walkWithTypeRefInTypeDef() {
        every { francaTypeDef.actualType } returns francaTypeRef

        treeWalker.walkTree(francaInterface)

        verify { modelBuilder.startBuilding(francaTypeRef) }
        verify { modelBuilder.finishBuilding(francaTypeRef) }
    }

    @Test
    fun walkWithTypeRefInArrayType() {
        every { francaArrayType.elementType } returns francaTypeRef

        treeWalker.walkTree(francaInterface)

        verify { modelBuilder.startBuilding(francaTypeRef) }
        verify { modelBuilder.finishBuilding(francaTypeRef) }
    }

    @Test
    fun walkWithTypeRefInMapTypeAsKeyType() {
        every { francaMapType.keyType } returns francaTypeRef

        treeWalker.walkTree(francaInterface)

        verify { modelBuilder.startBuilding(francaTypeRef) }
        verify { modelBuilder.finishBuilding(francaTypeRef) }
    }

    @Test
    fun walkWithTypeRefInMapTypeAsValueType() {
        every { francaMapType.valueType } returns francaTypeRef

        treeWalker.walkTree(francaInterface)

        verify { modelBuilder.startBuilding(francaTypeRef) }
        verify { modelBuilder.finishBuilding(francaTypeRef) }
    }

    @Test
    fun walkWithOneEnumerator() {
        treeWalker.walkTree(francaInterface)

        verify { modelBuilder.startBuilding(francaEnumerator) }
        verify { modelBuilder.finishBuilding(francaEnumerator) }
    }

    @Test
    fun walkWithTwoEnumerators() {
        val anotherFrancaEnumerator = mockk<FEnumerator>()
        every { anotherFrancaEnumerator.value } returns null
        enumerators.add(anotherFrancaEnumerator)

        treeWalker.walkTree(francaInterface)

        verify { modelBuilder.startBuilding(francaEnumerator) }
        verify { modelBuilder.finishBuilding(francaEnumerator) }
        verify { modelBuilder.startBuilding(anotherFrancaEnumerator) }
        verify { modelBuilder.finishBuilding(anotherFrancaEnumerator) }
    }

    @Test
    fun walkWithExpressionInEnumerator() {
        every { francaEnumerator.value } returns francaExpression
        treeWalker.walkTree(francaInterface)

        verify { modelBuilder.startBuilding(francaExpression) }
        verify { modelBuilder.finishBuilding(francaExpression) }
    }

    @Test
    fun walkWithExpressionInConstant() {
        every { francaConstant.rhs } returns francaInitializerExpression
        treeWalker.walkTree(francaInterface)

        verify { modelBuilder.startBuilding(francaInitializerExpression) }
        verify { modelBuilder.finishBuilding(francaInitializerExpression) }
    }
}
