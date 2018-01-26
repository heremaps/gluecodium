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

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.here.ivi.api.model.franca.FrancaDeploymentModel;
import org.franca.core.franca.*;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

@RunWith(JUnit4.class)
@SuppressWarnings("MethodName")
public class SerializationValidatorPredicateTest {

  @Mock private FModel fModel;
  @Mock private FTypeCollection francaTypeCollection;
  @Mock private FStructType francaStructType;
  @Mock private FField francaField;
  @Mock private FTypeRef francaTypeRef;

  @Mock private FrancaDeploymentModel deploymentModel;

  private final SerializationValidatorPredicate validatorPredicate =
      new SerializationValidatorPredicate();

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);

    when(fModel.getName()).thenReturn("");
    when(francaTypeCollection.getName()).thenReturn("");
    when(francaStructType.getName()).thenReturn("");
    when(francaField.getName()).thenReturn("");

    when(francaTypeCollection.eContainer()).thenReturn(fModel);
    when(francaStructType.eContainer()).thenReturn(francaTypeCollection);
    when(francaField.eContainer()).thenReturn(francaStructType);

    when(francaField.getType()).thenReturn(francaTypeRef);
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.UNDEFINED);

    when(deploymentModel.isSerializable(francaStructType)).thenReturn(true);
  }

  @Test
  public void validateWithFieldInNonSerializableStruct() {
    when(deploymentModel.isSerializable(francaStructType)).thenReturn(false);

    assertNull(validatorPredicate.validate(deploymentModel, francaField));
  }

  @Test
  public void validateWithPrimitiveType() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.BOOLEAN);

    assertNull(validatorPredicate.validate(deploymentModel, francaField));
  }

  @Test
  public void validateWithUndefined() {
    assertNotNull(validatorPredicate.validate(deploymentModel, francaField));
  }

  @Test
  public void validateWithTypeDefToUndefined() {
    FTypeRef undefinedTypeRef = mock(FTypeRef.class);
    when(undefinedTypeRef.getPredefined()).thenReturn(FBasicTypeId.UNDEFINED);
    FTypeDef francaTypeDef = mock(FTypeDef.class);
    when(francaTypeDef.getActualType()).thenReturn(undefinedTypeRef);
    when(francaTypeRef.getDerived()).thenReturn(francaTypeDef);

    assertNotNull(validatorPredicate.validate(deploymentModel, francaField));
  }

  @Test
  public void validateWithStructType() {
    when(francaTypeRef.getDerived()).thenReturn(mock(FStructType.class));

    assertNotNull(validatorPredicate.validate(deploymentModel, francaField));
  }

  @Test
  public void validateWithSerializableStructType() {
    FStructType serializableStruct = mock(FStructType.class);
    when(deploymentModel.isSerializable(serializableStruct)).thenReturn(true);
    when(francaTypeRef.getDerived()).thenReturn(serializableStruct);

    assertNull(validatorPredicate.validate(deploymentModel, francaField));
  }
}
