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

import com.here.ivi.api.model.cppmodel.CppStruct;
import com.here.ivi.api.model.javamodel.JavaClass;
import java.util.List;

public class JniStruct extends JniTopLevelElement {

  public final JavaClass javaClass;
  public final CppStruct cppStruct;
  public final List<JniField> fields;

  public JniStruct(
      final JniContainer owningContainer,
      final JavaClass javaClass,
      final CppStruct cppStruct,
      final List<JniField> fields) {
    super(javaClass.javaPackage);
    this.owningContainer = owningContainer;
    this.javaClass = javaClass;
    this.cppStruct = cppStruct;
    this.fields = fields;
  }

  public JniStruct(
      final JavaClass javaClass, final CppStruct cppStruct, final List<JniField> fields) {
    this(null, javaClass, cppStruct, fields);
  }
}
