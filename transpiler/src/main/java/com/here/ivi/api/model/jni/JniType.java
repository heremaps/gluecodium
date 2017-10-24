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

import com.here.ivi.api.TranspilerExecutionException;
import com.here.ivi.api.generator.jni.JniNameRules;
import com.here.ivi.api.generator.jni.JniTypeNameMapper;
import com.here.ivi.api.model.cppmodel.CppTypeRef;
import com.here.ivi.api.model.javamodel.JavaArrayType;
import com.here.ivi.api.model.javamodel.JavaComplexType;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType;
import com.here.ivi.api.model.javamodel.JavaType;
import java.util.List;

public final class JniType implements JniElement {

  public final String name;
  public final String cppName;
  public final String javaName;
  public final String jniTypeSignature;
  public final boolean isInstance;

  public final boolean isComplex;
  public final boolean refersToValueType;

  public static JniType createType(final JavaType javaType, final CppTypeRef cppType) {
    return createType(javaType, cppType, false);
  }

  public static JniType createType(
      final JavaType javaType, final CppTypeRef cppType, boolean isInstance) {
    if (javaType instanceof JavaPrimitiveType
        && ((JavaPrimitiveType) javaType).type == JavaPrimitiveType.Type.VOID) {
      return null;
    }
    return new JniType(javaType, cppType, isInstance);
  }

  @SuppressWarnings("unused")
  public String getMangledSignature() {
    return JniNameRules.getMangledName(jniTypeSignature);
  }

  private JniType(final JavaType javaType, final CppTypeRef cppType, boolean isInstance) {

    this.name = JniTypeNameMapper.map(javaType);
    this.cppName = cppType.name;
    this.javaName = javaType.name;
    this.isComplex = !(javaType instanceof JavaPrimitiveType);
    this.isInstance = isInstance;
    this.refersToValueType = cppType.refersToValueType();
    jniTypeSignature = createJniSignature(javaType);
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
      case INT_ARRAY:
        return "[I";
      case BOOL_ARRAY:
        return "[Z";
      case BYTE_ARRAY:
        return "[B";
      case CHAR_ARRAY:
        return "[C";
      case LONG_ARRAY:
        return "[J";
      case FLOAT_ARRAY:
        return "[F";
      case SHORT_ARRAY:
        return "[S";
      case DOUBLE_ARRAY:
        return "[D";
      default:
        throw new TranspilerExecutionException("invalid java primitive type: " + arrayType.type);
    }
  }

  private static String createJniSignature(JavaComplexType complexType) {

    List<String> packageNames = complexType.packageNames;
    List<String> classNames = complexType.classNames;

    if (classNames == null || packageNames == null) {
      return "";
    }
    return "L" + String.join("/", packageNames) + "/" + String.join("$", classNames) + ";";
  }
}
