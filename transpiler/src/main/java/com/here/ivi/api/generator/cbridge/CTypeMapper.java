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

package com.here.ivi.api.generator.cbridge;

import static com.here.ivi.api.generator.cbridge.CBridgeNameRules.BASE_HANDLE_IMPL_FILE;
import static com.here.ivi.api.generator.cbridge.CBridgeNameRules.BASE_REF_NAME;
import static com.here.ivi.api.generator.cbridge.CppTypeInfo.TypeCategory.*;
import static com.here.ivi.api.model.cbridge.CType.VOID;
import static com.here.ivi.api.model.common.InstanceRules.isInstanceId;

import com.here.ivi.api.common.FrancaTypeHelper;
import com.here.ivi.api.generator.cpp.CppLibraryIncludes;
import com.here.ivi.api.model.cbridge.CType;
import com.here.ivi.api.model.cbridge.IncludeResolver;
import com.here.ivi.api.model.common.Include;
import java.util.LinkedList;
import java.util.List;
import org.franca.core.franca.*;

public final class CTypeMapper {

  public static CppTypeInfo mapType(final IncludeResolver resolver, final FTypeRef typeRef) {
    FType derived = typeRef.getDerived();
    CppTypeInfo typeResult;
    if (derived != null) {
      typeResult = mapType(resolver, derived);
    } else {
      typeResult = mapPredefined(typeRef);
    }

    if (FrancaTypeHelper.isImplicitArray(typeRef)) {
      typeResult = CArrayMapper.createArrayReference(typeResult);
    }
    return typeResult;
  }

  private static CppTypeInfo mapType(IncludeResolver resolver, FType derived) {
    if (derived instanceof FStructType) {
      return createCustomTypeInfo(resolver, derived, STRUCT);
    } else if (derived instanceof FTypeDef) {
      return mapTypeDef(resolver, (FTypeDef) derived);
    } else if (derived instanceof FEnumerationType) {
      return createEnumTypeInfo(resolver, (FEnumerationType) derived);
    } else if (derived instanceof FArrayType) {
      CppTypeInfo innerType = mapType(resolver, ((FArrayType) derived).getElementType());
      return CArrayMapper.createArrayReference(innerType);
    } else if (derived instanceof FMapType) {
      return mapMapType(resolver, (FMapType) derived);
    } else {
      return new CppTypeInfo(VOID);
    }
  }

  private static CppTypeInfo mapTypeDef(IncludeResolver resolver, FTypeDef derived) {
    if (isInstanceId(derived)) {
      return createCustomTypeInfo(resolver, derived, CLASS);
    } else {
      return mapType(resolver, derived.getActualType());
    }
  }

  public static CppTypeInfo mapPredefined(final FTypeRef type) {
    FBasicTypeId typeId = type.getPredefined();
    switch (typeId.getValue()) {
      case FBasicTypeId.UNDEFINED_VALUE:
        return new CppTypeInfo(CType.VOID);
      case FBasicTypeId.INT8_VALUE:
        return new CppTypeInfo(CType.INT8);
      case FBasicTypeId.UINT8_VALUE:
        return new CppTypeInfo(CType.UINT8);
      case FBasicTypeId.INT16_VALUE:
        return new CppTypeInfo(CType.INT16);
      case FBasicTypeId.UINT16_VALUE:
        return new CppTypeInfo(CType.UINT16);
      case FBasicTypeId.INT32_VALUE:
        return new CppTypeInfo(CType.INT32);
      case FBasicTypeId.UINT32_VALUE:
        return new CppTypeInfo(CType.UINT32);
      case FBasicTypeId.INT64_VALUE:
        return new CppTypeInfo(CType.INT64);
      case FBasicTypeId.UINT64_VALUE:
        return new CppTypeInfo(CType.UINT64);
      case FBasicTypeId.BOOLEAN_VALUE:
        return new CppTypeInfo(CType.BOOL);
      case FBasicTypeId.FLOAT_VALUE:
        return new CppTypeInfo(CType.FLOAT);
      case FBasicTypeId.DOUBLE_VALUE:
        return new CppTypeInfo(CType.DOUBLE);
      case FBasicTypeId.STRING_VALUE:
        return CppTypeInfo.STRING;
      case FBasicTypeId.BYTE_BUFFER_VALUE:
        return CppTypeInfo.BYTE_VECTOR;
    }
    return new CppTypeInfo(VOID);
  }

  public static CppTypeInfo createCustomTypeInfo(
      final IncludeResolver resolver,
      final FModelElement elementType,
      final CppTypeInfo.TypeCategory category) {

    String baseApiName = CBridgeNameRules.getBaseApiName(elementType, category);
    String baseApiCall = CBridgeNameRules.getBaseApiCall(category, baseApiName);

    Include publicInclude =
        resolver.resolveInclude(elementType, IncludeResolver.HeaderType.CBRIDGE_PUBLIC_HEADER);
    Include privateInclude =
        resolver.resolveInclude(elementType, IncludeResolver.HeaderType.CBRIDGE_PRIVATE_HEADER);
    Include baseApiInclude =
        resolver.resolveInclude(elementType, IncludeResolver.HeaderType.BASE_API_HEADER);

    CType structCType = new CType(BASE_REF_NAME, publicInclude);

    return CppTypeInfo.builder(baseApiCall)
        .constructFromCType(structCType)
        .functionReturnType(structCType)
        .category(category)
        .include(publicInclude)
        .include(privateInclude)
        .include(baseApiInclude)
        .include(CppLibraryIncludes.MEMORY)
        .include(CppLibraryIncludes.NEW)
        .build();
  }

  public static CppTypeInfo createEnumTypeInfo(
      final IncludeResolver resolver, final FEnumerationType francaEnum) {

    CType enumCType =
        new CType(
            CBridgeNameRules.getEnumName(francaEnum),
            resolver.resolveInclude(francaEnum, IncludeResolver.HeaderType.CBRIDGE_PUBLIC_HEADER));

    return CppTypeInfo.builder(CBridgeNameRules.getBaseApiEnumName(francaEnum))
        .constructFromCType(enumCType)
        .functionReturnType(enumCType)
        .category(ENUM)
        .build();
  }

  public static CppTypeInfo createErrorTypeInfo(
      final IncludeResolver resolver, final FEnumerationType francaEnum) {
    CppTypeInfo errorEnumInfo = createEnumTypeInfo(resolver, francaEnum);
    errorEnumInfo.functionReturnType.includes.add(CType.BOOL_INCLUDE);
    return errorEnumInfo;
  }

  private static CppTypeInfo mapMapType(
      final IncludeResolver resolver, final FMapType francaMapType) {

    String baseApiName =
        CBridgeNameRules.getBaseApiName(francaMapType, CppTypeInfo.TypeCategory.MAP);
    CType cType = new CType(BASE_REF_NAME);
    CppTypeInfo keyType = mapType(resolver, francaMapType.getKeyType());
    CppTypeInfo valueType = mapType(resolver, francaMapType.getValueType());

    List<Include> includes = new LinkedList<>();
    includes.add(Include.createInternalInclude(BASE_HANDLE_IMPL_FILE));
    includes.add(CppLibraryIncludes.MAP);
    if (keyType.typeCategory == CppTypeInfo.TypeCategory.ENUM) {
      includes.add(CppLibraryIncludes.ENUM_HASH);
    }

    return CppMapTypeInfo.mapTypeBuilder(baseApiName)
        .constructFromCType(cType)
        .functionReturnType(cType)
        .includes(includes)
        .keyType(keyType)
        .valueType(valueType)
        .build();
  }
}
