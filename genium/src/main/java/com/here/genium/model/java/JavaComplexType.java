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

import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

public abstract class JavaComplexType extends JavaType {

  /** List of all class names (outer and inner class names); required for cppProxy generation */
  public final List<String> classNames = new LinkedList<>();
  /** List of all package identifiers; required for cppProxy generation */
  public final List<String> packageNames = new LinkedList<>();

  protected JavaComplexType(
      final String name,
      final List<String> classNames,
      final List<String> packageNames,
      final Collection<JavaImport> importCollection) {
    super(name, importCollection);
    if (classNames != null) {
      this.classNames.addAll(classNames);
    }
    if (packageNames != null) {
      this.packageNames.addAll(packageNames);
    }
  }
}
