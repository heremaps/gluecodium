/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
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

package com.here.genium.common

import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.rules.ExpectedException
import org.junit.runner.RunWith
import org.mockito.ArgumentMatchers.any
import org.mockito.ArgumentMatchers.anyString
import org.mockito.ArgumentMatchers.eq
import org.mockito.Mockito
import org.mockito.Mockito.mock
import org.mockito.Mockito.never
import org.mockito.Mockito.times
import org.mockito.Mockito.verify
import org.powermock.api.mockito.PowerMockito
import org.powermock.api.mockito.PowerMockito.`when`
import org.powermock.api.mockito.PowerMockito.verifyStatic
import org.powermock.core.classloader.annotations.PrepareForTest
import org.powermock.modules.junit4.PowerMockRunner
import java.util.concurrent.TimeUnit
import java.util.logging.Level
import java.util.logging.Logger

@RunWith(PowerMockRunner::class)
@PrepareForTest(TimeLogger::class)
class TimeLoggerTest {
    @Rule
    private val exception = ExpectedException.none()
    private val logger = mock(Logger::class.java)
    private lateinit var timeLogger: TimeLogger

    @Before
    fun beforeMocks() {
        PowerMockito.mockStatic(System::class.java)
        timeLogger = TimeLogger(logger, TimeUnit.NANOSECONDS, Level.INFO)
    }

    @Test
    fun startMultipleTimes() {
        // Arrange
        exception.expect(IllegalStateException::class.java)
        timeLogger.start()

        // Act
        timeLogger.start()
    }

    @Test
    fun addEntryNoStart() {
        // Arrange
        exception.expect(IllegalStateException::class.java)

        // Act
        timeLogger.addLogEntry("someString")
    }

    @Test
    fun addEntryEmptyString() {
        // Arrange
        timeLogger.start()

        // Act
        timeLogger.addLogEntry("")

        // Assert
        verifyStatic(times(2))
        System.nanoTime()
    }

    @Test
    fun logNoStartNoEntries() {
        // Act
        timeLogger.log()

        // Assert
        verifyStatic(never())
        System.nanoTime()
        verify(logger, never()).log(any(), anyString())
    }

    @Test
    fun logStartNoEntries() {
        // Arrange
        timeLogger.start()

        // Act
        timeLogger.log()

        // Assert
        verifyStatic()
        System.nanoTime()
        verify(logger, never()).log(any(), anyString())
    }

    @Test
    fun logOneEntry() {
        // Arrange
        `when`(System.nanoTime()).thenReturn(0L)
        timeLogger.start()
        `when`(System.nanoTime()).thenReturn(3000L)
        timeLogger.addLogEntry("someString")

        // Act
        timeLogger.log()

        // Assert
        verifyStatic(times(2))
        System.nanoTime()
        verify(logger).log(eq(Level.INFO), eq("3,000 ns <someString>"))
    }

    @Test
    fun logMultipleEntries() {
        // Arrange
        `when`(System.nanoTime()).thenReturn(-100L)
        timeLogger.start()
        `when`(System.nanoTime()).thenReturn(-1L)
        timeLogger.addLogEntry("Bla")
        `when`(System.nanoTime()).thenReturn(321094L)
        timeLogger.addLogEntry("Blu")
        `when`(System.nanoTime()).thenReturn(999999L)
        timeLogger.addLogEntry("")

        // Act
        timeLogger.log()

        // Assert
        verifyStatic(times(4))
        System.nanoTime()
        Mockito.inOrder(logger).apply {
            verify(logger).log(eq(Level.INFO), eq("99 ns <Bla>"))
            verify(logger).log(eq(Level.INFO), eq("321,095 ns <Blu>"))
            verify(logger).log(eq(Level.INFO), eq("678,905 ns <>"))
        }
    }
}
