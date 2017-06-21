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

/**
 * A custom Java type.
 *
 * <p>It is by nature a {@link JavaReferenceType} with a type that (indirectly) devices from {@link
 * java.lang.Object}.
 */
public final class JavaCustomType extends JavaReferenceType implements JavaType {
  private final String name;

  public JavaCustomType(final String name) {
    super(Type.OBJECT);
    this.name = name;
  }

  public JavaCustomType(final String name, final Collection<JavaImport> imports) {
    super(Type.OBJECT, imports);
    this.name = name;
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
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    if (!super.equals(o)) return false;

    JavaCustomType that = (JavaCustomType) o;

    return name != null ? name.equals(that.name) : that.name == null;
  }

  @Override
  public int hashCode() {
    int result = super.hashCode();
    result = 31 * result + (name != null ? name.hashCode() : 0);
    return result;
  }
}
