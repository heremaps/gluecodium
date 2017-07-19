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
public final class JavaCustomType extends JavaElementWithImports implements JavaType {

  public JavaCustomType(final String name) {
    super(name);
  }

  public JavaCustomType(final String name, final Collection<JavaImport> imports) {
    super(name, imports);
  }

  @Override
  public String getName() {
    return name;
  }

  @Override
  public boolean isValid() {
    return name != null && !name.isEmpty();
  }
}
