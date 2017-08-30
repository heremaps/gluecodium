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

import com.here.ivi.api.model.cppmodel.CppField;
import com.here.ivi.api.model.javamodel.JavaCustomType;
import com.here.ivi.api.model.javamodel.JavaField;

public class JniField implements JniElement {

  public final JavaField javaField;
  public final CppField cppField;

  public final boolean hasCustomType;

  public JniField(final JavaField javaField, final CppField cppField) {
    this.javaField = javaField;
    this.cppField = cppField;
    this.hasCustomType = javaField.type instanceof JavaCustomType;
  }
}
