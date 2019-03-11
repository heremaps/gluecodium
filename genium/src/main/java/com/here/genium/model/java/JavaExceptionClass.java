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

import java.util.LinkedHashSet;
import java.util.Objects;
import java.util.Set;

public class JavaExceptionClass extends JavaTopLevelElement {
  public final JavaEnumType enumTypeRef;

  public JavaExceptionClass(
      final String exceptionName, final JavaEnumType enumTypeRef, final JavaPackage javaPackage) {
    super(exceptionName);
    super.javaPackage = javaPackage;
    this.enumTypeRef = enumTypeRef;
  }

  @Override
  public Set<JavaImport> getImports() {
    Set<JavaImport> imports = new LinkedHashSet<>(enumTypeRef.imports);
    imports.removeIf(anImport -> Objects.equals(anImport.javaPackage, this.javaPackage));
    return imports;
  }
}
