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
import com.here.ivi.api.common.FrancaTypeHelper;
import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.javamodel.*;
import com.here.ivi.api.model.rules.InstanceRules;
import java.util.LinkedList;
import java.util.List;
import org.franca.core.franca.*;

/**
 * Maps Franca type references to their Java counterparts. These references are used as parameters,
 * in typedefs, array members etc.
 */

//TODO APIGEN-863: remove this
@SuppressWarnings("PMD.GodClass")
public class JavaTypeMapper {

  private final JavaPackage basePackage;

  public JavaTypeMapper(final JavaPackage basePackage) {
    this.basePackage = basePackage;
  }

  public JavaType map(final FTypeRef fTypeRef) {

    JavaType javaType = JavaPrimitiveType.VOID;
    if (fTypeRef.getDerived() != null) {
      javaType = mapFrancaType(fTypeRef.getDerived());
    } else if (fTypeRef.getPredefined() != FBasicTypeId.UNDEFINED) {
      javaType = mapFrancaBasicType(fTypeRef.getPredefined());
    } else if (fTypeRef.getInterval() != null) {
      throw new TranspilerExecutionException(
          "The transpiler does not support integer ranges. "
              + "Please use regular Integer types like Int64 instead. Type: "
              + fTypeRef);
    }

    if (FrancaTypeHelper.isImplicitArray(fTypeRef)) {
      if (javaType instanceof JavaPrimitiveType) {
        javaType = boxPrimitiveType((JavaPrimitiveType) javaType);
      }
      javaType = JavaTemplateType.create(JavaTemplateType.TemplateClass.LIST, javaType);
    }

    return javaType;
  }

  private static JavaType mapFrancaBasicType(final FBasicTypeId basicTypeId) {
    switch (basicTypeId.getValue()) {
      case FBasicTypeId.BOOLEAN_VALUE:
        return JavaPrimitiveType.BOOL;

      case FBasicTypeId.FLOAT_VALUE:
        return JavaPrimitiveType.FLOAT;

      case FBasicTypeId.DOUBLE_VALUE:
        return JavaPrimitiveType.DOUBLE;

      case FBasicTypeId.INT8_VALUE:
        return JavaPrimitiveType.BYTE;

      case FBasicTypeId.INT16_VALUE:
        return JavaPrimitiveType.SHORT;

      case FBasicTypeId.INT32_VALUE:
        return JavaPrimitiveType.INT;

      case FBasicTypeId.INT64_VALUE:
        return JavaPrimitiveType.LONG;

      case FBasicTypeId.UINT8_VALUE:
      case FBasicTypeId.UINT16_VALUE:
      case FBasicTypeId.UINT32_VALUE:
      case FBasicTypeId.UINT64_VALUE:
        // TODO: APIGEN-217 figure out how to handle unsigned ints
        return JavaPrimitiveType.LONG;

      case FBasicTypeId.STRING_VALUE:
        return new JavaReferenceType(JavaReferenceType.Type.STRING);

      case FBasicTypeId.BYTE_BUFFER_VALUE:
        return new JavaArrayType(JavaArrayType.Type.BYTE_ARRAY);

      default:
        return JavaPrimitiveType.VOID;
    }
  }

  @SuppressWarnings("PMD.EmptyIfStmt")
  private JavaType mapFrancaType(final FType francaType) {

    if (francaType instanceof FTypeDef) {
      return mapTypeDef((FTypeDef) francaType);
    }
    if (francaType instanceof FArrayType) {
      return mapArray((FArrayType) francaType);
    }
    if (francaType instanceof FMapType) {
      return mapMap((FMapType) francaType);
    }
    if (francaType instanceof FStructType) {
      return mapCustomType(francaType);
    }
    if (francaType instanceof FEnumerationType) {
      return mapCustomType(francaType);
    }

    return new JavaCustomType("TODO");
  }

  /**
   * Wrap primitive types since generic templates don't apply to them
   *
   * @param primitiveType a primitive type
   * @return custom type wrapper of the primitive type
   */
  private static JavaReferenceType boxPrimitiveType(JavaPrimitiveType primitiveType) {
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
      throw new TranspilerExecutionException("Can not wrap primitive type " + primitiveType.name);
    }
  }

  public JavaType mapArray(FArrayType arrayType) {
    JavaType elementType = map(arrayType.getElementType());

    if (elementType instanceof JavaPrimitiveType) {
      elementType = boxPrimitiveType((JavaPrimitiveType) elementType);
    }

    return JavaTemplateType.create(JavaTemplateType.TemplateClass.LIST, elementType);
  }

  public JavaType mapMap(final FMapType francaMapType) {
    JavaType keyType = map(francaMapType.getKeyType());
    JavaType valueType = map(francaMapType.getValueType());

    if (keyType instanceof JavaPrimitiveType) {
      keyType = boxPrimitiveType((JavaPrimitiveType) keyType);
    }
    if (valueType instanceof JavaPrimitiveType) {
      valueType = boxPrimitiveType((JavaPrimitiveType) valueType);
    }

    return JavaTemplateType.create(JavaTemplateType.TemplateClass.MAP, keyType, valueType);
  }

  public JavaType mapCustomType(final FType fType) {

    FTypeCollection typeCollection = DefinedBy.findDefiningTypeCollection(fType);
    List<String> packageNames =
        basePackage.createChildPackage(DefinedBy.getPackages(typeCollection)).packageNames;

    String typeName;
    String importClassName;
    String className = JavaNameRules.getClassName(fType.getName());

    List<String> classNames = new LinkedList<>();
    classNames.add(className);
    //type is nested class inside defining class
    if (typeCollection instanceof FInterface) {
      importClassName = JavaNameRules.getClassName(typeCollection.getName());
      classNames.add(0, importClassName);
      typeName = importClassName + "." + className;
    } else { // type from a type collection
      importClassName = className;
      typeName = className;
    }

    JavaImport javaImport = new JavaImport(importClassName, new JavaPackage(packageNames));

    if (fType instanceof FStructType) {
      return JavaCustomType.builder(typeName)
          .classNames(classNames)
          .packageNames(packageNames)
          .anImport(javaImport)
          .build();
    }
    if (fType instanceof FEnumerationType) {
      return new JavaEnumType(
          typeName,
          classNames,
          packageNames,
          javaImport,
          JavaValueMapper.createEnumInitializerValue(typeName, (FEnumerationType) fType));
    }
    throw new TranspilerExecutionException("invalid Ftype: " + fType.getName());
  }

  private JavaType mapTypeDef(final FTypeDef typeDef) {

    if (InstanceRules.isInstanceId(typeDef)) {
      FTypeCollection typeCollection = DefinedBy.findDefiningTypeCollection(typeDef);
      List<String> packageNames =
          basePackage.createChildPackage(DefinedBy.getPackages(typeCollection)).packageNames;
      String className = JavaNameRules.getClassName(typeCollection.getName());
      JavaImport classImport = new JavaImport(className, new JavaPackage(packageNames));

      return JavaCustomType.builder(className)
          .className(className)
          .packageNames(packageNames)
          .anImport(classImport)
          .isNullable(true)
          .build();
    } else {
      return map(typeDef.getActualType());
    }
  }
}
