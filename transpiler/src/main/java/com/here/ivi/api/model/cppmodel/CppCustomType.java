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

import com.here.ivi.api.model.common.Includes;
import com.here.ivi.api.model.franca.DefinedBy;
import java.util.Collection;

public class CppCustomType extends CppType {

  public static final String STRING_TYPE_NAME = "std::string";

  public final CppElements.TypeInfo info;

  public boolean isValid() {
    return info != CppElements.TypeInfo.Invalid;
  }

  public CppCustomType(String typeName, CppElements.TypeInfo info) {
    this(null, typeName, info);
  }

  public CppCustomType(String typeName, Includes.Include... includes) {
    this(null, typeName, CppElements.TypeInfo.Complex, asList(includes));
  }

  public CppCustomType(
      DefinedBy def, String typeName, CppElements.TypeInfo info, Includes.Include... includes) {
    this(def, typeName, info, asList(includes));
  }

  public CppCustomType(
      DefinedBy def,
      String typeName,
      CppElements.TypeInfo info,
      final Collection<Includes.Include> includes) {
    super(def, typeName, includes);
    this.definedIn = def;
    this.info = info;
  }
}
