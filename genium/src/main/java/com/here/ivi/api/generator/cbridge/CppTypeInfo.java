/*
 * Copyright (c) 2016-2018 HERE Europe B.V.
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

package com.here.ivi.api.generator.cbridge;

import static com.here.ivi.api.generator.cbridge.CBridgeNameRules.BASE_HANDLE_IMPL_FILE;
import static com.here.ivi.api.generator.cbridge.CBridgeNameRules.STRING_HANDLE_FILE;
import static com.here.ivi.api.model.cbridge.CType.FIXED_WIDTH_INTEGERS_INCLUDE;
import static java.util.Collections.emptyList;
import static java.util.Collections.singletonList;

import com.here.ivi.api.generator.cpp.CppLibraryIncludes;
import com.here.ivi.api.model.cbridge.CElement;
import com.here.ivi.api.model.cbridge.CPointerType;
import com.here.ivi.api.model.cbridge.CType;
import com.here.ivi.api.model.common.Include;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import lombok.Singular;

public class CppTypeInfo extends CElement {

  public final List<CType> cTypesNeededByConstructor;
  public final List<String> paramSuffixes;
  public CType functionReturnType;
  public TypeCategory typeCategory;
  public final List<Include> includes;

  public enum TypeCategory {
    BUILTIN_SIMPLE,
    BUILTIN_STRING,
    BUILTIN_BYTEBUFFER,
    STRUCT,
    CLASS,
    ENUM,
    ARRAY,
    MAP
  }

  public static final CppTypeInfo STRING =
      CppTypeInfo.builder("std::string")
          .constructFromCType(CPointerType.CONST_CHAR_PTR)
          .functionReturnType(CType.STRING_REF)
          .category(TypeCategory.BUILTIN_STRING)
          .include(CppLibraryIncludes.STRING)
          .include(CppLibraryIncludes.NEW)
          .include(Include.createInternalInclude(BASE_HANDLE_IMPL_FILE))
          .include(Include.createInternalInclude(STRING_HANDLE_FILE))
          .build();

  public static final CppTypeInfo BYTE_VECTOR =
      CppTypeInfo.builder("std::vector<uint8_t>")
          .constructFromCType(CPointerType.makeConstPointer(CType.UINT8))
          .constructFromCType(CType.INT64)
          .paramSuffix("_ptr")
          .paramSuffix("_size")
          .functionReturnType(CType.BYTE_ARRAY_REF)
          .category(TypeCategory.BUILTIN_BYTEBUFFER)
          .include(CppLibraryIncludes.NEW)
          .include(CppLibraryIncludes.VECTOR)
          .include(FIXED_WIDTH_INTEGERS_INCLUDE)
          .include(Include.createInternalInclude(BASE_HANDLE_IMPL_FILE))
          .build();

  @SuppressWarnings({"PMD.ExcessiveParameterList", "ParameterNumber"})
  @lombok.Builder(builderClassName = "Builder")
  protected CppTypeInfo(
      final String name,
      @Singular final List<CType> constructFromCTypes,
      @Singular final List<String> paramSuffixes,
      final CType functionReturnType,
      final TypeCategory category,
      @Singular final List<Include> includes) {
    super(name);
    this.cTypesNeededByConstructor = constructFromCTypes;
    this.paramSuffixes =
        paramSuffixes != null && !paramSuffixes.isEmpty()
            ? paramSuffixes
            : new LinkedList<>(Collections.singletonList(""));
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

  public static Builder builder(final String name) {
    return new Builder().name(name);
  }

  public boolean isStruct() {
    return typeCategory == TypeCategory.STRUCT;
  }
}
