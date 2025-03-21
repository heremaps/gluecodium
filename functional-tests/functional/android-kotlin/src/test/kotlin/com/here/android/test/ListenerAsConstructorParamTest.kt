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
import org.junit.runner.RunWith
import org.junit.Assert.assertEquals
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

import com.here.android.lorem.ipsum.time.Duration

@RunWith(RobolectricTestRunner::class)
@Config(application = RobolectricApplication::class)
class ListenerAsConstructorParamTest {

    class CelsiusObserver : TemperatureObserver {
        private var updatesCounter: Int = 0
        private var lastCelsiusTemperature: Double = 0.0

        fun getUpdatesCount(): Int = updatesCounter
        fun getLastCelsiusTemperature(): Double = lastCelsiusTemperature

        override fun onTemperatureUpdate(thermometer: Thermometer) {
            lastCelsiusTemperature = thermometer.getCelsius()
            ++updatesCounter
        }
    }

    @org.junit.Test
    fun celsiusObserverIsUpdatedFromConstructorWhenAfterConstructedAttributeUsed() {
        // Given temperature observer, which receives updates about temperature.
        val observer: CelsiusObserver = CelsiusObserver()
        val observers: MutableList<TemperatureObserver> = mutableListOf(observer)

        // When creating observed subject.
        val thermometer: Thermometer = Thermometer(Duration.ofSeconds(1), observers)

        // Then subject informed about its state during creation.
        val delta: Double = 0.00000001
        assertEquals(observer.getUpdatesCount(), 1)
        assertEquals(observer.getLastCelsiusTemperature(), thermometer.getCelsius(), delta)

        // When creating another observed subject.
        val anotherThermometer: Thermometer = Thermometer(observers)

        // Then subject informed about its state during creation.
        assertEquals(observer.getUpdatesCount(), 2)
        assertEquals(observer.getLastCelsiusTemperature(), anotherThermometer.getCelsius(), delta)
    }
}