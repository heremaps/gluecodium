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

import com.here.ivi.api.model.common.Includes;
import com.here.ivi.api.model.franca.DefinedBy;
import java.util.Collection;
import java.util.stream.Stream;

public class CppTypeDefType extends CppType {

  public final CppType actualType;

  public CppTypeDefType(
      final String typeName,
      final CppType actualType,
      final Collection<Includes.Include> includes) {
    super(typeName, includes);
    this.actualType = actualType;
  }

  public CppTypeDefType(
      final DefinedBy def,
      final String typeName,
      final CppType actualType,
      final Collection<Includes.Include> includes) {
    super(def, typeName, includes);
    this.actualType = actualType;
  }

  public CppType getActualType() {
    return actualType instanceof CppTypeDefType
        ? ((CppTypeDefType) actualType).getActualType()
        : actualType;
  }

  @Override
  public boolean isValid() {
    return actualType.isValid();
  }

  @Override
  public Stream<CppElement> stream() {
    return Stream.concat(this.stream(), Stream.of(actualType));
  }
}
