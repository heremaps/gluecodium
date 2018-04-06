/*
 * Copyright (c) 2016-2018 HERE Europe B.V.
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

package com.here.ivi.api.generator.java;

import com.here.ivi.api.common.FrancaTypeHelper;
import com.here.ivi.api.model.common.InstanceRules;
import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.java.*;
import java.util.LinkedList;
import java.util.List;
import lombok.Getter;
import org.franca.core.franca.*;

/**
 * Maps Franca type references to their Java counterparts. These references are used as parameters,
 * in typedefs, array members etc.
 */
public class JavaTypeMapper {

  private static final String NATIVE_BASE_NAME = "NativeBase";

  private final JavaPackage basePackage;
  @Getter private final JavaType nativeBase;
  @Getter private final JavaType serializationBase;
  @Getter private final JavaType notNullAnnotation;

  public JavaTypeMapper(
      final JavaPackage basePackage,
      final JavaType serializationBase,
      final JavaType notNullAnnotation) {
    this.basePackage = basePackage;
    this.nativeBase = new JavaCustomType(NATIVE_BASE_NAME, basePackage);
    this.serializationBase = serializationBase;
    this.notNullAnnotation = notNullAnnotation;
  }

  public JavaType map(final FTypeRef fTypeRef) {

    JavaType javaType =
        fTypeRef.getDerived() != null
            ? mapDerived(fTypeRef.getDerived())
            : mapPredefined(fTypeRef.getPredefined());

    if (FrancaTypeHelper.isImplicitArray(fTypeRef)) {
      javaType = JavaTemplateType.wrapInList(javaType);
    }

    return javaType;
  }

  private static JavaType mapPredefined(final FBasicTypeId basicTypeId) {
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
        return new JavaArrayType(JavaPrimitiveType.Type.BYTE);

      default:
        return JavaPrimitiveType.VOID;
    }
  }

  private JavaType mapDerived(final FType francaType) {

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

  public JavaTemplateType mapArray(FArrayType arrayType) {
    return JavaTemplateType.wrapInList(map(arrayType.getElementType()));
  }

  public JavaType mapMap(final FMapType francaMapType) {
    JavaType keyType = map(francaMapType.getKeyType());
    JavaType valueType = map(francaMapType.getValueType());

    if (keyType instanceof JavaPrimitiveType) {
      keyType = JavaReferenceType.boxPrimitiveType((JavaPrimitiveType) keyType);
    }
    if (valueType instanceof JavaPrimitiveType) {
      valueType = JavaReferenceType.boxPrimitiveType((JavaPrimitiveType) valueType);
    }

    return JavaTemplateType.create(JavaTemplateType.TemplateClass.MAP, keyType, valueType);
  }

  public JavaType mapCustomType(final FModelElement francaElement) {

    return mapCustomType(francaElement, JavaNameRules.getClassName(francaElement.getName()));
  }

  public JavaType mapCustomType(final FModelElement francaElement, final String className) {

    FTypeCollection typeCollection = DefinedBy.findDefiningTypeCollection(francaElement);
    List<String> packageNames =
        basePackage.createChildPackage(DefinedBy.getPackages(typeCollection)).packageNames;

    String typeName;
    String importClassName;

    List<String> classNames = new LinkedList<>();
    classNames.add(className);
    // type is nested inside defining class
    if (!(francaElement instanceof FInterface) && typeCollection instanceof FInterface) {
      importClassName = JavaNameRules.getClassName(typeCollection.getName());
      classNames.add(0, importClassName);
      typeName = importClassName + "." + className;
    } else { // non-nested type
      importClassName = className;
      typeName = className;
    }

    JavaImport javaImport = new JavaImport(importClassName, new JavaPackage(packageNames));

    if (francaElement instanceof FEnumerationType) {
      return new JavaEnumType(typeName, classNames, packageNames, javaImport);
    } else {
      return JavaCustomType.builder(typeName)
          .classNames(classNames)
          .packageNames(packageNames)
          .javaImport(javaImport)
          .build();
    }
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
          .javaImport(classImport)
          .isInterface(true)
          .build();
    } else {
      return map(typeDef.getActualType());
    }
  }
}
