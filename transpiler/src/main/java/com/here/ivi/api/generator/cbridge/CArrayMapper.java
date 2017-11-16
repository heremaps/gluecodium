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

import static com.here.ivi.api.generator.cbridge.CArrayGenerator.CBRIDGE_ARRAY_REF;
import static com.here.ivi.api.generator.cbridge.CArrayGenerator.CBRIDGE_INTERNAL_ARRAY_IMPL;
import static com.here.ivi.api.generator.cbridge.CppTypeInfo.TypeCategory.ARRAY;
import static java.util.Collections.emptyList;
import static java.util.Collections.singletonList;

import com.here.ivi.api.generator.cpp.CppLibraryIncludes;
import com.here.ivi.api.model.cmodel.CType;
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.rules.InstanceRules;
import java.util.Arrays;
import org.eclipse.emf.ecore.EObject;
import org.franca.core.franca.*;

public final class CArrayMapper {

  public static CppTypeInfo create(final CppTypeInfo innerType, final EObject francaElement) {

    String arrayName = addPrefix(getName(francaElement) + addNestedSuffixIfNeeded(innerType));
    CType arrayType =
        new CType(arrayName, singletonList(Include.createInternalInclude(CBRIDGE_ARRAY_REF)));
    CppTypeInfo type =
        new CppTypeInfo(
            "std::shared_ptr<" + arrayName + ">",
            singletonList(arrayType),
            singletonList(""),
            arrayType,
            ARRAY,
            Arrays.asList(
                Include.createInternalInclude(CBRIDGE_INTERNAL_ARRAY_IMPL),
                CppLibraryIncludes.VECTOR),
            emptyList());
    type.innerType = innerType;
    return type;
  }

  public static String getName(final EObject object) {
    String elementName = "undefined";

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
    } else if (object instanceof FEnumerationType) {
      elementName = "Enums";
    }

    return elementName;
  }

  private static String addNestedSuffixIfNeeded(final CppTypeInfo innerType) {
    return innerType.innerType != null
        ? addNestedSuffixIfNeeded(innerType.innerType) + "Array"
        : "";
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
