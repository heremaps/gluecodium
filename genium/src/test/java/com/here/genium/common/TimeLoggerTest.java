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

package com.here.genium.common;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.powermock.api.mockito.PowerMockito.verifyStatic;
import static org.powermock.api.mockito.PowerMockito.when;

import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;
import org.junit.runner.RunWith;
import org.mockito.InOrder;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest({TimeLogger.class})
public final class TimeLoggerTest {

  @Rule private final ExpectedException exception = ExpectedException.none();

  @Mock private Logger logger;

  private TimeLogger timeLogger;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
    PowerMockito.mockStatic(System.class);
    timeLogger = new TimeLogger(logger, TimeUnit.NANOSECONDS, Level.INFO);
  }

  @Test
  public void startMultipleTimes() {
    //arrange
    exception.expect(IllegalStateException.class);
    timeLogger.start();

    //act
    timeLogger.start();
  }

  @Test
  public void addEntryNoStart() {
    //arrange
    exception.expect(IllegalStateException.class);

    //act
    timeLogger.addLogEntry("someString");
  }

  @Test
  public void addEntryNullString() {
    //arrange
    timeLogger.start();

    //act
    timeLogger.addLogEntry(null);

    //verify
    verifyStatic(times(2));
    System.nanoTime();
  }

  @Test
  public void addEntryEmptyString() {
    //arrange
    timeLogger.start();

    //act
    timeLogger.addLogEntry("");

    //verify
    verifyStatic(times(2));
    System.nanoTime();
  }

  @Test
  public void logNoStartNoEntries() {
    //act
    timeLogger.log();

    verifyStatic(never());
    System.nanoTime();
    verify(logger, never()).log(any(), anyString());
  }

  @Test
  public void logStartNoEntries() {
    //arrange
    timeLogger.start();

    //act
    timeLogger.log();

    verifyStatic();
    System.nanoTime();
    verify(logger, never()).log(any(), anyString());
  }

  @SuppressWarnings("checkstyle:MagicNumber")
  @Test
  public void logOneEntry() {
    //arrange
    when(System.nanoTime()).thenReturn(0L);
    timeLogger.start();
    when(System.nanoTime()).thenReturn(3000L);
    timeLogger.addLogEntry("someString");

    //act
    timeLogger.log();

    //verify
    verifyStatic(times(2));
    System.nanoTime();
    verify(logger).log(eq(Level.INFO), eq("3,000 ns <someString>"));
  }

  @SuppressWarnings("checkstyle:MagicNumber")
  @Test
  public void logMultipleEntries() {
    //arrange
    when(System.nanoTime()).thenReturn(-100L);
    timeLogger.start();
    when(System.nanoTime()).thenReturn(-1L);
    timeLogger.addLogEntry("Bla");
    when(System.nanoTime()).thenReturn(321094L);
    timeLogger.addLogEntry("Blu");
    when(System.nanoTime()).thenReturn(999999L);
    timeLogger.addLogEntry(null);
    when(System.nanoTime()).thenReturn(999999L);
    timeLogger.addLogEntry("");

    //act
    timeLogger.log();

    //verify
    verifyStatic(times(5));
    System.nanoTime();
    InOrder orderVerifier = Mockito.inOrder(logger);
    orderVerifier.verify(logger).log(eq(Level.INFO), eq("99 ns <Bla>"));
    orderVerifier.verify(logger).log(eq(Level.INFO), eq("321,095 ns <Blu>"));
    orderVerifier.verify(logger).log(eq(Level.INFO), eq("678,905 ns <null>"));
    orderVerifier.verify(logger).log(eq(Level.INFO), eq("0 ns <>"));
  }
}
