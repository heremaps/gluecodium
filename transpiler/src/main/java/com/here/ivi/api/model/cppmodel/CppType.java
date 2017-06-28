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

import static java.util.Arrays.asList;

import com.here.ivi.api.model.Includes;
import com.here.ivi.api.model.franca.DefinedBy;
import java.util.*;
import java.util.stream.Stream;

public class CppType extends CppElementWithIncludes {
  public static final CppType NONE = new CppType("");
  public static final CppType VOID = new CppType("void");

  public CppElements.TypeInfo info = CppElements.TypeInfo.Invalid;
  public DefinedBy definedIn;

  public boolean isValid() {
    return info != CppElements.TypeInfo.Invalid;
  }

  public CppType() {
    super("INVALID");
  }

  public CppType(String typeName) {
    this(null, typeName);
  }

  public CppType(String typeName, Includes.Include... includes) {
    this(null, typeName, CppElements.TypeInfo.BuiltIn, asList(includes));
  }

  public CppType(DefinedBy def, String typeName) {
    this(def, typeName, CppElements.TypeInfo.BuiltIn, Collections.emptyList());
  }

  public CppType(
      DefinedBy def, String typeName, CppElements.TypeInfo info, Includes.Include... includes) {
    this(def, typeName, info, asList(includes));
  }

  public CppType(
      DefinedBy def,
      String typeName,
      CppElements.TypeInfo info,
      Collection<Includes.Include> includes) {
    super(typeName, includes);
    this.definedIn = def;
    this.info = info;
  }

  public void setIncludes(Includes.Include... includes) {
    super.includes = new HashSet<>(Arrays.asList(includes));
  }

  @Override
  public Stream<CppElement> stream() {
    return Stream.empty();
  }
}
