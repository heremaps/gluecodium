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

package com.here.genium.generator.cpp;

import com.here.genium.cli.GeniumExecutionException;
import com.here.genium.model.common.InstanceRules;
import com.here.genium.model.cpp.*;
import java.util.Collections;
import org.franca.core.franca.*;

/**
 * Maps Franca type references to their C++ counterparts. These references are used as parameters,
 * in typedefs, array members etc.
 */
public class CppTypeMapper {

  private static final CppTypeRef BASIC_STRING_CHAR_TYPE =
      CppTemplateTypeRef.Companion.create(
          CppTemplateTypeRef.TemplateClass.BASIC_STRING, CppPrimitiveTypeRef.Companion.getCHAR());

  public static final CppTypeRef STD_ERROR_CODE_TYPE =
      new CppComplexTypeRef(
          "::std::error_code", Collections.singletonList(CppLibraryIncludes.SYSTEM_ERROR));

  public static final CppTypeRef STRING_TYPE =
      new CppTypeDefRef("::std::string", BASIC_STRING_CHAR_TYPE.includes, BASIC_STRING_CHAR_TYPE);

  private static final String ENUM_HASH_CLASS_NAME = "EnumHash";

  private final CppIncludeResolver includeResolver;
  private final CppNameResolver nameResolver;
  private final String internalNamespace;

  public CppTypeMapper(
      final CppIncludeResolver includeResolver,
      final CppNameResolver nameResolver,
      final String internalNamespace) {
    this.includeResolver = includeResolver;
    this.nameResolver = nameResolver;
    this.internalNamespace = internalNamespace;
  }

  public CppTypeRef getEnumHashType() {
    String name = CppNameRules.joinFullyQualifiedName(internalNamespace, ENUM_HASH_CLASS_NAME);
    return new CppComplexTypeRef(name, Collections.singletonList(CppLibraryIncludes.ENUM_HASH));
  }

  public CppTypeRef getReturnWrapperType(final CppTypeRef outArgType, final CppTypeRef errorType) {
    return CppTemplateTypeRef.Companion.create(
        internalNamespace, CppTemplateTypeRef.TemplateClass.RETURN, outArgType, errorType);
  }

  public CppTypeRef getByteBufferType() {
    CppTypeRef byteBufferType =
        CppTemplateTypeRef.Companion.create(
            CppTemplateTypeRef.TemplateClass.VECTOR, CppPrimitiveTypeRef.Companion.getUINT8());
    return CppTemplateTypeRef.Companion.create(
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

  private CppTypeRef mapTypeDef(final FTypeDef francaTypeDef) {

    if (InstanceRules.isInstanceId(francaTypeDef)) {
      String fullyQualifiedName =
          nameResolver.getFullyQualifiedName((FInterface) francaTypeDef.eContainer());
      CppComplexTypeRef instanceType = new CppInstanceTypeRef(fullyQualifiedName);
      instanceType.includes.add(includeResolver.resolveInclude(francaTypeDef));

      return CppTemplateTypeRef.Companion.create(
          CppTemplateTypeRef.TemplateClass.SHARED_POINTER, instanceType);
    } else {

      String fullyQualifiedName = nameResolver.getFullyQualifiedName(francaTypeDef);
      CppTypeRef actualType = map(francaTypeDef.getActualType());

      return new CppTypeDefRef(
          fullyQualifiedName,
          Collections.singletonList(includeResolver.resolveInclude(francaTypeDef)),
          actualType);
    }
  }

  private CppTypeRef mapArray(final FArrayType francaArrayType) {

    String fullyQualifiedName = nameResolver.getFullyQualifiedName(francaArrayType);
    CppTypeRef elementType = map(francaArrayType.getElementType());
    CppTypeRef arrayType =
        CppTemplateTypeRef.Companion.create(CppTemplateTypeRef.TemplateClass.VECTOR, elementType);

    return new CppTypeDefRef(
        fullyQualifiedName,
        Collections.singletonList(includeResolver.resolveInclude(francaArrayType)),
        arrayType);
  }

  private CppTypeRef mapMapType(final FMapType francaMapType) {

    String fullyQualifiedName = nameResolver.getFullyQualifiedName(francaMapType);
    CppTypeRef mapType =
        wrapMap(map(francaMapType.getKeyType()), map(francaMapType.getValueType()));

    return new CppTypeDefRef(
        fullyQualifiedName,
        Collections.singletonList(includeResolver.resolveInclude(francaMapType)),
        mapType);
  }

  public CppTypeRef wrapMap(final CppTypeRef key, final CppTypeRef value) {
    if (key.getRefersToEnumType()) {
      return CppTemplateTypeRef.Companion.create(
          CppTemplateTypeRef.TemplateClass.MAP, key, value, getEnumHashType());
    } else {
      return CppTemplateTypeRef.Companion.create(CppTemplateTypeRef.TemplateClass.MAP, key, value);
    }
  }

  public CppTypeRef mapComplexType(final FModelElement francaElement) {

    return new CppComplexTypeRef(
        nameResolver.getFullyQualifiedName(francaElement),
        Collections.singletonList(includeResolver.resolveInclude(francaElement)),
        francaElement instanceof FEnumerationType);
  }

  private CppTypeRef mapPredefined(final FTypeRef type) {

    switch (type.getPredefined().getValue()) {
      case FBasicTypeId.BOOLEAN_VALUE:
        return CppPrimitiveTypeRef.Companion.getBOOL();

      case FBasicTypeId.FLOAT_VALUE:
        return CppPrimitiveTypeRef.Companion.getFLOAT();

      case FBasicTypeId.DOUBLE_VALUE:
        return CppPrimitiveTypeRef.Companion.getDOUBLE();

      case FBasicTypeId.INT8_VALUE:
        return CppPrimitiveTypeRef.Companion.getINT8();

      case FBasicTypeId.INT16_VALUE:
        return CppPrimitiveTypeRef.Companion.getINT16();

      case FBasicTypeId.INT32_VALUE:
        return CppPrimitiveTypeRef.Companion.getINT32();

      case FBasicTypeId.INT64_VALUE:
        return CppPrimitiveTypeRef.Companion.getINT64();

      case FBasicTypeId.UINT8_VALUE:
        return CppPrimitiveTypeRef.Companion.getUINT8();

      case FBasicTypeId.UINT16_VALUE:
        return CppPrimitiveTypeRef.Companion.getUINT16();

      case FBasicTypeId.UINT32_VALUE:
        return CppPrimitiveTypeRef.Companion.getUINT32();

      case FBasicTypeId.UINT64_VALUE:
        return CppPrimitiveTypeRef.Companion.getUINT64();

      case FBasicTypeId.STRING_VALUE:
        return STRING_TYPE;

      case FBasicTypeId.BYTE_BUFFER_VALUE:
        return getByteBufferType();

      case FBasicTypeId.UNDEFINED_VALUE:
        return CppPrimitiveTypeRef.Companion.getVOID();

      default:
        throw new GeniumExecutionException(
            "unmapped predefined [" + type.getPredefined().getName() + "]");
    }
  }
}
