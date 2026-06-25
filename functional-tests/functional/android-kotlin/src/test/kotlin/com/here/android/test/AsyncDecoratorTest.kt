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
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.runner.RunWith
import org.junit.After
import org.junit.Before
import org.junit.Test
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

import kotlinx.coroutines.*

data class SuspendingJobResult(val labels: List<String>, val timestamp: Long, val exceptionCaught: Boolean)

@RunWith(RobolectricTestRunner::class)
@Config(application = RobolectricApplication::class)
class AsyncDecoratorTest {
    var testedEngine: CoolEngine? = null

    @Before
    fun setUp() {
        // Create the engine used in tests.
        testedEngine = CoolEngine()
    }

    @After
    fun tearDown() {
        // Ensure that underlying C++ threads join.
        testedEngine?.waitForCompletion()
    }

    @Test
    fun multipleSuspendingFunctionsExecutedConcurrently() {
        val engine = testedEngine!!
        val startTimestamp = System.currentTimeMillis()

        // Test scenario is as follows:
        //  - start 3 coroutines that execute suspending functions via async
        //  - the coroutines inherit dispatcher from 'runBlocking' that is confined to the invoker thread so all three
        //    are executed by the same thread
        //  - the suspending functions wrap the Java-style async functions
        //  - consecutive execution of suspending functions must not block the current thread (only await coroutine)
        //    and execute concurrently
        //
        // Important note:
        //  - please be aware that final expectations calculate elapsed time between the beginning of the test case and
        //    completion of given coroutine
        //  - we assume that concurrent tasks start immediatelly after the start of the test case
        //  - this way we can tell that they were executed concurrently and there was no blocking -- if there was blocking
        //    then elapsed time would be total of given task and the ones before it
        runBlocking {
            // This task should work for a bit longer than 2000 ms.
            val t0 = async {
                // Worker thread on C++ level will sleep for: 1000 ms.
                val coolLabels: List<String> = engine.downloadCoolLabelsAsync("cool-labels.com")

                // Worker thread on C++ level will sleep for: 1000 ms.
                val superLabels: List<String> = engine.downloadCoolLabelsAsync("my-super-labels.com")

                // Return all labels from the task + timestamp.
                SuspendingJobResult(
                    labels = coolLabels + superLabels,
                    timestamp = System.currentTimeMillis(),
                    exceptionCaught = false
                )
            }

            // This task should work for a bit longer than 6000ms.
            val t1 = async {
                // Worker thread on C++ level will sleep for: 1000 ms.
                val coolLabels: List<String> = engine.downloadCoolLabelsAsync("cool-labels.com")

                // Introduce artificial delay of 2000ms.
                delay(2000)

                // Worker thread on C++ level will sleep for: 3000 ms.
                val dummyLabels: List<String> = engine.downloadCoolLabelsAsync("dummy-labels.com")

                // Return all labels from the task + timestamp.
                SuspendingJobResult(
                    labels = coolLabels + dummyLabels,
                    timestamp = System.currentTimeMillis(),
                    exceptionCaught = false
                )
            }

            // This task should finish with exception after a bit longer than 500ms.
            val t2 = async {
                var exceptionCaught: Boolean = false
                var labels = emptyList<String>()

                try {
                    // This url is not handled. It will throw after 500ms.
                    labels = engine.downloadCoolLabelsAsync("this-url-will-throw.com")
                } catch (e: Exception) {
                    exceptionCaught = true
                }

                // Return all labels from the task + timestamp.
                SuspendingJobResult(
                    labels = labels,
                    timestamp = System.currentTimeMillis(),
                    exceptionCaught = exceptionCaught
                )
            }

            // Wait for the first task's result.
            val t0Result = t0.await()
            // Check that expected labels were obtained without exception.
            assertEquals(listOf("COOL_LABEL", "SUPER_LABEL", "ANOTHER_SUPER_LABEL"), t0Result.labels)
            assertFalse(t0Result.exceptionCaught)
            // Check that job took at least 2000ms, and less than 2500ms (margin).
            val t0ElapsedTimeMs = t0Result.timestamp - startTimestamp
            assertTrue("Time of the first job: $t0ElapsedTimeMs >= 2000ms", t0ElapsedTimeMs >= 2000)
            assertTrue("Time of the first job: $t0ElapsedTimeMs < 2500ms", t0ElapsedTimeMs < 2500)

            // Wait for the second task's result.
            val t1Result = t1.await()
            // Check that expected labels were obtained without exception.
            assertEquals(listOf("COOL_LABEL", "DUMMY_LABEL"), t1Result.labels)
            assertFalse(t1Result.exceptionCaught)
            // Check that job took at least 6000ms, and less than 6500ms (margin).
            val t1ElapsedTimeMs = t1Result.timestamp - startTimestamp
            assertTrue("Time of the second job: $t1ElapsedTimeMs >= 6000ms", t1ElapsedTimeMs >= 6000)
            assertTrue("Time of the second job: $t1ElapsedTimeMs < 6500ms", t1ElapsedTimeMs < 6500)

            // Wait for the third task's result.
            val t2Result = t2.await()
            // Check that expected labels were obtained without exception.
            assertTrue(t2Result.labels.isEmpty())
            assertTrue(t2Result.exceptionCaught)
            // Check that job took at least 500ms, and less than 1000ms (margin).
            val t2ElapsedTimeMs = t2Result.timestamp - startTimestamp
            assertTrue("Time of the second job: $t2ElapsedTimeMs >= 500ms", t2ElapsedTimeMs >= 500)
            assertTrue("Time of the second job: $t2ElapsedTimeMs < 1000ms", t2ElapsedTimeMs < 1000)
        }
    }
}