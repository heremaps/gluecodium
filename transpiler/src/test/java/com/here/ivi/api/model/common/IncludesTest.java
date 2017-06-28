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

package com.here.ivi.api.model.common;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;

import com.here.ivi.api.model.common.Includes.SystemInclude;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class IncludesTest {
  @Test
  public void systemIncludeEquals() {
    // Arrange, act
    SystemInclude a = new SystemInclude("file1");
    SystemInclude b = new SystemInclude("file1");
    SystemInclude c = new SystemInclude("file2");

    // Assert
    assertEquals(a, b);
    assertNotEquals(a, c);
    assertNotEquals(b, c);
  }
}
