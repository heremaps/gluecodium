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
import org.junit.Assert.assertTrue

import com.here.android.RobolectricApplication
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(application = RobolectricApplication::class)
class StaticBooleanMethodsTest {
    @org.junit.Test
    fun returnInvertedBoolean_True() {
        assertFalse(StaticBooleanMethods.returnInvertedBoolean(true))
    }

    @org.junit.Test
    fun returnInvertedBoolean_booleanAndReturnsFalse() {
        assertFalse(StaticBooleanMethods.returnAndBoolean(true, false))
    }

    @org.junit.Test
    fun returnInvertedBoolean_booleanAndReturnsTrue() {
        assertTrue(StaticBooleanMethods.returnAndBoolean(true, true))
    }
}