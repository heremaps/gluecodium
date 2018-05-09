/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
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

import com.here.genium.generator.cpp.CppLibraryIncludes;
import com.here.genium.model.cbridge.CArray;
import com.here.genium.model.cbridge.CType;
import com.here.genium.model.common.Include;
import com.here.genium.model.common.InstanceRules;
import org.eclipse.emf.ecore.EObject;
import org.franca.core.franca.*;

public final class CArrayMapper {

  public static CppArrayTypeInfo createArrayReference(final CppTypeInfo innerType) {

    CType arrayType = new CType(BASE_REF_NAME);

    return CppArrayTypeInfo.arrayTypeBuilder("std::vector<" + innerType.name + ">")
        .cType(arrayType)
        .functionReturnType(arrayType)
        .include(Include.createInternalInclude(BASE_HANDLE_IMPL_FILE))
        .include(CppLibraryIncludes.VECTOR)
        .innerType(innerType)
        .build();
  }

  public static CArray createArrayDefinition(final FType francaArray, final CppTypeInfo innerType) {
    return createArrayDefinition(francaArray, innerType, createArrayReference(innerType));
  }

  public static CArray createArrayDefinition(
      final EObject francaArray, final CppTypeInfo innerType, final CppArrayTypeInfo cppTypeRef) {
    String fullName = addPrefix(getName(francaArray) + addNestedSuffixIfNeeded(innerType));
    return new CArray(fullName, cppTypeRef);
  }

  public static String getName(final EObject object) {
    String elementName = null;

    if (object instanceof FTypeDef) {
      FTypeDef francaDef = (FTypeDef) object;
      elementName =
          InstanceRules.isInstanceId(francaDef)
              ? francaDef.getName()
              : getName(francaDef.getActualType());
    } else if (object instanceof FTypeRef) {
      FTypeRef francaRef = (FTypeRef) object;
      if (francaRef.getDerived() != null) {
        elementName = getName(francaRef.getDerived());
      } else {
        elementName = getTypeRefName(francaRef);
      }
    } else if (object instanceof FStructType) {
      FStructType struct = (FStructType) object;
      elementName = struct.getName();
    } else if (object instanceof FArrayType) {
      FTypeRef francaRef = ((FArrayType) object).getElementType();
      elementName = getName(francaRef);
    } else if (object instanceof FMapType) {
      FMapType francaMap = (FMapType) object;
      elementName = getName(francaMap.getKeyType()) + getName(francaMap.getValueType()) + "Map";
    } else if (object instanceof FEnumerationType) {
      elementName = "Enums";
    }

    return elementName;
  }

  private static String addNestedSuffixIfNeeded(final CppTypeInfo innerType) {

    if (!(innerType instanceof CppArrayTypeInfo)) {
      return "";
    }

    CppTypeInfo innerInnerType = ((CppArrayTypeInfo) innerType).innerType;
    return innerInnerType != null ? addNestedSuffixIfNeeded(innerInnerType) + "Array" : "";
  }

  public static String addPrefix(final String typeString) {
    return "arrayCollection_" + typeString;
  }

  private static String getTypeRefName(FTypeRef ref) {
    if (ref.getPredefined() != FBasicTypeId.UNDEFINED) {
      return ref.getPredefined().getName();
    } else if (ref.getDerived() != null) {
      return ref.getDerived().getName();
    } else {
      return FBasicTypeId.UNDEFINED.getName();
    }
  }
}
