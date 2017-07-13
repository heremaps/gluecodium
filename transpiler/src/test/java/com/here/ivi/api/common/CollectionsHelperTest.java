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
      Arrays.asList(new Float(1), new Integer(2), new Double(3), new Integer(4), new Double(5));

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
    Byte result = CollectionsHelper.getFirstOfType(NUMBER_LIST, Byte.class, (byte) 123);

    assertEquals(123, result.byteValue());
  }

  @Test
  public void getFirstOfTypeSome() {
    Integer result = CollectionsHelper.getFirstOfType(NUMBER_LIST, Integer.class);

    assertEquals(2, result.intValue());
  }
}
