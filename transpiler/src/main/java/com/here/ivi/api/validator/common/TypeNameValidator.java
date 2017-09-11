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

import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.franca.FrancaModel;
import com.here.ivi.api.model.franca.TypeCollection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class TypeNameValidator {

  public static boolean validate(final FrancaModel model) {

    Map<String, List<String>> packageNameMapping = new HashMap<>();
    for (TypeCollection typeCollection : model.getTypeCollections()) {
      DefinedBy definer =
          DefinedBy.createFromFModelElement(typeCollection.getFrancaTypeCollection());
      String packageName = String.join(".", definer.getPackages());

      List<String> value = packageNameMapping.get(packageName);
      if (value == null) {
        value = new LinkedList<>();
        packageNameMapping.put(packageName, value);
      }
      value.addAll(
          typeCollection
              .getFrancaTypeCollection()
              .getTypes()
              .stream()
              .map(type -> type.getName())
              .collect(Collectors.toList()));
    }

    for (List<String> typeNames : packageNameMapping.values()) {
      if (typeNames.size() != new HashSet<>(typeNames).size()) {
        return false;
      }
    }
    return true;
  }
}
