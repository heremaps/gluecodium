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

import static junit.framework.TestCase.assertTrue;

import java.util.Set;

public class Assert {

  public static <E> void assertContains(Set<E> container, E element) {
    assertTrue(container + " must contain " + element, container.contains(element));
  }
}
