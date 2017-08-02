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

public abstract class JavaType extends JavaElementWithImports {

  public JavaType(String name) {
    super(name);
  }

  public String getLiteralName() {
    return name;
  }

  // TODO APIGEN-268 The string magic should be replaced with improved models
  public String getOuterName() {
    if (name.contains(".")) {
      return name.substring(name.lastIndexOf('.') + 1, name.length());
    } else {
      return name;
    }
  }

  public JavaType(final String name, final Collection<JavaImport> imports) {
    super(name, imports);
  }
}
