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

package com.here.genium.validator.visibility;

import com.here.genium.common.FrancaTypeHelper;
import java.util.Collection;
import java.util.LinkedList;
import java.util.stream.Collectors;
import org.franca.core.franca.*;

/**
 * Visibility predicate for methods. Conditions checked against:
 *
 * <ul>
 *   <li>A "public" method should not have any arguments (in or out) of an "internal" type.
 *   <li>A "public" method should not have an "internal" error enum.
 *   <li>An "internal" method should not have any arguments (in or out) of an "internal" type from a
 *       foreign package.
 *   <li>An "internal" method should not have an "internal" error enum from a foreign package.
 * </ul>
 */
public final class MethodVisibilityValidatorPredicate
    extends VisibilityValidatorPredicate<FMethod> {

  private static final String ERROR_MESSAGE_FORMAT =
      "Public method '%s' cannot use internal types:\n%s";
  private static final String PACKAGE_ERROR_MESSAGE_FORMAT =
      "Internal method '%s' cannot use internal types from a different package:\n%s";
  private static final String INTERNAL_ARGUMENT_MESSAGE_FORMAT =
      "argument '%s' has an internal type '%s'";
  private static final String INTERNAL_ENUM_MESSAGE_FORMAT = "error enum has an internal type '%s'";

  @Override
  public Class<FMethod> getElementClass() {
    return FMethod.class;
  }

  @Override
  protected Collection<FModelElement> getChildElements(final FMethod francaMethod) {

    Collection<FModelElement> result = new LinkedList<>();
    result.addAll(francaMethod.getInArgs());
    result.addAll(francaMethod.getOutArgs());
    result.add(francaMethod.getErrorEnum());

    return result;
  }

  @Override
  protected String getVisibilityErrorMessageFormat() {
    return ERROR_MESSAGE_FORMAT;
  }

  @Override
  protected String getPackageErrorMessageFormat() {
    return PACKAGE_ERROR_MESSAGE_FORMAT;
  }

  @Override
  protected String formatErrorMessage(
      final String messageFormat,
      final FModelElement francaElement,
      final Collection<FModelElement> childElements) {

    Collection<String> detailedErrorMessages =
        childElements
            .stream()
            .map(MethodVisibilityValidatorPredicate::formatErrorMessage)
            .collect(Collectors.toList());

    return String.format(
        messageFormat,
        FrancaTypeHelper.getFullName(francaElement),
        String.join("\n", detailedErrorMessages));
  }

  private static String formatErrorMessage(final FModelElement childElement) {

    if (childElement instanceof FArgument) {
      return String.format(
          INTERNAL_ARGUMENT_MESSAGE_FORMAT,
          childElement.getName(),
          FrancaTypeHelper.getFullName(((FArgument) childElement).getType().getDerived()));
    }
    if (childElement instanceof FEnumerationType) {
      return String.format(
          INTERNAL_ENUM_MESSAGE_FORMAT, FrancaTypeHelper.getFullName(childElement));
    }

    return null;
  }
}
