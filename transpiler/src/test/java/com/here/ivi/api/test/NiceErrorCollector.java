/*
 * Copyright (C) 2017 HERE Global B.V. and its affiliate(s). All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 */

package com.here.ivi.api.test;

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
