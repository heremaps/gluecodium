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

import com.here.genium.model.cpp.CppField;
import com.here.genium.model.java.JavaCustomType;
import com.here.genium.model.java.JavaField;
import com.here.genium.model.java.JavaTemplateType;

@SuppressWarnings("PMD.MissingStaticMethodInNonInstantiatableClass")
public final class JniField implements JniElement {

  public final JavaField javaField;
  public final CppField cppField;
  public final JniType type;
  public final String cppGetterName;
  public final String cppSetterName;

  public final boolean hasCustomType;
  public final boolean hasTemplateType;

  @lombok.Builder(builderClassName = "Builder")
  private JniField(
      final JavaField javaField,
      final CppField cppField,
      final JniType type,
      final String cppGetterName,
      final String cppSetterName) {
    this.javaField = javaField;
    this.cppField = cppField;
    this.type = type;
    this.cppGetterName = cppGetterName;
    this.cppSetterName = cppSetterName;
    this.hasCustomType = javaField.type instanceof JavaCustomType;
    this.hasTemplateType = javaField.type instanceof JavaTemplateType;
  }
}
