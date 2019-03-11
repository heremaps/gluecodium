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

import com.here.genium.model.java.JavaPackage;
import java.util.List;

@SuppressWarnings("PMD.MissingStaticMethodInNonInstantiatableClass")
public final class JniEnum extends JniTopLevelElement {

  public final String javaEnumName;
  public final String cppEnumName;
  public final List<JniEnumerator> enumerators;

  @lombok.Builder(builderClassName = "Builder")
  private JniEnum(
      final JniContainer owningContainer,
      final JavaPackage javaPackage,
      final String javaEnumName,
      final String cppEnumName,
      final List<JniEnumerator> enumerators) {
    super(javaPackage);
    this.owningContainer = owningContainer;
    this.javaEnumName = javaEnumName;
    this.cppEnumName = cppEnumName;
    this.enumerators = enumerators;
  }

  @SuppressWarnings("unused")
  public static class Builder {
    private String javaEnumName;
    private String cppEnumName;

    Builder() {
      this(null, null);
    }

    public Builder(final String javaEnumName, final String cppEnumName) {
      this.javaEnumName = javaEnumName;
      this.cppEnumName = cppEnumName;
    }
  }
}
