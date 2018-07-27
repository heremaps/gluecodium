/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 * License-Filename: LICENSE
 */

package com.here.genium.model.jni;

import com.here.genium.model.common.Include;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

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
  public final String javaInterfaceName;
  public final String cppName;
  public final boolean isFrancaInterface;
  public boolean isInterface;

  public final List<JniMethod> methods = new LinkedList<>();
  public final List<JniMethod> parentMethods = new LinkedList<>();
  public final List<JniStruct> structs = new LinkedList<>();
  public final List<JniEnum> enums = new LinkedList<>();
  public final Set<Include> includes = new LinkedHashSet<>();

  @SuppressWarnings("ParameterNumber")
  @lombok.Builder(builderClassName = "Builder")
  private JniContainer(
      final List<String> javaPackages,
      final List<String> cppNameSpaces,
      final String javaName,
      final String javaInterfaceName,
      final String cppName,
      final boolean isFrancaInterface,
      final boolean isInterface) {
    this.javaPackages = javaPackages;
    this.cppNameSpaces = cppNameSpaces;
    this.javaName = javaName;
    this.javaInterfaceName = javaInterfaceName;
    this.cppName = cppName;
    this.isFrancaInterface = isFrancaInterface;
    this.isInterface = isInterface;
  }

  public static Builder builder(final List<String> javaPackages, final List<String> cppNameSpaces) {
    return new Builder().javaPackages(javaPackages).cppNameSpaces(cppNameSpaces);
  }

  public void add(JniStruct struct) {
    struct.owningContainer = this;
    structs.add(struct);
  }

  public void add(JniEnum enumeration) {
    enumeration.owningContainer = this;
    enums.add(enumeration);
  }

  public void add(JniMethod method) {
    method.owningContainer = this;
    methods.add(method);
  }

  public void addParentMethod(final JniMethod method) {
    method.owningContainer = this;
    parentMethods.add(method);
  }
}
