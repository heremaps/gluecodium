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

package com.here.ivi.api.generator.swift;

import static org.junit.Assert.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.here.ivi.api.generator.common.NameHelper;
import com.here.ivi.api.model.franca.FrancaDeploymentModel;
import com.here.ivi.api.test.ArrayEList;
import org.franca.core.franca.FEnumerationType;
import org.franca.core.franca.FEnumerator;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FStructType;
import org.franca.core.franca.FTypeCollection;
import org.franca.core.franca.FTypeDef;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest(NameHelper.class)
public class SwiftNameRulesTest {

  private static final String NAMESPACE_DELIMITER = ".";
  private static final String STRUCT_NAME = "SomeStruct";
  private static final String TYPEDEF_NAME = "SomeTypeDef";
  @Mock private FrancaDeploymentModel deploymentModel;
  @Mock private FEnumerationType fEnumerationType;
  @Mock private FInterface fInterface;
  @Mock private FTypeCollection fTypeCollection;
  @Mock private FMethod fMethod;
  @Mock private FStructType fStruct;
  @Mock private FTypeDef fTypeDef;
  private static final String INTERFACE_NAME = "SomeInterface";
  private static final String ENUM_NAME = "SomeEnum";

  @Before
  public void setUp() {
    PowerMockito.mockStatic(NameHelper.class);

    ArrayEList<FMethod> methods = new ArrayEList<>();
    methods.add(fMethod);
    when(fEnumerationType.eContainer()).thenReturn(fInterface);
    when(fStruct.eContainer()).thenReturn(fInterface);
    when(fTypeDef.eContainer()).thenReturn(fInterface);
    when(fInterface.getName()).thenReturn(INTERFACE_NAME);
    when(fInterface.getMethods()).thenReturn(methods);
    when(fEnumerationType.getName()).thenReturn(ENUM_NAME);
    when(fStruct.getName()).thenReturn(STRUCT_NAME);
  }

  @Test
  public void getEnumItemName() {
    FEnumerator enumItem = mock(FEnumerator.class);
    String expected = "someEnumItem";
    when(NameHelper.toLowerCamelCase(any())).thenReturn(expected);

    assertEquals(expected, SwiftNameRules.getEnumItemName(enumItem));
  }

  @Test
  public void fullyQuallifiedNameForEnumInsideClass() {
    when(NameHelper.toUpperCamelCase(any())).thenReturn(INTERFACE_NAME).thenReturn(ENUM_NAME);
    String expected = INTERFACE_NAME + NAMESPACE_DELIMITER + ENUM_NAME;

    String actual = SwiftNameRules.getEnumTypeName(fEnumerationType, deploymentModel);

    assertEquals(expected, actual);
  }

  @Test
  public void fullyQuallifiedNameForEnumOutsideClass() {
    when(deploymentModel.isInterface(any())).thenReturn(true);
    when(NameHelper.toUpperCamelCase(any())).thenReturn(ENUM_NAME);

    String actual = SwiftNameRules.getEnumTypeName(fEnumerationType, deploymentModel);

    assertEquals(ENUM_NAME, actual);
  }

  @Test
  public void fullyQuallifiedNameForEnumFromTypeCollection() {
    when(fEnumerationType.eContainer()).thenReturn(fTypeCollection);
    when(NameHelper.toUpperCamelCase(any())).thenReturn(ENUM_NAME);

    String actual = SwiftNameRules.getEnumTypeName(fEnumerationType, deploymentModel);

    assertEquals(ENUM_NAME, actual);
  }

  @Test
  public void fullyQuallifiedNameForStructInsideClass() {
    when(NameHelper.toUpperCamelCase(any())).thenReturn(INTERFACE_NAME).thenReturn(STRUCT_NAME);
    String expected = INTERFACE_NAME + NAMESPACE_DELIMITER + STRUCT_NAME;

    String actual = SwiftNameRules.getStructName(fStruct, deploymentModel);

    assertEquals(expected, actual);
  }

  @Test
  public void fullyQuallifiedNameForStructOutsideClass() {
    when(deploymentModel.isInterface(any())).thenReturn(true);
    when(NameHelper.toUpperCamelCase(any())).thenReturn(STRUCT_NAME);

    String actual = SwiftNameRules.getStructName(fStruct, deploymentModel);

    assertEquals(STRUCT_NAME, actual);
  }

  @Test
  public void fullyQuallifiedNameForStructFromTypeCollection() {
    when(fStruct.eContainer()).thenReturn(fTypeCollection);
    when(NameHelper.toUpperCamelCase(any())).thenReturn(STRUCT_NAME);

    String actual = SwiftNameRules.getStructName(fStruct, deploymentModel);

    assertEquals(STRUCT_NAME, actual);
  }

  @Test
  public void fullyQuallifiedNameForTypedefInsideClass() {
    when(NameHelper.toUpperCamelCase(any())).thenReturn(INTERFACE_NAME).thenReturn(TYPEDEF_NAME);
    String expected = INTERFACE_NAME + NAMESPACE_DELIMITER + TYPEDEF_NAME;

    String actual = SwiftNameRules.getTypeDefName(fTypeDef, deploymentModel);

    assertEquals(expected, actual);
  }

  @Test
  public void fullyQuallifiedNameForTypedefInsideProtocol() {
    when(deploymentModel.isInterface(any())).thenReturn(true);
    when(NameHelper.toUpperCamelCase(any())).thenReturn(INTERFACE_NAME).thenReturn(TYPEDEF_NAME);
    String expected = INTERFACE_NAME + NAMESPACE_DELIMITER + TYPEDEF_NAME;

    String actual = SwiftNameRules.getTypeDefName(fTypeDef, deploymentModel);

    assertEquals(expected, actual);
  }

  @Test
  public void fullyQuallifiedNameForTypedefFromTypeCollection() {
    when(fTypeDef.eContainer()).thenReturn(fTypeCollection);
    when(NameHelper.toUpperCamelCase(any())).thenReturn(TYPEDEF_NAME);

    String actual = SwiftNameRules.getTypeDefName(fTypeDef, deploymentModel);

    assertEquals(TYPEDEF_NAME, actual);
  }
}
