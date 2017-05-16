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

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

public class CppNamespace extends CppElement {
  public List<CppElement> members = new ArrayList<>();

  public CppNamespace() {
    super("");
  }

  public CppNamespace(String name) {
    super(name);
  }

  public boolean isEmpty() {
    return members.isEmpty();
  }

  @Override
  public Stream<CppElement> stream() {
    return members.stream();
  }
}
