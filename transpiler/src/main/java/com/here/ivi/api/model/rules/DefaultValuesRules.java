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

package com.here.ivi.api.model.rules;

import org.franca.core.franca.FConstantDef;
import org.franca.core.franca.FEnumerator;
import org.franca.core.franca.FQualifiedElementRef;
import org.franca.core.franca.FStructType;

/**
 * This class handles the specific rules for adding default values to structs.
 *
 * <p>Each generator need to use these rules to recognize DefaultValue constants. No code should be
 * generated for these constants, and the given values should be used as defaults for the indicated
 * fields.
 *
 * <p>Example definition: <code>
 * package navigation
 *
 * typeCollection MyStruct {
 *     version {
 *         major 1
 *         minor 0
 *     }
 *
 *     // specification of the struct itself
 *     struct DefiningType {
 *         Double valueOne
 *         String valueTwo
 *     }
 *
 *     // specification of the default value
 *     const DefiningType DefaultValues = {
 *         valueOne: 4,
 *         valueTwo: "seventeen"
 *     }
 * }
 * </code>
 */
public class DefaultValuesRules {
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

  public static boolean isConstant(FQualifiedElementRef qer) {
    return qer.getElement() instanceof FConstantDef;
  }
}
