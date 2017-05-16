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

package com.here.ivi.api.model;

import java.util.Collection;
import java.util.List;

public class CollectionsHelper {

  public static <T> boolean areEqual(Collection<T> a, Collection<T> b) {
    if (a == null && b == null) {
      return true;
    }
    if (a == null || b == null || a.size() != b.size()) {
      return false;
    }

    return a.containsAll(b); // same length so if a is in b, b is also in a
  }

  public static <T> boolean areEqualOrdered(List<T> a, List<T> b) {
    if (a == null && b == null) {
      return true;
    }
    if (a == null || b == null) {
      return false;
    }

    return a.equals(b);
  }
}
