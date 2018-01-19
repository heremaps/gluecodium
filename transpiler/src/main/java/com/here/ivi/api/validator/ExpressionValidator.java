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

import com.google.common.annotations.VisibleForTesting;
import com.here.ivi.api.common.CollectionsHelper;
import com.here.ivi.api.model.franca.DefinedBy;
import java.util.*;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import java.util.stream.StreamSupport;
import org.eclipse.emf.ecore.EObject;
import org.franca.core.franca.*;

/** Validates that all Franca expressions in the model are constant expression */
public final class ExpressionValidator {

  private static final Logger LOGGER = Logger.getLogger(ExpressionValidator.class.getName());

  public static boolean validate(final List<FTypeCollection> typeCollections) {
    return typeCollections.stream().noneMatch(ExpressionValidator::containsNonConstantExpressions);
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

  @VisibleForTesting
  static boolean containsNonConstantExpressions(final FTypeCollection francaTypeCollection) {

    //noinspection NullableProblems
    Iterable<EObject> iterable = francaTypeCollection::eAllContents;
    Stream<EObject> elementStream = StreamSupport.stream(iterable.spliterator(), false);

    Collection<String> errorMessages =
        CollectionsHelper.getStreamOfType(elementStream, FInitializerExpression.class)
            .filter(expression -> !(expression instanceof FConstant))
            .map(ExpressionValidator::createErrorMessage)
            .collect(Collectors.toList());
    errorMessages.forEach(LOGGER::severe);

    return !errorMessages.isEmpty();
  }
}
