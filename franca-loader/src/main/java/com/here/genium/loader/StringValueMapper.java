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

package com.here.genium.loader;

import org.franca.core.franca.*;

public final class StringValueMapper {

  public static String map(final FInitializerExpression francaExpression) {

    if (francaExpression instanceof FBooleanConstant) {
      return ((FBooleanConstant) francaExpression).isVal() ? "true" : "false";
    } else if (francaExpression instanceof FIntegerConstant) {
      return String.valueOf(((FIntegerConstant) francaExpression).getVal());
    } else if (francaExpression instanceof FStringConstant) {
      return '"' + ((FStringConstant) francaExpression).getVal() + '"';
    } else if (francaExpression instanceof FFloatConstant) {
      return String.valueOf(((FFloatConstant) francaExpression).getVal());
    } else if (francaExpression instanceof FDoubleConstant) {
      return String.valueOf(((FDoubleConstant) francaExpression).getVal());
    } else if (francaExpression instanceof FUnaryOperation) {
      return map((FUnaryOperation) francaExpression);
    }

    return null;
  }

  private static String map(final FUnaryOperation francaExpression) {
    String base = map(francaExpression.getOperand());
    return base != null ? francaExpression.getOp().getLiteral() + base : null;
  }
}
