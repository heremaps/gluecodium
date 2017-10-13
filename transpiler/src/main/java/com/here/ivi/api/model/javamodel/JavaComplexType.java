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

import java.util.Collection;
import java.util.Collections;
import java.util.List;

public abstract class JavaComplexType extends JavaType {

  /** List of all class names (outer and inner class names); required for cppProxy generation */
  public final List<String> classNames;
  /** List of all package identifiers; required for cppProxy generation */
  public final List<String> packageNames;

  public JavaComplexType(final String name) {
    super(name);
    classNames = Collections.singletonList(name);
    packageNames = null;
  }

  public JavaComplexType(
      final String name,
      final List<String> classNames,
      final List<String> packageNames,
      final Collection<JavaImport> importCollection) {
    super(name, importCollection);
    this.classNames = classNames;
    this.packageNames = packageNames;
  }
}
