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

package com.here.ivi.api.model.javamodel;

import static org.junit.Assert.assertFalse;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class JavaEnumTest {
  @Test
  public void newJavaEnumWithoutValuesIsInvalid() {
    // Arrange, act
    JavaEnum javaEnum = new JavaEnum();

    // Assert
    assertFalse(javaEnum.isValid());
  }

  @Test
  public void newJavaEnumWithInvalidValueIsInvalid() {
    // Arrange
    JavaEnum javaEnum = new JavaEnum();

    // Act
    javaEnum.items.add(new JavaEnumItem());

    // Assert
    assertFalse(javaEnum.isValid());
  }
}
