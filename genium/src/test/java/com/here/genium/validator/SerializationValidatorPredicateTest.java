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

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.here.genium.model.franca.FrancaDeploymentModel;
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
