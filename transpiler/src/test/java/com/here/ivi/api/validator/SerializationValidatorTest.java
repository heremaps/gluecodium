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

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
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
public class SerializationValidatorTest {

  @Mock private FModel fModel;
  @Mock private FTypeCollection francaTypeCollection;
  @Mock private FStructType francaStructType;
  @Mock private FField francaField;
  @Mock private FTypeRef francaTypeRef;

  @Mock private FrancaDeploymentModel deploymentModel;

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
  }

  @Test
  public void refersToInstance_withPrimitiveType() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.BOOLEAN);

    assertFalse(SerializationValidator.refersToInstance(francaField));
  }

  @Test
  public void refersToInstance_withStructType() {
    when(francaTypeRef.getDerived()).thenReturn(mock(FStructType.class));

    assertFalse(SerializationValidator.refersToInstance(francaField));
  }

  @Test
  public void refersToInstance_withUndefined() {
    assertTrue(SerializationValidator.refersToInstance(francaField));
  }

  @Test
  public void refersToInstance_withTypeDefToUndefined() {
    FTypeRef undefinedTypeRef = mock(FTypeRef.class);
    when(undefinedTypeRef.getPredefined()).thenReturn(FBasicTypeId.UNDEFINED);
    FTypeDef francaTypeDef = mock(FTypeDef.class);
    when(francaTypeDef.getActualType()).thenReturn(undefinedTypeRef);
    when(francaTypeRef.getDerived()).thenReturn(francaTypeDef);

    assertTrue(SerializationValidator.refersToInstance(francaField));
  }

  @Test
  public void refersToNonSerializableStruct_withPrimitiveType() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.BOOLEAN);

    assertFalse(SerializationValidator.refersToNonSerializableStruct(deploymentModel, francaField));
  }

  @Test
  public void refersToNonSerializableStruct_withStructType() {
    when(francaTypeRef.getDerived()).thenReturn(mock(FStructType.class));

    assertTrue(SerializationValidator.refersToNonSerializableStruct(deploymentModel, francaField));
  }

  @Test
  public void refersToNonSerializableStruct_withSerializableStructType() {
    FStructType serializableStruct = mock(FStructType.class);
    when(deploymentModel.isSerializable(serializableStruct)).thenReturn(true);
    when(francaTypeRef.getDerived()).thenReturn(serializableStruct);

    assertFalse(SerializationValidator.refersToNonSerializableStruct(deploymentModel, francaField));
  }
}
