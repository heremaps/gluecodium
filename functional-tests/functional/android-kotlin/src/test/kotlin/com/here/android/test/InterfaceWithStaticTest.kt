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

class SomeInterfaceWithStaticImpl : InterfaceWithStatic {
    override var regularProperty: String = "buzz2"
    override fun regularFunction(): String = "buzz1"
}

@RunWith(RobolectricTestRunner::class)
@Config(application = RobolectricApplication::class)
class InterfaceWithStaticTest {

    @org.junit.Test
    fun callStaticFunction() {
        val result: String = InterfaceWithStatic.staticFunction()
        assertEquals("bar1", result)
    }

    @org.junit.Test
    fun callStaticPropertyGetter() {
        val result: String = InterfaceWithStatic.staticProperty
        assertEquals("bar2", result)
    }

    @org.junit.Test
    fun callStaticPropertySetter() {
        InterfaceWithStatic.staticProperty = "wizz1"

        val result: String = InterfaceWithStatic.staticProperty
        UseInterfaceWithStatic.resetStaticValue()

        assertEquals("wizz1", result)
    }

    @org.junit.Test
    fun callStaticFunctionOnProxy() {
        val instance: InterfaceWithStatic = SomeInterfaceWithStaticImpl()
        val result: String = UseInterfaceWithStatic.invokeStaticFunction(instance)

        assertEquals("bar1", result)
    }

    @org.junit.Test
    fun callStaticPropertyGetterOnProxy() {
        val instance: InterfaceWithStatic = SomeInterfaceWithStaticImpl()
        val result: String = UseInterfaceWithStatic.invokeStaticGetter(instance)

        assertEquals("bar2", result)
    }

    @org.junit.Test
    fun callStaticPropertySetterOnProxy() {
        val instance: InterfaceWithStatic = SomeInterfaceWithStaticImpl()
        UseInterfaceWithStatic.invokeStaticSetter(instance, "wizz2")

        val result: String = UseInterfaceWithStatic.invokeStaticGetter()
        UseInterfaceWithStatic.resetStaticValue()

        assertEquals("wizz2", result)
    }
}