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

package com.here.genium.generator.java;

import com.here.genium.common.FrancaTypeHelper;
import com.here.genium.model.common.InstanceRules;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import org.franca.core.framework.FrancaHelpers;
import org.franca.core.franca.FArgument;
import org.franca.core.franca.FArrayType;
import org.franca.core.franca.FMapType;
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FType;
import org.franca.core.franca.FTypeRef;

public class JavaMethodNameResolver {

  private static final String TYPE_ERASED_ARRAY = "List<>";
  private static final String TYPE_ERASED_MAP = "Map<>";

  private final Map<String, List<String>> signatureCache = new HashMap<>();

  public String getName(final FMethod francaMethod) {
    String selector = needsSelector(francaMethod) ? francaMethod.getSelector() : "";
    return JavaNameRules.getMethodName(francaMethod.getName(), selector);
  }

  private boolean needsSelector(final FMethod francaMethod) {
    List<String> signature = getSignature(francaMethod);
    return FrancaTypeHelper.getAllOverloads(francaMethod)
            .stream()
            .map(this::getSignature)
            .filter(signature::equals)
            .count()
        > 1;
  }

  private List<String> getSignature(final FMethod francaMethod) {

    String key = FrancaTypeHelper.getFullName(francaMethod);
    List<String> signature = signatureCache.get(key);
    if (signature == null) {
      signature = computeSignature(francaMethod);
      signatureCache.put(key, signature);
    }

    return signature;
  }

  private static List<String> computeSignature(final FMethod francaMethod) {
    return francaMethod
        .getInArgs()
        .stream()
        .map(JavaMethodNameResolver::getTypeName)
        .collect(Collectors.toList());
  }

  private static String getTypeName(final FArgument francaArgument) {

    if (francaArgument.isArray()) {
      return TYPE_ERASED_ARRAY;
    }

    FTypeRef francaTypeRef = francaArgument.getType();
    if (InstanceRules.isInstanceId(francaTypeRef)) {
      return francaTypeRef.getDerived().getName();
    }

    FType actualDerived = FrancaHelpers.getActualDerived(francaTypeRef);
    if (actualDerived == null) {
      return FrancaHelpers.getActualPredefined(francaTypeRef).getName();
    }

    if (actualDerived instanceof FArrayType) {
      return TYPE_ERASED_ARRAY;
    }
    if (actualDerived instanceof FMapType) {
      return TYPE_ERASED_MAP;
    }

    return actualDerived.getName();
  }
}
