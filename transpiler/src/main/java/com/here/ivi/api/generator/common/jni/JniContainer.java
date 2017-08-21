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
import java.util.LinkedList;
import java.util.List;

/**
 * JniContainer is a container for classes, fields and methods.
 *
 * <p>It can be referring to a type collection or an interface. The Cpp/Java name attributes
 * represent the name of the owning container which is the name of the containing class in case of
 * interface or the name of the package in case of type collection.
 */
public final class JniContainer implements JniElement {

  public final List<String> javaPackages;
  public final List<String> cppNameSpaces;
  public final String javaName;
  public final String cppName;
  public boolean isInterface;

  public final List<JniMethod> methods = new LinkedList<>();
  public final List<JniStruct> structs = new LinkedList<>();
  public final List<Include> includes = new LinkedList<>();

  private JniContainer(
      List<String> javaPackages,
      List<String> cppNameSpaces,
      String javaName,
      String cppName,
      boolean isInterface) {
    this.javaPackages = javaPackages;
    this.cppNameSpaces = cppNameSpaces;
    this.javaName = javaName;
    this.cppName = cppName;
    this.isInterface = isInterface;
  }

  public static JniContainer createTypeCollectionContainer(
      List<String> javaPackages, List<String> cppNameSpaces, String javaName, String cppName) {
    return new JniContainer(javaPackages, cppNameSpaces, javaName, cppName, false);
  }

  public static JniContainer createInterfaceContainer(
      List<String> javaPackages, List<String> cppNameSpaces, String javaName, String cppName) {
    return new JniContainer(javaPackages, cppNameSpaces, javaName, cppName, true);
  }
}
