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
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(application = RobolectricApplication::class)
class OptimizedListTest {

    @org.junit.Test
    fun optimizedListFromMethod() {
        val result: List<VeryBigStruct> = UseOptimizedList.fetchTheBigOnes()

        assertEquals(2, result.size)
        assertEquals("foo", result[0].field)
        assertEquals("bar", result[1].field)
    }

    @org.junit.Test
    fun optimizedListIteratorFromMethod() {
        val result: Iterator<VeryBigStruct> = UseOptimizedList.fetchTheBigOnes().iterator()

        assertTrue(result.hasNext())
        assertEquals("foo", result.next().field)

        assertTrue(result.hasNext())
        assertEquals("bar", result.next().field)

        assertFalse(result.hasNext())
    }

    @org.junit.Test
    fun optimizedListFromProperty() {
        val result: List<UnreasonablyLazyClass> = UseOptimizedList.getLazyOnes()

        assertEquals(2, result.size)
        assertNotNull(result[0])
        assertNotNull(result[1])
    }

    @org.junit.Test
    fun optimizedListIteratorFromProperty() {
        val lazyOnes = UseOptimizedList.getLazyOnes()
        val result: Iterator<UnreasonablyLazyClass> = lazyOnes.iterator()

        assertTrue(result.hasNext())
        assertNotNull(result.next())

        assertTrue(result.hasNext())
        assertNotNull(result.next())

        assertFalse(result.hasNext())
    }
}