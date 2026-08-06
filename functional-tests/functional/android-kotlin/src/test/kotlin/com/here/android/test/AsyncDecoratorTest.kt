/*
 * Copyright (C) 2016-2026 HERE Europe B.V.
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
import kotlinx.coroutines.flow.take
import kotlinx.coroutines.flow.toList
import kotlinx.coroutines.runBlocking
import kotlinx.coroutines.withTimeout
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(application = RobolectricApplication::class)
class AsyncDecoratorTest {

    @org.junit.Test
    fun suspendExtension_returnsValue() = runBlocking {
        val factory = AsyncDecoratorFactory()

        val value = factory.fetchValue(false)

        assertEquals("async-value", value)
    }

    @org.junit.Test
    fun suspendExtension_throwsOnError() {
        val factory = AsyncDecoratorFactory()

        val exception = assertThrows(FetchValueException::class.java) {
            runBlocking {
                factory.fetchValue(true)
            }
        }

        assertEquals(AsyncDecoratorErrorCode.FAILED, exception.error)
    }

    @org.junit.Test
    fun flowExtension_emitsValues_and_callsCancellationHook() = runBlocking {
        val factory = AsyncDecoratorFactory()
        AsyncDecoratorFactory.resetStopCalled()

        val values = withTimeout(5_000) {
            factory.startTicksFlow().take(3).toList()
        }

        assertEquals(listOf(1, 2, 3), values)
        assertTrue(AsyncDecoratorFactory.wasStopCalled())
    }
}
