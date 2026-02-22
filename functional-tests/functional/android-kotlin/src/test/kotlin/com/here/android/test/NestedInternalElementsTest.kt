/*
 * Copyright (C) 2016-2026 HERE Europe B.V.
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
@file:OptIn(com.here.android.lorem.ipsum.FunctionalTestsInternalAPI::class)

package com.here.android.test

import com.here.android.RobolectricApplication
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(application = RobolectricApplication::class)
class NestedInternalElementsTest {
    ////////// 1. Tests related to direct members of 'InternalClassWithNestedElements'.
    @Test
    fun constantOfInternalClassCanBeAccessed() {
        assertEquals(2026, InternalClassWithNestedElements.SOME_CONSTANT)
    }

    @Test
    fun functionOfInternalClassCanBeAccessed() {
        val internalClassObj = InternalClassWithNestedElements(20, 26)
        assertEquals(46, internalClassObj.someFunction())
    }

    @Test
    fun staticFunctionOfInternalClassCanBeAccessed() {
        assertEquals("SOME_STATIC_FUNCTION", InternalClassWithNestedElements.someStaticFunction())
    }

    @Test
    fun propertyOfInternalClassCanBeAccessed() {
        val internalClassObj = InternalClassWithNestedElements(20, 26)
        assertEquals(2202, internalClassObj.someProperty)

        internalClassObj.someProperty = 77
        assertEquals(77, internalClassObj.someProperty)
    }

    @Test
    fun staticPropertyOfInternalClassCanBeAccessed() {
        assertEquals(11, InternalClassWithNestedElements.getSomeStaticProperty())

        InternalClassWithNestedElements.setSomeStaticProperty(37)
        assertEquals(37, InternalClassWithNestedElements.getSomeStaticProperty())
    }

    ////////// 2. Tests related to direct members of 'InternalClassWithNestedElements.NestedClassLevelOne'.
    @Test
    fun functionOfClassNestedInInternalClassCanBeAccessed() {
        val obj = InternalClassWithNestedElements.NestedClassLevelOne(2, 3)
        assertEquals(6, obj.someNestedFunction())
    }

    @Test
    fun staticFunctionOfClassNestedInInternalClassCanBeAccessed() {
        assertEquals("LEVEL_1_NESTING", InternalClassWithNestedElements.NestedClassLevelOne.someNestedStaticFunction())
    }

    @Test
    fun propertyOfClassNestedInInternalClassCanBeAccessed() {
        val obj = InternalClassWithNestedElements.NestedClassLevelOne(2, 3)
        assertEquals(333, obj.someNestedProperty)

        obj.someNestedProperty = 11
        assertEquals(11, obj.someNestedProperty)
    }

    @Test
    fun staticPropertyOfClassNestedInInternalClassCanBeAccessed() {
        assertEquals(77, InternalClassWithNestedElements.NestedClassLevelOne.getSomeNestedStaticProperty())

        InternalClassWithNestedElements.NestedClassLevelOne.setSomeNestedStaticProperty(37)
        assertEquals(37, InternalClassWithNestedElements.NestedClassLevelOne.getSomeNestedStaticProperty())
    }

    ////////// 3. Tests related to direct members of 'InternalClassWithNestedElements.NestedClassLevelOne.NestedClassLevelTwo'.
    @Test
    fun functionOfClassNestedInClassNestedInInternalClassCanBeAccessed() {
        val obj = InternalClassWithNestedElements.NestedClassLevelOne.NestedClassLevelTwo(2, 33)
        assertEquals(66, obj.doubleNestedFunction())
    }

    @Test
    fun staticFunctionOfClassNestedInClassNestedInInternalClassCanBeAccessed() {
        assertEquals("LEVEL_2_NESTING", InternalClassWithNestedElements.NestedClassLevelOne.NestedClassLevelTwo.doubleNestedStaticFunction())
    }

    @Test
    fun propertyOfClassNestedInClassNestedInInternalClassCanBeAccessed() {
        val obj = InternalClassWithNestedElements.NestedClassLevelOne.NestedClassLevelTwo(2, 33)
        assertEquals(17, obj.doubleNestedProperty)

        obj.doubleNestedProperty = 13
        assertEquals(13, obj.doubleNestedProperty)
    }

    @Test
    fun staticPropertyOfClassNestedInClassNestedInInternalClassCanBeAccessed() {
        assertEquals(123, InternalClassWithNestedElements.NestedClassLevelOne.NestedClassLevelTwo.getDoubleNestedStaticProperty())

        InternalClassWithNestedElements.NestedClassLevelOne.NestedClassLevelTwo.setDoubleNestedStaticProperty(9)
        assertEquals(9, InternalClassWithNestedElements.NestedClassLevelOne.NestedClassLevelTwo.getDoubleNestedStaticProperty())
    }

    ////////// 4. Tests related to nested enum, nested exception and nested lambda.
    @Test
    fun enumeratorsOfEnumNestedInInternalClassCanBeAccessed() {
        val someObject = InternalClassWithNestedElements.NestedEnum.OPTION_1
        assertEquals(1, someObject.value)

        assertEquals(InternalClassWithNestedElements.NestedEnum.OPTION_1, someObject)
    }

    @Test
    fun exceptionNestedInInternalClassCanBeAccessed() {
        val exception = assertThrows(InternalClassWithNestedElements.NestedException::class.java) {
            InternalClassWithNestedElements.throwNestedException()
        }
        assertEquals(exception.error, InternalClassWithNestedElements.NestedEnum.OPTION_1)
    }

    @Test
    fun lambdaNestedInInternalClassCanBeAccessedWhenObtainedFromCpp() {
        val someLambda = InternalClassWithNestedElements.produceNestedLambda()
        assertEquals("CONTENT_FROM_NESTED_LAMBDA_FROM_CPP: 'Kotlin 2026'", someLambda.apply("Kotlin ", 2026))
    }

    ////////// 5. Tests related to direct members of 'InternalClassWithNestedElements.NestedStruct'.
    @Test
    fun fieldsOfStructNestedInInternalClassCanBeAccessed() {
        val obj = InternalClassWithNestedElements.NestedStruct(10, 2026)
        assertEquals(10, obj.firstField)
        assertEquals("2026", obj.secondField)
    }

    @Test
    fun fieldConstructorOfStructNestedInInternalClassCanBeAccessed() {
        val obj = InternalClassWithNestedElements.NestedStruct(123, "NESTED_STRUCT")
        assertEquals(123, obj.firstField)
        assertEquals("NESTED_STRUCT", obj.secondField)
    }

    @Test
    fun functionOfStructNestedInInternalClassCanBeAccessed() {
        val obj = InternalClassWithNestedElements.NestedStruct(10, 2026)
        assertEquals(20, obj.nestedStructFunction())
    }

    @Test
    fun staticFunctionOfStructNestedInInternalClassCanBeAccessed() {
        assertEquals("NESTED_STRUCT_STATIC_FUN", InternalClassWithNestedElements.NestedStruct.nestedStructStaticFunction())
    }

    ////////// 6. Tests related to direct members of 'InternalClassWithNestedElements.NestedInterface'.
    @Test
    fun staticFunctionOfInterfaceNestedInInternalClassCanBeAccessed() {
        assertEquals("NESTED_ITF_STATIC_FUN", InternalClassWithNestedElements.NestedInterface.nestedInterfaceStaticFunction())
    }

    @Test
    fun staticPropertyOfInterfaceNestedInInternalClassCanBeAccessed() {
        assertEquals(572, InternalClassWithNestedElements.NestedInterface.getNestedInterfaceStaticProperty())

        InternalClassWithNestedElements.NestedInterface.setNestedInterfaceStaticProperty(37)
        assertEquals(37, InternalClassWithNestedElements.NestedInterface.getNestedInterfaceStaticProperty())
    }

    @Test
    fun interfaceNestedInInternalClassCanBeAccessedWhenObtainedFromCpp() {
        val itfImpl = InternalClassWithNestedElements.produceNestedInterfaceImplementation()
        assertEquals(909, itfImpl.nestedInterfaceFunction())
        assertEquals(77, itfImpl.nestedInterfaceProperty)

        itfImpl.nestedInterfaceProperty = 123
        assertEquals(123, itfImpl.nestedInterfaceProperty)
    }
}