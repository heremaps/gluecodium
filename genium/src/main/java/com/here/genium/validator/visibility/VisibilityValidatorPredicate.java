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
import com.here.genium.model.franca.FrancaDeploymentModel;
import com.here.genium.validator.ValidatorPredicate;
import java.util.Collection;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import org.franca.core.franca.*;

/**
 * Abstract base class for the family of Visibility predicates. Conditions checked against:
 *
 * <ul>
 *   <li>If the element itself is "public", it should not refer to anything "internal".
 *   <li>If the element itself is "internal", it should not refer to "internal" elements from a
 *       foreign package.
 * </ul>
 */
abstract class VisibilityValidatorPredicate<T extends FModelElement>
    implements ValidatorPredicate<T> {

  protected abstract Collection<FModelElement> getChildElements(T francaElement);

  protected abstract String getVisibilityErrorMessageFormat();

  protected abstract String getPackageErrorMessageFormat();

  protected String formatErrorMessage(
      final String messageFormat,
      final FModelElement francaElement,
      final Collection<FModelElement> childElements) {

    return String.format(
        messageFormat,
        FrancaTypeHelper.getFullName(francaElement),
        FrancaTypeHelper.getFullName(childElements.iterator().next()));
  }

  @Override
  public String validate(final FrancaDeploymentModel deploymentModel, final T francaElement) {

    Stream<FModelElement> internalChildElements =
        getChildElements(francaElement).stream().filter(deploymentModel::isInternal);

    Collection<FModelElement> validationChildElements;
    String errorMessageFormat;

    if (deploymentModel.isInternal(francaElement)) {
      validationChildElements =
          internalChildElements
              .filter(
                  childElement -> !FrancaTypeHelper.haveSamePackage(francaElement, childElement))
              .collect(Collectors.toList());
      errorMessageFormat = getPackageErrorMessageFormat();
    } else {
      validationChildElements = internalChildElements.collect(Collectors.toList());
      errorMessageFormat = getVisibilityErrorMessageFormat();
    }

    if (validationChildElements.isEmpty()) {
      return null;
    } else {
      return formatErrorMessage(errorMessageFormat, francaElement, validationChildElements);
    }
  }
}
