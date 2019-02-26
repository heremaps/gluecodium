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

import com.here.genium.common.FrancaTypeHelper;
import com.here.genium.generator.cpp.CppLibraryIncludes;
import com.here.genium.model.cbridge.CType;
import com.here.genium.model.common.Include;
import com.here.genium.model.common.InstanceRules;
import java.util.Arrays;
import org.eclipse.emf.ecore.EObject;
import org.franca.core.franca.*;

public final class CArrayMapper {

  private static final CType BASE_REF_TYPE = new CType(BASE_REF_NAME);

  public static CppArrayTypeInfo createArrayReference(final CppTypeInfo innerType) {

    return new CppArrayTypeInfo(
        "std::vector<" + innerType.name + ">",
        BASE_REF_TYPE,
        BASE_REF_TYPE,
        Arrays.asList(
            Include.Companion.createInternalInclude(BASE_HANDLE_IMPL_FILE),
            CppLibraryIncludes.VECTOR),
        innerType);
  }

  public static String getArrayName(final EObject francaArray) {
    return "arrayCollection_" + getName(francaArray);
  }

  private static String getName(final EObject object) {

    if (object instanceof FTypeDef) {
      FTypeDef francaDef = (FTypeDef) object;
      return InstanceRules.isInstanceId(francaDef)
          ? francaDef.getName()
          : getName(francaDef.getActualType());
    } else if (object instanceof FTypeRef) {
      FTypeRef francaRef = (FTypeRef) object;
      String elementName;
      if (francaRef.getDerived() != null) {
        elementName = getName(francaRef.getDerived());
      } else {
        elementName = francaRef.getPredefined().getName();
      }
      return FrancaTypeHelper.isImplicitArray(francaRef) ? elementName + "Array" : elementName;
    } else if (object instanceof FStructType || object instanceof FEnumerationType) {
      return ((FType) object).getName();
    } else if (object instanceof FArrayType) {
      FTypeRef francaRef = ((FArrayType) object).getElementType();
      return getName(francaRef) + "Array";
    } else if (object instanceof FMapType) {
      FMapType francaMap = (FMapType) object;
      return getName(francaMap.getKeyType()) + "To" + getName(francaMap.getValueType()) + "Map";
    } else {
      return null;
    }
  }
}
