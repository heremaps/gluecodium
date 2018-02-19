/*
 * Copyright (C) 2018 HERE Global B.V. and its affiliate(s). All rights reserved.
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

public final class CMap extends CElement {

  public final CppTypeInfo keyType;
  public final CppTypeInfo valueType;
  public final Include include;

  public CMap(
      final String name,
      final CppTypeInfo keyType,
      final CppTypeInfo valueType,
      final Include include) {
    super(name);
    this.keyType = keyType;
    this.valueType = valueType;
    this.include = include;
  }
}
