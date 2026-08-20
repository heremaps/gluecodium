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
import java.util.Collections
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
        val completionOrder = Collections.synchronizedList(mutableListOf<String>())

        // All three coroutines share the single thread owned by runBlocking's dispatcher, and the
        // longest call is started first on purpose. A wrapper that blocked that thread would have to
        // run the slow call to completion before the shorter ones could start, recording "slow"
        // first; only a suspending wrapper lets the shorter calls resume ahead of it.
        val slowJob = async {
            factory.fetchValueSlow().also { completionOrder += "slow" }
        }
        val fastJob = async {
            factory.fetchValue(false).also { completionOrder += "fast" }
        }
        val errorJob = async {
            val caught = try {
                factory.fetchValue(true)
                false
            } catch (e: AsyncDecoratorFactoryFetchValueException) {
                true
            }
            completionOrder += "error"
            caught
        }

        assertEquals("async-value", fastJob.await())
        assertTrue("error coroutine should have caught AsyncDecoratorFactoryFetchValueException", errorJob.await())
        assertEquals("slow-value", slowJob.await())

        // Relative ordering rather than elapsed milliseconds, so scheduler jitter and CI load cannot
        // flip the result: the outcome only depends on the fixture's slow delay being the longest.
        assertEquals(
            "expected the slow call to resume last, got $completionOrder",
            "slow",
            completionOrder.last(),
        )
        assertEquals(
            "expected both short calls to resume before the slow call, got $completionOrder",
            setOf("fast", "error"),
            completionOrder.dropLast(1).toSet(),
        )
    }

    @Test
    fun suspendExtension_doesNotBlockCallerSoCallsRunConcurrently() = runBlocking {
        val factory = AsyncDecoratorFactory()
        val callCount = 8

        // Started first and outlasts every call below, so it can only still be in flight at the
        // assertion if the generated wrapper suspends instead of blocking the shared thread.
        val slowJob = async { factory.fetchValueSlow() }

        val values = (1..callCount).map { async { factory.fetchValue(false) } }.awaitAll()

        assertTrue(
            "expected the slow call to still be suspended after $callCount concurrent calls completed",
            slowJob.isActive,
        )
        assertEquals(List(callCount) { "async-value" }, values)
        assertEquals("slow-value", slowJob.await())
    }

    @Test
    fun cancellingSuspendExtension_cancelsNativeTask() = runBlocking {
        val factory = AsyncDecoratorFactory()
        AsyncDecoratorFactory.resetStopCalled()

        // The slow call is used so the task is still in flight when the cancellation arrives: the
        // handover delay below only has to outlast reaching the native call, not race its callback.
        val job = launch { factory.fetchValueSlow() }
        delay(HANDOVER_DELAY_MS)
        job.cancelAndJoin()

        assertTrue(
            "cancelling the coroutine must call stop() on the native task handle",
            AsyncDecoratorFactory.wasStopCalled(),
        )
    }

    private companion object {
        // Long enough for the launched coroutine to reach the native call and register its task
        // handle, and far below k_slow_completion_delay (300ms) in AsyncDecoratorFactory.cpp.
        const val HANDOVER_DELAY_MS = 50L
    }
}
