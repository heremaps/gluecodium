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

package com.here.genium.generator.common.modelbuilder

import com.here.genium.model.lime.LimeConstant
import com.here.genium.model.lime.LimeContainer
import com.here.genium.model.lime.LimeContainer.ContainerType
import com.here.genium.model.lime.LimeDirectTypeRef
import com.here.genium.model.lime.LimeEnumeration
import com.here.genium.model.lime.LimeEnumerator
import com.here.genium.model.lime.LimeException
import com.here.genium.model.lime.LimeThrownType
import com.here.genium.model.lime.LimeField
import com.here.genium.model.lime.LimeFunction
import com.here.genium.model.lime.LimeParameter
import com.here.genium.model.lime.LimePath.Companion.EMPTY_PATH
import com.here.genium.model.lime.LimeProperty
import com.here.genium.model.lime.LimeStruct
import com.here.genium.model.lime.LimeTypeDef
import com.here.genium.model.lime.LimeLazyTypeRef
import com.here.genium.model.lime.LimeValue
import io.mockk.MockKAnnotations
import io.mockk.impl.annotations.MockK
import io.mockk.verify
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class LimeTreeWalkerTest {
    private val limeParentContainer = LimeContainer(EMPTY_PATH, type = ContainerType.INTERFACE)
    private val limeParentTypeRef = LimeLazyTypeRef("foo", mapOf("foo" to limeParentContainer))
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
    private val limeTypeDef = LimeTypeDef(EMPTY_PATH, typeRef = limeTypeDefTypeRef)
    private val limeEnumeratorValue = LimeValue.Literal(LimeLazyTypeRef("", emptyMap()), "bar")
    private val limeEnumerator = LimeEnumerator(EMPTY_PATH, value = limeEnumeratorValue)
    private val limeEnumeration = LimeEnumeration(EMPTY_PATH, enumerators = listOf(limeEnumerator))
    private val limeFieldValue = LimeValue.Literal(limeValueTypeRef, "foo")
    private val limeField = LimeField(
        path = EMPTY_PATH,
        typeRef = limeFieldTypeRef,
        defaultValue = limeFieldValue
    )
    private val limeStruct = LimeStruct(EMPTY_PATH, fields = listOf(limeField))
    private val limeParameter = LimeParameter(EMPTY_PATH, typeRef = limeParameterTypeRef)
    private val limeException = LimeException(EMPTY_PATH, errorEnum = limeErrorTypeRef)
    private val limeMethod = LimeFunction(
        path = EMPTY_PATH,
        thrownType = LimeThrownType(LimeDirectTypeRef(limeException)),
        parameters = listOf(limeParameter)
    )
    private val limeContainer = LimeContainer(
        path = EMPTY_PATH,
        type = ContainerType.TYPE_COLLECTION,
        parent = limeParentTypeRef,
        methods = listOf(limeMethod),
        structs = listOf(limeStruct),
        typeDefs = listOf(limeTypeDef),
        enumerations = listOf(limeEnumeration),
        constants = listOf(limeConstant),
        properties = listOf(limeProperty)
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
    fun walkContainerWalksParentContainer() {
        treeWalker.walkTree(limeContainer)

        verify { modelBuilder.startBuilding(limeParentContainer) }
        verify { modelBuilder.finishBuilding(limeParentContainer) }
    }

    @Test
    fun walkMethod() {
        treeWalker.walkTree(limeContainer)

        verify { modelBuilder.startBuilding(limeMethod) }
        verify { modelBuilder.finishBuilding(limeMethod) }
    }

    @Test
    fun walkMethodWalksErrorType() {
        treeWalker.walkTree(limeContainer)

        verify { modelBuilder.startBuilding(limeErrorTypeRef) }
        verify { modelBuilder.finishBuilding(limeErrorTypeRef) }
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
}
