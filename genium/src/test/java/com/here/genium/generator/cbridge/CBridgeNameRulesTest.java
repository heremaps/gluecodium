/*
 * Copyright (C) 2016-2019 HERE Europe B.V.
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
import static org.mockito.Mockito.when;

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
import org.junit.runners.JUnit4;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

@RunWith(JUnit4.class)
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
    MockitoAnnotations.initMocks(this);

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
        String.join(
            "_",
            PACKAGES.get(0),
            PACKAGES.get(1),
            TYPE_COLLECTION_NAME,
            toUpperCamelCase(STRUCT_NAME));

    String actualName = CBridgeNameRules.getStructBaseName(francaStruct);
    assertEquals(expectedName, actualName);
  }

  @Test
  public void getEnumNameReturnsCorrectValue() {
    when(francaEnum.getName()).thenReturn("enumName");

    String expected =
        String.join("_", PACKAGES.get(0), PACKAGES.get(1), INTERFACE_NAME, "EnumName");

    String actual = CBridgeNameRules.getEnumName(francaEnum);

    assertEquals(expected, actual);
  }

  @Test
  public void getEnumItemNameReturnsCorrectValue() {
    when(francaEnumItem.getName()).thenReturn("ENUM_ITEM_NAME");

    String expected =
        String.join("_", PACKAGES.get(0), PACKAGES.get(1), INTERFACE_NAME, "enum_item_name");

    String actual = CBridgeNameRules.getEnumItemName(francaEnumItem);

    assertEquals(expected, actual);
  }

  private String prependNameWithPackageAndInterface(String name) {
    return String.join("_", PACKAGES.get(0), PACKAGES.get(1), INTERFACE_NAME, name);
  }
}
