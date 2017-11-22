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
import java.util.Objects;
import java.util.Set;

public class JavaExceptionClass extends JavaTopLevelElement {
  public final JavaEnumType enumTypeRef;

  public JavaExceptionClass(
      final String exceptionName, final JavaEnumType enumTypeRef, final JavaPackage javaPackage) {
    super(exceptionName);
    super.javaPackage = javaPackage;
    this.enumTypeRef = enumTypeRef;
  }

  @Override
  public Set<JavaImport> getImports() {
    Set<JavaImport> imports = new LinkedHashSet<>(enumTypeRef.imports);
    imports.removeIf(anImport -> Objects.equals(anImport.javaPackage, this.javaPackage));
    return imports;
  }
}
