/*
 * Copyright (C) 2017 HERE Global B.V. and its affiliate(s). All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 */

package com.here.ivi.api.model.jni;

import com.here.ivi.api.cli.TranspilerExecutionException;
import com.here.ivi.api.generator.jni.JniNameRules;
import com.here.ivi.api.generator.jni.JniTypeNameMapper;
import com.here.ivi.api.model.cpp.CppComplexTypeRef;
import com.here.ivi.api.model.cpp.CppTypeRef;
import com.here.ivi.api.model.java.JavaArrayType;
import com.here.ivi.api.model.java.JavaComplexType;
import com.here.ivi.api.model.java.JavaPrimitiveType;
import com.here.ivi.api.model.java.JavaType;
import java.util.List;

public final class JniType implements JniElement {

  public final String name;
  public final String cppName;
  public final String javaName;
  public final String jniTypeSignature;
  public final String cppFullyQualifiedName;
  public final boolean isJavaArray;

  public final boolean isComplex;
  public final boolean refersToValueType;

  public static JniType createType(final JavaType javaType, final CppTypeRef cppType) {
    if (javaType instanceof JavaPrimitiveType
        && ((JavaPrimitiveType) javaType).type == JavaPrimitiveType.Type.VOID) {
      return null;
    }
    return new JniType(javaType, cppType);
  }

  @SuppressWarnings("unused")
  public String getMangledSignature() {
    return JniNameRules.getMangledName(jniTypeSignature);
  }

  private JniType(final JavaType javaType, final CppTypeRef cppType) {

    this.name = JniTypeNameMapper.map(javaType);
    this.cppName = cppType.name;
    this.javaName = javaType.name;
    isComplex = !(javaType instanceof JavaPrimitiveType);
    isJavaArray = javaType instanceof JavaArrayType;
    this.refersToValueType = cppType.refersToValueType();
    jniTypeSignature = createJniSignature(javaType);
    cppFullyQualifiedName = getCppFullyQualifiedName(cppType);
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
    throw new TranspilerExecutionException("invalid java type: " + type);
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
        throw new TranspilerExecutionException(
            "invalid java primitive type: " + primitiveType.type);
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
        throw new TranspilerExecutionException("invalid java primitive type: " + arrayType.type);
    }
  }

  private static String createJniSignature(final JavaComplexType complexType) {

    List<String> packageNames = complexType.packageNames;
    List<String> classNames = complexType.classNames;

    if (classNames == null || packageNames == null) {
      return "";
    }
    return "L" + String.join("/", packageNames) + "/" + String.join("$", classNames) + ";";
  }

  private static String getCppFullyQualifiedName(final CppTypeRef cppTypeRef) {
    return cppTypeRef instanceof CppComplexTypeRef
        ? ((CppComplexTypeRef) cppTypeRef).fullyQualifiedName
        : null;
  }
}
