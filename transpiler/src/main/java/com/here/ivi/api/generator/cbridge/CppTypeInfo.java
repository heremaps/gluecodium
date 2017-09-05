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
import com.here.ivi.api.model.franca.FrancaElement;
import java.util.Arrays;
import java.util.List;
import org.franca.core.franca.FStructType;

public class CppTypeInfo {

  public final String baseType;
  public final String constructFromCExpr;
  public final List<CType> cTypesNeededByConstructor;
  public final List<String> paramSuffixes;
  public String returnValueConstrExpr;
  public final CType functionReturnType;
  public TypeCategory typeCategory;
  public final List<Include> conversionToCppIncludes;
  public final List<Include> conversionFromCppIncludes;

  public enum TypeCategory {
    BUILTIN_SIMPLE,
    BUILTIN_STRING,
    BUILTIN_BYTEBUFFER,
    STRUCT
  }

  public static final CppTypeInfo STRING =
      new CppTypeInfo(
          "std::string",
          "std::string(%1$s)",
          singletonList(CPointerType.CONST_CHAR_PTR),
          singletonList(""),
          CType.STRING_REF + "{new std::string(std::move(%1$s))}",
          CType.STRING_REF,
          TypeCategory.BUILTIN_STRING,
          singletonList(Include.createSystemInclude("string")),
          Arrays.asList(
              Include.createSystemInclude("utility"), Include.createSystemInclude("string")));

  public static final CppTypeInfo BYTE_VECTOR =
      new CppTypeInfo(
          "std::vector<uint8_t>",
          "std::vector<uint8_t>(%1$s, %1$s + %2$s)",
          asList(CPointerType.makeConstPointer(CType.UINT8), CType.INT64),
          asList("_ptr", "_size"),
          CType.BYTE_ARRAY_REF + "{new std::vector<uint8_t>(std::move(%1$s))}",
          CType.BYTE_ARRAY_REF,
          TypeCategory.BUILTIN_BYTEBUFFER,
          Arrays.asList(
              Include.createSystemInclude("vector"), Include.createSystemInclude("stdint.h")),
          Arrays.asList(
              Include.createSystemInclude("vector"),
              Include.createSystemInclude("utility"),
              Include.createSystemInclude("stdint.h")));

  public static CppTypeInfo createStructTypeInfo(
      final FrancaElement rootModel, final IncludeResolver resolver, final FStructType structType) {
    CBridgeNameRules rules = new CBridgeNameRules();

    String handleName = rules.getStructRefType(rootModel, structType.getName());
    return new CppTypeInfo(
        structType.getName(),
        "*get_pointer(%1$s)",
        singletonList(
            new CType(
                handleName,
                singletonList(
                    resolver.resolveInclude(structType, HeaderType.CBRIDGE_PUBLIC_HEADER)))),
        singletonList(""),
        handleName + "{ new " + rules.getBaseApiStructName(rootModel, structType) + "(%s)}",
        new CType(handleName),
        TypeCategory.STRUCT,
        asList(
            resolver.resolveInclude(structType, HeaderType.CBRIDGE_PRIVATE_HEADER),
            resolver.resolveInclude(structType, HeaderType.BASE_API_HEADER)),
        asList(
            resolver.resolveInclude(structType, HeaderType.CBRIDGE_PUBLIC_HEADER),
            resolver.resolveInclude(structType, HeaderType.BASE_API_HEADER)));
  }

  // TODO (APIGEN-625): refactor this
  @SuppressWarnings({"PMD.ExcessiveParameterList", "ParameterNumber"})
  private CppTypeInfo(
      String baseType,
      String constructFromCExpr,
      List<CType> constructFromCTypes,
      List<String> paramSuffixes,
      String returnValueConstrExpr,
      CType functionReturntype,
      TypeCategory category,
      List<Include> conversionToCppIncludes,
      List<Include> conversionFromCppIncludes) {
    this.baseType = baseType;
    this.constructFromCExpr = constructFromCExpr;
    this.paramSuffixes = paramSuffixes;
    this.cTypesNeededByConstructor = constructFromCTypes;
    this.returnValueConstrExpr = returnValueConstrExpr;
    this.functionReturnType = functionReturntype;
    this.typeCategory = category;
    this.conversionToCppIncludes = conversionToCppIncludes;
    this.conversionFromCppIncludes = conversionFromCppIncludes;
  }

  public CppTypeInfo(CType type, TypeCategory category) {
    this.baseType = type.name;
    this.constructFromCExpr = "%1$s";
    this.cTypesNeededByConstructor = singletonList(type);
    this.paramSuffixes = singletonList("");
    this.returnValueConstrExpr = "%1$s";
    this.functionReturnType = type;
    this.typeCategory = category;
    this.conversionToCppIncludes = emptyList();
    this.conversionFromCppIncludes = emptyList();
  }

  public CppTypeInfo(CType type) {
    this(type, TypeCategory.BUILTIN_SIMPLE);
  }
}
