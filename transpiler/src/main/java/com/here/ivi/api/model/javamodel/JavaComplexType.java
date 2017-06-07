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

import static java.util.Arrays.asList;

import com.here.ivi.api.model.Includes;
import java.util.Collection;
import java.util.Collections;

public class JavaComplexType extends JavaElementWithIncludes implements JavaType {

  private final boolean hasFinalModifier;

  public JavaComplexType() {
    super("INVALID");
    this.hasFinalModifier = false;
  }

  public JavaComplexType(String typeName) {
    this(typeName, false, Collections.emptyList());
  }

  public JavaComplexType(String typeName, boolean hasFinalModifier, Includes.Include... includes) {
    this(typeName, hasFinalModifier, asList(includes));
  }

  public JavaComplexType(
      String typeName, boolean hasFinalModifier, Collection<Includes.Include> includes) {
    super(typeName, includes);
    this.hasFinalModifier = hasFinalModifier;
  }

  @Override
  public String getName() {
    return name;
  }

  @Override
  public boolean isValid() {
    return name != null && !name.isEmpty();
  }

  @Override
  public boolean isFinal() {
    return hasFinalModifier;
  }
}
