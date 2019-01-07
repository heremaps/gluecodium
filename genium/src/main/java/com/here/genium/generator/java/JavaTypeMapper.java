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
import com.here.genium.model.franca.FrancaDeploymentModel;
import com.here.genium.model.java.JavaArrayType;
import com.here.genium.model.java.JavaCustomType;
import com.here.genium.model.java.JavaEnumType;
import com.here.genium.model.java.JavaExceptionType;
import com.here.genium.model.java.JavaImport;
import com.here.genium.model.java.JavaPackage;
import com.here.genium.model.java.JavaPrimitiveType;
import com.here.genium.model.java.JavaReferenceType;
import com.here.genium.model.java.JavaTemplateType;
import com.here.genium.model.java.JavaType;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import org.eclipse.emf.ecore.EObject;
import org.franca.core.framework.FrancaHelpers;
import org.franca.core.franca.FArgument;
import org.franca.core.franca.FArrayType;
import org.franca.core.franca.FAttribute;
import org.franca.core.franca.FBasicTypeId;
import org.franca.core.franca.FEnumerationType;
import org.franca.core.franca.FField;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FMapType;
import org.franca.core.franca.FModelElement;
import org.franca.core.franca.FStructType;
import org.franca.core.franca.FType;
import org.franca.core.franca.FTypeCollection;
import org.franca.core.franca.FTypeDef;
import org.franca.core.franca.FTypeRef;
import org.franca.core.franca.FTypedElement;

/**
 * Maps Franca type references to their Java counterparts. These references are used as parameters,
 * in typedefs, array members etc.
 */
@SuppressWarnings("PMD.GodClass")
public class JavaTypeMapper {

  private static final String NATIVE_BASE_NAME = "NativeBase";

  private final JavaPackage basePackage;
  private final JavaType nativeBase;
  private final JavaType serializationBase;
  private final JavaType notNullAnnotation;
  private final JavaType nullableAnnotation;

  public JavaTypeMapper(
      final JavaPackage basePackage,
      final JavaType serializationBase,
      final JavaType notNullAnnotation,
      final JavaType nullableAnnotation) {
    this.basePackage = basePackage;
    this.nativeBase = new JavaCustomType(NATIVE_BASE_NAME, basePackage);
    this.serializationBase = serializationBase;
    this.notNullAnnotation = notNullAnnotation;
    this.nullableAnnotation = nullableAnnotation;
  }

  public JavaType map(final FTypeRef francaTypRef, final FrancaDeploymentModel deploymentModel) {

    JavaType javaType = mapTypeReference(francaTypRef);

    if (FrancaTypeHelper.isImplicitArray(francaTypRef)) {
      javaType = JavaTemplateType.wrapInList(javaType);
    }
    if (nullableAnnotation != null && needsNullableAnnotation(francaTypRef, deploymentModel)) {
      if (javaType instanceof JavaPrimitiveType) {
        javaType = JavaReferenceType.boxPrimitiveType((JavaPrimitiveType) javaType);
      }
      javaType.annotations.add(nullableAnnotation);
    }
    if (notNullAnnotation != null && needsNotNullAnnotation(francaTypRef, deploymentModel)) {
      javaType.annotations.add(notNullAnnotation);
    }

    return javaType;
  }

  private JavaType mapTypeReference(final FTypeRef francaTypRef) {
    return francaTypRef.getDerived() != null
        ? mapDerived(francaTypRef.getDerived())
        : mapPredefined(francaTypRef.getPredefined());
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
    return JavaTemplateType.wrapInList(mapTypeReference(arrayType.getElementType()));
  }

  public JavaType mapMap(final FMapType francaMapType) {
    JavaType keyType = mapTypeReference(francaMapType.getKeyType());
    JavaType valueType = mapTypeReference(francaMapType.getValueType());

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
        basePackage.createChildPackage(DefinedBy.getPackages(typeCollection)).getPackageNames();

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
      return new JavaCustomType(
          typeName, classNames, packageNames, Collections.singletonList(javaImport));
    }
  }

  public JavaExceptionType mapExceptionType(final FEnumerationType francaEnum) {

    String exceptionName = JavaNameRules.getExceptionName(francaEnum.getName());
    FTypeCollection typeCollection = DefinedBy.findDefiningTypeCollection(francaEnum);
    JavaPackage javaPackage =
        new JavaPackage(
            basePackage
                .createChildPackage(DefinedBy.getPackages(typeCollection))
                .getPackageNames());

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
          basePackage.createChildPackage(DefinedBy.getPackages(typeCollection)).getPackageNames();
      String className = JavaNameRules.getClassName(typeCollection.getName());
      JavaImport classImport = new JavaImport(className, new JavaPackage(packageNames));

      return new JavaCustomType(
          className, null, packageNames, Collections.singletonList(classImport), true);
    } else {
      return mapTypeReference(typeDef.getActualType());
    }
  }

  private boolean needsNotNullAnnotation(
      final FTypeRef francaTypeRef, final FrancaDeploymentModel deploymentModel) {

    EObject parentElement = francaTypeRef.eContainer();
    if (!isNullableElement(parentElement)) {
      return false;
    }

    FTypedElement typedElement = (FTypedElement) parentElement;
    if (deploymentModel.isNotNull(typedElement)) {
      return true;
    }
    if (deploymentModel.isNullable(typedElement)) {
      return false;
    }

    FType actualDerived = FrancaHelpers.getActualDerived(francaTypeRef);
    return actualDerived instanceof FStructType
        || actualDerived instanceof FEnumerationType
        || actualDerived instanceof FArrayType
        || actualDerived instanceof FMapType
        || typedElement.isArray();
  }

  private boolean needsNullableAnnotation(
      final FTypeRef francaTypeRef, final FrancaDeploymentModel deploymentModel) {

    EObject parentElement = francaTypeRef.eContainer();
    if (!isNullableElement(parentElement)) {
      return false;
    }

    FTypedElement typedElement = (FTypedElement) parentElement;
    if (deploymentModel.isNullable(typedElement)) {
      return true;
    }
    if (deploymentModel.isNotNull(typedElement)) {
      return false;
    }

    return !typedElement.isArray() && InstanceRules.isInstanceId(francaTypeRef);
  }

  @SuppressWarnings("BooleanMethodIsAlwaysInverted")
  private boolean isNullableElement(final EObject francaElement) {
    return francaElement instanceof FField
        || francaElement instanceof FArgument
        || francaElement instanceof FAttribute;
  }

  public JavaType getNativeBase() {
    return this.nativeBase;
  }

  public JavaType getSerializationBase() {
    return this.serializationBase;
  }
}
