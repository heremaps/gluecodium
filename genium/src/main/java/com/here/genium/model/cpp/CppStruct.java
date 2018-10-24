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

package com.here.genium.model.cpp;

import java.util.LinkedList;
import java.util.List;
import java.util.stream.Stream;
import lombok.Builder;
import lombok.Singular;

public final class CppStruct extends CppElementWithComment {

  public final List<CppField> fields;
  public final boolean isExternal;
  public final boolean isEquatable;
  public final boolean isImmutable;

  @SuppressWarnings("ParameterNumber")
  @Builder
  private CppStruct(
      final String name,
      final String fullyQualifiedName,
      final String comment,
      @Singular final List<CppField> fields,
      final boolean isExternal,
      final boolean isEquatable,
      final boolean isImmutable) {
    super(name, fullyQualifiedName, comment);
    this.fields = fields != null ? new LinkedList<>(fields) : new LinkedList<>();
    this.isExternal = isExternal;
    this.isEquatable = isEquatable;
    this.isImmutable = isImmutable;
  }

  @Override
  public Stream<? extends CppElement> stream() {
    return fields.stream();
  }
}
