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

import java.util.LinkedHashSet;
import java.util.Set;
import java.util.stream.Stream;

public final class JavaClass extends JavaTopLevelElement {

  public static final JavaClass NATIVE_BASE = new JavaClass("NativeBase");

  public Set<JavaField> fields = new LinkedHashSet<>();
  public JavaClass extendedClass;

  public JavaClass(final String name) {
    super(name);
  }

  public boolean extendsNativeBase() {
    return NATIVE_BASE.equals(extendedClass);
  }

  @Override
  public Stream<JavaNamedEntity> stream() {
    return Stream.concat(
            super.stream(),
            extendedClass != null
                ? Stream.concat(fields.stream(), extendedClass.stream())
                : fields.stream())
        .map(JavaElement.class::cast);
  }

  @Override
  public Set<JavaImport> getImports() {
    Set<JavaImport> imports = super.getImports();
    if (extendedClass != null) {
      imports.add(new JavaImport(extendedClass.name, extendedClass.javaPackage));
    }
    return imports;
  }
}
