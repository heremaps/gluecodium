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

import java.util.LinkedList;
import java.util.List;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode
public final class JniMethod implements JniElement {

  public JniContainer owningContainer;

  public final String javaMethodName;
  public final String cppMethodName;
  public final JniType returnType;
  public final boolean isStatic;
  public final boolean isConst;

  public final List<JniParameter> parameters = new LinkedList<>();

  private JniMethod(
      final String javaMethodName,
      final String cppMethodName,
      final JniType returnType,
      final boolean isStatic,
      final boolean isConst) {
    this.javaMethodName = javaMethodName;
    this.cppMethodName = cppMethodName;
    this.returnType = returnType;
    this.isStatic = isStatic;
    this.isConst = isConst;
  }

  @SuppressWarnings({"PMD.AvoidFieldNameMatchingMethodName"})
  public static class Builder {
    public final String javaMethodName;
    public final String cppMethodName;
    public JniType returnType;
    public boolean isStatic;
    public boolean isConst;

    public Builder(final String javaMethodName, final String cppMethodName) {
      this.javaMethodName = javaMethodName;
      this.cppMethodName = cppMethodName;
      returnType = null;
      isStatic = false;
      isConst = false;
    }

    public Builder returnType(final JniType returnTypeParam) {
      returnType = returnTypeParam;
      return this;
    }

    public Builder staticFlag(final boolean isStaticParam) {
      isStatic = isStaticParam;
      return this;
    }

    public Builder constFlag(final boolean isConstParam) {
      isConst = isConstParam;
      return this;
    }

    public JniMethod build() {
      return new JniMethod(javaMethodName, cppMethodName, returnType, isStatic, isConst);
    }
  }
}
