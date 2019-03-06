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

package com.here.genium.validator.visibility;

import java.util.Collection;
import java.util.Collections;
import org.franca.core.franca.FAttribute;
import org.franca.core.franca.FModelElement;

/**
 * Visibility predicate for attributes. Conditions checked against:
 *
 * <ul>
 *   <li>A "public" attribute should not have an "internal" type.
 *   <li>An "internal" attribute should not have an "internal" type from a foreign package.
 * </ul>
 */
public final class AttributeVisibilityValidatorPredicate
    extends VisibilityValidatorPredicate<FAttribute> {

  private static final String ERROR_MESSAGE_FORMAT =
      "Public attribute '%s' cannot have an internal type '%s'.";
  private static final String PACKAGE_ERROR_MESSAGE_FORMAT =
      "Internal attribute '%s' cannot have an internal type '%s' from a different package.";

  @Override
  public Class<FAttribute> getElementClass() {
    return FAttribute.class;
  }

  @Override
  protected Collection<FModelElement> getChildElements(final FAttribute francaAttribute) {
    return Collections.singletonList(francaAttribute.getType().getDerived());
  }

  @Override
  protected String getVisibilityErrorMessageFormat() {
    return ERROR_MESSAGE_FORMAT;
  }

  @Override
  protected String getPackageErrorMessageFormat() {
    return PACKAGE_ERROR_MESSAGE_FORMAT;
  }
}
