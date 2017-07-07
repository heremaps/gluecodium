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
import com.here.ivi.api.model.common.Includes;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class CppTypeInfo {
  public static final CppTypeInfo STRING =
      new CppTypeInfo(
          "std::string",
          singletonList(new Includes.SystemInclude("string")),
          "const char",
          emptyList(),
          "std::string(%1$s)",
          singletonList(CPointerType.CONST_CHAR_PTR),
          singletonList(""),
          "new std::string(std::move(%1$s))",
          Arrays.asList(
              new Includes.SystemInclude("string"), new Includes.SystemInclude("utility")),
          CPointerType.VOID_PTR,
          "%1$s->c_str()",
          "%1$s->length()");

  static final CppTypeInfo BYTE_VECTOR =
      new CppTypeInfo(
          "std::vector<uint8_t>",
          singletonList(new Includes.SystemInclude("vector")),
          "uint8_t",
          singletonList(new Includes.SystemInclude("stdint.h")),
          "std::vector<uint8_t>(%1$s, %1$s + %2$s)",
          asList(new CPointerType(CType.UINT8), CType.UINT64),
          asList("_ptr", "_size"),
          "new std::vector<uint8_t>(std::move(%1$s))",
          Arrays.asList(
              new Includes.SystemInclude("vector"),
              new Includes.SystemInclude("stdint.h"),
              new Includes.SystemInclude("utility")),
          CPointerType.VOID_PTR,
          "&(*%1$s)[0]",
          "%1$s->size()");

  public final String baseType;
  public final String heldType;
  public final String constructFromCExpr;
  public final List<CType> cTypesNeededByConstructor;
  public final List<String> paramSuffixes;
  public final List<Includes.Include> baseTypeIncludes;
  public final List<Includes.Include> heldTypeIncludes;
  public final String returnValueConstrExpr;
  public final List<Includes.Include> returnConversionIncludes;
  public final CType functionReturnType;
  public final String getDataExpr;
  public final String getSizeExpr;

  private CppTypeInfo(
      String baseType,
      List<Includes.Include> baseTypeIncludes,
      String heldType,
      List<Includes.Include> heldTypeIncludes,
      String constructFromCExpr,
      List<CType> constructFromCTypes,
      List<String> paramSuffixes,
      String returnValueConstrExpr,
      List<Includes.Include> returnConversionIncludes,
      CType functionReturntype,
      String getDataExpr,
      String getSizeExpr) {
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
  }
}
