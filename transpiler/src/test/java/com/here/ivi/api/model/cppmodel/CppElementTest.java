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
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class CppElementTest {
  private static final String TEST_NAME = "name";

  @Test
  public void newCppElement() {
    // Arrange, act
    CppElement cppElement = new CppElement();

    // Assert
    assertNull(cppElement.name);
  }

  @Test
  public void newCppElementWithName() {
    // Arrange, act
    CppElement cppElement = new CppElement(TEST_NAME);

    // Assert
    assertNotNull(cppElement.name);
    assertEquals(TEST_NAME, cppElement.name);
  }

  @Test
  public void equals() {
    // Arrange, act
    CppElement a = new CppElement("elem1");
    CppElement b = new CppElement("elem1");
    CppElement c = new CppElement("elem2");

    // Assert
    assertEquals(a, b);
    assertNotEquals(a, c);
    assertNotEquals(b, c);
  }
}
