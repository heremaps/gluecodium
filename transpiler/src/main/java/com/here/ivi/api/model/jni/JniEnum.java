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

package com.here.ivi.api.model.jni;

import com.here.ivi.api.model.javamodel.JavaPackage;
import java.util.List;

@SuppressWarnings("PMD.MissingStaticMethodInNonInstantiatableClass")
public final class JniEnum extends JniTopLevelElement {

  public final String javaEnumName;
  public final String cppEnumName;
  public final List<JniEnumerator> enumerators;

  @lombok.Builder(builderClassName = "Builder")
  private JniEnum(
      final JniContainer owningContainer,
      final JavaPackage javaPackage,
      final String javaEnumName,
      final String cppEnumName,
      final List<JniEnumerator> enumerators) {
    super(javaPackage);
    this.owningContainer = owningContainer;
    this.javaEnumName = javaEnumName;
    this.cppEnumName = cppEnumName;
    this.enumerators = enumerators;
  }

  @SuppressWarnings("unused")
  public static class Builder {
    private String javaEnumName;
    private String cppEnumName;

    Builder() {
      this(null, null);
    }

    public Builder(final String javaEnumName, final String cppEnumName) {
      this.javaEnumName = javaEnumName;
      this.cppEnumName = cppEnumName;
    }
  }
}
