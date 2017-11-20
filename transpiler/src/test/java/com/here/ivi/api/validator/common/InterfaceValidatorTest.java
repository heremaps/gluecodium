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

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.mockito.Mockito.when;

import com.here.ivi.api.model.franca.FrancaDeploymentModel;
import com.here.ivi.api.test.ArrayEList;
import java.util.LinkedList;
import java.util.List;
import org.eclipse.emf.common.util.EList;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FTypeCollection;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

@RunWith(JUnit4.class)
@SuppressWarnings({"MethodName"})
public final class InterfaceValidatorTest {

  @Mock private FInterface francaInterface;
  @Mock private FInterface francaInterface2;
  @Mock private FTypeCollection francaTypeCollection;
  @Mock private FrancaDeploymentModel francaDeploymentModel;
  @Mock private FMethod staticFMethod;
  @Mock private FMethod fMethod;

  private final EList<FMethod> francaInterfaceMethods = new ArrayEList<>();
  private final EList<FMethod> francaInterface2Methods = new ArrayEList<>();
  private final List<FTypeCollection> typeCollections = new LinkedList<>();

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);

    when(francaInterface.getName()).thenReturn("francaInterface");
    when(francaInterface.getMethods()).thenReturn(francaInterfaceMethods);

    when(francaInterface2.getName()).thenReturn("francaInterface2");
    when(francaInterface2.getMethods()).thenReturn(francaInterface2Methods);

    when(francaDeploymentModel.isStatic(staticFMethod)).thenReturn(true);

    when(fMethod.getName()).thenReturn("instance_method");
    when(staticFMethod.getName()).thenReturn("static_method");

    typeCollections.add(francaInterface);
  }

  // IsInterface = false

  @Test
  public void checkSingleFInterface_withNoMethods() {
    assertTrue(InterfaceValidator.validate(typeCollections, francaDeploymentModel));
  }

  @Test
  public void checkSingleFInterface_withInstanceMethod() {
    francaInterfaceMethods.add(fMethod);

    assertTrue(InterfaceValidator.validate(typeCollections, francaDeploymentModel));
  }

  @Test
  public void checkSingleFInterface_withStaticMethod() {
    francaInterfaceMethods.add(staticFMethod);

    assertTrue(InterfaceValidator.validate(typeCollections, francaDeploymentModel));
  }

  @Test
  public void checkSingleFInterface_withMixedMethods() {
    francaInterfaceMethods.add(staticFMethod);
    francaInterfaceMethods.add(fMethod);

    assertTrue(InterfaceValidator.validate(typeCollections, francaDeploymentModel));
  }

  @Test
  public void checkMultipleElements_withInstanceMethods() {
    francaInterface2Methods.add(fMethod);
    francaInterfaceMethods.add(fMethod);
    typeCollections.add(francaTypeCollection);
    typeCollections.add(francaInterface2);

    assertTrue(InterfaceValidator.validate(typeCollections, francaDeploymentModel));
  }

  @Test
  public void checkMultipleElements_withMixedMethods() {
    francaInterface2Methods.add(fMethod);
    francaInterface2Methods.add(staticFMethod);
    francaInterfaceMethods.add(fMethod);
    francaInterfaceMethods.add(staticFMethod);
    typeCollections.add(francaTypeCollection);
    typeCollections.add(francaInterface2);

    assertTrue(InterfaceValidator.validate(typeCollections, francaDeploymentModel));
  }

  // IsInterface = true

  @Test
  public void checkSingleFInterface_interfaceWithNoMethods() {
    when(francaDeploymentModel.isInterface(francaInterface)).thenReturn(true);

    assertTrue(InterfaceValidator.validate(typeCollections, francaDeploymentModel));
  }

  @Test
  public void checkSingleFInterface_interfaceWithInstanceMethod() {
    when(francaDeploymentModel.isInterface(francaInterface)).thenReturn(true);
    francaInterfaceMethods.add(fMethod);

    assertTrue(InterfaceValidator.validate(typeCollections, francaDeploymentModel));
  }

  @Test
  public void checkSingleFInterface_interfaceWithStaticMethod() {
    when(francaDeploymentModel.isInterface(francaInterface)).thenReturn(true);
    francaInterfaceMethods.add(staticFMethod);

    assertFalse(
        "No static methods are allowed in interfaces",
        InterfaceValidator.validate(typeCollections, francaDeploymentModel));
  }

  @Test
  public void checkSingleFInterface_interfaceWithMixedMethods() {
    when(francaDeploymentModel.isInterface(francaInterface)).thenReturn(true);
    francaInterfaceMethods.add(staticFMethod);
    francaInterfaceMethods.add(fMethod);

    assertFalse(
        "No static methods are allowed in interfaces",
        InterfaceValidator.validate(typeCollections, francaDeploymentModel));
  }

  @Test
  public void checkMultipleElements_interfaceWithInstanceMethods() {
    when(francaDeploymentModel.isInterface(francaInterface2)).thenReturn(true);
    francaInterface2Methods.add(fMethod);
    francaInterfaceMethods.add(fMethod);
    typeCollections.add(francaTypeCollection);
    typeCollections.add(francaInterface2);

    assertTrue(InterfaceValidator.validate(typeCollections, francaDeploymentModel));
  }

  @Test
  public void checkMultipleElements_interfaceWithMixedMethods() {
    when(francaDeploymentModel.isInterface(francaInterface2)).thenReturn(true);
    francaInterface2Methods.add(fMethod);
    francaInterface2Methods.add(staticFMethod);
    francaInterfaceMethods.add(fMethod);
    francaInterfaceMethods.add(staticFMethod);
    typeCollections.add(francaTypeCollection);
    typeCollections.add(francaInterface2);

    assertFalse(InterfaceValidator.validate(typeCollections, francaDeploymentModel));
  }
}
