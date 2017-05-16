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

import org.franca.core.franca.*;

public class DefaultValuesHelper {
  // Used to identify the definition of default values of struct
  private static final String DEFAULT_VALUE_CONSTANT = "DefaultValues";

  public static boolean isStructDefaultValueConstant(FQualifiedElementRef qer) {
    return qer.getElement() instanceof FConstantDef
        && isStructDefaultValueConstant((FConstantDef) qer.getElement());
  }

  public static boolean isStructDefaultValueConstant(FConstantDef cd) {
    return cd.getType().getDerived() instanceof FStructType
        && DEFAULT_VALUE_CONSTANT.equals(cd.getName());
  }

  public static boolean isEnumerator(FQualifiedElementRef qer) {
    return qer.getElement() instanceof FEnumerator;
  }
}
