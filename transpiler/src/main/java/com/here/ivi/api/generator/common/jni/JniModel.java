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

import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.javamodel.JavaClass;
import java.util.LinkedList;
import java.util.List;

public class JniModel implements JniElement {

  public final String cppClassName;
  public final List<String> cppNameSpaces;
  public final JavaClass javaClass;
  public final List<String> javaPackages;

  public final List<JniMethod> methods = new LinkedList<>();
  public final List<JniStruct> structs = new LinkedList<>();
  public final List<Include> includes = new LinkedList<>();

  public JniModel(
      final String cppClassName,
      final List<String> cppNamespaces,
      final JavaClass javaClass,
      final List<String> javaPackages) {
    this.cppClassName = cppClassName;
    this.cppNameSpaces = cppNamespaces;
    this.javaClass = javaClass;
    this.javaPackages = javaPackages;
  }
}
