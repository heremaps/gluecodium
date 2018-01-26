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

import static org.junit.Assert.*;
import static org.mockito.Mockito.when;

import org.franca.core.franca.*;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

@RunWith(JUnit4.class)
@SuppressWarnings("MethodName")
public final class ExpressionValidatorPredicateTest {

  @Mock private FModel fModel;

  @Mock private FTypeCollection francaTypeCollection;
  @Mock private FEnumerationType francaEnumerationType;
  @Mock private FEnumerator francaEnumerator;
  @Mock private FConstantDef francaConstantDef;
  @Mock private FConstant francaConstantExpression;
  @Mock private FOperation francaCompoundExpression;

  private final ExpressionValidatorPredicate validatorPredicate =
      new ExpressionValidatorPredicate();

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);

    when(fModel.getName()).thenReturn("");
    when(francaTypeCollection.getName()).thenReturn("");
    when(francaEnumerationType.getName()).thenReturn("");
    when(francaEnumerator.getName()).thenReturn("");
    when(francaConstantDef.getName()).thenReturn("");

    when(francaTypeCollection.eContainer()).thenReturn(fModel);
    when(francaEnumerationType.eContainer()).thenReturn(francaTypeCollection);
    when(francaEnumerator.eContainer()).thenReturn(francaEnumerationType);
    when(francaConstantDef.eContainer()).thenReturn(francaTypeCollection);
  }

  @Test
  public void validateWithConstantExpression() {
    assertNull(validatorPredicate.validate(null, francaConstantExpression));
  }

  @Test
  public void validateWithNonConstantExpressionInEnumerator() {
    when(francaCompoundExpression.eContainer()).thenReturn(francaEnumerator);

    assertNotNull(validatorPredicate.validate(null, francaCompoundExpression));
  }

  @Test
  public void validateWithNonConstantExpressionInConstant() {
    when(francaCompoundExpression.eContainer()).thenReturn(francaConstantDef);

    assertNotNull(validatorPredicate.validate(null, francaCompoundExpression));
  }
}
