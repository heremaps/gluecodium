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

package com.here.ivi.api.model.java;

import java.util.List;

public final class JavaEnumType extends JavaCustomType {

  public JavaEnumType(
      final String fullName,
      final List<String> classNames,
      final List<String> packageNames,
      final JavaImport anImport) {
    super(fullName, classNames, packageNames, anImport, false);
  }
}
