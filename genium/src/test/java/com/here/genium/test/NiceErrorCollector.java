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

package com.here.genium.test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import java.util.concurrent.Callable;
import org.junit.rules.ErrorCollector;

/**
 * Custom error collector that calls specific assert*() methods instead of just generic assertThat()
 */
public class NiceErrorCollector extends ErrorCollector {

  /**
   * Adds a failure with the given {@code message} to the table if {@code actualValue} is null.
   * Execution continues, but the test will fail at the end if the match fails.
   */
  public <T> void checkNull(final String message, final T value) {
    checkSucceeds(
        (Callable<Object>)
            () -> {
              assertNull(message, value);
              return value;
            });
  }

  /**
   * Adds a failure with the given {@code message} to the table if {@code actualValue} is not null.
   * Execution continues, but the test will fail at the end if the match fails.
   */
  public <T> void checkNotNull(final String message, final T value) {
    checkSucceeds(
        (Callable<Object>)
            () -> {
              assertNotNull(message, value);
              return value;
            });
  }

  /**
   * Adds a failure with the given {@code message} to the table if {@code expectedValue} does not
   * match {@code actualValue}. Execution continues, but the test will fail at the end if the match
   * fails.
   *
   * @implNote Calling assertEquals() makes sure the stored AssertionError is actually a
   *     ComparisonFailure object. This allows IntelliJ to format the message nicely with a link to
   *     a diff of the values.
   */
  public <T> void checkEquals(final String message, final T expectedValue, final T actualValue) {
    checkSucceeds(
        (Callable<Object>)
            () -> {
              assertEquals(message, expectedValue, actualValue);
              return actualValue;
            });
  }
}
