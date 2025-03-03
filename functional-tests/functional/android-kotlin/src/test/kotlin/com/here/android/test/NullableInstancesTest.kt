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
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(application = RobolectricApplication::class)
class NullableInstancesTest {

    class NullableInstanceListenerImpl : NullableInstanceListener {
        override var nullableAttribute: NullablePayload? = null

        override fun nullableBottomUpRoundTrip(input: NullablePayload?): NullablePayload? {
            return input
        }
    }

    @org.junit.Test
    fun topDownNullRoundTrip() {
        val result = NullableStatic.nullableTopDownRoundTrip(null)
        assertNull(result)
    }

    @org.junit.Test
    fun topDownRoundTrip() {
        val result = NullableStatic.nullableTopDownRoundTrip(NullablePayload())
        assertNotNull(result)
    }

    @org.junit.Test
    fun bottomUpNullRoundTrip() {
        val result: Boolean =
            NullableStatic.nullableBottomUpNullRoundTrip(NullableInstanceListenerImpl())
        assertTrue(result)
    }

    @org.junit.Test
    fun bottomUpRoundTrip() {
        val result: Boolean = NullableStatic.nullableBottomUpRoundTrip(NullableInstanceListenerImpl())
        assertTrue(result)
    }

    @org.junit.Test
    fun bottomUpAttributeNullRoundTrip() {
        val result: Boolean =
            NullableStatic.nullableBottomUpAttributeNullRoundTrip(NullableInstanceListenerImpl())
        assertTrue(result)
    }

    @org.junit.Test
    fun bottomUpAttributeRoundTrip() {
        val result: Boolean =
            NullableStatic.nullableBottomUpAttributeRoundTrip(NullableInstanceListenerImpl())
        assertTrue(result)
    }
}