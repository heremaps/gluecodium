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

import static junit.framework.TestCase.assertNotNull;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class JavaEnumItemTest {
  private static final String TEST_ENUM_ITEM_NAME = "TestEnumItem";
  private static final String TEST_ENUM_ITEM_VALUE = "SomeValue";

  @Test
  public void newJavaEnumItemWithoutNameAndValueIsInvalid() {
    // Arrange, act
    JavaEnumItem javaEnumItem = new JavaEnumItem(null, null);

    // Assert
    assertNull(javaEnumItem.name);
    assertNull(javaEnumItem.value);
    assertFalse(javaEnumItem.isValid());
  }

  @Test
  public void newJavaEnumItemWithoutValueIsInvalid() {
    // Arrange, act
    JavaEnumItem javaEnumItem = new JavaEnumItem(TEST_ENUM_ITEM_NAME, null);

    // Assert
    assertEquals(TEST_ENUM_ITEM_NAME, javaEnumItem.name);
    assertNull(javaEnumItem.value);
    assertFalse(javaEnumItem.isValid());
  }

  @Test
  public void newJavaEnumItemWithNameAndValidValueIsValid() {
    // Arrange, act
    JavaEnumItem javaEnumItem =
        new JavaEnumItem(TEST_ENUM_ITEM_NAME, new JavaValue(TEST_ENUM_ITEM_VALUE));

    // Assert
    assertEquals(TEST_ENUM_ITEM_NAME, javaEnumItem.name);
    assertNotNull(javaEnumItem.value);
    assertEquals(TEST_ENUM_ITEM_VALUE, javaEnumItem.value.name);
    assertTrue(javaEnumItem.isValid());
  }
}
