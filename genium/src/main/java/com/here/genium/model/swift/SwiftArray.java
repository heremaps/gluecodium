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

package com.here.genium.model.swift;

public final class SwiftArray extends SwiftType {

  public final SwiftType underlyingType;

  public SwiftArray(final SwiftType underlyingType, final String cPrefix) {
    this(underlyingType, null, getImplName(underlyingType), false, cPrefix);
  }

  private SwiftArray(
      final SwiftType underlyingType,
      final SwiftVisibility visibility,
      final String publicName,
      final boolean optional,
      final String cPrefix) {
    super(
        getImplName(underlyingType), cPrefix, visibility, TypeCategory.ARRAY, publicName, optional);
    this.underlyingType = underlyingType;
  }

  @Override
  public SwiftType withAlias(String aliasName) {
    return new SwiftArray(underlyingType, visibility, aliasName, optional, cPrefix);
  }

  @Override
  public SwiftType withOptional(final boolean optional) {
    return this.optional != optional
        ? new SwiftArray(underlyingType, visibility, publicName, optional, cPrefix)
        : this;
  }

  public SwiftArray withoutAlias() {
    return new SwiftArray(
        underlyingType, visibility, getImplName(underlyingType), optional, cPrefix);
  }

  private static String getImplName(SwiftType underlyingType) {
    return "[" + underlyingType.publicName + "]";
  }
}
