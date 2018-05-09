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

  public CParameter(final String name, final CppTypeInfo mappedType) {
    super(name);
    this.mappedType = mappedType;
  }

  public List<Include> getSignatureIncludes() {
    List<Include> includes = new ArrayList<>(mappedType.functionReturnType.includes);
    includes.addAll(mappedType.cType.includes);
    return includes;
  }

  @Override
  public String toString() {
    return mappedType.functionReturnType + " " + name;
  }
}
