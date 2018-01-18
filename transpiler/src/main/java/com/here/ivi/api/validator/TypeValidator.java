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
import java.util.Collection;
import java.util.List;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import java.util.stream.StreamSupport;
import org.eclipse.emf.ecore.EObject;
import org.franca.core.franca.*;

/**
 * Validates that all of the Franca type collections or interfaces contain none of the following
 * unsupported types:
 *
 * <ul>
 *   <li>Union
 * </ul>
 */
public final class TypeValidator {

  private static final Logger LOGGER = Logger.getLogger(TypeValidator.class.getName());

  private static final String UNION_MESSAGE =
      "Unions are not supported: union '%s' in type collection '%s.%s'.";

  public static boolean validate(final List<FTypeCollection> typeCollections) {

    return checkUnions(typeCollections);
  }

  private static boolean checkUnions(final Collection<FTypeCollection> typeCollections) {
    return typeCollections.stream().noneMatch(TypeValidator::containsUnions);
  }

  @VisibleForTesting
  static boolean containsUnions(final FTypeCollection francaTypeCollection) {

    String modelName = DefinedBy.getModelName(francaTypeCollection);
    String typeCollectionName = francaTypeCollection.getName();

    //noinspection NullableProblems
    Iterable<EObject> iterable = francaTypeCollection::eAllContents;
    Stream<EObject> elementStream = StreamSupport.stream(iterable.spliterator(), false);

    Collection<String> errorMessages =
        CollectionsHelper.getStreamOfType(elementStream, FUnionType.class)
            .map(
                union ->
                    String.format(UNION_MESSAGE, union.getName(), modelName, typeCollectionName))
            .collect(Collectors.toList());
    errorMessages.forEach(LOGGER::severe);

    return !errorMessages.isEmpty();
  }
}
