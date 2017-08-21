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

package com.here.ivi.api.generator.common.java;

import com.here.ivi.api.TranspilerExecutionException;
import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.franca.ModelInfo;
import com.here.ivi.api.model.javamodel.JavaCustomType;
import com.here.ivi.api.model.javamodel.JavaImport;
import com.here.ivi.api.model.javamodel.JavaPackage;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType.Type;
import com.here.ivi.api.model.javamodel.JavaReferenceType;
import com.here.ivi.api.model.javamodel.JavaType;
import java.util.Collections;
import java.util.List;
import org.franca.core.franca.FArrayType;
import org.franca.core.franca.FBasicTypeId;
import org.franca.core.franca.FEnumerationType;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FMapType;
import org.franca.core.franca.FModel;
import org.franca.core.franca.FStructType;
import org.franca.core.franca.FType;
import org.franca.core.franca.FTypeDef;
import org.franca.core.franca.FTypeRef;

public final class JavaTypeMapper {
  private JavaTypeMapper() {}

  public static JavaPackage createJavaPackage(final JavaPackage basePackage, final FModel fModel) {
    ModelInfo info = new ModelInfo(fModel);
    return basePackage.createChildPackage(info.getPackageNames());
  }

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

    return new JavaPrimitiveType(Type.VOID);
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
        return new JavaPrimitiveType(Type.VOID);
    }
  }

  private static JavaType mapDerived(final JavaPackage basePackage, final FTypeRef type) {
    FType derived = type.getDerived();

    // types without a parent are not valid
    if (derived.eContainer() == null) {
      //TODO: return reportInvalidType(api, type);
    }

    if (derived instanceof FTypeDef) {
      // TODO APIGEN-439 Replace this when typedef support is implemented
      return map(basePackage, ((FTypeDef) derived).getActualType());
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

    DefinedBy definer = DefinedBy.createFromFModelElement(structType);
    List<String> packageNames = createJavaPackage(basePackage, definer.model).packageNames;

    String structName;
    String importClassName;
    String className = JavaNameRules.getClassName(structType.getName());

    //struct is nested class inside defining class
    if (definer.type instanceof FInterface) {
      importClassName = JavaNameRules.getClassName(definer.type.getName());
      structName = importClassName + "." + className;
    } else { // struct from a type collection
      importClassName = className;
      structName = className;
      String typeCollectionName = definer.type.getName();
      String packageName = JavaNameRules.getTypeCollectionName(typeCollectionName);
      packageNames.add(packageName);
    }

    JavaImport javaImport = new JavaImport(importClassName, new JavaPackage(packageNames));
    if (!className.equals(structName)) {
      return new JavaCustomType(structName, className, Collections.singletonList(javaImport));
    }
    return new JavaCustomType(structName, Collections.singletonList(javaImport));
  }
}
