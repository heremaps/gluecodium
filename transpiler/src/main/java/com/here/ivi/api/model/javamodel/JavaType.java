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
import java.util.stream.Stream;

public class JavaType extends JavaElementWithIncludes {
  public static final JavaType None = new JavaType("");
  public static final JavaType Null = new JavaType("null");

  public JavaElements.TypeInfo info = JavaElements.TypeInfo.Invalid;

  public JavaType() {
    super("INVALID");
  }

  public JavaType(String typeName) {
    this(typeName, JavaElements.TypeInfo.BuiltIn, Collections.emptyList());
  }

  public JavaType(String typeName, Includes.Include... includes) {
    this(typeName, JavaElements.TypeInfo.BuiltIn, asList(includes));
  }

  public JavaType(String typeName, JavaElements.TypeInfo info, Includes.Include... includes) {
    this(typeName, info, asList(includes));
  }

  public JavaType(
      String typeName, JavaElements.TypeInfo info, Collection<Includes.Include> includes) {
    super(typeName, includes);
    this.info = info;
  }

  public boolean isValid() {
    return info != JavaElements.TypeInfo.Invalid;
  }

  @Override
  public Stream<JavaElement> stream() {
    return Stream.empty();
  }
}
