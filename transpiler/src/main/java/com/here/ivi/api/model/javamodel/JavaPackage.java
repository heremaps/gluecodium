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

package com.here.ivi.api.model.javamodel;

import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

public final class JavaPackage {
  public static final JavaPackage DEFAULT =
      new JavaPackage(Arrays.asList("com", "here", "android"));

  public final List<String> packageNames;

  public JavaPackage(final List<String> packageList) {
    packageNames = packageList;
  }

  public String flatten() {
    return String.join(".", packageNames);
  }

  public JavaPackage createChildPackage(final List<String> additionalPackages) {

    List<String> packages = new LinkedList<>(packageNames);
    if (additionalPackages != null) {
      packages.addAll(additionalPackages);
    }

    return new JavaPackage(packages);
  }
}
