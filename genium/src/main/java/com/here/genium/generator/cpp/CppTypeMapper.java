/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
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

package com.here.genium.generator.cpp;

import com.here.genium.cli.GeniumExecutionException;
import com.here.genium.model.common.InstanceRules;
import com.here.genium.model.cpp.*;
import com.here.genium.model.franca.FrancaDeploymentModel;
import java.util.Collections;
import org.franca.core.franca.*;

/**
 * Maps Franca type references to their C++ counterparts. These references are used as parameters,
 * in typedefs, array members etc.
 */
public class CppTypeMapper {

  private static final CppTypeRef BASIC_STRING_CHAR_TYPE =
      CppTemplateTypeRef.create(
          CppTemplateTypeRef.TemplateClass.BASIC_STRING, CppPrimitiveTypeRef.CHAR);

  public static final CppTypeRef STD_ERROR_CODE_TYPE =
      new CppComplexTypeRef.Builder("::std::error_code")
          .include(CppLibraryIncludes.SYSTEM_ERROR)
          .build();

  public static final CppTypeRef STRING_TYPE =
      new CppTypeDefRef("::std::string", BASIC_STRING_CHAR_TYPE, BASIC_STRING_CHAR_TYPE.includes);

  private static final String ENUM_HASH_CLASS_NAME = "EnumHash";

  private final CppIncludeResolver includeResolver;
  private final FrancaDeploymentModel deploymentModel;
  private final String internalNamespace;

  public CppTypeMapper(
      final CppIncludeResolver includeResolver,
      final FrancaDeploymentModel deploymentModel,
      final String internalNamespace) {
    this.includeResolver = includeResolver;
    this.deploymentModel = deploymentModel;
    this.internalNamespace = internalNamespace;
  }

  public CppTypeRef getEnumHashType() {
    String name =
        CppNameRules.getFullyQualifiedName(
            Collections.singletonList(internalNamespace), ENUM_HASH_CLASS_NAME);
    return new CppComplexTypeRef.Builder(name).include(CppLibraryIncludes.ENUM_HASH).build();
  }

  public CppTypeRef getReturnWrapperType(final CppTypeRef outArgType, final CppTypeRef errorType) {
    return CppTemplateTypeRef.create(
        internalNamespace, CppTemplateTypeRef.TemplateClass.RETURN, outArgType, errorType);
  }

  public CppTypeRef getByteBufferType() {
    CppTypeRef byteBufferType =
        CppTemplateTypeRef.create(
            CppTemplateTypeRef.TemplateClass.VECTOR, CppPrimitiveTypeRef.UINT8);
    return CppTemplateTypeRef.create(
        CppTemplateTypeRef.TemplateClass.SHARED_POINTER, byteBufferType);
  }

  public CppTypeRef map(FTypeRef type) {

    return type.getDerived() != null ? mapDerived(type.getDerived()) : mapPredefined(type);
  }

  private CppTypeRef mapDerived(FType derived) {
    if (derived instanceof FTypeDef) {
      return mapTypeDef((FTypeDef) derived);
    }
    if (derived instanceof FArrayType) {
      return mapArray((FArrayType) derived);
    }
    if (derived instanceof FMapType) {
      return mapMapType((FMapType) derived);
    }
    if (derived instanceof FCompoundType || derived instanceof FEnumerationType) {
      return mapComplexType(derived);
    }
    throw new GeniumExecutionException("Unmapped derived type: " + derived.getName());
  }

  private CppTypeRef mapTypeDef(FTypeDef typedef) {
    String fullyQualifiedName = CppNameRules.getFullyQualifiedName(typedef);

    if (InstanceRules.isInstanceId(typedef)) {
      CppComplexTypeRef instanceType = new CppInstanceTypeRef(fullyQualifiedName);
      instanceType.includes.add(includeResolver.resolveInclude(typedef));

      return CppTemplateTypeRef.create(
          CppTemplateTypeRef.TemplateClass.SHARED_POINTER, instanceType);
    } else {

      CppTypeRef actualType = map(typedef.getActualType());

      return new CppTypeDefRef(
          fullyQualifiedName, actualType, includeResolver.resolveInclude(typedef));
    }
  }

  private CppTypeRef mapArray(final FArrayType francaArrayType) {

    String fullyQualifiedName = CppNameRules.getFullyQualifiedName(francaArrayType);
    CppTypeRef elementType = map(francaArrayType.getElementType());
    CppTypeRef arrayType =
        CppTemplateTypeRef.create(CppTemplateTypeRef.TemplateClass.VECTOR, elementType);

    return new CppTypeDefRef(
        fullyQualifiedName, arrayType, includeResolver.resolveInclude(francaArrayType));
  }

  private CppTypeRef mapMapType(final FMapType francaMapType) {

    String fullyQualifiedName = CppNameRules.getFullyQualifiedName(francaMapType);
    CppTypeRef mapType =
        wrapMap(map(francaMapType.getKeyType()), map(francaMapType.getValueType()));

    return new CppTypeDefRef(
        fullyQualifiedName, mapType, includeResolver.resolveInclude(francaMapType));
  }

  public CppTypeRef wrapMap(final CppTypeRef key, final CppTypeRef value) {
    if (key.refersToEnumType()) {
      return CppTemplateTypeRef.create(
          CppTemplateTypeRef.TemplateClass.MAP, key, value, getEnumHashType());
    } else {
      return CppTemplateTypeRef.create(CppTemplateTypeRef.TemplateClass.MAP, key, value);
    }
  }

  public CppTypeRef mapComplexType(final FModelElement francaElement) {

    String fullyQualifiedName;

    boolean isExternal = deploymentModel.isExternalType(francaElement);
    String externalName = deploymentModel.getExternalName(francaElement);
    fullyQualifiedName =
        CppNameRules.getFullyQualifiedName(francaElement, isExternal, externalName);

    return new CppComplexTypeRef.Builder(fullyQualifiedName)
        .refersToEnum(francaElement instanceof FEnumerationType)
        .include(includeResolver.resolveInclude(francaElement))
        .build();
  }

  private CppTypeRef mapPredefined(final FTypeRef type) {

    switch (type.getPredefined().getValue()) {
      case FBasicTypeId.BOOLEAN_VALUE:
        return CppPrimitiveTypeRef.BOOL;

      case FBasicTypeId.FLOAT_VALUE:
        return CppPrimitiveTypeRef.FLOAT;

      case FBasicTypeId.DOUBLE_VALUE:
        return CppPrimitiveTypeRef.DOUBLE;

      case FBasicTypeId.INT8_VALUE:
        return CppPrimitiveTypeRef.INT8;

      case FBasicTypeId.INT16_VALUE:
        return CppPrimitiveTypeRef.INT16;

      case FBasicTypeId.INT32_VALUE:
        return CppPrimitiveTypeRef.INT32;

      case FBasicTypeId.INT64_VALUE:
        return CppPrimitiveTypeRef.INT64;

      case FBasicTypeId.UINT8_VALUE:
        return CppPrimitiveTypeRef.UINT8;

      case FBasicTypeId.UINT16_VALUE:
        return CppPrimitiveTypeRef.UINT16;

      case FBasicTypeId.UINT32_VALUE:
        return CppPrimitiveTypeRef.UINT32;

      case FBasicTypeId.UINT64_VALUE:
        return CppPrimitiveTypeRef.UINT64;

      case FBasicTypeId.STRING_VALUE:
        return STRING_TYPE;

      case FBasicTypeId.BYTE_BUFFER_VALUE:
        return getByteBufferType();

      case FBasicTypeId.UNDEFINED_VALUE:
        return CppPrimitiveTypeRef.VOID;

      default:
        throw new GeniumExecutionException(
            "unmapped predefined [" + type.getPredefined().getName() + "]");
    }
  }
}
