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

import java.util.List;
import lombok.EqualsAndHashCode;

/** This class represents an import in java. It is based on a java package. */
@EqualsAndHashCode
public final class JavaImport implements Comparable<JavaImport> {
  public final JavaPackage javaPackage;
  public final String className;

  public JavaImport(final String className, final JavaPackage javaPackage) {
    this.javaPackage = javaPackage;
    this.className = className;
  }

  @Override
  public int compareTo(JavaImport otherImport) {

    List<String> thisPackageNames = javaPackage.packageNames;
    List<String> otherPackageNames = otherImport.javaPackage.packageNames;

    int minimumNameCount = Math.min(thisPackageNames.size(), otherPackageNames.size());
    for (int i = 0; i < minimumNameCount; ++i) {
      int comparison = thisPackageNames.get(i).compareTo(otherPackageNames.get(i));
      if (comparison != 0) {
        return comparison;
      }
    }
    int comparison = Integer.compare(thisPackageNames.size(), otherPackageNames.size());
    if (comparison != 0) {
      return comparison;
    }
    return className.compareTo(otherImport.className);
  }
}
