/*
 * Copyright (C) 2016-2025 HERE Europe B.V.
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
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

class ImplementationOfSomeInternalInterface: SomeInternalInterface {
    override fun foo(): Int = 709
    override fun bar(): Long = 121
}

@RunWith(RobolectricTestRunner::class)
@Config(application = RobolectricApplication::class)
class VisibilityAttributeTest {

    @org.junit.Test
    fun internalFunctionCanBeCalled() {
        val someObject = SomeClassWithInternalMembers.create()
        assertEquals(567, someObject.someInternalFunction())
    }

    @org.junit.Test
    fun internalConstructorOfClassCanBeCalled() {
        val someObject = SomeClassWithInternalMembers()
        assertEquals(567, someObject.someInternalFunction())
    }

    @org.junit.Test
    fun staticInternalFunctionCanBeCalled() {
        assertEquals(123, SomeClassWithInternalMembers.someStaticInternalFunction())
    }

    @org.junit.Test
    fun internalPropertyCanBeAccessed() {
        val someObject = SomeClassWithInternalMembers.create()
        assertEquals("DEFAULT", someObject.someInternalProperty)

        someObject.someInternalProperty = "CUSTOM"
        assertEquals("CUSTOM", someObject.someInternalProperty)
    }

    @org.junit.Test
    fun internalCachedPropertyCanBeAccessed() {
        val someObject = CachedProperties()
        assertEquals(someObject.internalCachedProperty, listOf("foo", "bar"))
    }

    @org.junit.Test
    fun functionOfInternalClassCanBeCalled() {
        val someObject = SomeInternalClassWithMembers.create()
        assertEquals(987, someObject.someFunction())
    }

    @org.junit.Test
    fun staticFunctionOfInternalClassCanBeCalled() {
        assertEquals(765, SomeInternalClassWithMembers.someStaticFunction())
    }

    @org.junit.Test
    fun functionOfInternalStructCanBeCalled() {
        val someObject = SomeInternalStructWithMembers.create()
        assertEquals(32, someObject.someFunction())
    }

    @org.junit.Test
    fun fieldsOfInternalStructCanBeAccessed() {
        val someObject = SomeInternalStructWithMembers.create()
        assertEquals(123, someObject.someInteger)
        assertEquals(456, someObject.someLong)
    }

    @org.junit.Test
    fun internalFieldOfStructCanBeAccessed() {
        val someObject = SomeStructWithInternalMembers(21)
        assertEquals(21, someObject.someInteger)
        assertEquals(444, someObject.someLong)
        assertEquals("ABCDEF", someObject.someInternalString)
    }

    @org.junit.Test
    fun internaFunctionOfStructCanBeCalled() {
        val someObject = SomeStructWithInternalMembers(21)
        assertEquals(888, someObject.someInternalFunction())
        assertEquals(999, someObject.someInternalFunctionButOnlyForAndroid())
    }

    @org.junit.Test
    fun internalFreeArgsCtorCanBeCalled() {
        val someObject = SomeStructWithInternalFreeArgsCtor(33)
        assertEquals(33, someObject.someInt)
        assertEquals("Special string", someObject.someString)
    }

    @org.junit.Test
    fun internalAllArgsCtorCanBeCalled() {
        val someObject = SomeStructWithInternalAllArgsCtor(11, "QWERTY")
        assertEquals(11, someObject.someInt)
        assertEquals("QWERTY", someObject.someString)
    }

    @org.junit.Test
    fun internalFieldCtorCanBeCalled() {
        val someObject = SomeStructWithInternalFieldConstructor(77)
        assertEquals(77, someObject.someInt)
        assertEquals("QAZWSX", someObject.someString)
    }

    @org.junit.Test
    fun valueOfInternalEnumCanBeAccessed() {
        val someObject = SomeInternalEnum.TWO
        assertEquals(2, someObject.value)
        assertEquals(SomeInternalEnum.TWO, someObject)
    }

    @org.junit.Test
    fun internalAliasOfEnumCanBeAccessed() {
        val someObject = SomeInternalEnum.SINGLE
        assertEquals(1, someObject.value)
        assertEquals(SomeInternalEnum.ONE, someObject)
    }

    @org.junit.Test
    fun internaLambdaFromKotlinCanBeCalled() {
        val someObject = SomeStructWithInternalMembers(21)
        val result = someObject.callSomeLambda { 555 }
        assertEquals(555, result)
    }

    @org.junit.Test
    fun internaLambdaFromCppCanBeCalled() {
        val someObject = SomeStructWithInternalMembers(21)
        val cppLambda = someObject.getSomeCppLambda()
        assertEquals(909, cppLambda.apply())
    }

    @org.junit.Test
    fun internaInterfaceFromKotlinCanBeUsed() {
        val someInterfaceImpl = ImplementationOfSomeInternalInterface()
        val someObject = SomeStructWithInternalMembers(21)
        val result = someObject.callMethodOfSomeInterface(someInterfaceImpl)
        assertEquals(709, result)
    }

    @org.junit.Test
    fun internaInterfaceFromCppCanBeUsed() {
        val someObject = SomeStructWithInternalMembers(21)
        val cppInterfaceImpl = someObject.getSomeCppImplOfInternalInterface()
        assertEquals(777, cppInterfaceImpl.bar())
    }

    @org.junit.Test
    fun callInternalMethodsOfDerivedInternalClass() {
        val someObject = SomeDerivedInternalClass.create()
        assertEquals(111, someObject.someFunctionFromDerivedClass())
        assertEquals(222, someObject.foo())
        assertEquals(333, someObject.bar())
        assertEquals(444, someObject.someInternalFunction())
    }

    @org.junit.Test
    fun callFunctionsOfNestedInternalClass() {
        val someObject = SomeInternalClassWithMembers.SomeNestedInternalClass.create()
        assertEquals(1, someObject.doSomething())
        assertEquals(2, someObject.doSomethingElse())
    }

    @org.junit.Test
    fun internalExceptionCanBeThrown() {
        val exception = assertThrows(SomethingBadHappenedException::class.java) {
            SomeClassWithInternalMembers.someStaticInternalFunctionThatMayThrow(shouldThrow = true)
        }
        assertEquals(exception.error, SomeInternalEnum.ONE)
    }

    @org.junit.Test
    fun checkInternalConst() {
        assertEquals(11, SomeClassWithInternalMembers.INTERNAL_CONSTANT)
    }

    @org.junit.Test
    fun checkInternalStaticProperty() {
        assertEquals("foo", InternalAttributeClassWithStaticProperty.getFooBar())
    }

    @org.junit.Test
    fun checkInternalStaticPropertyFromInterface() {
        assertEquals("FOO_BAR", InternalAttributeInterfaceParent.getSomeInternalProperty())

        InternalAttributeInterfaceParent.setSomeInternalProperty("abc")
        assertEquals("abc", InternalAttributeInterfaceParent.getSomeInternalProperty())
    }
}
