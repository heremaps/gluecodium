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

import com.here.ivi.api.test.ArrayEList;
import org.eclipse.emf.common.util.EList;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FTypeCollection;
import org.franca.deploymodel.core.FDeployedInterface;
import org.franca.deploymodel.core.FDeployedTypeCollection;
import org.franca.deploymodel.dsl.fDeploy.FDSpecification;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Mock;

@RunWith(JUnit4.class)
public final class FDHelperTest {

  @Mock private FDSpecification fdSpecification;
  @Mock private FInterface fInterface;
  @Mock private FMethod fMethod1;
  @Mock private FMethod fMethod2;

  @Mock private FTypeCollection fTypeCollection;

  @Before
  public void setUp() {
    initMocks(this);
  }

  @Test
  public void testCreateDummyFDElementWithFInterface() {
    // Arrange
    when(fMethod1.getSelector()).thenReturn("MyFMethodSelector1");
    when(fMethod2.getSelector()).thenReturn("MyFMethodSelector2");

    EList<FMethod> fMethods = new ArrayEList<>();
    fMethods.add(fMethod1);
    fMethods.add(fMethod2);

    when(fInterface.getMethods()).thenReturn(fMethods);

    // Act
    FDeployedInterface fDeployedInterface =
        (FDeployedInterface) FDHelper.createDummyFDElement(fdSpecification, fInterface);

    // Assert
    FInterface retrievedFInterface = fDeployedInterface.getFInterface();
    assertEquals(2, retrievedFInterface.getMethods().size());
    assertEquals("MyFMethodSelector1", retrievedFInterface.getMethods().get(0).getSelector());
    assertEquals("MyFMethodSelector2", retrievedFInterface.getMethods().get(1).getSelector());
  }

  @Test
  public void testCreateDummyFDElementWithFTypecollection() {
    // Arrange
    when(fTypeCollection.getName()).thenReturn("MyTypeCollection");

    // Act
    FDeployedTypeCollection fDeployedTypeCollection =
        (FDeployedTypeCollection) FDHelper.createDummyFDElement(fdSpecification, fTypeCollection);

    // Assert
    FTypeCollection retrievedTypeCollection = fDeployedTypeCollection.getTypeCollection();
    assertEquals("MyTypeCollection", retrievedTypeCollection.getName());
  }
}
