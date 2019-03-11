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

import java.util.Collection;
import java.util.Collections;
import org.franca.core.franca.FArrayType;
import org.franca.core.franca.FModelElement;

/**
 * Visibility predicate for arrays. Conditions checked against:
 *
 * <ul>
 *   <li>A "public" array should not have an "internal" element type.
 *   <li>An "internal" array should not have an "internal" element type from a foreign package.
 * </ul>
 */
public final class ArrayVisibilityValidatorPredicate
    extends VisibilityValidatorPredicate<FArrayType> {

  private static final String VISIBILITY_ERROR_MESSAGE_FORMAT =
      "Public array '%s' cannot have an internal element type '%s'.";
  private static final String PACKAGE_ERROR_MESSAGE_FORMAT =
      "Internal array '%s' cannot have an internal element type '%s' from a different package.";

  @Override
  public Class<FArrayType> getElementClass() {
    return FArrayType.class;
  }

  @Override
  protected Collection<FModelElement> getChildElements(final FArrayType francaArray) {
    return Collections.singletonList(francaArray.getElementType().getDerived());
  }

  @Override
  protected String getVisibilityErrorMessageFormat() {
    return VISIBILITY_ERROR_MESSAGE_FORMAT;
  }

  @Override
  protected String getPackageErrorMessageFormat() {
    return PACKAGE_ERROR_MESSAGE_FORMAT;
  }
}
