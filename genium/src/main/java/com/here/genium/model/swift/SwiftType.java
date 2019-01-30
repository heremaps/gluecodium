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

  public static final SwiftType INT8 = new SwiftType("Int8", "int8_t");
  public static final SwiftType UINT8 = new SwiftType("UInt8", "uint8_t");
  public static final SwiftType INT16 = new SwiftType("Int16", "int16_t");
  public static final SwiftType UINT16 = new SwiftType("UInt16", "uint16_t");
  public static final SwiftType INT32 = new SwiftType("Int32", "int32_t");
  public static final SwiftType UINT32 = new SwiftType("UInt32", "uint32_t");
  public static final SwiftType INT64 = new SwiftType("Int64", "int64_t");
  public static final SwiftType UINT64 = new SwiftType("UInt64", "uint64_t");

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

  public static final SwiftType VOID = new SwiftType("Void", null);
  public static final SwiftType BOOL = new SwiftType("Bool", "bool");
  public static final SwiftType FLOAT = new SwiftType("Float", "float");
  public static final SwiftType DOUBLE = new SwiftType("Double", "double");
  public static final SwiftType STRING =
      new SwiftType("String", "std_string", TypeCategory.BUILTIN_STRING);
  public static final SwiftType DATA =
      new SwiftType("Data", "data", TypeCategory.BUILTIN_BYTEBUFFER);

  public final String cPrefix;
  public final TypeCategory category;
  public final String implementingClass;
  public final String publicName;
  public final String className;
  public final boolean optional;

  public SwiftType(final String name, final String cPrefix) {
    this(name, cPrefix, TypeCategory.BUILTIN_SIMPLE);
  }

  public SwiftType(final String name, final String cPrefix, final TypeCategory category) {
    this(name, cPrefix, null, category, null, name, false);
  }

  protected SwiftType(
      final String name,
      final String cPrefix,
      final SwiftVisibility visibility,
      final TypeCategory category,
      final String implementingClass,
      final String publicName,
      final boolean optional) {
    super(name, visibility);
    this.cPrefix = cPrefix;
    this.optional = optional;
    this.category = category;
    this.implementingClass = implementingClass;
    this.publicName = publicName;
    this.className = category == TypeCategory.CLASS ? publicName : "";
  }

  public SwiftType withAlias(final String aliasName) {
    return new SwiftType(
        name, cPrefix, visibility, category, implementingClass, aliasName, optional);
  }

  public SwiftType withOptional(final boolean isOptional) {
    return this.optional != isOptional
        ? new SwiftType(
            name, cPrefix, visibility, category, implementingClass, publicName, isOptional)
        : this;
  }
}
