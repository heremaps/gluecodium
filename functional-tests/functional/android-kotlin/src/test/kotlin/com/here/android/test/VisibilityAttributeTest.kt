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
package com.here.android.test

import com.here.android.RobolectricApplication
import org.junit.Assert.assertEquals
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

import java.util.Collections
import java.util.EnumSet

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
    fun internaLambdaCanBeCalled() {
        val someObject = SomeStructWithInternalMembers(21)
        val result = someObject.callSomeLambda { 555 }
        assertEquals(555, result)
    }
}