/*
 * Copyright (C) 2018 HERE Global B.V. and its affiliate(s). All rights reserved.
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
import com.here.ivi.api.model.franca.FrancaDeploymentModel;
import java.util.Collection;
import java.util.List;
import java.util.Objects;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import java.util.stream.StreamSupport;
import org.eclipse.emf.ecore.EObject;
import org.franca.core.franca.*;

/** Validates the Franca model against Transpiler's own restrictions. */
public final class FrancaModelValidator {

  private static final Logger LOGGER = Logger.getLogger(FrancaModelValidator.class.getName());

  private final Collection<ValidatorPredicate<?>> predicates;

  public FrancaModelValidator(final Collection<ValidatorPredicate<?>> predicates) {
    this.predicates = predicates;
  }

  public boolean validate(
      final FrancaDeploymentModel deploymentModel, final List<FTypeCollection> typeCollections) {

    Collection<EObject> allElements =
        typeCollections
            .stream()
            .flatMap(FrancaModelValidator::getAllElements)
            .collect(Collectors.toList());

    return predicates
            .stream()
            .flatMap(predicate -> validateAllElements(predicate, deploymentModel, allElements))
            .filter(Objects::nonNull)
            .peek(LOGGER::severe)
            .count()
        == 0;
  }

  private static Stream<EObject> getAllElements(final FTypeCollection francaTypeCollection) {
    @SuppressWarnings("NullableProblems")
    Iterable<EObject> iterable = francaTypeCollection::eAllContents;
    return StreamSupport.stream(iterable.spliterator(), false);
  }

  private static <T extends EObject> Stream<String> validateAllElements(
      final ValidatorPredicate<T> predicate,
      final FrancaDeploymentModel deploymentModel,
      final Collection<EObject> elements) {

    return CollectionsHelper.getStreamOfType(elements, predicate.getElementClass())
        .map(element -> predicate.validate(deploymentModel, element));
  }
}
