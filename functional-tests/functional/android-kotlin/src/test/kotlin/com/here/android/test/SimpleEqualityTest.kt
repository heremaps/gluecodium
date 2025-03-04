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
import org.junit.Assert.assertNotEquals
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(application = RobolectricApplication::class)
class SimpleEqualityTest {

    val class1: NonEquatableClass = NonEquatableFactory.createNonEquatableClass()
    val class2: NonEquatableClass = NonEquatableFactory.createNonEquatableClass()
    val interface1: NonEquatableInterface = NonEquatableFactory.createNonEquatableInterface()
    val interface2: NonEquatableInterface = NonEquatableFactory.createNonEquatableInterface()

    @org.junit.Test
    fun simpleEqualityForStructs() {
        val struct1 = SimpleEquatableStruct(class1, interface1, class2, interface2)
        val struct2 = SimpleEquatableStruct(class1, interface1, class2, interface2)

        assertEquals(struct1, struct2)
        assertEquals(struct1.hashCode(), struct2.hashCode())
    }

    @org.junit.Test
    fun simpleEqualityForStructsWithNulls() {
        val struct1 = SimpleEquatableStruct(class1, interface1, null, null)
        val struct2 = SimpleEquatableStruct(class1, interface1, null, null)

        assertEquals(struct1, struct2)
        assertEquals(struct1.hashCode(), struct2.hashCode())
    }

    @org.junit.Test
    fun simpleInequalityForStructs() {
        val struct1 = SimpleEquatableStruct(class1, interface1, class2, interface2)
        val struct2 = SimpleEquatableStruct(class2, interface2, class1, interface1)

        assertNotEquals(struct1, struct2)
        assertNotEquals(struct1.hashCode(), struct2.hashCode())
    }

    @org.junit.Test
    fun simpleInequalityForStructsWithNulls() {
        val struct1 = SimpleEquatableStruct(class1, interface1, class2, null)
        val struct2 = SimpleEquatableStruct(class1, interface1, null, interface2)

        assertNotEquals(struct1, struct2)
        assertNotEquals(struct1.hashCode(), struct2.hashCode())
    }
}