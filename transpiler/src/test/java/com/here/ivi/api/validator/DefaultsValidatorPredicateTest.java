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

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
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
@SuppressWarnings("MethodName")
public class DefaultsValidatorPredicateTest {

  @Mock private FModel francaModel;
  @Mock private FTypeCollection francaTypeCollection;
  @Mock private FStructType francaStruct;
  @Mock private FField francaField;
  @Mock private FTypeRef francaTypeRef;
  @Mock private FEnumerationType francaEnum;

  @Mock private FrancaDeploymentModel deploymentModel;

  private final DefaultsValidatorPredicate validatorPredicate = new DefaultsValidatorPredicate();

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
  public void validateForStringNone() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.STRING);

    String result = validatorPredicate.validate(deploymentModel, francaField);

    assertNull(result);
  }

  @Test
  public void validateForBooleanNone() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.BOOLEAN);

    String result = validatorPredicate.validate(deploymentModel, francaField);

    assertNull(result);
    verify(deploymentModel).getDefaultValue(francaField);
  }

  @Test
  public void validateForBooleanValid() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.BOOLEAN);
    when(deploymentModel.getDefaultValue(any())).thenReturn("false");

    String result = validatorPredicate.validate(deploymentModel, francaField);

    assertNull(result);
    verify(deploymentModel).getDefaultValue(francaField);
  }

  @Test
  public void validateForBooleanInvalid() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.BOOLEAN);
    when(deploymentModel.getDefaultValue(any())).thenReturn("nonsense");

    String result = validatorPredicate.validate(deploymentModel, francaField);

    assertNotNull(result);
    verify(deploymentModel).getDefaultValue(francaField);
  }

  @Test
  public void validateForFloatNone() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.FLOAT);

    String result = validatorPredicate.validate(deploymentModel, francaField);

    assertNull(result);
    verify(deploymentModel).getDefaultValue(francaField);
  }

  @Test
  public void validateForFloatValid() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.FLOAT);
    when(deploymentModel.getDefaultValue(any())).thenReturn("3.14");

    String result = validatorPredicate.validate(deploymentModel, francaField);

    assertNull(result);
    verify(deploymentModel).getDefaultValue(francaField);
  }

  @Test
  public void validateForFloatInvalid() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.FLOAT);
    when(deploymentModel.getDefaultValue(any())).thenReturn("nonsense");

    String result = validatorPredicate.validate(deploymentModel, francaField);

    assertNotNull(result);
    verify(deploymentModel).getDefaultValue(francaField);
  }

  @Test
  public void validateForIntegerNone() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.INT8);

    String result = validatorPredicate.validate(deploymentModel, francaField);

    assertNull(result);
    verify(deploymentModel).getDefaultValue(francaField);
  }

  @Test
  public void validateForIntegerValid() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.INT8);
    when(deploymentModel.getDefaultValue(any())).thenReturn("42");

    String result = validatorPredicate.validate(deploymentModel, francaField);

    assertNull(result);
    verify(deploymentModel).getDefaultValue(francaField);
  }

  @Test
  public void validateForIntegerInvalid() {
    when(francaTypeRef.getPredefined()).thenReturn(FBasicTypeId.INT8);
    when(deploymentModel.getDefaultValue(any())).thenReturn("nonsense");

    String result = validatorPredicate.validate(deploymentModel, francaField);

    assertNotNull(result);
    verify(deploymentModel).getDefaultValue(francaField);
  }

  @Test
  public void validateForEnumNone() {
    when(francaTypeRef.getDerived()).thenReturn(francaEnum);

    String result = validatorPredicate.validate(deploymentModel, francaField);

    assertNull(result);
    verify(deploymentModel).getDefaultValue(francaField);
  }

  @Test
  public void validateForEnumValid() {
    when(francaTypeRef.getDerived()).thenReturn(francaEnum);
    when(deploymentModel.getDefaultValue(any())).thenReturn("SomeOtherEnumItem");

    String result = validatorPredicate.validate(deploymentModel, francaField);

    assertNull(result);
    verify(deploymentModel).getDefaultValue(francaField);
  }

  @Test
  public void validateForEnumInvalid() {
    when(francaTypeRef.getDerived()).thenReturn(francaEnum);
    when(deploymentModel.getDefaultValue(any())).thenReturn("nonsense");

    String result = validatorPredicate.validate(deploymentModel, francaField);

    assertNotNull(result);
    verify(deploymentModel).getDefaultValue(francaField);
  }
}
