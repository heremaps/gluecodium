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

package com.here.genium.generator.swift;

import com.here.genium.model.swift.SwiftType;
import com.here.genium.model.swift.SwiftValue;
import org.apache.commons.text.StringEscapeUtils;
import org.franca.core.franca.FExpression;
import org.franca.core.franca.FIntegerConstant;

public final class SwiftValueMapper {

  public static SwiftValue mapExpression(final FExpression expression) {
    if (expression instanceof FIntegerConstant) {
      return new SwiftValue(String.valueOf(((FIntegerConstant) expression).getVal()));
    } else {
      return null;
    }
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
}
