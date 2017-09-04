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

package com.here.ivi.api.model.cmodel;

import static java.util.Collections.emptySet;

import com.here.ivi.api.model.common.Include;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

/** Collection of related methods and structs forming an interface (like a C header file) */
public class CInterface extends CElement {
  public Set<Include> headerIncludes = emptySet();
  public Set<Include> implementationIncludes = emptySet();
  public Set<Include> privateHeaderIncludes = emptySet();
  public List<CStruct> structs = new LinkedList<>();
  public List<CFunction> functions = new LinkedList<>();

  public CInterface() {
    super("");
  }
}
