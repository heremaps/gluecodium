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

package com.here.genium.model.swift;

import java.util.LinkedList;
import java.util.List;

public final class SwiftStruct extends SwiftType {

  public final List<SwiftField> fields = new LinkedList<>();
  public final List<SwiftConstant> constants = new LinkedList<>();
  public final SwiftStruct parent;
  public final String cPrefix;
  public final boolean isInterface;
  public final boolean isEquatable;
  public final boolean isImmutable;

  @SuppressWarnings({"ParameterNumber", "PMD.ExcessiveParameterList"})
  @lombok.Builder(builderClassName = "Builder")
  private SwiftStruct(
      final String name,
      final SwiftVisibility visibility,
      final TypeCategory category,
      final String implementingClass,
      final String publicName,
      final boolean optional,
      final SwiftStruct parent,
      final String cPrefix,
      final boolean isEquatable,
      final boolean isImmutable) {
    super(
        name,
        visibility,
        category != null ? category : TypeCategory.STRUCT,
        implementingClass,
        publicName != null ? publicName : name,
        optional);
    this.parent = parent;
    this.cPrefix = cPrefix;
    this.isEquatable = isEquatable;
    this.isImmutable = isImmutable;
    this.isInterface = !name.equals(implementingClass);
  }

  public static Builder builder(final String name) {
    return new Builder().name(name);
  }

  @Override
  public SwiftType withAlias(final String aliasName) {
    SwiftStruct container =
        new SwiftStruct(
            name,
            visibility,
            category,
            implementingClass,
            aliasName,
            optional,
            parent,
            cPrefix,
            isEquatable,
            isImmutable);
    container.comment = this.comment;
    container.fields.addAll(fields);
    return container;
  }

  @Override
  public SwiftType withOptional(final boolean optional) {
    SwiftStruct container =
        new SwiftStruct(
            name,
            visibility,
            category,
            implementingClass,
            publicName,
            optional,
            parent,
            cPrefix,
            isEquatable,
            isImmutable);
    container.comment = this.comment;
    container.fields.addAll(fields);
    return container;
  }
}
