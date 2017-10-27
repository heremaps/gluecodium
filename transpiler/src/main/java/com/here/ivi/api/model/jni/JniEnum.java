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

import java.util.List;

public final class JniEnum implements JniElement {

  public JniContainer owningContainer;
  public final String javaEnumName;
  public final String cppEnumName;
  public final List<JniEnumerator> enumerators;

  private JniEnum(
      final JniContainer owningContainer,
      final String javaEnumName,
      final String cppEnumName,
      final List<JniEnumerator> enumerators) {
    this.owningContainer = owningContainer;
    this.javaEnumName = javaEnumName;
    this.cppEnumName = cppEnumName;
    this.enumerators = enumerators;
  }

  public static class Builder {
    private final String javaEnumName;
    private final String cppEnumName;
    private JniContainer jniContainer;
    private List<JniEnumerator> enumItems;

    public Builder(final String javaEnumName, final String cppEnumName) {
      this.javaEnumName = javaEnumName;
      this.cppEnumName = cppEnumName;
    }

    public Builder owningContainer(JniContainer owningContainer) {
      this.jniContainer = owningContainer;
      return this;
    }

    public Builder enumerators(List<JniEnumerator> enumerators) {
      this.enumItems = enumerators;
      return this;
    }

    public JniEnum build() {
      return new JniEnum(jniContainer, javaEnumName, cppEnumName, enumItems);
    }
  }
}
