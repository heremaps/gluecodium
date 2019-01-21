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

package com.here.genium.validator;

import com.here.genium.common.FrancaTypeHelper;
import com.here.genium.model.franca.FrancaDeploymentModel;
import org.franca.core.franca.*;

/**
 * Validate each field or attribute with "ExternalGetter" or "ExternalSetter" properties set against
 * the following conditions:
 *
 * <ul>
 *   <li>Should either have both "ExternalGetter" or "ExternalSetter" properties set, or none.
 *   <li>Should be in a struct or interface which has "ExternalType" property set.
 *   <li>Attribute in an interface which has "ExternalType" property set should have
 *       "ExternalGetter" and "ExternalSetter" properties set, as appropriate to its "readonly"
 *       flag.
 * </ul>
 */
public class ExternalElementsValidatorPredicate implements ValidatorPredicate<FTypedElement> {

  private static final String BOTH_PROPERTIES_MESSAGE =
      "External elements should have both 'ExternalGetter' and 'ExternalSetter' properties set: "
          + "element '%s' in type '%s'.";
  private static final String NON_EXTERNAL_TYPE_MESSAGE =
      "The type containing external elements should have 'ExternalType' property set: "
          + "element '%s' in type '%s'.";
  private static final String EXTERNAL_ATTRIBUTES_MESSAGE =
      "Attributes in an external interface should have both 'ExternalGetter' and 'ExternalSetter' "
          + "properties set: attribute '%s' in interface '%s'.";
  private static final String READONLY_EXTERNAL_ATTRIBUTES_MESSAGE =
      "Readonly attributes in an external interface should have 'ExternalGetter' property set: "
          + "attribute '%s' in interface '%s'.";

  @Override
  public Class<FTypedElement> getElementClass() {
    return FTypedElement.class;
  }

  @Override
  public String validate(
      final FrancaDeploymentModel deploymentModel, final FTypedElement francaElement) {

    boolean isAttribute = francaElement instanceof FAttribute;
    boolean isReadonly = isAttribute && ((FAttribute) francaElement).isReadonly();

    boolean hasExternalGetter = deploymentModel.getExternalGetter(francaElement) != null;
    boolean hasExternalSetter = deploymentModel.getExternalSetter(francaElement) != null;

    FModelElement parentElement = (FModelElement) francaElement.eContainer();
    boolean parentIsExternal = deploymentModel.isExternalType(parentElement);

    String messageFormat = null;

    if (parentIsExternal) {
      if (isAttribute && !hasExternalGetter) {
        messageFormat =
            isReadonly ? READONLY_EXTERNAL_ATTRIBUTES_MESSAGE : EXTERNAL_ATTRIBUTES_MESSAGE;
      } else if (hasExternalGetter != hasExternalSetter && !isReadonly) {
        messageFormat = BOTH_PROPERTIES_MESSAGE;
      }
    } else {
      if (hasExternalGetter) {
        messageFormat = NON_EXTERNAL_TYPE_MESSAGE;
      }
    }

    return messageFormat != null
        ? String.format(
            messageFormat, francaElement.getName(), FrancaTypeHelper.getFullName(parentElement))
        : null;
  }
}
