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

import static org.junit.Assert.assertNotNull;
import static org.mockito.Mockito.when;

import org.franca.core.franca.*;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

@RunWith(JUnit4.class)
public final class UnionsValidatorPredicateTest {

  @Mock private FModel francaModel;
  @Mock private FTypeCollection francaTypeCollection;
  @Mock private FUnionType francaUnionType;

  private final UnionsValidatorPredicate validatorPredicate = new UnionsValidatorPredicate();

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);

    when(francaModel.getName()).thenReturn("");
    when(francaTypeCollection.getName()).thenReturn("");
    when(francaUnionType.getName()).thenReturn("");

    when(francaTypeCollection.eContainer()).thenReturn(francaModel);
    when(francaUnionType.eContainer()).thenReturn(francaTypeCollection);
  }

  @Test
  public void validateWithUnion() {
    assertNotNull(validatorPredicate.validate(null, francaUnionType));
  }
}
