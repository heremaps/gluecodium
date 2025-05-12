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
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(application = RobolectricApplication::class)
class MultipleInheritanceTest {

    class MultiInterfaceImpl : MultiInterface {
        override fun childFunction() {}

        override var childProperty: String
            get() = ""
            set(_) {}

        override fun parentFunction() {}

        override var parentProperty: String
            get() = ""
            set(_) {}

        override fun parentFunctionLight(): String {
            return "kotlin face faces"
        }

        override var parentPropertyLight: String
            get() = ""
            set(_) {}
    }

    @org.junit.Test
    fun fromCppSendUpcastSucceeds() {
        val instance: MultiClass? = MultipleInheritanceFactory.getMultiClass()
        assertTrue(instance is NarrowInterface)
    }

    @org.junit.Test
    fun fromCppSendDowncastFails() {
        val instance: NarrowInterface = MultipleInheritanceFactory.getMultiClassAsNarrow()
        assertFalse(instance is MultiClass)
    }

    @org.junit.Test
    fun fromCppSendTwiceEquals() {
        val instance1: NarrowInterface = MultipleInheritanceFactory.getMultiClassSingleton()
        val instance2: NarrowInterface = MultipleInheritanceFactory.getMultiClassSingleton()

        assertTrue(instance1 === instance2)
    }

    @org.junit.Test
    fun fromCppRoundTripNotEquals() {
        val instance: NarrowInterface = MultipleInheritanceFactory.getMultiClassSingleton()
        assertFalse(MultipleInheritanceChecker.checkSingletonEquality(instance))
    }

    @org.junit.Test
    fun fromCppRoundTripWithUpcastNotEquals() {
        val uncastInstance: MultiClass = MultipleInheritanceFactory.getMultiClass()
        val instance: NarrowInterface = uncastInstance

        assertFalse(MultipleInheritanceChecker.checkSingletonEquality(instance))
    }

    @org.junit.Test
    fun fromKotlinSendUpcastSucceeds() {
        val instance: MultiInterface = MultiInterfaceImpl()
        val result: Boolean = MultipleInheritanceChecker.checkIsNarrow(instance)

        assertTrue(result)
    }

    @org.junit.Test
    fun fromKotlinSendDowncastFails() {
        val uncastInstance: MultiInterface = MultiInterfaceImpl()
        val instance: NarrowInterface = uncastInstance

        val result: Boolean = MultipleInheritanceChecker.checkIsMultiInterface(instance)
        assertFalse(result)
    }

    @org.junit.Test
    fun fromKotlinSendTwiceEquals() {
        val instance: NarrowInterface = MultiInterfaceImpl()
        val result: Boolean = MultipleInheritanceChecker.checkNarrowEquality(instance, instance)

        assertTrue(result)
    }

    @org.junit.Test
    fun fromKotlinRoundTripEquals() {
        val uncastInstance: MultiInterface = MultiInterfaceImpl()
        val instance: NarrowInterface = uncastInstance

        assertTrue(uncastInstance === MultipleInheritanceChecker.narrowRoundTrip(instance))
    }

    @org.junit.Test
    fun fromKotlinRoundTripWithUpcastNotEquals() {
        val instance: MultiInterface = MultiInterfaceImpl()

        assertFalse(instance === MultipleInheritanceFactory.upcastMultiInterfaceToNarrow(instance))
    }
}