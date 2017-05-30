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

package com.here.ivi.api.model.cppmodel;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNotSame;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import com.here.ivi.api.model.Includes.Include;
import com.here.ivi.api.model.Includes.SystemInclude;
import java.util.HashSet;
import java.util.Set;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class CppElementWithIncludesTest {
  private static final Set<Include> TEST_INCLUDES = new HashSet<>();
  private static final String TEST_NAME = "my_name";

  static {
    TEST_INCLUDES.add(new SystemInclude("file1"));
    TEST_INCLUDES.add(new SystemInclude("file2"));
  }

  @Test
  public void newCppElementWithIncludesWithoutIncludesHasEmptyIncludes() {
    // Arrange, act
    CppElementWithIncludes cppElementWithIncludes = new CppElementWithIncludes(null);

    // Assert
    assertNull(cppElementWithIncludes.name);
    assertNotNull(cppElementWithIncludes.includes);
    assertTrue(cppElementWithIncludes.includes.isEmpty());
  }

  @Test
  public void newCppElementWithIncludesStoresProvidedIncludes() {
    // Arrange, act
    CppElementWithIncludes cppElementWithIncludes = new CppElementWithIncludes(null, TEST_INCLUDES);

    // Assert
    assertNull(cppElementWithIncludes.name);
    assertEquals(TEST_INCLUDES, cppElementWithIncludes.includes);
    assertNotSame(TEST_INCLUDES, cppElementWithIncludes.includes);
  }

  @Test
  public void newCppElementWithIncludesStoresName() {
    // Arrange, act
    CppElementWithIncludes cppElementWithIncludes =
        new CppElementWithIncludes(TEST_NAME, TEST_INCLUDES);

    // Assert
    assertNotNull(cppElementWithIncludes.name);
    assertEquals(TEST_NAME, cppElementWithIncludes.name);
    assertEquals(TEST_INCLUDES, cppElementWithIncludes.includes);
    assertNotSame(TEST_INCLUDES, cppElementWithIncludes.includes);
  }
}
