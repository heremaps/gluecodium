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

package com.here.ivi.api.model.franca;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.when;
import static org.mockito.MockitoAnnotations.initMocks;

import org.franca.core.franca.FModelElement;
import org.franca.core.franca.FQualifiedElementRef;
import org.franca.core.franca.FTypeCollection;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Mock;

@SuppressWarnings("MethodName")
@RunWith(JUnit4.class)
public final class DefinedByTest {

  @Mock private FModelElement francaModelElement;
  @Mock private FQualifiedElementRef francaQualifiedElementRef;
  @Mock private FTypeCollection francaTypeCollection;

  @Before
  public void setUp() {
    initMocks(this);
  }

  @Test
  public void findDefiningTypeCollectionReturnsTypeCollection() {
    // Arrange
    when(francaTypeCollection.getName()).thenReturn("MyFTypeCollection");

    // Act
    FTypeCollection definingTypeCollection =
        DefinedBy.findDefiningTypeCollection(francaTypeCollection);

    // Assert
    assertEquals("MyFTypeCollection", definingTypeCollection.getName());
  }

  @Test
  public void findDefiningTypeCollection_returnsParentTypeCollection() {

    // Arrange
    when(francaTypeCollection.getName()).thenReturn("MyFTypeCollection");
    when(francaModelElement.eContainer()).thenReturn(francaTypeCollection);

    // Act
    FTypeCollection definingTypeCollection =
        DefinedBy.findDefiningTypeCollection(francaModelElement);

    // Assert
    assertEquals("MyFTypeCollection", definingTypeCollection.getName());
  }

  @Test
  public void findDefiningTypeCollection_forQualifiedRef_returnsParentTypeCollection() {

    // Arrange
    when(francaTypeCollection.getName()).thenReturn("MyFTypeCollection");
    when(francaQualifiedElementRef.eContainer()).thenReturn(francaTypeCollection);

    // Act
    FTypeCollection definingTypeCollection =
        DefinedBy.findDefiningTypeCollection(francaQualifiedElementRef);

    // Assert
    assertEquals("MyFTypeCollection", definingTypeCollection.getName());
  }
}
