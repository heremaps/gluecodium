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

package com.here.gluecodium.generator.common.modelbuilder

import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeConstant
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeEnumerator
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeLazyTypeRef
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimePath.Companion.EMPTY_PATH
import com.here.gluecodium.model.lime.LimeProperty
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeThrownType
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeValue
import io.mockk.MockKAnnotations
import io.mockk.impl.annotations.MockK
import io.mockk.verify
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class LimeTreeWalkerTest {
    private val limeErrorTypeRef = LimeLazyTypeRef("bar", emptyMap())
    private val limeParameterTypeRef = LimeLazyTypeRef("baz", emptyMap())
    private val limeFieldTypeRef = LimeLazyTypeRef("foobar", emptyMap())
    private val limeTypeDefTypeRef = LimeLazyTypeRef("barbaz", emptyMap())
    private val limeConstantTypeRef = LimeLazyTypeRef("bazfoo", emptyMap())
    private val limePropertyTypeRef = LimeLazyTypeRef("foobarbaz", emptyMap())
    private val limeValueTypeRef = LimeLazyTypeRef("nonsense", emptyMap())
    private val limeProperty =
        LimeProperty(EMPTY_PATH, typeRef = limePropertyTypeRef, getter = LimeFunction(EMPTY_PATH))
    private val limeConstantValue = LimeValue.Literal(LimeLazyTypeRef("", emptyMap()), "baz")
    private val limeConstant = LimeConstant(
        path = EMPTY_PATH,
        typeRef = limeConstantTypeRef,
        value = limeConstantValue
    )
    private val limeTypeDef = LimeTypeAlias(EMPTY_PATH, typeRef = limeTypeDefTypeRef)
    private val limeEnumeratorValue = LimeValue.Literal(LimeLazyTypeRef("", emptyMap()), "bar")
    private val limeEnumerator = LimeEnumerator(EMPTY_PATH, explicitValue = limeEnumeratorValue)
    private val limeEnumeration = LimeEnumeration(EMPTY_PATH, enumerators = listOf(limeEnumerator))
    private val limeFieldValue = LimeValue.Literal(limeValueTypeRef, "foo")
    private val limeField = LimeField(
        path = EMPTY_PATH,
        typeRef = limeFieldTypeRef,
        defaultValue = limeFieldValue
    )
    private val limeStruct = LimeStruct(EMPTY_PATH, fields = listOf(limeField))
    private val limeParameter = LimeParameter(EMPTY_PATH, typeRef = limeParameterTypeRef)
    private val limeException = LimeException(EMPTY_PATH, errorType = limeErrorTypeRef)
    private val limeMethod = LimeFunction(
        path = EMPTY_PATH,
        thrownType = LimeThrownType(LimeDirectTypeRef(limeException)),
        parameters = listOf(limeParameter)
    )
    private val limeNestedClass = LimeClass(EMPTY_PATH)
    private val limeNestedInterface = LimeInterface(EMPTY_PATH)
    private val limeLambda = LimeLambda(EMPTY_PATH)
    private val limeContainer = LimeClass(
        path = EMPTY_PATH,
        functions = listOf(limeMethod),
        structs = listOf(limeStruct),
        typeAliases = listOf(limeTypeDef),
        enumerations = listOf(limeEnumeration),
        constants = listOf(limeConstant),
        properties = listOf(limeProperty),
        classes = listOf(limeNestedClass),
        interfaces = listOf(limeNestedInterface),
        lambdas = listOf(limeLambda)
    )

    @MockK private lateinit var modelBuilder: LimeBasedModelBuilder

    private lateinit var treeWalker: LimeTreeWalker

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)

        treeWalker = LimeTreeWalker(listOf(modelBuilder))
    }

    @Test
    fun walkContainer() {
        treeWalker.walkTree(limeContainer)

        verify { modelBuilder.startBuilding(limeContainer) }
        verify { modelBuilder.finishBuilding(limeContainer) }
    }

    @Test
    fun walkMethod() {
        treeWalker.walkTree(limeContainer)

        verify { modelBuilder.startBuilding(limeMethod) }
        verify { modelBuilder.finishBuilding(limeMethod) }
    }

    @Test
    fun walkParameter() {
        treeWalker.walkTree(limeContainer)

        verify { modelBuilder.startBuilding(limeParameter) }
        verify { modelBuilder.finishBuilding(limeParameter) }
    }

    @Test
    fun walkParameterWalksTypeRef() {
        treeWalker.walkTree(limeContainer)

        verify { modelBuilder.startBuilding(limeParameterTypeRef) }
        verify { modelBuilder.finishBuilding(limeParameterTypeRef) }
    }

    @Test
    fun walkStruct() {
        treeWalker.walkTree(limeContainer)

        verify { modelBuilder.startBuilding(limeStruct) }
        verify { modelBuilder.finishBuilding(limeStruct) }
    }

    @Test
    fun walkField() {
        treeWalker.walkTree(limeContainer)

        verify { modelBuilder.startBuilding(limeField) }
        verify { modelBuilder.finishBuilding(limeField) }
    }

    @Test
    fun walkFieldWalksTypeRef() {
        treeWalker.walkTree(limeContainer)

        verify { modelBuilder.startBuilding(limeFieldTypeRef) }
        verify { modelBuilder.finishBuilding(limeFieldTypeRef) }
    }

    @Test
    fun walkValueInField() {
        treeWalker.walkTree(limeContainer)

        verify { modelBuilder.startBuilding(limeFieldValue) }
        verify { modelBuilder.finishBuilding(limeFieldValue) }
    }

    @Test
    fun walkValueWalksTypeRef() {
        treeWalker.walkTree(limeContainer)

        verify { modelBuilder.startBuilding(limeValueTypeRef) }
        verify { modelBuilder.finishBuilding(limeValueTypeRef) }
    }

    @Test
    fun walkTypeDef() {
        treeWalker.walkTree(limeContainer)

        verify { modelBuilder.startBuilding(limeTypeDef) }
        verify { modelBuilder.finishBuilding(limeTypeDef) }
    }

    @Test
    fun walkTypeDefWalksTypeRef() {
        treeWalker.walkTree(limeContainer)

        verify { modelBuilder.startBuilding(limeTypeDefTypeRef) }
        verify { modelBuilder.finishBuilding(limeTypeDefTypeRef) }
    }

    @Test
    fun walkEnumeration() {
        treeWalker.walkTree(limeContainer)

        verify { modelBuilder.startBuilding(limeEnumeration) }
        verify { modelBuilder.finishBuilding(limeEnumeration) }
    }

    @Test
    fun walkEnumerator() {
        treeWalker.walkTree(limeContainer)

        verify { modelBuilder.startBuilding(limeEnumerator) }
        verify { modelBuilder.finishBuilding(limeEnumerator) }
    }

    @Test
    fun walkValueInEnumerator() {
        treeWalker.walkTree(limeContainer)

        verify { modelBuilder.startBuilding(limeEnumeratorValue) }
        verify { modelBuilder.finishBuilding(limeEnumeratorValue) }
    }

    @Test
    fun walkConstant() {
        treeWalker.walkTree(limeContainer)

        verify { modelBuilder.startBuilding(limeConstant) }
        verify { modelBuilder.finishBuilding(limeConstant) }
    }

    @Test
    fun walkConstantWalksTypeRef() {
        treeWalker.walkTree(limeContainer)

        verify { modelBuilder.startBuilding(limeConstantTypeRef) }
        verify { modelBuilder.finishBuilding(limeConstantTypeRef) }
    }

    @Test
    fun walkValueInConstant() {
        treeWalker.walkTree(limeContainer)

        verify { modelBuilder.startBuilding(limeConstantValue) }
        verify { modelBuilder.finishBuilding(limeConstantValue) }
    }

    @Test
    fun walkProperty() {
        treeWalker.walkTree(limeContainer)

        verify { modelBuilder.startBuilding(limeProperty) }
        verify { modelBuilder.finishBuilding(limeProperty) }
    }

    @Test
    fun walkPropertyWalksTypeRef() {
        treeWalker.walkTree(limeContainer)

        verify { modelBuilder.startBuilding(limePropertyTypeRef) }
        verify { modelBuilder.finishBuilding(limePropertyTypeRef) }
    }

    @Test
    fun walkNestedClass() {
        treeWalker.walkTree(limeContainer)

        verify { modelBuilder.startBuilding(limeNestedClass) }
        verify { modelBuilder.finishBuilding(limeNestedClass) }
    }

    @Test
    fun walkNestedInterface() {
        treeWalker.walkTree(limeContainer)

        verify { modelBuilder.startBuilding(limeNestedInterface) }
        verify { modelBuilder.finishBuilding(limeNestedInterface) }
    }

    @Test
    fun walkLambda() {
        treeWalker.walkTree(limeContainer)

        verify { modelBuilder.startBuilding(limeLambda) }
        verify { modelBuilder.finishBuilding(limeLambda) }
    }
}
