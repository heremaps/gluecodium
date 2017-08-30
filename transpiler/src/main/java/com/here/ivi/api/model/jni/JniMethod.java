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

public final class JniMethod implements JniElement {

  public JniContainer owningContainer;

  public String javaMethodName;
  public String cppMethodName;

  public JniType returnType;
  public List<JniParameter> parameters = new LinkedList<>();

  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }

    JniMethod jniMethod = (JniMethod) o;

    if (owningContainer != null
        ? !owningContainer.equals(jniMethod.owningContainer)
        : jniMethod.owningContainer != null) {
      return false;
    }
    if (javaMethodName != null
        ? !javaMethodName.equals(jniMethod.javaMethodName)
        : jniMethod.javaMethodName != null) {
      return false;
    }
    if (returnType != null
        ? !returnType.equals(jniMethod.returnType)
        : jniMethod.returnType != null) {
      return false;
    }
    if (cppMethodName != null
        ? !cppMethodName.equals(jniMethod.cppMethodName)
        : jniMethod.cppMethodName != null) {
      return false;
    }
    return parameters != null
        ? parameters.equals(jniMethod.parameters)
        : jniMethod.parameters == null;
  }

  @Override
  public int hashCode() {
    int result = owningContainer != null ? owningContainer.hashCode() : 0;
    result = 31 * result + (javaMethodName != null ? javaMethodName.hashCode() : 0);
    result = 31 * result + (returnType != null ? returnType.hashCode() : 0);
    result = 31 * result + (cppMethodName != null ? cppMethodName.hashCode() : 0);
    result = 31 * result + (parameters != null ? parameters.hashCode() : 0);
    return result;
  }
}
