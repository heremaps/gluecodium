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
import static org.mockito.ArgumentMatchers.any;
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
public final class InheritanceValidatorPredicateTest {

  @Mock private FModel francaModel;
  @Mock private FInterface francaInterface;
  @Mock private FInterface francaInterface2;

  @Mock private FrancaDeploymentModel deploymentModel;

  private final InheritanceValidatorPredicate validatorPredicate =
      new InheritanceValidatorPredicate();

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);

    when(francaModel.getName()).thenReturn("");
    when(francaInterface.getName()).thenReturn("");
    when(francaInterface2.getName()).thenReturn("");

    when(francaInterface.eContainer()).thenReturn(francaModel);
    when(francaInterface2.eContainer()).thenReturn(francaModel);
  }

  @Test
  public void validateWithInterfaceThatInheritsFromInterface() {
    when(francaInterface.getBase()).thenReturn(francaInterface2);
    when(deploymentModel.isInterface(any())).thenReturn(true);

    assertNull(validatorPredicate.validate(deploymentModel, francaInterface));
  }

  @Test
  public void validateWithClassThatInheritsFromInterface() {
    when(francaInterface.getBase()).thenReturn(francaInterface2);
    when(deploymentModel.isInterface(francaInterface)).thenReturn(false);
    when(deploymentModel.isInterface(francaInterface2)).thenReturn(true);

    assertNull(validatorPredicate.validate(deploymentModel, francaInterface));
  }

  @Test
  public void validateWithInterfaceThatInheritsFromClass() {
    when(francaInterface.getBase()).thenReturn(francaInterface2);
    when(deploymentModel.isInterface(francaInterface)).thenReturn(true);
    when(deploymentModel.isInterface(francaInterface2)).thenReturn(false);

    assertNotNull(validatorPredicate.validate(deploymentModel, francaInterface));
  }

  @Test
  public void validateWithClassThatInheritsFromClass() {
    when(francaInterface.getBase()).thenReturn(francaInterface2);
    when(deploymentModel.isInterface(any())).thenReturn(false);

    assertNull(validatorPredicate.validate(deploymentModel, francaInterface));
  }
}
