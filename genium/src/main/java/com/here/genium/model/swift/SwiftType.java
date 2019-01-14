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

public class SwiftType extends SwiftModelElement {

  public enum TypeCategory {
    BUILTIN_SIMPLE,
    BUILTIN_STRING,
    BUILTIN_BYTEBUFFER,
    STRUCT,
    ENUM,
    CLASS,
    ARRAY,
    DICTIONARY
  }

  public static final SwiftType VOID = new SwiftType("Void");
  public static final SwiftType BOOL = new SwiftType("Bool");
  public static final SwiftType FLOAT = new SwiftType("Float");
  public static final SwiftType DOUBLE = new SwiftType("Double");
  public static final SwiftType STRING = new SwiftType("String", TypeCategory.BUILTIN_STRING);
  public static final SwiftType DATA = new SwiftType("Data", TypeCategory.BUILTIN_BYTEBUFFER);

  public final TypeCategory category;
  public final String implementingClass;
  public final String publicName;
  public final String className;
  public final boolean optional;

  public SwiftType(final String name) {
    this(name, TypeCategory.BUILTIN_SIMPLE);
  }

  public SwiftType(final String name, final TypeCategory category) {
    this(name, null, category, null, name, false);
  }

  protected SwiftType(
      final String name,
      final SwiftVisibility visibility,
      final TypeCategory category,
      final String implementingClass,
      final String publicName,
      final boolean optional) {
    super(name, visibility);
    this.optional = optional;
    this.category = category;
    this.implementingClass = implementingClass;
    this.publicName = publicName;
    this.className = category == TypeCategory.CLASS ? publicName : "";
  }

  public SwiftType withAlias(final String aliasName) {
    return new SwiftType(name, visibility, category, implementingClass, aliasName, optional);
  }

  public SwiftType asNonOptional() {
    return new SwiftType(name, visibility, category, implementingClass, publicName, false);
  }
}
