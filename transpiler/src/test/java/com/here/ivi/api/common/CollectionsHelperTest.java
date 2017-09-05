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

package com.here.ivi.api.common;

import static org.junit.Assert.assertEquals;

import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public class CollectionsHelperTest {

  @SuppressWarnings("UnnecessaryBoxing")
  private static final Collection<Number> NUMBER_LIST =
      Arrays.asList(
          Float.valueOf(1),
          Integer.valueOf(2),
          Double.valueOf(3),
          Integer.valueOf(4),
          Double.valueOf(5));

  public static final int DEFAULT_VALUE = 123;

  @Test
  public void getAllOfTypeNone() {
    List<Byte> result = CollectionsHelper.getAllOfType(NUMBER_LIST, Byte.class);

    assertEquals(0, result.size());
  }

  @Test
  public void getAllOfTypeSome() {
    List<Integer> result = CollectionsHelper.getAllOfType(NUMBER_LIST, Integer.class);

    assertEquals(2, result.size());
  }

  @Test
  public void getFirstOfTypeNone() {
    Byte result = CollectionsHelper.getFirstOfType(NUMBER_LIST, Byte.class);

    assertEquals(null, result);
  }

  @Test
  public void getFirstOfTypeNoneWithDefault() {
    Byte result = CollectionsHelper.getFirstOfType(NUMBER_LIST, Byte.class, (byte) DEFAULT_VALUE);

    assertEquals(DEFAULT_VALUE, result.byteValue());
  }

  @Test
  public void getFirstOfTypeSome() {
    Integer result = CollectionsHelper.getFirstOfType(NUMBER_LIST, Integer.class);

    assertEquals(2, result.intValue());
  }
}
