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

package com.here.ivi.api.validator;

import com.here.ivi.api.common.CollectionsHelper;
import com.here.ivi.api.model.franca.DefinedBy;
import java.util.*;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import org.franca.core.franca.*;

/** Validates that all Franca expressions in the model are constant expression */
public final class ExpressionValidator {

  private static final Logger LOGGER = Logger.getLogger(ExpressionValidator.class.getName());

  public static boolean validate(final List<FTypeCollection> typeCollections) {

    Stream<FType> allTypes =
        typeCollections.stream().map(FTypeCollection::getTypes).flatMap(Collection::stream);
    List<FInitializerExpression> enumeratorExpressions =
        CollectionsHelper.getStreamOfType(allTypes, FEnumerationType.class)
            .map(FEnumerationType::getEnumerators)
            .flatMap(Collection::stream)
            .map(FEnumerator::getValue)
            .filter(Objects::nonNull)
            .collect(Collectors.toList());
    List<FInitializerExpression> constantExpressions =
        typeCollections
            .stream()
            .map(FTypeCollection::getConstants)
            .flatMap(Collection::stream)
            .map(FConstantDef::getRhs)
            .filter(Objects::nonNull)
            .collect(Collectors.toList());

    List<FInitializerExpression> allExpressions = new LinkedList<>();
    allExpressions.addAll(enumeratorExpressions);
    allExpressions.addAll(constantExpressions);

    boolean result = true;
    for (final FInitializerExpression expression : allExpressions) {
      if (!(expression instanceof FConstant)) {
        LOGGER.severe(createErrorMessage(expression));
        result = false;
      }
    }

    return result;
  }

  private static String createErrorMessage(final FInitializerExpression expression) {

    StringBuilder builder = new StringBuilder();
    builder.append("Initializer expression for ");
    FModelElement parentElement = (FModelElement) expression.eContainer();
    if (parentElement instanceof FEnumerator) {
      builder
          .append("enumerator '")
          .append(parentElement.getName())
          .append("' of enumeration '")
          .append(((FModelElement) parentElement.eContainer()).getName())
          .append("' ");
    } else {
      builder.append("constant '").append(parentElement.getName()).append("' ");
    }

    FTypeCollection parentTypeCollection = DefinedBy.findDefiningTypeCollection(parentElement);
    builder
        .append(" in '")
        .append(((FModel) parentTypeCollection.eContainer()).getName())
        .append('.')
        .append(parentTypeCollection.getName())
        .append("' is not a constant expression.");

    return builder.toString();
  }
}
