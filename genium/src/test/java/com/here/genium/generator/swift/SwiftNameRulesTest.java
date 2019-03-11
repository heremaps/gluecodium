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

package com.here.genium.generator.swift;

import static org.junit.Assert.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.here.genium.generator.common.NameHelper;
import com.here.genium.model.franca.FrancaDeploymentModel;
import com.here.genium.test.ArrayEList;
import org.franca.core.franca.*;
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
  private static final String INTERFACE_NAME = "SomeInterface";
  private static final String ENUM_NAME = "SomeEnum";
  private static final String FRANCA_NAME = "do_nuts";
  private static final String SWIFT_NAME = "nonsense";

  @Mock private FrancaDeploymentModel deploymentModel;
  @Mock private FEnumerationType fEnumerationType;
  @Mock private FInterface fInterface;
  @Mock private FTypeCollection fTypeCollection;
  @Mock private FMethod fMethod;
  @Mock private FStructType fStruct;
  @Mock private FTypeDef fTypeDef;
  @Mock private FArgument francaArgument;

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
  public void fullyQualifiedNameForEnumInsideClass() {
    when(NameHelper.toUpperCamelCase(any())).thenReturn(INTERFACE_NAME).thenReturn(ENUM_NAME);
    String expected = INTERFACE_NAME + NAMESPACE_DELIMITER + ENUM_NAME;

    String actual = SwiftNameRules.getEnumTypeName(fEnumerationType, deploymentModel);

    assertEquals(expected, actual);
  }

  @Test
  public void fullyQualifiedNameForEnumOutsideClass() {
    when(deploymentModel.isInterface(any())).thenReturn(true);
    when(NameHelper.toUpperCamelCase(any())).thenReturn(ENUM_NAME);

    String actual = SwiftNameRules.getEnumTypeName(fEnumerationType, deploymentModel);

    assertEquals(ENUM_NAME, actual);
  }

  @Test
  public void fullyQualifiedNameForEnumFromTypeCollection() {
    when(fEnumerationType.eContainer()).thenReturn(fTypeCollection);
    when(NameHelper.toUpperCamelCase(any())).thenReturn(ENUM_NAME);

    String actual = SwiftNameRules.getEnumTypeName(fEnumerationType, deploymentModel);

    assertEquals(ENUM_NAME, actual);
  }

  @Test
  public void fullyQualifiedNameForStructInsideClass() {
    when(NameHelper.toUpperCamelCase(any())).thenReturn(INTERFACE_NAME).thenReturn(STRUCT_NAME);
    String expected = INTERFACE_NAME + NAMESPACE_DELIMITER + STRUCT_NAME;

    String actual = SwiftNameRules.getStructName(fStruct, deploymentModel);

    assertEquals(expected, actual);
  }

  @Test
  public void fullyQualifiedNameForStructOutsideClass() {
    when(deploymentModel.isInterface(any())).thenReturn(true);
    when(NameHelper.toUpperCamelCase(any())).thenReturn(STRUCT_NAME);

    String actual = SwiftNameRules.getStructName(fStruct, deploymentModel);

    assertEquals(STRUCT_NAME, actual);
  }

  @Test
  public void fullyQualifiedNameForStructFromTypeCollection() {
    when(fStruct.eContainer()).thenReturn(fTypeCollection);
    when(NameHelper.toUpperCamelCase(any())).thenReturn(STRUCT_NAME);

    String actual = SwiftNameRules.getStructName(fStruct, deploymentModel);

    assertEquals(STRUCT_NAME, actual);
  }

  @Test
  public void fullyQualifiedNameForTypedefInsideClass() {
    when(NameHelper.toUpperCamelCase(any())).thenReturn(INTERFACE_NAME).thenReturn(TYPEDEF_NAME);
    String expected = INTERFACE_NAME + NAMESPACE_DELIMITER + TYPEDEF_NAME;

    String actual = SwiftNameRules.getTypeDefName(fTypeDef, deploymentModel);

    assertEquals(expected, actual);
  }

  @Test
  public void fullyQualifiedNameForTypedefInsideProtocol() {
    when(deploymentModel.isInterface(any())).thenReturn(true);
    when(NameHelper.toUpperCamelCase(any())).thenReturn(INTERFACE_NAME).thenReturn(TYPEDEF_NAME);
    String expected = INTERFACE_NAME + NAMESPACE_DELIMITER + TYPEDEF_NAME;

    String actual = SwiftNameRules.getTypeDefName(fTypeDef, deploymentModel);

    assertEquals(expected, actual);
  }

  @Test
  public void fullyQualifiedNameForTypedefFromTypeCollection() {
    when(fTypeDef.eContainer()).thenReturn(fTypeCollection);
    when(NameHelper.toUpperCamelCase(any())).thenReturn(TYPEDEF_NAME);

    String actual = SwiftNameRules.getTypeDefName(fTypeDef, deploymentModel);

    assertEquals(TYPEDEF_NAME, actual);
  }

  @Test
  public void getMethodNameAppliesLowerCamelCase() {
    when(fMethod.getName()).thenReturn(FRANCA_NAME);
    when(NameHelper.toLowerCamelCase(any())).thenReturn(SWIFT_NAME);

    String actual = SwiftNameRules.getMethodName(fMethod);

    assertEquals(SWIFT_NAME, actual);

    PowerMockito.verifyStatic();
    NameHelper.toLowerCamelCase(FRANCA_NAME);
  }

  @Test
  public void getParameterNameAppliesLowerCamelCase() {
    when(francaArgument.getName()).thenReturn(FRANCA_NAME);
    when(NameHelper.toLowerCamelCase(any())).thenReturn(SWIFT_NAME);

    String actual = SwiftNameRules.getParameterName(francaArgument);

    assertEquals(SWIFT_NAME, actual);

    PowerMockito.verifyStatic();
    NameHelper.toLowerCamelCase(FRANCA_NAME);
  }
}
