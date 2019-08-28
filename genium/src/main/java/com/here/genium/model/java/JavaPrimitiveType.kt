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

package com.here.genium.model.java;

import java.util.EnumSet;
import java.util.stream.Stream;

public final class JavaPrimitiveType extends JavaType {

  public static final EnumSet<Type> TYPES = EnumSet.allOf(Type.class);

  public static final JavaPrimitiveType VOID = new JavaPrimitiveType(Type.VOID);
  public static final JavaPrimitiveType BYTE = new JavaPrimitiveType(Type.BYTE);
  public static final JavaPrimitiveType SHORT = new JavaPrimitiveType(Type.SHORT);
  public static final JavaPrimitiveType INT = new JavaPrimitiveType(Type.INT);
  public static final JavaPrimitiveType LONG = new JavaPrimitiveType(Type.LONG);
  public static final JavaPrimitiveType FLOAT = new JavaPrimitiveType(Type.FLOAT);
  public static final JavaPrimitiveType DOUBLE = new JavaPrimitiveType(Type.DOUBLE);
  public static final JavaPrimitiveType BOOL = new JavaPrimitiveType(Type.BOOL);
  public static final JavaPrimitiveType CHAR = new JavaPrimitiveType(Type.CHAR);

  public enum Type {
    VOID("void"),
    BYTE("byte"),
    SHORT("short"),
    INT("int"),
    LONG("long"),
    FLOAT("float"),
    DOUBLE("double"),
    BOOL("boolean"),
    CHAR("char");

    private final String value;

    Type(final String value) {
      this.value = value;
    }

    public String getValue() {
      return value;
    }
  }

  public final Type type;

  private JavaPrimitiveType(final Type type) {
    super(type.getValue());
    this.type = type;
  }

  public String getName() {
    return type.getValue();
  }

  @Override
  public Stream<JavaElement> stream() {
    return Stream.empty();
  }
}
