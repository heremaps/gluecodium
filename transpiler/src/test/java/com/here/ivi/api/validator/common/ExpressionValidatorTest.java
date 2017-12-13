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

import static java.util.Collections.singletonList;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.mockito.Mockito.when;

import com.here.ivi.api.test.ArrayEList;
import com.here.ivi.api.validator.ExpressionValidator;
import org.franca.core.franca.*;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

@RunWith(JUnit4.class)
public final class ExpressionValidatorTest {

  @Mock private FModel fModel;

  @Mock private FTypeCollection francaTypeCollection;
  @Mock private FEnumerationType francaEnumerationType;
  @Mock private FEnumerator francaEnumerator;
  @Mock private FConstantDef francaConstantDef;
  @Mock private FConstant francaConstantExpression;
  @Mock private FOperation francaCompoundExpression;

  private final ArrayEList<FType> types = new ArrayEList<>();
  private final ArrayEList<FConstantDef> constants = new ArrayEList<>();
  private final ArrayEList<FEnumerator> enumerators = new ArrayEList<>();

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

    when(francaTypeCollection.getTypes()).thenReturn(types);
    when(francaTypeCollection.getConstants()).thenReturn(constants);
    when(francaEnumerationType.getEnumerators()).thenReturn(enumerators);

    enumerators.add(francaEnumerator);
  }

  @Test
  public void validateEnumeratorWithoutInitializer() {
    types.add(francaEnumerationType);

    boolean result = ExpressionValidator.validate(singletonList(francaTypeCollection));

    assertTrue(result);
  }

  @Test
  public void validateEnumeratorWithConstantInitializer() {
    when(francaEnumerator.getValue()).thenReturn(francaConstantExpression);
    types.add(francaEnumerationType);

    boolean result = ExpressionValidator.validate(singletonList(francaTypeCollection));

    assertTrue(result);
  }

  @Test
  public void validateEnumeratorWithCompoundInitializer() {
    when(francaCompoundExpression.eContainer()).thenReturn(francaEnumerator);
    when(francaEnumerator.getValue()).thenReturn(francaCompoundExpression);
    types.add(francaEnumerationType);

    boolean result = ExpressionValidator.validate(singletonList(francaTypeCollection));

    assertFalse(result);
  }

  @Test
  public void validateConstantWithoutInitializer() {
    constants.add(francaConstantDef);

    boolean result = ExpressionValidator.validate(singletonList(francaTypeCollection));

    assertTrue(result);
  }

  @Test
  public void validateConstantWithConstantInitializer() {
    when(francaConstantDef.getRhs()).thenReturn(francaConstantExpression);
    constants.add(francaConstantDef);

    boolean result = ExpressionValidator.validate(singletonList(francaTypeCollection));

    assertTrue(result);
  }

  @Test
  public void validateContantWithCompoundInitializer() {
    when(francaCompoundExpression.eContainer()).thenReturn(francaConstantDef);
    when(francaConstantDef.getRhs()).thenReturn(francaCompoundExpression);
    constants.add(francaConstantDef);

    boolean result = ExpressionValidator.validate(singletonList(francaTypeCollection));

    assertFalse(result);
  }
}
