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

package com.here.genium.model.java;

import com.here.genium.generator.java.JavaNameRules;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode
public final class JavaPackage {

  public static final List<String> DEFAULT_PACKAGE_NAMES = Arrays.asList("com", "example");
  public static final JavaPackage DEFAULT = new JavaPackage(DEFAULT_PACKAGE_NAMES);

  public final List<String> packageNames;

  public JavaPackage(final List<String> packageList) {
    packageNames =
        packageList.stream().map(JavaNameRules::getPackageName).collect(Collectors.toList());
  }

  public String flatten() {
    return String.join(".", packageNames);
  }

  public JavaPackage createChildPackage(final List<String> additionalPackages) {

    List<String> packages = new LinkedList<>(packageNames);
    if (additionalPackages != null) {
      packages.addAll(additionalPackages);
    }

    return new JavaPackage(packages);
  }
}
