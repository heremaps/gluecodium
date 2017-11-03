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
import static com.here.ivi.api.model.cmodel.CType.VECTOR_INCLUDE;
import static java.util.Collections.emptyList;
import static java.util.Collections.singletonList;

import com.here.ivi.api.TranspilerExecutionException;
import com.here.ivi.api.model.cmodel.CType;
import com.here.ivi.api.model.common.Include;
import java.nio.file.Paths;
import java.util.Arrays;
import org.eclipse.emf.ecore.EObject;
import org.franca.core.franca.FArrayType;
import org.franca.core.franca.FStructType;
import org.franca.core.franca.FTypeDef;
import org.franca.core.franca.FTypeRef;

public class CArrayMapper {

  public static final Include INTERNAL_ARRAY_INCLUDE =
      Include.createInternalInclude(Paths.get(CBRIDGE_INTERNAL_ARRAY_IMPL).toString());
  public static final Include INTERNAL_ARRAYREF_INCLUDE =
      Include.createInternalInclude(Paths.get(CBRIDGE_ARRAY_REF).toString());

  public static CppTypeInfo create(CppTypeInfo innerType, EObject francaElement) {

    StringBuffer elementName = new StringBuffer(getName(francaElement));
    elementName.append(addNestedSufixIfNeeded(innerType));
    String arrayName = addPrefix(elementName.toString());
    CType arrayType = getArrayType(arrayName);
    CppTypeInfo type =
        new CppTypeInfo(
            getBaseApiCall(arrayName),
            singletonList(arrayType),
            singletonList(""),
            arrayType,
            ARRAY,
            Arrays.asList(INTERNAL_ARRAY_INCLUDE, VECTOR_INCLUDE),
            emptyList());
    type.innerType = innerType;
    return type;
  }

  private static CType getArrayType(final String name) {
    return new CType(name, singletonList(INTERNAL_ARRAYREF_INCLUDE));
  }

  private static String getBaseApiCall(final String baseAPIName) {
    return "std::shared_ptr<" + baseAPIName + ">";
  }

  public static String getName(EObject object) {
    String elementName = "undefined";

    if (object instanceof FTypeDef) {
      FTypeDef francaDef = (FTypeDef) object;
      elementName = francaDef.getName();
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
      elementName = getTypeRefName(francaRef);
    }

    return elementName;
  }

  private static String addNestedSufixIfNeeded(final CppTypeInfo innerType) {
    String sufix = "";
    if (innerType.innerType != null) {
      sufix = addNestedSufixIfNeeded(innerType.innerType) + "Array";
    }
    return sufix;
  }

  public static String addPrefix(final String typeString) {
    return "arrayCollection" + "_" + typeString;
  }

  private static String getTypeRefName(FTypeRef ref) {
    if (!ref.getPredefined().getName().equals("undefined")) {
      return ref.getPredefined().getName();
    } else if (ref.getDerived() != null) {
      return ref.getDerived().getName();
    } else {
      throw new TranspilerExecutionException(
          "[Arrays] Error - type not supported: " + ref.toString());
    }
  }
}
