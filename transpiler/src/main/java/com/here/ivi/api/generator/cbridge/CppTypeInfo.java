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
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.franca.FrancaElement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.franca.core.franca.FStructType;

public class CppTypeInfo {

  public enum TypeCategory {
    BUILTIN_SIMPLE,
    BUILTIN_STRING,
    BUILTIN_BYTEBUFFER,
    STRUCT
  };

  public static final CppTypeInfo STRING =
      new CppTypeInfo(
          "std::string",
          singletonList(Include.createSystemInclude("string")),
          "char",
          emptyList(),
          "std::string(%1$s)",
          singletonList(CPointerType.CONST_CHAR_PTR),
          singletonList(""),
          "new std::string(std::move(%1$s))",
          Arrays.asList(
              Include.createSystemInclude("string"), Include.createSystemInclude("utility")),
          CPointerType.VOID_PTR,
          "%1$s->c_str()",
          "%1$s->length()",
          TypeCategory.BUILTIN_STRING);

  static final CppTypeInfo BYTE_VECTOR =
      new CppTypeInfo(
          "std::vector<uint8_t>",
          singletonList(Include.createSystemInclude("vector")),
          "uint8_t",
          singletonList(Include.createSystemInclude("stdint.h")),
          "std::vector<uint8_t>(%1$s, %1$s + %2$s)",
          asList(CPointerType.makeConstPointer(CType.UINT8), CType.INT64),
          asList("_ptr", "_size"),
          "new std::vector<uint8_t>(std::move(%1$s))",
          Arrays.asList(
              Include.createSystemInclude("vector"),
              Include.createSystemInclude("stdint.h"),
              Include.createSystemInclude("utility")),
          CPointerType.VOID_PTR,
          "&(*%1$s)[0]",
          "%1$s->size()",
          TypeCategory.BUILTIN_BYTEBUFFER);

  public static CppTypeInfo createStructTypeInfo(
      final FrancaElement<?> rootModel, final FStructType structType) {
    CBridgeNameRules rules = new CBridgeNameRules();
    String handleName = rules.getStructName(rootModel, structType);
    return new CppTypeInfo(
        structType.getName(),
        emptyList(), //TODO: APIGEN-285 Correct stubs from BaseApi include paths
        "",
        emptyList(),
        "*get_pointer(%1$s)",
        singletonList(new CType(handleName)),
        singletonList(""),
        handleName + "{ new " + rules.getBaseApiStructName(rootModel, structType) + "(%s)}",
        emptyList(),
        new CType(handleName),
        "",
        "",
        TypeCategory.STRUCT);
  }

  public final String baseType;
  public final String heldType;
  public final String constructFromCExpr;
  public final List<CType> cTypesNeededByConstructor;
  public final List<String> paramSuffixes;
  public List<Include> baseTypeIncludes;
  public final List<Include> heldTypeIncludes;
  public String returnValueConstrExpr;
  public final List<Include> returnConversionIncludes;
  public final CType functionReturnType;
  public final String getDataExpr;
  public final String getSizeExpr;
  public TypeCategory typeCategory;

  private CppTypeInfo(
      String baseType,
      List<Include> baseTypeIncludes,
      String heldType,
      List<Include> heldTypeIncludes,
      String constructFromCExpr,
      List<CType> constructFromCTypes,
      List<String> paramSuffixes,
      String returnValueConstrExpr,
      List<Include> returnConversionIncludes,
      CType functionReturntype,
      String getDataExpr,
      String getSizeExpr,
      TypeCategory category) {
    this.baseType = baseType;
    this.heldType = heldType;
    this.constructFromCExpr = constructFromCExpr;
    this.paramSuffixes = paramSuffixes;
    this.cTypesNeededByConstructor = constructFromCTypes;
    this.baseTypeIncludes = baseTypeIncludes;
    this.heldTypeIncludes = heldTypeIncludes;
    this.returnValueConstrExpr = returnValueConstrExpr;
    this.returnConversionIncludes = returnConversionIncludes;
    this.functionReturnType = functionReturntype;
    this.getDataExpr = getDataExpr;
    this.getSizeExpr = getSizeExpr;
    this.typeCategory = category;
  }

  public CppTypeInfo(CType type) {
    this.baseType = type.name;
    this.heldType = "";
    this.constructFromCExpr = "%1$s";
    this.cTypesNeededByConstructor = singletonList(type);
    this.paramSuffixes = singletonList("");
    this.baseTypeIncludes = new ArrayList<>(type.includes);
    this.heldTypeIncludes = emptyList();
    this.returnValueConstrExpr = "%1$s";
    this.returnConversionIncludes = emptyList();
    this.functionReturnType = type;
    this.getDataExpr = "";
    this.getSizeExpr = "";
    this.typeCategory = TypeCategory.BUILTIN_SIMPLE;
  }
}
