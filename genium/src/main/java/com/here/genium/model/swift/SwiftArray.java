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

public final class SwiftArray extends SwiftType {

  public final SwiftType underlyingType;
  public final SwiftGenericParameter genericParameter;
  public final String refName;

  public SwiftArray(final SwiftType underlyingType) {
    this(null, null, getImplName(underlyingType), false, underlyingType, null);
  }

  public SwiftArray(
      final SwiftType underlyingType, final String implementingClass, final String refName) {
    this(implementingClass, null, getImplName(underlyingType), false, underlyingType, refName);
  }

  private SwiftArray(
      final String implementingClass,
      final SwiftVisibility visibility,
      final String publicName,
      final boolean optional,
      final SwiftType underlyingType,
      final String refName) {
    super(
        getImplName(underlyingType),
        visibility,
        TypeCategory.ARRAY,
        implementingClass,
        publicName,
        optional);
    this.underlyingType = underlyingType;
    this.genericParameter = new SwiftGenericParameter(null, this);
    this.refName = refName;
  }

  @Override
  public SwiftType withAlias(String aliasName) {
    return new SwiftArray(
        implementingClass, visibility, aliasName, optional, underlyingType, refName);
  }

  private static String getImplName(SwiftType underlyingType) {
    return "CollectionOf<" + underlyingType.publicName + ">";
  }
}
