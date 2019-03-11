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

package com.here.genium.validator;

import com.here.genium.common.CollectionsHelper;
import com.here.genium.model.franca.FrancaDeploymentModel;
import java.util.Collection;
import java.util.List;
import java.util.Objects;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import java.util.stream.StreamSupport;
import org.eclipse.emf.ecore.EObject;
import org.franca.core.franca.*;

/** Validates the Franca model against Genium's own restrictions. */
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
