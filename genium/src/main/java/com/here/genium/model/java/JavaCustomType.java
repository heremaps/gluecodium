/*
 * Copyright (C) 2016-2019 HERE Europe B.V.
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

package com.here.genium.model.java;

import java.util.Collections;
import java.util.List;
import lombok.Singular;

public class JavaCustomType extends JavaComplexType {

  public final boolean isInterface;

  public JavaCustomType(final String fullName, final JavaPackage javaPackage) {
    this(fullName, null, javaPackage.getPackageNames(), new JavaImport(fullName, javaPackage));
  }

  protected JavaCustomType(
      final String fullName,
      final List<String> classNames,
      final List<String> packageNames,
      final JavaImport javaImport) {
    this(
        fullName,
        classNames,
        packageNames,
        javaImport != null ? Collections.singletonList(javaImport) : null,
        false);
  }

  @lombok.Builder(builderClassName = "Builder")
  private JavaCustomType(
      final String fullName,
      @Singular final List<String> classNames,
      final List<String> packageNames,
      @Singular final List<JavaImport> javaImports,
      final boolean isInterface) {
    super(
        fullName,
        classNames != null ? classNames : Collections.singletonList(fullName),
        packageNames,
        javaImports);
    this.isInterface = isInterface;
  }

  public static Builder builder(final String fullName) {
    return new Builder().fullName(fullName);
  }
}
