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
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.here.ivi.api.model.franca.FrancaDeploymentModel;
import com.here.ivi.api.test.ArrayEList;
import java.util.LinkedList;
import java.util.List;
import org.eclipse.emf.common.util.EList;
import org.franca.core.franca.*;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

@RunWith(JUnit4.class)
@SuppressWarnings({"MethodName"})
public final class InterfaceValidatorTest {

  @Mock private FModel francaModel;
  @Mock private FInterface francaInterface;
  @Mock private FInterface francaInterface2;
  @Mock private FrancaDeploymentModel francaDeploymentModel;
  @Mock private FMethod staticFMethod;
  @Mock private FMethod francaMethod;

  private final EList<FMethod> francaInterfaceMethods = new ArrayEList<>();
  private final EList<FMethod> francaInterface2Methods = new ArrayEList<>();
  private final EList<FArgument> arguments = new ArrayEList<>();
  private final List<FInterface> interfaces = new LinkedList<>();

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);

    when(francaModel.getName()).thenReturn("nonsense");
    when(francaInterface.eContainer()).thenReturn(francaModel);
    when(francaInterface2.eContainer()).thenReturn(francaModel);

    when(francaInterface.getName()).thenReturn("francaInterface");
    when(francaInterface.getMethods()).thenReturn(francaInterfaceMethods);

    when(francaInterface2.getName()).thenReturn("francaInterface2");
    when(francaInterface2.getMethods()).thenReturn(francaInterface2Methods);

    when(francaDeploymentModel.isStatic(staticFMethod)).thenReturn(true);

    when(francaMethod.getName()).thenReturn("instance_method");
    when(staticFMethod.getName()).thenReturn("static_method");
    when(francaMethod.getOutArgs()).thenReturn(arguments);

    interfaces.add(francaInterface);
  }

  // StaticMethods, IsInterface = false

  @Test
  public void checkSingleFInterface_withNoMethods() {
    assertTrue(InterfaceValidator.checkStaticMethods(interfaces, francaDeploymentModel));
  }

  @Test
  public void checkSingleFInterface_withInstanceMethod() {
    francaInterfaceMethods.add(francaMethod);

    assertTrue(InterfaceValidator.checkStaticMethods(interfaces, francaDeploymentModel));
  }

  @Test
  public void checkSingleFInterface_withStaticMethod() {
    francaInterfaceMethods.add(staticFMethod);

    assertTrue(InterfaceValidator.checkStaticMethods(interfaces, francaDeploymentModel));
  }

  @Test
  public void checkSingleFInterface_withMixedMethods() {
    francaInterfaceMethods.add(staticFMethod);
    francaInterfaceMethods.add(francaMethod);

    assertTrue(InterfaceValidator.checkStaticMethods(interfaces, francaDeploymentModel));
  }

  @Test
  public void checkMultipleElements_withInstanceMethods() {
    francaInterface2Methods.add(francaMethod);
    francaInterfaceMethods.add(francaMethod);
    interfaces.add(francaInterface);
    interfaces.add(francaInterface2);

    assertTrue(InterfaceValidator.checkStaticMethods(interfaces, francaDeploymentModel));
  }

  @Test
  public void checkMultipleElements_withMixedMethods() {
    francaInterface2Methods.add(francaMethod);
    francaInterface2Methods.add(staticFMethod);
    francaInterfaceMethods.add(francaMethod);
    francaInterfaceMethods.add(staticFMethod);
    interfaces.add(francaInterface);
    interfaces.add(francaInterface2);

    assertTrue(InterfaceValidator.checkStaticMethods(interfaces, francaDeploymentModel));
  }

  // StaticMethods, IsInterface = true

  @Test
  public void checkSingleFInterface_interfaceWithNoMethods() {
    when(francaDeploymentModel.isInterface(francaInterface)).thenReturn(true);

    assertTrue(InterfaceValidator.checkStaticMethods(interfaces, francaDeploymentModel));
  }

  @Test
  public void checkSingleFInterface_interfaceWithInstanceMethod() {
    when(francaDeploymentModel.isInterface(francaInterface)).thenReturn(true);
    francaInterfaceMethods.add(francaMethod);

    assertTrue(InterfaceValidator.checkStaticMethods(interfaces, francaDeploymentModel));
  }

  @Test
  public void checkSingleFInterface_interfaceWithStaticMethod() {
    when(francaDeploymentModel.isInterface(francaInterface)).thenReturn(true);
    francaInterfaceMethods.add(staticFMethod);

    assertFalse(
        "No static methods are allowed in interfaces",
        InterfaceValidator.checkStaticMethods(interfaces, francaDeploymentModel));
  }

  @Test
  public void checkSingleFInterface_interfaceWithMixedMethods() {
    when(francaDeploymentModel.isInterface(francaInterface)).thenReturn(true);
    francaInterfaceMethods.add(staticFMethod);
    francaInterfaceMethods.add(francaMethod);

    assertFalse(
        "No static methods are allowed in interfaces",
        InterfaceValidator.checkStaticMethods(interfaces, francaDeploymentModel));
  }

  @Test
  public void checkMultipleElements_interfaceWithInstanceMethods() {
    when(francaDeploymentModel.isInterface(francaInterface2)).thenReturn(true);
    francaInterface2Methods.add(francaMethod);
    francaInterfaceMethods.add(francaMethod);
    interfaces.add(francaInterface);
    interfaces.add(francaInterface2);

    assertTrue(InterfaceValidator.checkStaticMethods(interfaces, francaDeploymentModel));
  }

  @Test
  public void checkMultipleElements_interfaceWithMixedMethods() {
    when(francaDeploymentModel.isInterface(francaInterface2)).thenReturn(true);
    francaInterface2Methods.add(francaMethod);
    francaInterface2Methods.add(staticFMethod);
    francaInterfaceMethods.add(francaMethod);
    francaInterfaceMethods.add(staticFMethod);
    interfaces.add(francaInterface);
    interfaces.add(francaInterface2);

    assertFalse(InterfaceValidator.checkStaticMethods(interfaces, francaDeploymentModel));
  }

  // InlineEnums

  @Test
  public void checkInlineEnums_noErrorTypes() {
    francaInterfaceMethods.add(francaMethod);

    assertTrue(InterfaceValidator.checkInlineEnums(interfaces));
  }

  @Test
  public void checkInlineEnums_withErrorEnum() {
    when(francaMethod.getErrorEnum()).thenReturn(mock(FEnumerationType.class));
    francaInterfaceMethods.add(francaMethod);

    assertTrue(InterfaceValidator.checkInlineEnums(interfaces));
  }

  @Test
  public void checkInlineEnums_withInlineEnum() {
    when(francaMethod.getErrors()).thenReturn(mock(FEnumerationType.class));
    francaInterfaceMethods.add(francaMethod);

    assertFalse(InterfaceValidator.checkInlineEnums(interfaces));
  }

  // Inheritance

  @Test
  public void checkInheritance_interfaceInheritsFromInterface() {
    when(francaInterface.getBase()).thenReturn(francaInterface2);
    when(francaDeploymentModel.isInterface(any())).thenReturn(true);

    assertTrue(InterfaceValidator.checkInheritance(interfaces, francaDeploymentModel));
  }

  @Test
  public void checkInheritance_classInheritsFromInterface() {
    when(francaInterface.getBase()).thenReturn(francaInterface2);
    when(francaDeploymentModel.isInterface(francaInterface2)).thenReturn(true);

    assertTrue(InterfaceValidator.checkInheritance(interfaces, francaDeploymentModel));
  }

  @Test
  public void checkInheritance_interfaceInheritsFromClass() {
    when(francaInterface.getBase()).thenReturn(francaInterface2);
    when(francaDeploymentModel.isInterface(francaInterface)).thenReturn(true);

    assertFalse(InterfaceValidator.checkInheritance(interfaces, francaDeploymentModel));
  }

  @Test
  public void checkInheritance_classInheritsFromClass() {
    when(francaInterface.getBase()).thenReturn(francaInterface2);

    assertTrue(InterfaceValidator.checkInheritance(interfaces, francaDeploymentModel));
  }
}
