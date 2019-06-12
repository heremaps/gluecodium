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

package com.here.genium.model.jni;

import com.here.genium.cli.GeniumExecutionException;
import com.here.genium.generator.jni.JniNameRules;
import com.here.genium.generator.jni.JniTypeNameMapper;
import com.here.genium.model.cpp.CppComplexTypeRef;
import com.here.genium.model.cpp.CppPrimitiveTypeRef;
import com.here.genium.model.cpp.CppTemplateTypeRef;
import com.here.genium.model.cpp.CppTypeDefRef;
import com.here.genium.model.cpp.CppTypeRef;
import com.here.genium.model.java.JavaArrayType;
import com.here.genium.model.java.JavaComplexType;
import com.here.genium.model.java.JavaPrimitiveType;
import com.here.genium.model.java.JavaTemplateType;
import com.here.genium.model.java.JavaType;

public class JniType implements JniElement {

  public static final JniType VOID =
      new JniType(JavaPrimitiveType.VOID, CppPrimitiveTypeRef.Companion.getVOID());

  public final String name;
  public final String cppName;
  public final String javaName;
  public final String jniTypeSignature;
  public final String cppFullyQualifiedName;

  public final boolean isJavaArray;
  public final boolean isComplex;
  public final boolean refersToValueType;
  public final boolean isJavaVoid;

  public final JniType elementType;

  public JniType(final JavaType javaType, final CppTypeRef cppType) {
    this.name = JniTypeNameMapper.map(javaType);
    this.cppName = cppType.name;
    this.javaName = javaType.name;
    isComplex = !(javaType instanceof JavaPrimitiveType);
    isJavaArray = javaType instanceof JavaArrayType;
    refersToValueType = cppType.getRefersToValueType();
    isJavaVoid = javaType == JavaPrimitiveType.VOID;
    jniTypeSignature = createJniSignature(javaType);
    cppFullyQualifiedName = getCppFullyQualifiedName(cppType);
    elementType = inferElementType(javaType, cppType);
  }

  @SuppressWarnings("unused")
  public String getMangledSignature() {
    return JniNameRules.Companion.getMangledName(jniTypeSignature);
  }

  private static String createJniSignature(JavaType type) {

    if (type instanceof JavaPrimitiveType) {
      return createJniSignature((JavaPrimitiveType) type);
    }
    if (type instanceof JavaArrayType) {
      return createJniSignature((JavaArrayType) type);
    }
    if (type instanceof JavaComplexType) {
      return createJniSignature((JavaComplexType) type);
    }
    throw new GeniumExecutionException("invalid java type: " + type);
  }

  private static String createJniSignature(JavaPrimitiveType primitiveType) {
    switch (primitiveType.type) {
      case INT:
        return "I";
      case BOOL:
        return "Z";
      case BYTE:
        return "B";
      case CHAR:
        return "C";
      case LONG:
        return "J";
      case VOID:
        return "V";
      case FLOAT:
        return "F";
      case SHORT:
        return "S";
      case DOUBLE:
        return "D";
      default:
        throw new GeniumExecutionException("invalid java primitive type: " + primitiveType.type);
    }
  }

  private static String createJniSignature(JavaArrayType arrayType) {
    switch (arrayType.type) {
      case INT:
        return "[I";
      case BOOL:
        return "[Z";
      case BYTE:
        return "[B";
      case CHAR:
        return "[C";
      case LONG:
        return "[J";
      case FLOAT:
        return "[F";
      case SHORT:
        return "[S";
      case DOUBLE:
        return "[D";
      default:
        throw new GeniumExecutionException("invalid java primitive type: " + arrayType.type);
    }
  }

  private static String createJniSignature(final JavaComplexType complexType) {
    return "L"
        + String.join("/", complexType.packageNames)
        + "/"
        + String.join("$", complexType.classNames)
        + ";";
  }

  private static String getCppFullyQualifiedName(final CppTypeRef cppTypeRef) {
    return cppTypeRef instanceof CppComplexTypeRef
        ? ((CppComplexTypeRef) cppTypeRef).fullyQualifiedName
        : null;
  }

  private static JniType inferElementType(final JavaType javaType, final CppTypeRef cppType) {
    if (!(javaType instanceof JavaTemplateType)) {
      return null;
    }
    CppTypeRef actualCppType = cppType;
    while (actualCppType instanceof CppTypeDefRef) {
      actualCppType = actualCppType.getActualType();
    }
    return new JniType(
        ((JavaTemplateType) javaType).templateParameters.get(0),
        ((CppTemplateTypeRef) actualCppType).getTemplateParameters().get(0));
  }
}
