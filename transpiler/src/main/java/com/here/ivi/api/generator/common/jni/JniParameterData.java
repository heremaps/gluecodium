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

public class JniParameterData implements JniElement {

  public String baseName;
  public JavaType javaType;
  public String cppType;

  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }

    JniParameterData that = (JniParameterData) o;

    if (baseName != null ? !baseName.equals(that.baseName) : that.baseName != null) {
      return false;
    }
    if (javaType != null ? !javaType.equals(that.javaType) : that.javaType != null) {
      return false;
    }
    return cppType != null ? cppType.equals(that.cppType) : that.cppType == null;
  }

  @Override
  public int hashCode() {
    int result = baseName != null ? baseName.hashCode() : 0;
    result = 31 * result + (javaType != null ? javaType.hashCode() : 0);
    result = 31 * result + (cppType != null ? cppType.hashCode() : 0);
    return result;
  }
}
