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

import java.util.Collections;
import java.util.List;
import lombok.Singular;

public class JavaCustomType extends JavaComplexType {

  public final boolean isInterface;

  public JavaCustomType(final String name) {
    this(name, null, null, null, false);
  }

  public JavaCustomType(final String fullName, final JavaPackage javaPackage) {
    this(fullName, null, javaPackage.packageNames, new JavaImport(fullName, javaPackage), false);
  }

  @lombok.Builder(builderClassName = "Builder")
  protected JavaCustomType(
      final String fullName,
      @Singular final List<String> classNames,
      final List<String> packageNames,
      final JavaImport anImport,
      final boolean isInterface) {
    super(
        fullName,
        classNames != null ? classNames : Collections.singletonList(fullName),
        packageNames,
        anImport != null ? Collections.singletonList(anImport) : null);
    this.isInterface = isInterface;
  }

  public static Builder builder(final String fullName) {
    return new Builder().fullName(fullName);
  }
}
