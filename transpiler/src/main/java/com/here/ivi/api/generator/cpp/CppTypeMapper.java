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

package com.here.ivi.api.generator.cpp;

import com.google.common.annotations.VisibleForTesting;
import com.here.ivi.api.cli.TranspilerExecutionException;
import com.here.ivi.api.model.common.InstanceRules;
import com.here.ivi.api.model.cpp.*;
import org.franca.core.franca.*;

/**
 * Maps Franca type references to their C++ counterparts. These references are used as parameters,
 * in typedefs, array members etc.
 */
public class CppTypeMapper {

  private static final CppTypeRef BASIC_STRING_CHAR_TYPE =
      CppTemplateTypeRef.create(
          CppTemplateTypeRef.TemplateClass.BASIC_STRING, CppPrimitiveTypeRef.CHAR);

  public static final CppTypeRef HF_ERROR_TYPE =
      new CppComplexTypeRef.Builder("::hf::Error").include(CppLibraryIncludes.HF_ERROR).build();

  @VisibleForTesting
  static final CppTypeRef ENUM_HASH_TYPE =
      new CppComplexTypeRef.Builder("::hf::EnumHash").include(CppLibraryIncludes.ENUM_HASH).build();

  public static final CppTypeRef STRING_TYPE =
      new CppTypeDefRef("::std::string", BASIC_STRING_CHAR_TYPE, BASIC_STRING_CHAR_TYPE.includes);

  private final CppIncludeResolver includeResolver;

  public CppTypeMapper(final CppIncludeResolver includeResolver) {
    this.includeResolver = includeResolver;
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
    if (derived instanceof FCompoundType) {
      return mapComplexType(derived);
    }
    if (derived instanceof FEnumerationType) {
      return mapEnum((FEnumerationType) derived);
    }
    throw new TranspilerExecutionException("Unmapped derived type: " + derived.getName());
  }

  private CppTypeRef mapTypeDef(FTypeDef typedef) {
    String fullyQualifiedName = CppNameRules.getFullyQualifiedName(typedef);

    if (InstanceRules.isInstanceId(typedef)) {
      CppComplexTypeRef instanceType =
          new CppComplexTypeRef.Builder(fullyQualifiedName)
              .include(includeResolver.resolveInclude(typedef))
              .build();

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

  public static CppComplexTypeRef wrapMap(CppTypeRef key, CppTypeRef value) {
    if (key.refersToEnumType()) {
      return CppTemplateTypeRef.create(
          CppTemplateTypeRef.TemplateClass.MAP, key, value, ENUM_HASH_TYPE);
    } else {
      return CppTemplateTypeRef.create(CppTemplateTypeRef.TemplateClass.MAP, key, value);
    }
  }

  public CppTypeRef mapComplexType(final FModelElement francaElement) {

    String fullyQualifiedName = CppNameRules.getFullyQualifiedName(francaElement);

    return new CppComplexTypeRef.Builder(fullyQualifiedName)
        .include(includeResolver.resolveInclude(francaElement))
        .build();
  }

  public CppTypeRef mapEnum(FEnumerationType enumeration) {

    String fullyQualifiedName = CppNameRules.getFullyQualifiedName(enumeration);

    return new CppComplexTypeRef.Builder(fullyQualifiedName)
        .refersToEnum(true)
        .include(includeResolver.resolveInclude(enumeration))
        .build();
  }

  private static CppTypeRef mapPredefined(final FTypeRef type) {

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
        return CppTemplateTypeRef.create(
            CppTemplateTypeRef.TemplateClass.VECTOR, CppPrimitiveTypeRef.UINT8);

      case FBasicTypeId.UNDEFINED_VALUE:
        return CppPrimitiveTypeRef.VOID;

      default:
        throw new TranspilerExecutionException(
            "unmapped predefined [" + type.getPredefined().getName() + "]");
    }
  }
}
