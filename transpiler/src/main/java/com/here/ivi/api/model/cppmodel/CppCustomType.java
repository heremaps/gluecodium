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

import com.here.ivi.api.model.common.Include;
import java.util.Collection;
import java.util.Collections;

public class CppCustomType extends CppType {

  public static final String STRING_TYPE_NAME = "std::string";

  public final CppElements.TypeInfo info;

  public CppCustomType(String typeName, CppElements.TypeInfo info) {
    this(typeName, info, Collections.emptyList());
  }

  public CppCustomType(String typeName, Include... includes) {
    this(typeName, CppElements.TypeInfo.Complex, asList(includes));
  }

  public CppCustomType(String typeName, CppElements.TypeInfo info, Include... includes) {
    this(typeName, info, asList(includes));
  }

  public CppCustomType(
      String typeName, CppElements.TypeInfo info, final Collection<Include> includes) {
    super(typeName, includes);
    this.info = info;
  }

  @Override
  public boolean isValueType() {
    return info == CppElements.TypeInfo.Enumeration;
  }
}
