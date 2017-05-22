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

package com.here.ivi.api.generator.common.java;

import org.franca.core.franca.FType;
import org.franca.core.franca.FTypeCollection;

//TODO Find common parts with CppNameRules and split into multiple interfaces
public interface JavaNameRules {

  /** Returns the cpp typename of given type */
  String getTypename(FType type);

  /** Formats a name as a class */
  String getClassName(FTypeCollection base);

  /** Formats a name as a method */
  String getMethodName(String base);

  /** Formats a name as a argument */
  String getArgumentName(String base);

  /** Formats a name as a constant */
  String getConstantName(String base);

  /** Formats a name as a enum */
  String getEnumName(String base);

  /** Formats a name as a enum entry */
  String getEnumEntryName(String base);

  /** Formats a name as a field */
  String getFieldName(String base);
}
