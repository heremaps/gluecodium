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

package com.here.genium.generator.cbridge;

import static com.here.genium.generator.common.NameHelper.toUpperCamelCase;
import static java.util.Arrays.asList;
import static org.junit.Assert.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;
import static org.powermock.api.mockito.PowerMockito.mockStatic;

import com.here.genium.generator.cpp.CppNameRules;
import java.util.ArrayList;
import java.util.List;
import org.franca.core.franca.FAttribute;
import org.franca.core.franca.FEnumerationType;
import org.franca.core.franca.FEnumerator;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FModel;
import org.franca.core.franca.FStructType;
import org.franca.core.franca.FTypeCollection;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest(CppNameRules.class)
public final class CBridgeNameRulesTest {
  private static final List<String> PACKAGES = asList("PKG1", "PKG2");
  private static final String INTERFACE_NAME = "TestInterface";
  private static final String TYPE_COLLECTION_NAME = "TestTypeCollection";
  private static final String STRUCT_NAME = "structName";
  private static final String METHOD_NAME = "testMethod";
  private static final String ATTRIBUTE_NAME = "TestAttributeName";

  @Mock private FModel francaModel;
  @Mock private FTypeCollection francaTypeCollection;
  @Mock private FInterface francaInterface;
  @Mock private FStructType francaStruct;
  @Mock private FMethod francaMethod;
  @Mock private FEnumerationType francaEnum;
  @Mock private FEnumerator francaEnumItem;
  @Mock private FAttribute francaAttribute;

  @Before
  public void setUp() {
    mockStatic(CppNameRules.class);
    when(francaInterface.getName()).thenReturn(INTERFACE_NAME);

    when(francaStruct.getName()).thenReturn(STRUCT_NAME);
    when(francaMethod.getName()).thenReturn(METHOD_NAME);
    when(francaMethod.eContainer()).thenReturn(francaInterface);

    when(francaAttribute.getName()).thenReturn(ATTRIBUTE_NAME);

    when(francaEnum.eContainer()).thenReturn(francaInterface);
    when(francaEnumItem.eContainer()).thenReturn(francaEnum);

    when(francaTypeCollection.eContainer()).thenReturn(francaModel);
    when(francaTypeCollection.getName()).thenReturn(TYPE_COLLECTION_NAME);

    when(francaInterface.eContainer()).thenReturn(francaModel);
    when(francaInterface.getName()).thenReturn(INTERFACE_NAME);

    when(francaModel.getName()).thenReturn(String.join(".", PACKAGES));
  }

  @Test
  public void getStructBaseNameCreatesProperNameForStructInInterface() {
    when(francaStruct.eContainer()).thenReturn(francaInterface);
    String expectedName = prependNameWithPackageAndInterface(toUpperCamelCase(STRUCT_NAME));

    String actualName = CBridgeNameRules.getStructBaseName(francaStruct);
    assertEquals(expectedName, actualName);
  }

  @Test
  public void getStructBaseNameCreatesProperNameForStructInTypeCollection() {
    when(francaStruct.eContainer()).thenReturn(francaTypeCollection);
    String expectedName =
        prependNameWithPackageAndContainer(
            toUpperCamelCase(STRUCT_NAME), "_", TYPE_COLLECTION_NAME);

    String actualName = CBridgeNameRules.getStructBaseName(francaStruct);
    assertEquals(expectedName, actualName);
  }

  @Test
  public void getHeaderFileNameWithPathReturnsCorrectPath() {
    String expected = "cbridge/include/PKG1/PKG2/TestInterface.h";

    String actual = CBridgeNameRules.getHeaderFileNameWithPath(francaInterface);

    assertEquals(expected, actual);
  }

  @Test
  public void getImplementationFileNameWithPathReturnsCorrectPath() {
    String expected = "cbridge/src/PKG1/PKG2/TestInterface.cpp";

    String actual = CBridgeNameRules.getImplementationFileNameWithPath(francaInterface);

    assertEquals(expected, actual);
  }

  @Test
  public void getBaseApiStructNameReturnsCorrectValue() {
    List<String> packagesWithInterface = new ArrayList<>(PACKAGES);
    packagesWithInterface.add(INTERFACE_NAME);
    when(CppNameRules.getNestedNameSpecifier(any())).thenReturn(packagesWithInterface);
    when(CppNameRules.getStructName(any())).thenReturn(STRUCT_NAME);

    String expected = prependNameWithPackageAndInterface(STRUCT_NAME, "::");

    String actual = CBridgeNameRules.getBaseApiStructName(francaStruct);

    assertEquals(expected, actual);
  }

  @Test
  public void getBaseApiEnumNameReturnsCorrectValue() {
    List<String> packagesWithInterface = new ArrayList<>(PACKAGES);
    packagesWithInterface.add(INTERFACE_NAME);
    when(CppNameRules.getNestedNameSpecifier(any())).thenReturn(packagesWithInterface);
    when(CppNameRules.getEnumName(any())).thenReturn("ENUM_NAME");

    String expected = prependNameWithPackageAndInterface("ENUM_NAME", "::");

    String actual = CBridgeNameRules.getBaseApiEnumName(francaEnum);

    assertEquals(expected, actual);
  }

  @Test
  public void getEnumNameReturnsCorrectValue() {
    List<String> packagesWithInterface = new ArrayList<>(PACKAGES);
    packagesWithInterface.add(INTERFACE_NAME);
    when(francaEnum.getName()).thenReturn("enumName");

    String expected = prependNameWithPackageAndInterface("EnumName", "_");

    String actual = CBridgeNameRules.getEnumName(francaEnum);

    assertEquals(expected, actual);
  }

  @Test
  public void getEnumItemNameReturnsCorrectValue() {
    List<String> packagesWithInterface = new ArrayList<>(PACKAGES);
    packagesWithInterface.add(INTERFACE_NAME);
    when(francaEnumItem.getName()).thenReturn("ENUM_ITEM_NAME");

    String expected = prependNameWithPackageAndInterface("enum_item_name", "_");

    String actual = CBridgeNameRules.getEnumItemName(francaEnumItem);

    assertEquals(expected, actual);
  }

  private String prependNameWithPackageAndInterface(String name) {
    return prependNameWithPackageAndInterface(name, "_");
  }

  private String prependNameWithPackageAndInterface(String name, String delimiter) {
    return prependNameWithPackageAndContainer(name, delimiter, INTERFACE_NAME);
  }

  private String prependNameWithPackageAndContainer(
      String name, String delimiter, String container) {
    return String.join(delimiter, PACKAGES.get(0), PACKAGES.get(1), container, name);
  }
}
