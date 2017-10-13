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

public class JniEnum implements JniElement {

  public JniContainer owningContainer;
  public final String javaEnumName;
  public final String cppEnumName;

  public JniEnum(
      final JniContainer owningContainer, final String javaEnumName, final String cppEnumName) {
    this.owningContainer = owningContainer;
    this.javaEnumName = javaEnumName;
    this.cppEnumName = cppEnumName;
  }

  public JniEnum(final String javaEnumName, final String cppEnumName) {
    this(null, javaEnumName, cppEnumName);
  }
}
