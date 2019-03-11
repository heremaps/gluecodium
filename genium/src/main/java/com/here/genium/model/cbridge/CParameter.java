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

package com.here.genium.model.cbridge;

import com.here.genium.generator.cbridge.CppTypeInfo;
import com.here.genium.model.common.Include;
import java.util.ArrayList;
import java.util.List;

public class CParameter extends CElement {

  public final CppTypeInfo mappedType;

  public static class SimpleParameter {
    public final String name;
    public final CType type;

    public SimpleParameter(String name, CType type) {
      this.name = name;
      this.type = type;
    }

    @Override
    public String toString() {
      return type + " " + name;
    }
  }

  public CParameter(final String name, final CppTypeInfo mappedType) {
    super(name);
    this.mappedType = mappedType;
  }

  public List<Include> getSignatureIncludes() {
    List<Include> includes = new ArrayList<>();
    includes.addAll(mappedType.functionReturnType.includes);
    for (CType signatureType : mappedType.cTypesNeededByConstructor) {
      includes.addAll(signatureType.includes);
    }
    return includes;
  }

  public List<SimpleParameter> getSignatureParameters() {
    List<SimpleParameter> parameters = new ArrayList<>();
    for (int i = 0; i < mappedType.cTypesNeededByConstructor.size(); ++i) {
      parameters.add(
          new SimpleParameter(
              name + mappedType.paramSuffixes.get(i), mappedType.cTypesNeededByConstructor.get(i)));
    }
    return parameters;
  }

  @Override
  public String toString() {
    return mappedType.functionReturnType + " " + name;
  }
}
