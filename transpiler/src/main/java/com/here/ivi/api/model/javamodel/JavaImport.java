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

import java.util.List;
import lombok.EqualsAndHashCode;

/** This class represents an import in java. It is based on a java package. */
@EqualsAndHashCode
public final class JavaImport implements Comparable<JavaImport> {
  public final JavaPackage javaPackage;
  public final String className;

  public JavaImport(final String className, final JavaPackage javaPackage) {
    this.javaPackage = javaPackage;
    this.className = className;
  }

  @Override
  public int compareTo(JavaImport otherImport) {

    List<String> thisPackageNames = javaPackage.packageNames;
    List<String> otherPackageNames = otherImport.javaPackage.packageNames;

    int minimumNameCount = Math.min(thisPackageNames.size(), otherPackageNames.size());
    for (int i = 0; i < minimumNameCount; ++i) {
      int comparison = thisPackageNames.get(i).compareTo(otherPackageNames.get(i));
      if (comparison != 0) {
        return comparison;
      }
    }
    int comparison = Integer.compare(thisPackageNames.size(), otherPackageNames.size());
    if (comparison != 0) {
      return comparison;
    }
    return className.compareTo(otherImport.className);
  }
}
