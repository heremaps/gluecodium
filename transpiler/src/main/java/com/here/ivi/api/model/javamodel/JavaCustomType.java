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

/** A custom Java type. */
public final class JavaCustomType extends JavaType {

  /** The class name without outer class if there is one */
  public final String simpleName;

  public JavaCustomType(final String name) {
    super(name);
    simpleName = name;
  }

  public JavaCustomType(final String name, final Collection<JavaImport> imports) {
    super(name, imports);
    simpleName = name;
  }

  public JavaCustomType(
      final String fullName, String className, final Collection<JavaImport> imports) {
    super(fullName, imports);
    simpleName = className;
  }
}
