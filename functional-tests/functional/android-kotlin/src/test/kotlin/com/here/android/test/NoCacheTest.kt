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

import org.junit.Assert.assertFalse

import com.here.android.RobolectricApplication
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(application = RobolectricApplication::class)
class NoCacheTest {

    class NoCacheImpl : NoCacheInterface {
        override fun foo() {}
    }

    @org.junit.Test
    fun noCacheInterfaceFromCpp() {
        val instance1: NoCacheInterface = NoCacheHelper.getNoCacheInterface()
        val instance2: NoCacheInterface = NoCacheHelper.getNoCacheInterface()

        val result: Boolean = instance1 === instance2

        assertFalse(result)
    }

    @org.junit.Test
    fun noCacheInterfaceFromKotlin() {
        val instance: NoCacheInterface = NoCacheImpl()

        val result: Boolean = NoCacheHelper.compareNoCacheInterface(instance, instance)

        assertFalse(result)
    }

    @org.junit.Test
    fun noCacheClassFromCpp() {
        val instance1: NoCacheClass = NoCacheHelper.getNoCacheClass()
        val instance2: NoCacheClass = NoCacheHelper.getNoCacheClass()

        val result: Boolean = instance1 === instance2

        assertFalse(result)
    }

}