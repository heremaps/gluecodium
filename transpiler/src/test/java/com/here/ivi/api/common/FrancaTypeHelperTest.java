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

package com.here.ivi.api.common;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import org.eclipse.emf.ecore.EObject;
import org.franca.core.franca.FTypeRef;
import org.franca.core.franca.FTypedElement;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

@RunWith(JUnit4.class)
public class FrancaTypeHelperTest {

  @Mock private FTypeRef typeRef;
  @Mock private FTypedElement typedElement;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
  }

  @Test
  public void nonTypedElement() {
    when(typeRef.eContainer()).thenReturn(mock(EObject.class));

    assertFalse(FrancaTypeHelper.isImplicitArray(typeRef));

    verify(typeRef).eContainer();
  }

  @Test
  public void nonImplicitArrayTypedElement() {
    when(typeRef.eContainer()).thenReturn(typedElement);
    when(typedElement.isArray()).thenReturn(false);

    assertFalse(FrancaTypeHelper.isImplicitArray(typeRef));

    verify(typeRef).eContainer();
    verify(typedElement).isArray();
  }

  @Test
  public void implicitArrayTypedElement() {
    when(typeRef.eContainer()).thenReturn(typedElement);
    when(typedElement.isArray()).thenReturn(true);

    assertTrue(FrancaTypeHelper.isImplicitArray(typeRef));

    verify(typeRef).eContainer();
    verify(typedElement).isArray();
  }
}
