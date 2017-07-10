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

package com.here.ivi.api.generator.common.jni;

import com.here.ivi.api.model.javamodel.JavaType;
import java.util.LinkedList;
import java.util.List;

public class JniMethod implements JniElement {

  public JniModel owningModel = null;

  public String javaMethodName;
  public JavaType javaReturnType;

  public String cppMethodName;
  public String cppReturnType;

  public List<JniParameterData> parameters = new LinkedList<>();

  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }

    JniMethod jniMethod = (JniMethod) o;

    if (owningModel != null
        ? !owningModel.equals(jniMethod.owningModel)
        : jniMethod.owningModel != null) {
      return false;
    }
    if (javaMethodName != null
        ? !javaMethodName.equals(jniMethod.javaMethodName)
        : jniMethod.javaMethodName != null) {
      return false;
    }
    if (javaReturnType != null
        ? !javaReturnType.equals(jniMethod.javaReturnType)
        : jniMethod.javaReturnType != null) {
      return false;
    }
    if (cppMethodName != null
        ? !cppMethodName.equals(jniMethod.cppMethodName)
        : jniMethod.cppMethodName != null) {
      return false;
    }
    if (cppReturnType != null
        ? !cppReturnType.equals(jniMethod.cppReturnType)
        : jniMethod.cppReturnType != null) {
      return false;
    }
    return parameters != null
        ? parameters.equals(jniMethod.parameters)
        : jniMethod.parameters == null;
  }

  @Override
  public int hashCode() {
    int result = owningModel != null ? owningModel.hashCode() : 0;
    result = 31 * result + (javaMethodName != null ? javaMethodName.hashCode() : 0);
    result = 31 * result + (javaReturnType != null ? javaReturnType.hashCode() : 0);
    result = 31 * result + (cppMethodName != null ? cppMethodName.hashCode() : 0);
    result = 31 * result + (cppReturnType != null ? cppReturnType.hashCode() : 0);
    result = 31 * result + (parameters != null ? parameters.hashCode() : 0);
    return result;
  }
}
