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

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

import com.here.ivi.api.model.franca.FrancaDeploymentModel;
import com.here.ivi.api.test.ArrayEList;
import java.util.Arrays;
import org.franca.core.franca.*;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

@RunWith(JUnit4.class)
public class DefaultsValidatorTest {

  @Mock private FModel francaModel;
  @Mock private FTypeCollection francaTypeCollection;
  @Mock private FStructType francaStruct;
  @Mock private FField francaField;
  @Mock private FTypeRef francaTypeRef;
  @Mock private FEnumerationType francaEnum;

  @Mock private FrancaDeploymentModel deploymentModel;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);

    when(francaModel.getName()).thenReturn("Foo");
    when(francaTypeCollection.getName()).thenReturn("Bar");
    when(francaStruct.getName()).thenReturn("Baz");
    when(francaField.getName()).thenReturn("Fizz");

    when(francaTypeCollection.eContainer()).thenReturn(francaModel);
    when(francaStruct.eContainer()).thenReturn(francaTypeCollection);
    when(francaField.eContainer()).thenReturn(francaStruct);
    when(francaField.getType()).thenReturn(francaTypeRef);

    FEnumerator enumerator1 = mock(FEnumerator.class);
    when(enumerator1.getName()).thenReturn("SomeEnumItem");
    FEnumerator enumerator2 = mock(FEnumerator.class);
    when(enumerator2.getName()).thenReturn("SomeOtherEnumItem");
    when(francaEnum.getEnumerators())
        .thenReturn(new ArrayEList<>(Arrays.asList(enumerator1, enumerator2)));
  }

  @Test
  public void checkFieldDefaultValueForStringNone() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.STRING);

    boolean result = DefaultsValidator.checkFieldDefaultValue(francaField, deploymentModel);

    assertTrue(result);
    verify(deploymentModel, never()).getDefaultValue(any());
  }

  @Test
  public void checkFieldDefaultValueForBooleanNone() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.BOOLEAN);

    boolean result = DefaultsValidator.checkFieldDefaultValue(francaField, deploymentModel);

    assertTrue(result);
    verify(deploymentModel).getDefaultValue(francaField);
  }

  @Test
  public void checkFieldDefaultValueForBooleanValid() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.BOOLEAN);
    when(deploymentModel.getDefaultValue(any())).thenReturn("false");

    boolean result = DefaultsValidator.checkFieldDefaultValue(francaField, deploymentModel);

    assertTrue(result);
    verify(deploymentModel).getDefaultValue(francaField);
  }

  @Test
  public void checkFieldDefaultValueForBooleanInvalid() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.BOOLEAN);
    when(deploymentModel.getDefaultValue(any())).thenReturn("nonsense");

    boolean result = DefaultsValidator.checkFieldDefaultValue(francaField, deploymentModel);

    assertFalse(result);
    verify(deploymentModel).getDefaultValue(francaField);
  }

  @Test
  public void checkFieldDefaultValueForFloatNone() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.FLOAT);

    boolean result = DefaultsValidator.checkFieldDefaultValue(francaField, deploymentModel);

    assertTrue(result);
    verify(deploymentModel).getDefaultValue(francaField);
  }

  @Test
  public void checkFieldDefaultValueForFloatValid() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.FLOAT);
    when(deploymentModel.getDefaultValue(any())).thenReturn("3.14");

    boolean result = DefaultsValidator.checkFieldDefaultValue(francaField, deploymentModel);

    assertTrue(result);
    verify(deploymentModel).getDefaultValue(francaField);
  }

  @Test
  public void checkFieldDefaultValueForFloatInvalid() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.FLOAT);
    when(deploymentModel.getDefaultValue(any())).thenReturn("nonsense");

    boolean result = DefaultsValidator.checkFieldDefaultValue(francaField, deploymentModel);

    assertFalse(result);
    verify(deploymentModel).getDefaultValue(francaField);
  }

  @Test
  public void checkFieldDefaultValueForIntegerNone() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.INT8);

    boolean result = DefaultsValidator.checkFieldDefaultValue(francaField, deploymentModel);

    assertTrue(result);
    verify(deploymentModel).getDefaultValue(francaField);
  }

  @Test
  public void checkFieldDefaultValueForIntegerValid() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.INT8);
    when(deploymentModel.getDefaultValue(any())).thenReturn("42");

    boolean result = DefaultsValidator.checkFieldDefaultValue(francaField, deploymentModel);

    assertTrue(result);
    verify(deploymentModel).getDefaultValue(francaField);
  }

  @Test
  public void checkFieldDefaultValueForIntegerInvalid() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.INT8);
    when(deploymentModel.getDefaultValue(any())).thenReturn("nonsense");

    boolean result = DefaultsValidator.checkFieldDefaultValue(francaField, deploymentModel);

    assertFalse(result);
    verify(deploymentModel).getDefaultValue(francaField);
  }

  @Test
  public void checkFieldDefaultValueForEnumNone() {
    when(francaTypeRef.getDerived()).thenReturn(francaEnum);

    boolean result = DefaultsValidator.checkFieldDefaultValue(francaField, deploymentModel);

    assertTrue(result);
    verify(deploymentModel).getDefaultValue(francaField);
  }

  @Test
  public void checkFieldDefaultValueForEnumValid() {
    when(francaTypeRef.getDerived()).thenReturn(francaEnum);
    when(deploymentModel.getDefaultValue(any())).thenReturn("SomeOtherEnumItem");

    boolean result = DefaultsValidator.checkFieldDefaultValue(francaField, deploymentModel);

    assertTrue(result);
    verify(deploymentModel).getDefaultValue(francaField);
  }

  @Test
  public void checkFieldDefaultValueForEnumInvalid() {
    when(francaTypeRef.getDerived()).thenReturn(francaEnum);
    when(deploymentModel.getDefaultValue(any())).thenReturn("nonsense");

    boolean result = DefaultsValidator.checkFieldDefaultValue(francaField, deploymentModel);

    assertFalse(result);
    verify(deploymentModel).getDefaultValue(francaField);
  }
}
