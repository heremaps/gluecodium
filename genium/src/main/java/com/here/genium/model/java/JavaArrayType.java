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

package com.here.genium.model.java;

import static com.here.genium.model.java.JavaPrimitiveType.Type;

import java.util.stream.Stream;

public final class JavaArrayType extends JavaType {

  public static final JavaArrayType BYTE_ARRAY = new JavaArrayType(Type.BYTE);
  public static final JavaArrayType SHORT_ARRAY = new JavaArrayType(Type.SHORT);
  public static final JavaArrayType INT_ARRAY = new JavaArrayType(Type.INT);
  public static final JavaArrayType LONG_ARRAY = new JavaArrayType(Type.LONG);
  public static final JavaArrayType FLOAT_ARRAY = new JavaArrayType(Type.FLOAT);
  public static final JavaArrayType DOUBLE_ARRAY = new JavaArrayType(Type.DOUBLE);
  public static final JavaArrayType BOOL_ARRAY = new JavaArrayType(Type.BOOL);
  public static final JavaArrayType CHAR_ARRAY = new JavaArrayType(Type.CHAR);

  public final Type type;

  public JavaArrayType(final Type type) {
    super(type.getValue() + "[]");
    this.type = type;
  }

  @Override
  public Stream<JavaElement> stream() {
    return Stream.empty();
  }

  @Override
  public String getLiteralName() {
    return type.getValue() + "_array";
  }
}
