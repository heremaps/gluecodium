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

internal class TestForecastListener : ForecastListener {
    var forecast: String = ""

    override fun onForecastDataProvided(data: MutableMap<String, ForecastData>) {
        val cities: MutableList<String> = mutableListOf<String>("Berlin", "Madrid", "Marrakesh")
        forecast = cities.map {
            if (data.containsKey(it)) {
                val f: ForecastData = data[it]!!
                "$it -> [${f.lowestDegree}, ${f.highestDegree}]\n"
            } else {
                ""
            }
        }.joinToString(separator = "")
    }
}

@RunWith(RobolectricTestRunner::class)
@Config(application = RobolectricApplication::class)
class ListenerWithMapsTest {

    @org.junit.Test
    fun checkNativeListener() {
        val listener: ForecastListener = ForecastFactory.createListener()
        PROVIDER.inform(listener)
        assertEquals(ListenerWithMapsTest.EXPECTED_FORECAST, ForecastFactory.getLog())
    }

    @org.junit.Test
    fun checkKotlinListener() {
        val listener: TestForecastListener = TestForecastListener()
        PROVIDER.inform(listener)
        assertEquals(ListenerWithMapsTest.EXPECTED_FORECAST, listener.forecast)
    }

    companion object {
        val EXPECTED_FORECAST = "Berlin -> [-2, 26]\n" + "Madrid -> [1, 33]\n" + "Marrakesh -> [8, 40]\n"
        val PROVIDER: ForecastProvider = ForecastFactory.createProvider()
    }
}