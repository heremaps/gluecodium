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

import static com.here.ivi.api.generator.cbridge.CBridgeGenerator.STRING_HANDLE_FILE;
import static com.here.ivi.api.generator.cbridge.CBridgeGenerator.STRING_HANDLE_IMPL_FILE;
import static com.here.ivi.api.model.cmodel.CType.FIXED_WIDTH_INTEGERS_INCLUDE;
import static java.util.Arrays.asList;
import static java.util.Collections.emptyList;
import static java.util.Collections.singletonList;

import com.here.ivi.api.generator.cpp.CppLibraryIncludes;
import com.here.ivi.api.model.cmodel.CElement;
import com.here.ivi.api.model.cmodel.CPointerType;
import com.here.ivi.api.model.cmodel.CType;
import com.here.ivi.api.model.cmodel.IncludeResolver;
import com.here.ivi.api.model.cmodel.IncludeResolver.HeaderType;
import com.here.ivi.api.model.common.Include;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.franca.core.franca.*;

public final class CppTypeInfo extends CElement {

  public final List<CType> cTypesNeededByConstructor;
  public final List<String> paramSuffixes;
  public CType functionReturnType;
  public TypeCategory typeCategory;
  public final List<Include> includes;
  public CppTypeInfo innerType;

  public enum TypeCategory {
    BUILTIN_SIMPLE,
    BUILTIN_STRING,
    BUILTIN_BYTEBUFFER,
    STRUCT,
    CLASS,
    ENUM,
    ARRAY,
  }

  public static final CppTypeInfo STRING =
      new CppTypeInfo(
          "std::string",
          singletonList(CPointerType.CONST_CHAR_PTR),
          singletonList(""),
          CType.STRING_REF,
          TypeCategory.BUILTIN_STRING,
          Arrays.asList(
              CppLibraryIncludes.STRING,
              CppLibraryIncludes.NEW,
              Include.createInternalInclude(STRING_HANDLE_IMPL_FILE),
              Include.createInternalInclude(STRING_HANDLE_FILE)));

  public static final CppTypeInfo BYTE_VECTOR =
      new CppTypeInfo(
          "std::vector<uint8_t>",
          asList(CPointerType.makeConstPointer(CType.UINT8), CType.INT64),
          asList("_ptr", "_size"),
          CType.BYTE_ARRAY_REF,
          TypeCategory.BUILTIN_BYTEBUFFER,
          Arrays.asList(
              CppLibraryIncludes.NEW, CppLibraryIncludes.VECTOR, FIXED_WIDTH_INTEGERS_INCLUDE));

  public static CppTypeInfo createCustomTypeInfo(
      final IncludeResolver resolver,
      final FModelElement elementType,
      final TypeCategory category) {

    String handleName = CBridgeNameRules.getHandleName(elementType, category);
    String baseAPIName = CBridgeNameRules.getBaseApiName(elementType, category);
    String baseApiCall = CBridgeNameRules.getBaseApiCall(category, baseAPIName);

    return new CppTypeInfo(
        baseApiCall,
        singletonList(
            new CType(
                handleName,
                resolver.resolveInclude(elementType, HeaderType.CBRIDGE_PUBLIC_HEADER))),
        singletonList(""),
        new CType(
            handleName, resolver.resolveInclude(elementType, HeaderType.CBRIDGE_PUBLIC_HEADER)),
        category,
        resolveIncludes(resolver, elementType));
  }

  private static List<Include> resolveIncludes(
      final IncludeResolver resolver, FModelElement element) {
    return new ArrayList<>(
        Arrays.asList(
            resolver.resolveInclude(element, HeaderType.CBRIDGE_PUBLIC_HEADER),
            resolver.resolveInclude(element, HeaderType.CBRIDGE_PRIVATE_HEADER),
            resolver.resolveInclude(element, HeaderType.BASE_API_HEADER),
            CppLibraryIncludes.MEMORY,
            CppLibraryIncludes.NEW));
  }

  public static CppTypeInfo createEnumTypeInfo(
      final IncludeResolver resolver, final FEnumerationType francaEnum) {
    CType enumCType =
        new CType(
            CBridgeNameRules.getEnumName(francaEnum),
            resolver.resolveInclude(francaEnum, HeaderType.CBRIDGE_PUBLIC_HEADER));
    return new CppTypeInfo(
        CBridgeNameRules.getBaseApiEnumName(francaEnum),
        singletonList(enumCType),
        singletonList(""),
        enumCType,
        TypeCategory.ENUM,
        emptyList());
  }

  public static CppTypeInfo createErrorTypeInfo(
      final IncludeResolver resolver, final FEnumerationType francaEnum) {
    CppTypeInfo errorEnumInfo = createEnumTypeInfo(resolver, francaEnum);
    errorEnumInfo.functionReturnType.includes.add(CType.BOOL_INCLUDE);
    return errorEnumInfo;
  }

  // TODO (APIGEN-625): refactor this
  @SuppressWarnings({"PMD.ExcessiveParameterList", "ParameterNumber"})
  public CppTypeInfo(
      String baseType,
      List<CType> constructFromCTypes,
      List<String> paramSuffixes,
      CType functionReturnType,
      TypeCategory category,
      List<Include> includes) {
    super(baseType);
    this.paramSuffixes = paramSuffixes;
    this.cTypesNeededByConstructor = constructFromCTypes;
    this.functionReturnType = functionReturnType;
    this.typeCategory = category;
    this.includes = includes;
  }

  public CppTypeInfo(CType type, TypeCategory category) {
    this(type.name, singletonList(type), singletonList(""), type, category, emptyList());
  }

  public CppTypeInfo(CType type) {
    this(type, TypeCategory.BUILTIN_SIMPLE);
  }

  public boolean isStruct() {
    return typeCategory == TypeCategory.STRUCT;
  }

  @SuppressWarnings("unused")
  public String getArrayBaseApi() {
    return arrayFindNested(this.innerType);
  }

  private String arrayFindNested(CppTypeInfo array) {
    String arrayName = array.innerType != null ? arrayFindNested(array.innerType) : array.name;
    return "std::vector<" + arrayName + ">";
  }
}
