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

package com.here.genium.generator.cbridge;

import static com.here.genium.generator.cbridge.CBridgeNameRules.BASE_HANDLE_IMPL_FILE;
import static com.here.genium.generator.cbridge.CBridgeNameRules.BASE_REF_NAME;
import static com.here.genium.generator.cbridge.CppTypeInfo.TypeCategory.BUILTIN_BYTEBUFFER;
import static com.here.genium.generator.cbridge.CppTypeInfo.TypeCategory.CLASS;
import static com.here.genium.generator.cbridge.CppTypeInfo.TypeCategory.ENUM;
import static com.here.genium.generator.cbridge.CppTypeInfo.TypeCategory.STRUCT;
import static com.here.genium.model.cbridge.CType.VOID;
import static com.here.genium.model.common.InstanceRules.isInstanceId;

import com.here.genium.common.FrancaTypeHelper;
import com.here.genium.generator.cpp.CppLibraryIncludes;
import com.here.genium.generator.cpp.CppNameResolver;
import com.here.genium.model.cbridge.CBridgeIncludeResolver;
import com.here.genium.model.cbridge.CType;
import com.here.genium.model.common.Include;
import com.here.genium.model.cpp.CppIncludeResolver;
import com.here.genium.model.cpp.CppTypeRef;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import org.franca.core.franca.FArrayType;
import org.franca.core.franca.FBasicTypeId;
import org.franca.core.franca.FEnumerationType;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FMapType;
import org.franca.core.franca.FModelElement;
import org.franca.core.franca.FStructType;
import org.franca.core.franca.FType;
import org.franca.core.franca.FTypeDef;
import org.franca.core.franca.FTypeRef;

public class CBridgeTypeMapper {

  private static final Include BASE_HANDLE_IMPL_INCLUDE =
      Include.Companion.createInternalInclude(CBridgeNameRules.BASE_HANDLE_IMPL_FILE);

  private final CppIncludeResolver cppIncludeResolver;
  private final CppNameResolver cppNameResolver;
  private final CBridgeIncludeResolver includeResolver;
  private final String enumHashType;
  private final CppTypeInfo byteBufferTypeInfo;

  public CBridgeTypeMapper(
      final CppIncludeResolver cppIncludeResolver,
      final CppNameResolver cppNameResolver,
      final CBridgeIncludeResolver includeResolver,
      final String enumHashType,
      final String byteBufferType) {
    this.cppIncludeResolver = cppIncludeResolver;
    this.cppNameResolver = cppNameResolver;
    this.includeResolver = includeResolver;
    this.enumHashType = enumHashType;
    this.byteBufferTypeInfo =
        new CppTypeInfo(
            byteBufferType,
            new CType(BASE_REF_NAME),
            CType.BYTE_ARRAY_REF,
            BUILTIN_BYTEBUFFER,
            Collections.singletonList(
                Include.Companion.createInternalInclude(BASE_HANDLE_IMPL_FILE)));
  }

  public CppTypeInfo mapType(final FTypeRef typeRef) {
    FType derived = typeRef.getDerived();
    CppTypeInfo typeResult;
    if (derived != null) {
      typeResult = mapType(derived);
    } else {
      typeResult = mapPredefined(typeRef);
    }

    if (FrancaTypeHelper.isImplicitArray(typeRef)) {
      typeResult = CArrayMapper.createArrayReference(typeResult);
    }
    return typeResult;
  }

  private CppTypeInfo mapType(final FType derived) {
    if (derived instanceof FStructType) {
      return createCustomTypeInfo(derived, STRUCT);
    } else if (derived instanceof FTypeDef) {
      return mapTypeDef((FTypeDef) derived);
    } else if (derived instanceof FEnumerationType) {
      return createEnumTypeInfo((FEnumerationType) derived);
    } else if (derived instanceof FArrayType) {
      CppTypeInfo innerType = mapType(((FArrayType) derived).getElementType());
      return CArrayMapper.createArrayReference(innerType);
    } else if (derived instanceof FMapType) {
      return mapMapType((FMapType) derived);
    } else {
      return new CppTypeInfo(VOID);
    }
  }

  private CppTypeInfo mapTypeDef(FTypeDef derived) {
    if (isInstanceId(derived)) {
      return createCustomTypeInfo((FInterface) derived.eContainer(), CLASS);
    } else {
      return mapType(derived.getActualType());
    }
  }

  private CppTypeInfo mapPredefined(final FTypeRef type) {
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
        return CppTypeInfo.Companion.getSTRING();
      case FBasicTypeId.BYTE_BUFFER_VALUE:
        return byteBufferTypeInfo;
    }
    return new CppTypeInfo(VOID);
  }

  public CppTypeInfo createCustomTypeInfo(
      final FModelElement modelElement, final CppTypeInfo.TypeCategory category) {

    String baseApiName = cppNameResolver.getFullyQualifiedName(modelElement);
    String baseApiCall = CBridgeNameRules.getBaseApiCall(category, baseApiName);

    Include publicInclude = includeResolver.resolveInclude(modelElement);
    Include baseApiInclude = cppIncludeResolver.resolveInclude(modelElement);

    CType structCType = new CType(BASE_REF_NAME, publicInclude);

    return new CppTypeInfo(
        baseApiCall,
        structCType,
        structCType,
        category,
        Arrays.asList(
            publicInclude,
            baseApiInclude,
            BASE_HANDLE_IMPL_INCLUDE,
            CppLibraryIncludes.MEMORY,
            CppLibraryIncludes.NEW));
  }

  public static CppTypeInfo createNullableTypeInfo(
      final CppTypeInfo baseTypeInfo, final CppTypeRef cppTypeRef) {

    List<Include> includes = new LinkedList<>();
    includes.addAll(baseTypeInfo.getIncludes());
    includes.addAll(cppTypeRef.includes);

    CType structCType = new CType(BASE_REF_NAME);
    return new CppTypeInfo(
        cppTypeRef.fullyQualifiedName, structCType, structCType, CLASS, includes);
  }

  public CppTypeInfo createEnumTypeInfo(final FEnumerationType francaEnum) {

    Include publicInclude = includeResolver.resolveInclude(francaEnum);
    Include baseApiInclude = cppIncludeResolver.resolveInclude(francaEnum);

    CType enumCType = new CType(CBridgeNameRules.getEnumName(francaEnum), publicInclude);

    return new CppTypeInfo(
        cppNameResolver.getFullyQualifiedName(francaEnum),
        enumCType,
        enumCType,
        ENUM,
        Arrays.asList(publicInclude, baseApiInclude));
  }

  public CppTypeInfo createErrorTypeInfo(final FEnumerationType francaEnum) {
    CppTypeInfo errorEnumInfo = createEnumTypeInfo(francaEnum);
    errorEnumInfo.getFunctionReturnType().includes.add(CType.BOOL_INCLUDE);
    return errorEnumInfo;
  }

  private CppTypeInfo mapMapType(final FMapType francaMapType) {

    CType cType = new CType(BASE_REF_NAME);
    CppTypeInfo keyType = mapType(francaMapType.getKeyType());
    CppTypeInfo valueType = mapType(francaMapType.getValueType());

    List<Include> includes = new LinkedList<>();
    includes.add(Include.Companion.createInternalInclude(BASE_HANDLE_IMPL_FILE));
    includes.add(CppLibraryIncludes.MAP);

    String enumHash = null;
    if (keyType.getTypeCategory() == CppTypeInfo.TypeCategory.ENUM) {
      includes.add(CppLibraryIncludes.ENUM_HASH);
      enumHash = enumHashType;
    }

    return new CppMapTypeInfo(
        cppNameResolver.getFullyQualifiedName(francaMapType),
        cType,
        cType,
        includes,
        keyType,
        valueType,
        enumHash);
  }

  public String getEnumHashType() {
    return this.enumHashType;
  }
}
