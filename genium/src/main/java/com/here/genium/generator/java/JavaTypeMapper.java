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

package com.here.genium.generator.java;

import com.here.genium.cli.GeniumExecutionException;
import com.here.genium.common.FrancaTypeHelper;
import com.here.genium.model.common.InstanceRules;
import com.here.genium.model.franca.DefinedBy;
import com.here.genium.model.java.*;
import java.util.LinkedList;
import java.util.List;
import lombok.Getter;
import org.eclipse.emf.ecore.EObject;
import org.franca.core.framework.FrancaHelpers;
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

  public JavaType map(final FTypeRef francaTypRef) {

    JavaType javaType =
        francaTypRef.getDerived() != null
            ? mapDerived(francaTypRef.getDerived())
            : mapPredefined(francaTypRef.getPredefined());

    if (FrancaTypeHelper.isImplicitArray(francaTypRef)) {
      javaType = JavaTemplateType.wrapInList(javaType);
    }

    if (notNullAnnotation != null && needsNotNullAnnotation(francaTypRef)) {
      javaType.annotations.add(notNullAnnotation);
    }

    return javaType;
  }

  private static JavaType mapPredefined(final FBasicTypeId basicTypeId) {
    switch (basicTypeId) {
      case BOOLEAN:
        return JavaPrimitiveType.BOOL;
      case FLOAT:
        return JavaPrimitiveType.FLOAT;
      case DOUBLE:
        return JavaPrimitiveType.DOUBLE;
      case INT8:
        return JavaPrimitiveType.BYTE;
      case INT16:
      case UINT8:
        return JavaPrimitiveType.SHORT;
      case INT32:
      case UINT16:
        return JavaPrimitiveType.INT;
      case INT64:
      case UINT32:
      case UINT64:
        return JavaPrimitiveType.LONG;
      case STRING:
        return new JavaReferenceType(JavaReferenceType.Type.STRING);
      case BYTE_BUFFER:
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

    throw new GeniumExecutionException("Unmapped derived type: " + francaType.getName());
  }

  public JavaType mapArray(final FArrayType arrayType) {
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

  public JavaExceptionType mapExceptionType(final FEnumerationType francaEnum) {

    String exceptionName = JavaNameRules.getExceptionName(francaEnum.getName());
    FTypeCollection typeCollection = DefinedBy.findDefiningTypeCollection(francaEnum);
    JavaPackage javaPackage =
        new JavaPackage(
            basePackage.createChildPackage(DefinedBy.getPackages(typeCollection)).packageNames);

    String importClassName;
    List<String> classNames = new LinkedList<>();
    classNames.add(exceptionName);
    // type is nested inside defining class
    if (typeCollection instanceof FInterface) {
      importClassName = JavaNameRules.getClassName(typeCollection.getName());
      classNames.add(0, importClassName);
    } else { // non-nested type
      importClassName = exceptionName;
    }

    JavaImport javaImport = new JavaImport(importClassName, javaPackage);
    return new JavaExceptionType(String.join(".", classNames), classNames, javaImport);
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

  private boolean needsNotNullAnnotation(final FTypeRef francaTypeRef) {

    EObject parentElement = francaTypeRef.eContainer();
    FType actualDerived = FrancaHelpers.getActualDerived(francaTypeRef);

    return (parentElement instanceof FField
            || parentElement instanceof FArgument
            || parentElement instanceof FAttribute)
        && (actualDerived instanceof FStructType
            || actualDerived instanceof FEnumerationType
            || actualDerived instanceof FArrayType
            || actualDerived instanceof FMapType
            || ((FTypedElement) parentElement).isArray());
  }
}
