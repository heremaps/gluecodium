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

package com.here.ivi.api.model.swift;

import java.util.LinkedList;
import java.util.List;

public final class SwiftFile extends SwiftModelElement {

  public final List<SwiftClass> classes = new LinkedList<>();
  public final List<SwiftContainerType> structs = new LinkedList<>();
  public final List<SwiftEnum> enums = new LinkedList<>();
  public final List<SwiftTypeDef> typeDefs = new LinkedList<>();
  public final List<SwiftArray> arrays = new LinkedList<>();
  public final List<SwiftDictionary> dictionaries = new LinkedList<>();

  public SwiftFile() {
    super("");
  }

  public boolean isEmpty() {
    return classes.isEmpty()
        && structs.isEmpty()
        && enums.isEmpty()
        && arrays.isEmpty()
        && dictionaries.isEmpty();
  }
}
