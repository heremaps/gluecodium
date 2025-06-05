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

}