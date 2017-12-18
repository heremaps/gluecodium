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

package com.here.ivi.api.model.cbridge;

import com.here.ivi.api.generator.cbridge.CppTypeInfo;
import com.here.ivi.api.model.common.Include;
import java.util.*;

/** Collection of related methods and structs forming an interface (like a C header file) */
public final class CInterface extends CElement {
  public final Set<Include> headerIncludes = new TreeSet<>();
  public final Set<Include> implementationIncludes = new TreeSet<>();
  public final Set<Include> privateHeaderIncludes = new TreeSet<>();
  public final List<CStruct> structs = new LinkedList<>();
  public final List<CFunction> functions = new LinkedList<>();
  public String functionTableName;
  public final CppTypeInfo selfType;
  public final List<CEnum> enumerators = new LinkedList<>();
  public final List<CArray> arrays = new LinkedList<>();

  public CInterface(final String name) {
    this(name, null);
  }

  public CInterface(final String name, final CppTypeInfo selfType) {
    super(name);
    this.selfType = selfType;
  }

  public boolean hasPrivateHeaderContent() {
    return !structs.isEmpty() || selfType != null;
  }

  public boolean isInterface() {
    // only interfaces have a functionTableName
    return functionTableName != null && !functionTableName.isEmpty() && selfType != null;
  }
}
