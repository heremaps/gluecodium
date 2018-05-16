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
  @Mock private FQualifiedElementRef francaEnumeratorRef;

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

    when(francaEnumeratorRef.getElement()).thenReturn(francaEnumerator);
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

  @Test
  public void validateWithEnumeratorReferenceExpressionInConstant() {
    when(francaEnumeratorRef.eContainer()).thenReturn(francaConstantDef);

    assertNull(validatorPredicate.validate(null, francaEnumeratorRef));
  }
}
