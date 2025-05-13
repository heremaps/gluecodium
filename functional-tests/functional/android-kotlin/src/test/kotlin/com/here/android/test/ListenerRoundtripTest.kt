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
import org.junit.Assert.assertTrue
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

class RouteImpl : Route {}

class RouteProviderImpl : RouteProvider {
    override fun setRoute(route: Route) {
        // Compile time test. Annotation is used to suppress runtime warning.
        @Suppress("UNUSED_VARIABLE")
        val impl: RouteImpl = route as RouteImpl
    }
}

class SomeSimpleInterfaceImpl : SomeSimpleInterface {
    override val value: String
        get() = "this is a value"
}

@RunWith(RobolectricTestRunner::class)
@Config(application = RobolectricApplication::class)
class ListenerRoundtripTest {

    @org.junit.Test
    fun stringListenerRoundTripDoesNotCrash() {
        Nlp.setRoute(RouteProviderImpl(), RouteImpl())
    }

    @org.junit.Test
    fun childClassRoundTrip() {
        val listener: SomeLifecycleListener = SomeIndicator()
        assertTrue(RealBase.compareListenerToInitial(listener))
    }

    @org.junit.Test
    fun convolutedRoundTrip() {
        val listener: SomeIndicator = SomeIndicator()

        val base: SomeBase = RealBase()
        base.addLifecycleListener(listener)

        assertTrue(listener.isWeakPtrAlive())
    }

    @org.junit.Test
    fun simpleRoundTrip() {
        val instance: SomeSimpleInterface = SomeSimpleInterfaceImpl()
        val result: SomeSimpleInterface = SomeSimpleRoundTrip.roundTrip(instance)

        assertEquals("this is a value", result.value)
    }
}