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

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.mockito.Mockito.when;

import com.here.ivi.api.test.ArrayEList;
import com.here.ivi.api.test.Fakerator;
import org.eclipse.emf.common.util.EList;
import org.eclipse.emf.ecore.EObject;
import org.franca.core.franca.*;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

@RunWith(JUnit4.class)
@SuppressWarnings("MethodName")
public final class ExpressionValidatorTest {

  @Mock private FModel fModel;

  @Mock private FTypeCollection francaTypeCollection;
  @Mock private FEnumerationType francaEnumerationType;
  @Mock private FEnumerator francaEnumerator;
  @Mock private FConstantDef francaConstantDef;
  @Mock private FConstant francaConstantExpression;
  @Mock private FOperation francaCompoundExpression;

  private final EList<EObject> elements = new ArrayEList<>();
  private final Fakerator<EObject> fakerator = new Fakerator<>(elements);

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

    when(francaTypeCollection.eAllContents()).thenReturn(fakerator);
  }

  @Test
  public void containsNonConstantExpressions_withConstantExpression() {
    elements.add(francaConstantExpression);
    fakerator.reset();

    assertFalse(ExpressionValidator.containsNonConstantExpressions(francaTypeCollection));
  }

  @Test
  public void containsNonConstantExpressions_withNonConstantExpressionInEnumerator() {
    when(francaCompoundExpression.eContainer()).thenReturn(francaEnumerator);
    elements.add(francaCompoundExpression);
    fakerator.reset();

    assertTrue(ExpressionValidator.containsNonConstantExpressions(francaTypeCollection));
  }

  @Test
  public void containsNonConstantExpressions_withNonConstantExpressionInConstant() {
    when(francaCompoundExpression.eContainer()).thenReturn(francaConstantDef);
    elements.add(francaCompoundExpression);
    fakerator.reset();

    assertTrue(ExpressionValidator.containsNonConstantExpressions(francaTypeCollection));
  }
}
