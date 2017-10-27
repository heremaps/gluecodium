/*
 * Copyright (C) 2017 HERE Global B.V. and its affiliate(s). All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 */

package com.here.ivi.api.validator.common;

import com.google.common.annotations.VisibleForTesting;
import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.franca.FrancaModel;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import org.franca.core.franca.FModelElement;
import org.franca.core.franca.FTypeCollection;

public class NameValidator {

  private static final Logger LOGGER = Logger.getLogger(NameValidator.class.getName());

  public static boolean validate(final FrancaModel model) {
    return checkTypeCollectionNames(model) && checkTypeNamesInTypeCollection(model);
  }

  @VisibleForTesting
  static boolean checkTypeNamesInTypeCollection(final FrancaModel model) {
    Map<String, List<String>> packageNameMapping = new HashMap<>();
    for (FTypeCollection typeCollection : model.typeCollections) {

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
  static boolean checkTypeCollectionNames(final FrancaModel model) {

    Map<String, List<String>> packageNameMapping = new HashMap<>();
    model.typeCollections.forEach(
        typeCollection -> collectName(typeCollection, packageNameMapping));
    model.interfaces.forEach(anInterface -> collectName(anInterface, packageNameMapping));

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
