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
import org.franca.core.franca.*;

/**
 * Visibility predicate for structs. Conditions checked against:
 *
 * <ul>
 *   <li>A "public" struct should not inherit from an "internal" struct.
 *   <li>An "internal" struct should not inherit from an "internal" struct from a foreign package.
 * </ul>
 */
public final class StructVisibilityValidatorPredicate
    extends VisibilityValidatorPredicate<FStructType> {

  private static final String ERROR_MESSAGE_FORMAT =
      "Public struct '%s' cannot inherit from an internal struct '%s'.";
  private static final String PACKAGE_ERROR_MESSAGE_FORMAT =
      "Internal struct '%s' cannot inherit from an internal struct '%s' from a different package.";

  @Override
  public Class<FStructType> getElementClass() {
    return FStructType.class;
  }

  @Override
  protected Collection<FModelElement> getChildElements(final FStructType francaStruct) {
    return Collections.singletonList(francaStruct.getBase());
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
