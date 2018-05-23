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

package com.here.genium.generator.swift;

import com.here.genium.generator.common.StringValueMapper;
import com.here.genium.model.swift.SwiftType;
import com.here.genium.model.swift.SwiftValue;
import java.util.LinkedList;
import org.apache.commons.text.StringEscapeUtils;
import org.franca.core.franca.*;

public final class SwiftValueMapper {

  public static SwiftValue map(final FInitializerExpression francaExpression) {

    if (francaExpression instanceof FConstant || francaExpression instanceof FUnaryOperation) {
      String stringValue = StringValueMapper.map(francaExpression);
      return stringValue != null ? new SwiftValue(stringValue) : null;
    } else if (francaExpression instanceof FQualifiedElementRef) {
      return map((FQualifiedElementRef) francaExpression);
    }

    return null;
  }

  public static SwiftValue mapDefaultValue(
      final SwiftType swiftType, final String deploymentDefaultValue) {

    switch (swiftType.category) {
      case BUILTIN_STRING:
        return new SwiftValue("\"" + StringEscapeUtils.escapeJava(deploymentDefaultValue) + "\"");
      case ENUM:
        String enumItemName = SwiftNameRules.getEnumItemName(deploymentDefaultValue);
        return new SwiftValue(swiftType.name + "." + enumItemName);
      default:
        return new SwiftValue(deploymentDefaultValue);
    }
  }

  private static SwiftValue map(final FQualifiedElementRef francaElementRef) {

    FEvaluableElement value = francaElementRef.getElement();
    if (!(value instanceof FEnumerator)) {
      return null;
    }

    LinkedList<String> names = new LinkedList<>();
    names.add(SwiftNameRules.getConstantName(value.getName()));
    FEnumerationType enumerationType = (FEnumerationType) value.eContainer();
    names.addFirst(SwiftNameRules.getClassName(enumerationType.getName()));
    FTypeCollection typeCollection = (FTypeCollection) enumerationType.eContainer();
    if (typeCollection instanceof FInterface) {
      names.addFirst(SwiftNameRules.getClassName(typeCollection.getName()));
    }

    return new SwiftValue(String.join(".", names));
  }
}
