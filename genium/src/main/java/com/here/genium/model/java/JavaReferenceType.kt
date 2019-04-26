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

import com.here.genium.cli.GeniumExecutionException;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public final class JavaReferenceType extends JavaComplexType {

  private static final List<String> JAVA_PACKAGE_NAMES = Arrays.asList("java", "lang");

  public enum Type {
    OBJECT("Object"), // All java objects
    CLASS("Class"), // java.lang.Class objects
    STRING("String"), // java.lang.String objects
    THROWABLE("Throwable"), // java.lang.Throwable objects
    BOOL("Boolean"),
    BYTE("Byte"),
    CHAR("Character"),
    SHORT("Short"),
    INT("Integer"),
    LONG("Long"),
    FLOAT("Float"),
    DOUBLE("Double");

    private final String value;

    Type(final String value) {
      this.value = value;
    }

    public String getValue() {
      return value;
    }
  }

  public final Type type;

  public JavaReferenceType(final Type type) {
    super(
        type.getValue(),
        Collections.singletonList(type.getValue()),
        JAVA_PACKAGE_NAMES,
        Collections.emptyList());
    this.type = type;
  }

  /**
   * Wrap primitive types since generic templates don't apply to them
   *
   * @param primitiveType a primitive type
   * @return custom type wrapper of the primitive type
   */
  public static JavaReferenceType boxPrimitiveType(JavaPrimitiveType primitiveType) {
    if (primitiveType == JavaPrimitiveType.BOOL) {
      return new JavaReferenceType(JavaReferenceType.Type.BOOL);
    } else if (primitiveType == JavaPrimitiveType.CHAR) {
      return new JavaReferenceType(JavaReferenceType.Type.CHAR);
    } else if (primitiveType == JavaPrimitiveType.INT) {
      return new JavaReferenceType(JavaReferenceType.Type.INT);
    } else if (primitiveType == JavaPrimitiveType.FLOAT) {
      return new JavaReferenceType(JavaReferenceType.Type.FLOAT);
    } else if (primitiveType == JavaPrimitiveType.DOUBLE) {
      return new JavaReferenceType(JavaReferenceType.Type.DOUBLE);
    } else if (primitiveType == JavaPrimitiveType.BYTE) {
      return new JavaReferenceType(JavaReferenceType.Type.BYTE);
    } else if (primitiveType == JavaPrimitiveType.SHORT) {
      return new JavaReferenceType(JavaReferenceType.Type.SHORT);
    } else if (primitiveType == JavaPrimitiveType.LONG) {
      return new JavaReferenceType(JavaReferenceType.Type.LONG);
    } else {
      // No array for void type
      throw new GeniumExecutionException("Can not wrap primitive type " + primitiveType.name);
    }
  }
}
