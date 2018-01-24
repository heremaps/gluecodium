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

import com.google.common.annotations.VisibleForTesting;
import com.here.ivi.api.common.CollectionsHelper;
import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.franca.FrancaDeploymentModel;
import java.util.*;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import java.util.stream.StreamSupport;
import org.eclipse.emf.ecore.EObject;
import org.franca.core.franca.*;

/**
 * Validate each Franca struct marked as "Serializable" against the following conditions:
 *
 * <ul>
 *   <li>Should not contain Instance type fields.
 *   <li>All Struct type fields should be of some "Serializable" Struct type.
 * </ul>
 */
public class SerializationValidator {

  private static final Logger LOGGER = Logger.getLogger(SerializationValidator.class.getName());

  private static final String INSTANCE_MESSAGE =
      "Instance fields are not supported for serializable structs: "
          + "field '%s' in struct '%s.%s.%s'.";
  private static final String NON_SERIALIZABLE_MESSAGE =
      "Fields of non-serializable struct types are not supported for serializable structs: "
          + "field '%s' in struct '%s.%s.%s'.";

  public static boolean validate(
      final FrancaDeploymentModel deploymentModel, final List<FTypeCollection> typeCollections) {

    Collection<FField> fields =
        typeCollections
            .stream()
            .flatMap(
                typeCollection ->
                    getAllFieldsOfSerializableStructs(deploymentModel, typeCollection))
            .collect(Collectors.toList());

    // Fully evaluate both predicates so that all errors are reported.
    boolean noInstanceFields =
        CollectionsHelper.noneMatchFullEvaluation(
            fields.stream(), SerializationValidator::refersToInstance);
    boolean noNonSerializableFields =
        CollectionsHelper.noneMatchFullEvaluation(
            fields.stream(), field -> refersToNonSerializableStruct(deploymentModel, field));

    return noInstanceFields && noNonSerializableFields;
  }

  private static Stream<FField> getAllFieldsOfSerializableStructs(
      final FrancaDeploymentModel deploymentModel, final FTypeCollection francaTypeCollection) {

    @SuppressWarnings("NullableProblems")
    Iterable<EObject> iterable = francaTypeCollection::eAllContents;
    Stream<EObject> elementStream = StreamSupport.stream(iterable.spliterator(), false);

    return CollectionsHelper.getStreamOfType(elementStream, FField.class)
        .filter(field -> deploymentModel.isSerializable((FStructType) field.eContainer()));
  }

  private static FTypeRef getUnderlyingType(final FTypeRef declaredType) {

    FType derivedType = declaredType.getDerived();
    if (derivedType instanceof FTypeDef) {
      return getUnderlyingType(((FTypeDef) derivedType).getActualType());
    }
    if (derivedType instanceof FArrayType) {
      return getUnderlyingType(((FArrayType) derivedType).getElementType());
    }
    if (derivedType instanceof FMapType) {
      // No validation against Map keys, since only primitive and enum keys are supported.
      return getUnderlyingType(((FMapType) derivedType).getValueType());
    }

    return declaredType;
  }

  private static String formatErrorMessage(final String formatString, final FField francaField) {

    FStructType francaStruct = (FStructType) francaField.eContainer();
    FTypeCollection francaTypeCollection = (FTypeCollection) francaStruct.eContainer();

    return String.format(
        formatString,
        francaField.getName(),
        DefinedBy.getModelName(francaTypeCollection),
        francaTypeCollection.getName(),
        francaStruct.getName());
  }

  @VisibleForTesting
  static boolean refersToInstance(final FField francaField) {

    FTypeRef underlyingType = getUnderlyingType(francaField.getType());
    boolean result =
        underlyingType.getDerived() == null
            && underlyingType.getPredefined() == FBasicTypeId.UNDEFINED;

    if (result) {
      LOGGER.severe(formatErrorMessage(INSTANCE_MESSAGE, francaField));
    }

    return result;
  }

  @VisibleForTesting
  static boolean refersToNonSerializableStruct(
      final FrancaDeploymentModel deploymentModel, final FField francaField) {

    FTypeRef underlyingType = getUnderlyingType(francaField.getType());
    FType derivedType = underlyingType.getDerived();
    boolean result =
        derivedType instanceof FStructType
            && !deploymentModel.isSerializable((FStructType) derivedType);

    if (result) {
      LOGGER.severe(formatErrorMessage(NON_SERIALIZABLE_MESSAGE, francaField));
    }

    return result;
  }
}
