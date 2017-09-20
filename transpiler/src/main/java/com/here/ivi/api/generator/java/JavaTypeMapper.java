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

package com.here.ivi.api.generator.java;

import com.here.ivi.api.TranspilerExecutionException;
import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.javamodel.JavaCustomType;
import com.here.ivi.api.model.javamodel.JavaImport;
import com.here.ivi.api.model.javamodel.JavaPackage;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType.Type;
import com.here.ivi.api.model.javamodel.JavaReferenceType;
import com.here.ivi.api.model.javamodel.JavaType;
import com.here.ivi.api.model.rules.InstanceRules;
import java.util.Collections;
import java.util.List;
import org.franca.core.franca.*;

public final class JavaTypeMapper {
  public static JavaType map(final JavaPackage basePackage, final FTypeRef fTypeRef) {
    if (fTypeRef.getDerived() != null) {
      return mapDerived(basePackage, fTypeRef);
    }

    if (fTypeRef.getPredefined() != FBasicTypeId.UNDEFINED) {
      return mapPredefined(fTypeRef.getPredefined());
    }

    if (fTypeRef.getInterval() != null) {
      throw new TranspilerExecutionException(
          "The transpiler does not support integer ranges. "
              + "Please use regular Integer types like Int64 instead. Type: "
              + fTypeRef);
    }

    return JavaPrimitiveType.VOID;
  }

  private static JavaType mapPredefined(final FBasicTypeId basicTypeId) {
    switch (basicTypeId.getValue()) {
      case FBasicTypeId.BOOLEAN_VALUE:
        return new JavaPrimitiveType(Type.BOOL);
      case FBasicTypeId.FLOAT_VALUE:
        return new JavaPrimitiveType(Type.FLOAT);
      case FBasicTypeId.DOUBLE_VALUE:
        return new JavaPrimitiveType(Type.DOUBLE);
      case FBasicTypeId.INT8_VALUE:
        return new JavaPrimitiveType(Type.BYTE);
      case FBasicTypeId.INT16_VALUE:
        return new JavaPrimitiveType(Type.SHORT);
      case FBasicTypeId.INT32_VALUE:
        return new JavaPrimitiveType(Type.INT);
      case FBasicTypeId.INT64_VALUE:
        return new JavaPrimitiveType(Type.LONG);
      case FBasicTypeId.UINT8_VALUE:
      case FBasicTypeId.UINT16_VALUE:
      case FBasicTypeId.UINT32_VALUE:
      case FBasicTypeId.UINT64_VALUE:
        // TODO: APIGEN-217 figure out how to handle unsigned ints
        return new JavaPrimitiveType(Type.LONG);
      case FBasicTypeId.STRING_VALUE:
        return new JavaReferenceType(JavaReferenceType.Type.STRING);
      case FBasicTypeId.BYTE_BUFFER_VALUE:
        return new JavaReferenceType(JavaReferenceType.Type.BYTE_ARRAY);
      default:
        return JavaPrimitiveType.VOID;
    }
  }

  @SuppressWarnings("PMD.EmptyIfStmt")
  private static JavaType mapDerived(final JavaPackage basePackage, final FTypeRef type) {
    FType derived = type.getDerived();

    // types without a parent are not valid
    if (derived.eContainer() == null) {
      //TODO: return reportInvalidType(api, type);
    }
    if (derived instanceof FTypeDef) {
      return mapTypeDef(basePackage, (FTypeDef) derived);
    }
    if (derived instanceof FArrayType) {
      //TODO: return mapArray(api, (FArrayType) derived);
    }
    if (derived instanceof FMapType) {
      //TODO: return mapMap(api, (FMapType) derived);
    }
    if (derived instanceof FStructType) {
      return mapStruct(basePackage, (FStructType) derived);
    }
    if (derived instanceof FEnumerationType) {
      //TODO: return mapEnum(api, (FEnumerationType) derived);
    }

    return new JavaCustomType("TODO");
  }

  private static JavaCustomType mapStruct(
      final JavaPackage basePackage, final FStructType structType) {

    FTypeCollection typeCollection = DefinedBy.findDefiningTypeCollection(structType);
    List<String> packageNames =
        basePackage.createChildPackage(DefinedBy.getPackages(typeCollection)).packageNames;

    String structName;
    String importClassName;
    String className = JavaNameRules.getClassName(structType.getName());

    //struct is nested class inside defining class
    if (typeCollection instanceof FInterface) {
      importClassName = JavaNameRules.getClassName(typeCollection.getName());
      structName = importClassName + "." + className;
    } else { // struct from a type collection
      importClassName = className;
      structName = String.join(".", packageNames) + "." + className;
    }

    JavaImport javaImport = new JavaImport(importClassName, new JavaPackage(packageNames));

    return new JavaCustomType(structName, className, Collections.singletonList(javaImport));
  }

  private static JavaType mapTypeDef(final JavaPackage basePackage, final FTypeDef typeDef) {

    if (InstanceRules.isInstanceId(typeDef)) {
      FTypeCollection typeCollection = DefinedBy.findDefiningTypeCollection(typeDef);
      List<String> packageNames =
          basePackage.createChildPackage(DefinedBy.getPackages(typeCollection)).packageNames;
      String className = JavaNameRules.getClassName(typeCollection.getName());
      JavaImport classImport = new JavaImport(className, new JavaPackage(packageNames));

      return new JavaCustomType(className, Collections.singletonList(classImport));

    } else {
      // TODO APIGEN-441 Replace this when typedef support is implemented
      return map(basePackage, typeDef.getActualType());
    }
  }
}
