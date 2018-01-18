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
import static org.mockito.Mockito.mock;
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
public final class TypeValidatorTest {

  @Mock private FModel francaModel;
  @Mock private FTypeCollection francaTypeCollection;
  @Mock private FUnionType francaUnionType;

  private final EList<EObject> elements = new ArrayEList<>();
  private final Fakerator<EObject> fakerator = new Fakerator<>(elements);

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);

    when(francaModel.getName()).thenReturn("nonsense");
    when(francaTypeCollection.eContainer()).thenReturn(francaModel);
    when(francaTypeCollection.getName()).thenReturn("foo");
    when(francaTypeCollection.eAllContents()).thenReturn(fakerator);

    when(francaUnionType.getName()).thenReturn("bar");
  }

  @Test
  public void containsUnions_noElements() {
    fakerator.reset();

    assertFalse(TypeValidator.containsUnions(francaTypeCollection));
  }

  @Test
  public void containsUnions_noUnions() {
    elements.add(mock(FModelElement.class));
    fakerator.reset();

    assertFalse(TypeValidator.containsUnions(francaTypeCollection));
  }

  @Test
  public void containsUnions_oneUnion() {
    elements.add(francaUnionType);
    fakerator.reset();

    assertTrue(TypeValidator.containsUnions(francaTypeCollection));
  }
}
