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

package com.here.genium.generator.cpp;

import com.here.genium.generator.common.StringValueMapper;
import com.here.genium.model.cpp.*;
import java.util.List;
import org.apache.commons.text.StringEscapeUtils;
import org.franca.core.franca.*;

public final class CppValueMapper {

  public static CppValue map(final FInitializerExpression francaExpression) {

    if (francaExpression instanceof FConstant || francaExpression instanceof FUnaryOperation) {
      String stringValue = StringValueMapper.map(francaExpression);
      return stringValue != null ? new CppValue(stringValue) : null;
    } else if (francaExpression instanceof FQualifiedElementRef) {
      return map((FQualifiedElementRef) francaExpression);
    }

    return null;
  }

  public static CppValue mapDeploymentDefaultValue(
      final CppTypeRef cppTypeRef, final String deploymentDefaultValue) {

    if (cppTypeRef == CppTypeMapper.STRING_TYPE) {
      return new CppValue("\"" + StringEscapeUtils.escapeJava(deploymentDefaultValue) + "\"");
    } else if (cppTypeRef.refersToEnumType()) {
      String enumEntryName = CppNameRules.getEnumEntryName(deploymentDefaultValue);
      return new CppValue(cppTypeRef.name + "::" + enumEntryName);
    } else {
      return new CppValue(deploymentDefaultValue);
    }
  }

  private static CppValue map(final FQualifiedElementRef francaElementRef) {

    FEvaluableElement value = francaElementRef.getElement();
    if (!(value instanceof FEnumerator)) {
      return null;
    }

    List<String> nestedNameSpecifier = CppNameRules.getNestedNameSpecifier(value);
    String enumEntryName = CppNameRules.getEnumEntryName(value.getName());
    return new CppValue(CppNameRules.getFullyQualifiedName(nestedNameSpecifier, enumEntryName));
  }
}
