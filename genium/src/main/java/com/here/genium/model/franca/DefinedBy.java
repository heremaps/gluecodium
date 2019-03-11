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

package com.here.genium.model.franca;

import java.util.List;
import org.eclipse.xtext.util.Strings;
import org.franca.core.franca.FModel;
import org.franca.core.franca.FModelElement;
import org.franca.core.franca.FQualifiedElementRef;
import org.franca.core.franca.FTypeCollection;

/** This class is used for resolving namespaces and includes. */
public final class DefinedBy {

  /**
   * Find the TypeCollection that contains this type by moving up the hierarchy recursively
   *
   * @param modelElement The franca object
   * @return The type collection that contains this type
   */
  public static FTypeCollection findDefiningTypeCollection(final FModelElement modelElement) {
    return modelElement instanceof FTypeCollection
        ? (FTypeCollection) modelElement
        : findDefiningTypeCollection((FModelElement) modelElement.eContainer());
  }

  public static FTypeCollection findDefiningTypeCollection(
      final FQualifiedElementRef qualifiedElementRef) {
    return findDefiningTypeCollection((FModelElement) qualifiedElementRef.eContainer());
  }

  public static List<String> getPackages(final FTypeCollection francaTypeCollection) {
    return Strings.split(getModelName(francaTypeCollection), ".");
  }

  public static String getModelName(final FTypeCollection typeCollection) {
    return ((FModel) typeCollection.eContainer()).getName();
  }

  public static String getModelName(final FModelElement francaModeElement) {
    return getModelName(findDefiningTypeCollection(francaModeElement));
  }
}
