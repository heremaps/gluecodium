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

import com.google.common.annotations.VisibleForTesting;
import com.here.genium.franca.DefinedBy;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FModelElement;
import org.franca.core.franca.FTypeCollection;

/**
 * Check for name duplications.
 *
 * <p>Type collection names are omitted from the generated types to give a more native feel. This
 * means there could be name collisions between types from TypeCollections and Interfaces. This
 * validator checks that.
 */
public class NameValidator {

  private static final Logger LOGGER = Logger.getLogger(NameValidator.class.getName());

  public static boolean validate(final List<FTypeCollection> typeCollections) {
    return checkTypeCollectionNames(typeCollections)
        && checkTypeNamesInTypeCollection(typeCollections);
  }

  @VisibleForTesting
  static boolean checkTypeNamesInTypeCollection(final List<FTypeCollection> typeCollections) {
    Map<String, List<String>> packageNameMapping = new HashMap<>();
    List<FTypeCollection> filteredTypeCollections =
        typeCollections
            .stream()
            .filter(obj -> !(obj instanceof FInterface))
            .collect(Collectors.toList());
    for (FTypeCollection typeCollection : filteredTypeCollections) {

      String packageName = DefinedBy.getModelName(typeCollection);
      List<String> value =
          packageNameMapping.computeIfAbsent(packageName, key -> new LinkedList<>());
      value.addAll(
          typeCollection
              .getTypes()
              .stream()
              .map(FModelElement::getName)
              .collect(Collectors.toList()));
    }

    return checkForDuplicateNames(packageNameMapping, "type");
  }

  @VisibleForTesting
  static boolean checkTypeCollectionNames(final List<FTypeCollection> typeCollections) {

    Map<String, List<String>> packageNameMapping = new HashMap<>();
    typeCollections.forEach(typeCollection -> collectName(typeCollection, packageNameMapping));

    return checkForDuplicateNames(packageNameMapping, "type collection");
  }

  private static void collectName(
      final FTypeCollection francaTypeCollection,
      final Map<String, List<String>> packageNameMapping) {
    String packageName = DefinedBy.getModelName(francaTypeCollection);
    List<String> value = packageNameMapping.computeIfAbsent(packageName, key -> new LinkedList<>());
    value.add(francaTypeCollection.getName());
  }

  private static boolean checkForDuplicateNames(
      final Map<String, List<String>> packageNameMapping, final String entityName) {

    for (Map.Entry<String, List<String>> entry : packageNameMapping.entrySet()) {
      List<String> names = entry.getValue();
      if (names.size() != new HashSet<>(names).size()) {
        LOGGER.severe("Package '" + entry.getKey() + "' has duplicate " + entityName + " names");
        return false;
      }
    }

    return true;
  }
}
