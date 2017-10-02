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

import static java.util.Arrays.asList;
import static java.util.Collections.emptyList;
import static java.util.Collections.singletonList;

import com.here.ivi.api.model.cmodel.CPointerType;
import com.here.ivi.api.model.cmodel.CType;
import com.here.ivi.api.model.cmodel.IncludeResolver;
import com.here.ivi.api.model.cmodel.IncludeResolver.HeaderType;
import com.here.ivi.api.model.common.Include;
import java.util.Arrays;
import java.util.List;
import org.franca.core.franca.FEnumerationType;
import org.franca.core.franca.FModelElement;
import org.franca.core.franca.FStructType;

public class CppTypeInfo {

  public final String baseType;
  public final List<CType> cTypesNeededByConstructor;
  public final List<String> paramSuffixes;
  public final CType functionReturnType;
  public TypeCategory typeCategory;
  public final List<Include> conversionToCppIncludes;
  public final List<Include> conversionFromCppIncludes;

  public enum TypeCategory {
    BUILTIN_SIMPLE,
    BUILTIN_STRING,
    BUILTIN_BYTEBUFFER,
    STRUCT,
    INSTANCE,
    ENUM
  }

  public static final CppTypeInfo STRING =
      new CppTypeInfo(
          "std::string",
          singletonList(CPointerType.CONST_CHAR_PTR),
          singletonList(""),
          CType.STRING_REF,
          TypeCategory.BUILTIN_STRING,
          singletonList(Include.createSystemInclude("string")),
          Arrays.asList(Include.createSystemInclude("string")));

  public static final CppTypeInfo BYTE_VECTOR =
      new CppTypeInfo(
          "std::vector<uint8_t>",
          asList(CPointerType.makeConstPointer(CType.UINT8), CType.INT64),
          asList("_ptr", "_size"),
          CType.BYTE_ARRAY_REF,
          TypeCategory.BUILTIN_BYTEBUFFER,
          Arrays.asList(
              Include.createSystemInclude("vector"), Include.createSystemInclude("stdint.h")),
          Arrays.asList(
              Include.createSystemInclude("vector"), Include.createSystemInclude("stdint.h")));

  public static CppTypeInfo createStructTypeInfo(
      final IncludeResolver resolver, final FStructType structType) {
    String handleName = CBridgeNameRules.getStructRefType(structType);
    return new CppTypeInfo(
        CBridgeNameRules.getBaseApiStructName(structType),
        singletonList(
            new CType(
                handleName,
                singletonList(
                    resolver.resolveInclude(structType, HeaderType.CBRIDGE_PUBLIC_HEADER)))),
        singletonList(""),
        new CType(
            handleName,
            singletonList(resolver.resolveInclude(structType, HeaderType.CBRIDGE_PUBLIC_HEADER))),
        TypeCategory.STRUCT,
        asList(
            resolver.resolveInclude(structType, HeaderType.CBRIDGE_PUBLIC_HEADER),
            resolver.resolveInclude(structType, HeaderType.CBRIDGE_PRIVATE_HEADER),
            resolver.resolveInclude(structType, HeaderType.BASE_API_HEADER)),
        asList(
            resolver.resolveInclude(structType, HeaderType.CBRIDGE_PUBLIC_HEADER),
            resolver.resolveInclude(structType, HeaderType.BASE_API_HEADER)));
  }

  public static CppTypeInfo createInstanceTypeInfo(
      final IncludeResolver resolver, final FModelElement instanceId) {
    String handleName = CBridgeNameRules.getInstanceRefType(instanceId);
    return new CppTypeInfo(
        "std::shared_ptr<" + CBridgeNameRules.getBaseApiInstanceName(instanceId) + ">",
        singletonList(
            new CType(
                handleName,
                singletonList(
                    resolver.resolveInclude(instanceId, HeaderType.CBRIDGE_PUBLIC_HEADER)))),
        singletonList(""),
        new CType(
            handleName,
            singletonList(resolver.resolveInclude(instanceId, HeaderType.CBRIDGE_PUBLIC_HEADER))),
        TypeCategory.INSTANCE,
        asList(
            resolver.resolveInclude(instanceId, HeaderType.CBRIDGE_PUBLIC_HEADER),
            resolver.resolveInclude(instanceId, HeaderType.CBRIDGE_PRIVATE_HEADER),
            resolver.resolveInclude(instanceId, HeaderType.BASE_API_HEADER),
            Include.createSystemInclude("memory")),
        asList(
            resolver.resolveInclude(instanceId, HeaderType.CBRIDGE_PUBLIC_HEADER),
            resolver.resolveInclude(instanceId, HeaderType.BASE_API_HEADER)));
  }

  public static CppTypeInfo createEnumTypeInfo(
      final IncludeResolver resolver, final FEnumerationType francaEnum) {
    CType enumCType =
        new CType(
            CBridgeNameRules.getEnumName(francaEnum),
            singletonList(resolver.resolveInclude(francaEnum, HeaderType.CBRIDGE_PUBLIC_HEADER)));
    return new CppTypeInfo(
        CBridgeNameRules.getBaseApiEnumName(francaEnum),
        singletonList(enumCType),
        singletonList(""),
        enumCType,
        TypeCategory.ENUM,
        emptyList(),
        emptyList());
  }
  // TODO (APIGEN-625): refactor this
  @SuppressWarnings({"PMD.ExcessiveParameterList", "ParameterNumber"})
  private CppTypeInfo(
      String baseType,
      List<CType> constructFromCTypes,
      List<String> paramSuffixes,
      CType functionReturntype,
      TypeCategory category,
      List<Include> conversionToCppIncludes,
      List<Include> conversionFromCppIncludes) {
    this.baseType = baseType;
    this.paramSuffixes = paramSuffixes;
    this.cTypesNeededByConstructor = constructFromCTypes;
    this.functionReturnType = functionReturntype;
    this.typeCategory = category;
    this.conversionToCppIncludes = conversionToCppIncludes;
    this.conversionFromCppIncludes = conversionFromCppIncludes;
  }

  public CppTypeInfo(CType type, TypeCategory category) {
    this.baseType = type.name;
    this.cTypesNeededByConstructor = singletonList(type);
    this.paramSuffixes = singletonList("");
    this.functionReturnType = type;
    this.typeCategory = category;
    this.conversionToCppIncludes = emptyList();
    this.conversionFromCppIncludes = emptyList();
  }

  public CppTypeInfo(CType type) {
    this(type, TypeCategory.BUILTIN_SIMPLE);
  }

  public boolean isStruct() {
    return typeCategory == TypeCategory.STRUCT;
  }
}
