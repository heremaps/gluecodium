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

package com.here.genium.model.cbridge;

import com.here.genium.generator.cbridge.CppTypeInfo;
import java.util.LinkedList;
import java.util.List;

public final class CStruct extends CType {

  public final String baseApiName;
  public final CppTypeInfo mappedType;
  public final List<CField> fields = new LinkedList<>();
  public final boolean hasImmutableFields;

  public CStruct(
      final String name,
      final String baseApiName,
      final CppTypeInfo mappedType,
      final boolean hasImmutableFields) {
    super(name);
    this.baseApiName = baseApiName;
    this.mappedType = mappedType;
    this.hasImmutableFields = hasImmutableFields;
  }

  public String getType() {
    return mappedType.getFunctionReturnType().toString();
  }
}
