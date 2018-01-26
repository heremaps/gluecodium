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

import static org.junit.Assert.*;
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
public final class ErrorEnumsValidatorPredicateTest {

  @Mock private FModel francaModel;
  @Mock private FInterface francaInterface;
  @Mock private FMethod francaMethod;

  @Mock private FrancaDeploymentModel deploymentModel;

  private final ErrorEnumsValidatorPredicate validatorPredicate =
      new ErrorEnumsValidatorPredicate();

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);

    when(francaModel.getName()).thenReturn("");
    when(francaInterface.getName()).thenReturn("");
    when(francaMethod.getName()).thenReturn("");

    when(francaInterface.eContainer()).thenReturn(francaModel);
    when(francaMethod.eContainer()).thenReturn(francaInterface);
  }

  @Test
  public void validateWithNoErrorTypes() {
    assertNull(validatorPredicate.validate(deploymentModel, francaMethod));
  }

  @Test
  public void validateWithErrorEnum() {
    when(francaMethod.getErrorEnum()).thenReturn(mock(FEnumerationType.class));

    assertNull(validatorPredicate.validate(deploymentModel, francaMethod));
  }

  @Test
  public void validateWithInlineEnum() {
    when(francaMethod.getErrors()).thenReturn(mock(FEnumerationType.class));

    assertNotNull(validatorPredicate.validate(deploymentModel, francaMethod));
  }
}
