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
import kotlin.system.measureTimeMillis
import kotlinx.coroutines.async
import kotlinx.coroutines.awaitAll
import kotlinx.coroutines.cancelAndJoin
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch
import kotlinx.coroutines.runBlocking
import kotlinx.coroutines.withTimeout
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(application = RobolectricApplication::class)
class AsyncDecoratorTest {

    @Test
    fun suspendExtension_returnsValue() = runBlocking {
        val factory = AsyncDecoratorFactory()

        val value = factory.fetchValue(false)

        assertEquals("async-value", value)
    }

    @Test
    fun suspendExtension_throwsOnError() {
        val factory = AsyncDecoratorFactory()

        val exception = assertThrows(AsyncDecoratorFactoryFetchValueException::class.java) {
            runBlocking {
                factory.fetchValue(true)
            }
        }

        assertEquals(AsyncDecoratorErrorCode.FAILED, exception.error)
    }

    @Test
    fun suspendExtension_usesGeneratedDefaultParameterValue() = runBlocking {
        val factory = AsyncDecoratorFactory()

        // `options` is omitted, so the generated `= FetchOptions()` default reaches native code.
        val value = factory.fetchWithOptions()

        assertEquals("retries-3", value)
    }

    @Test
    fun suspendExtension_allowsOverridingDefaultParameterValue() = runBlocking {
        val factory = AsyncDecoratorFactory()

        val value = factory.fetchWithOptions(FetchOptions(7))

        assertEquals("retries-7", value)
    }

    @Test
    fun multipleSuspendingFunctionsWithDifferentDurationsExecutedConcurrently() = runBlocking {
        val factory = AsyncDecoratorFactory()
        val startMs = System.currentTimeMillis()

        // All three coroutines share the single thread owned by runBlocking's dispatcher.
        // If any call blocks that thread the remaining coroutines cannot start until it returns.
        //   Concurrent execution: total ≈ max(fast, slow, error) ≈ SLOW_DELAY_MS
        //   Serial   execution: total ≈ fast + slow + error     ≈ SLOW_DELAY_MS + 2 * FAST_DELAY_MS
        // The assertion below passes only under the concurrent schedule.
        val fastJob = async { factory.fetchValue(false) }          // ~50ms, returns "async-value"
        val slowJob = async { factory.fetchValueSlow() }           // ~300ms, returns "slow-value"
        val errorJob = async {
            try {
                factory.fetchValue(true)
                false
            } catch (e: AsyncDecoratorFactoryFetchValueException) {
                true
            }
        }                                                           // ~50ms, throws AsyncDecoratorFactoryFetchValueException

        val fastResult = fastJob.await()
        val fastElapsedMs = System.currentTimeMillis() - startMs

        val slowResult = slowJob.await()
        val slowElapsedMs = System.currentTimeMillis() - startMs

        val errorCaught = errorJob.await()

        assertEquals("async-value", fastResult)
        assertEquals("slow-value", slowResult)
        assertTrue("error coroutine should have caught AsyncDecoratorFactoryFetchValueException", errorCaught)

        // Fast and error tasks complete at ~50ms from start.
        // If they had to wait for slow, this would be > 300ms.
        assertTrue(
            "fast task took ${fastElapsedMs}ms; expected < ${FAST_UPPER_BOUND_MS}ms",
            fastElapsedMs < FAST_UPPER_BOUND_MS,
        )

        // Slow task completes at ~300ms.  If fast had to finish first (serial), it would be > 350ms.
        assertTrue(
            "slow task took ${slowElapsedMs}ms; expected < ${SERIAL_UPPER_BOUND_MS}ms",
            slowElapsedMs < SERIAL_UPPER_BOUND_MS,
        )
    }

    @Test
    fun suspendExtension_doesNotBlockCallerSoCallsRunConcurrently() = runBlocking {
        val factory = AsyncDecoratorFactory()
        val callCount = 8

        // All 8 coroutines share the single thread.  Concurrent: total ≈ 50ms.  Serial: 400ms.
        val elapsedMs = measureTimeMillis {
            val values = (1..callCount).map { async { factory.fetchValue(false) } }.awaitAll()
            assertEquals(List(callCount) { "async-value" }, values)
        }

        assertTrue(
            "expected concurrent execution, but $callCount calls took ${elapsedMs}ms (serial would be ${callCount * NATIVE_COMPLETION_DELAY_MS}ms)",
            elapsedMs < NATIVE_COMPLETION_DELAY_MS * 3,
        )
    }

    @Test
    fun cancellingSuspendExtension_cancelsNativeTask() = runBlocking {
        val factory = AsyncDecoratorFactory()
        AsyncDecoratorFactory.resetStopCalled()

        val job = launch { factory.fetchValue(false) }
        delay(NATIVE_COMPLETION_DELAY_MS / 2)
        job.cancelAndJoin()

        assertTrue(AsyncDecoratorFactory.wasStopCalled())
    }

    private companion object {
        // Must mirror k_completion_delay and k_slow_completion_delay in AsyncDecoratorFactory.cpp.
        const val NATIVE_COMPLETION_DELAY_MS = 50L
        const val SLOW_NATIVE_DELAY_MS = 300L

        // fast + 50% overhead; fails if fast task had to wait for slow to finish first.
        const val FAST_UPPER_BOUND_MS = NATIVE_COMPLETION_DELAY_MS * 3    // 150ms
        // slow + one fast task; fails if slow started after fast completed (serial schedule).
        const val SERIAL_UPPER_BOUND_MS = SLOW_NATIVE_DELAY_MS + NATIVE_COMPLETION_DELAY_MS  // 350ms
    }
}
