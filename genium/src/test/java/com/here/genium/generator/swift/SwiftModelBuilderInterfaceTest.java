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

import static java.util.Collections.singletonList;
import static org.junit.Assert.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;
import static org.mockito.MockitoAnnotations.initMocks;
import static org.powermock.api.mockito.PowerMockito.mockStatic;

import com.here.genium.generator.cbridge.CBridgeNameRules;
import com.here.genium.model.franca.DefinedBy;
import com.here.genium.model.franca.FrancaDeploymentModel;
import com.here.genium.model.swift.*;
import com.here.genium.test.MockContextStack;
import org.franca.core.franca.*;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest({DefinedBy.class, SwiftNameRules.class, CBridgeNameRules.class})
public class SwiftModelBuilderInterfaceTest {

  private final MockContextStack<SwiftModelElement> contextStack = new MockContextStack<>();
  private final SwiftValue swiftValue = new SwiftValue("value");
  private final SwiftEnumItem swiftEnumItem =
      SwiftEnumItem.builder("ItemName")
          .comment("Some comment on enumerator")
          .value(swiftValue)
          .build();
  private final SwiftEnum swiftEnum =
      SwiftEnum.builder("EnumSwiftName")
          .comment("Some comment on enum type")
          .items(singletonList(swiftEnumItem))
          .build();
  private final SwiftStruct swiftStruct = SwiftStruct.builder("SomeStruct").build();
  private final SwiftMethod swiftMethod = SwiftMethod.builder("SwiftMethod").build();

  @Mock private FrancaDeploymentModel deploymentModel;
  @Mock private FInterface francaInterface;

  private SwiftModelBuilder modelBuilder;

  @Before
  public void setUp() {
    initMocks(this);
    mockStatic(DefinedBy.class, SwiftNameRules.class, CBridgeNameRules.class);

    swiftMethod.parameters.add(new SwiftParameter("MethodValue", SwiftType.STRING));

    when(SwiftNameRules.getClassName(any())).thenReturn("classy");
    when(CBridgeNameRules.getInterfaceName(francaInterface)).thenReturn("package_classy");
    when(CBridgeNameRules.getFunctionTableName(francaInterface)).thenReturn("fun_table");

    modelBuilder = new SwiftModelBuilder(contextStack, deploymentModel);
  }

  // Creates instantiable Swift class

  @Test
  public void finishBuildingFrancaInstantiableInterface() {
    modelBuilder.finishBuilding(francaInterface);

    SwiftFile swiftFile = modelBuilder.getFinalResult(SwiftFile.class);
    assertNotNull(swiftFile);
    assertNotNull(swiftFile.classes);
    assertEquals(1, swiftFile.classes.size());
    SwiftClass swiftClass = swiftFile.classes.get(0);
    assertEquals("classy", swiftClass.name.toLowerCase());
    assertFalse(swiftClass.isInterface);
    assertTrue(swiftClass.implementsProtocols.isEmpty());
  }

  @Test
  public void finishBuildingFrancaInstantiableInterfaceReadsEnums() {
    contextStack.injectResult(swiftEnum);

    modelBuilder.finishBuilding(francaInterface);

    SwiftFile swiftFile = modelBuilder.getFinalResult(SwiftFile.class);
    assertNotNull(swiftFile);
    assertNotNull(swiftFile.classes);
    assertEquals(1, swiftFile.classes.size());
    SwiftClass swiftClass = swiftFile.classes.get(0);
    assertEquals("classy", swiftClass.name.toLowerCase());
    assertNotNull(swiftClass.enums);
    assertEquals(1, swiftClass.enums.size());
    assertEquals("EnumSwiftName", swiftClass.enums.get(0).name);
  }

  @Test
  public void finishBuildingFrancaInstantiableInterfaceReadsStructs() {
    contextStack.injectResult(swiftStruct);

    modelBuilder.finishBuilding(francaInterface);

    SwiftFile swiftFile = modelBuilder.getFinalResult(SwiftFile.class);
    assertNotNull(swiftFile);
    assertNotNull(swiftFile.classes);
    assertEquals(1, swiftFile.classes.size());
    SwiftClass swiftClass = swiftFile.classes.get(0);
    assertEquals("classy", swiftClass.name.toLowerCase());
    assertNotNull(swiftClass.structs);
    assertEquals(1, swiftClass.structs.size());
    assertEquals("SomeStruct", swiftClass.structs.get(0).name);
  }

  @Test
  public void finishBuildingFrancaInstantiableInterfaceReadsMethods() {
    contextStack.injectResult(swiftMethod);

    modelBuilder.finishBuilding(francaInterface);

    SwiftFile swiftFile = modelBuilder.getFinalResult(SwiftFile.class);
    assertNotNull(swiftFile);
    assertNotNull(swiftFile.classes);
    assertEquals(1, swiftFile.classes.size());
    SwiftClass swiftClass = swiftFile.classes.get(0);
    assertEquals("classy", swiftClass.name.toLowerCase());
    assertNotNull(swiftClass.methods);
    assertEquals(1, swiftClass.methods.size());
    assertEquals("SwiftMethod", swiftClass.methods.get(0).name);
  }

  @Test
  public void finishBuildingFrancaInstantiableInterfaceReadsClassParent() {
    SwiftClass parentClass = SwiftClass.builder("SomeParent").build();
    contextStack.injectResult(parentClass);

    modelBuilder.finishBuilding(francaInterface);

    SwiftFile swiftFile = modelBuilder.getFinalResult(SwiftFile.class);
    assertNotNull(swiftFile);
    assertNotNull(swiftFile.classes);
    assertEquals(1, swiftFile.classes.size());
    SwiftClass swiftClass = swiftFile.classes.get(0);
    assertEquals("SomeParent", swiftClass.parentClass);
    assertTrue(swiftClass.useParentCInstance);
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsConstants() {
    SwiftConstant swiftConstant =
        new SwiftConstant("Foo", SwiftVisibility.PUBLIC, new SwiftType("Bar"), swiftValue);
    contextStack.injectResult(swiftConstant);

    modelBuilder.finishBuilding(francaInterface);

    SwiftFile result = modelBuilder.getFinalResult(SwiftFile.class);
    assertNotNull(result);
    assertEquals(1, result.classes.size());

    SwiftClass resultClass = result.classes.get(0);
    assertEquals(1, resultClass.constants.size());
    assertEquals(swiftConstant, resultClass.constants.get(0));
  }

  @Test
  public void finishBuildingFrancaInstantiableInterfaceReadsInterfaceParent() {
    SwiftClass parentClass = SwiftClass.builder("SomeParent").isInterface(true).build();
    contextStack.injectResult(parentClass);

    modelBuilder.finishBuilding(francaInterface);

    SwiftFile swiftFile = modelBuilder.getFinalResult(SwiftFile.class);
    assertNotNull(swiftFile);
    assertNotNull(swiftFile.classes);
    assertEquals(1, swiftFile.classes.size());
    SwiftClass swiftClass = swiftFile.classes.get(0);
    assertNull(swiftClass.parentClass);
    assertFalse(swiftClass.useParentCInstance);
    assertEquals(1, swiftClass.implementsProtocols.size());
    assertEquals("SomeParent", swiftClass.implementsProtocols.get(0));
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsParentMethods() {
    SwiftClass parentClass = SwiftClass.builder("SomeParent").isInterface(true).build();
    SwiftMethod parentMethod = SwiftMethod.builder("ParentMethod").cNestedSpecifier("foo").build();
    parentClass.methods.add(parentMethod);
    contextStack.injectResult(parentClass);
    contextStack.injectResult(swiftMethod);

    modelBuilder.finishBuilding(francaInterface);

    SwiftFile swiftFile = modelBuilder.getFinalResult(SwiftFile.class);
    assertNotNull(swiftFile);
    assertNotNull(swiftFile.classes);
    assertEquals(1, swiftFile.classes.size());
    SwiftClass swiftClass = swiftFile.classes.get(0);
    assertEquals(2, swiftClass.methods.size());
    SwiftMethod resultMethod = swiftClass.methods.get(0);
    assertEquals("ParentMethod", resultMethod.name);
    assertEquals("foo", resultMethod.cNestedSpecifier);
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsParentProperties() {
    SwiftClass parentClass = SwiftClass.builder("SomeParent").isInterface(true).build();
    SwiftProperty parentProperty = new SwiftProperty("ParentProperty", null, null);
    parentClass.properties.add(parentProperty);
    SwiftMethod parentMethod = SwiftMethod.builder("ParentMethod").cNestedSpecifier("foo").build();
    SwiftProperty childProperty = new SwiftProperty("", null, null);

    parentProperty.propertyAccessors.add(parentMethod);
    contextStack.injectResult(parentClass);
    contextStack.injectResult(childProperty);

    modelBuilder.finishBuilding(francaInterface);

    SwiftFile swiftFile = modelBuilder.getFinalResult(SwiftFile.class);
    assertNotNull(swiftFile);
    assertNotNull(swiftFile.classes);
    assertEquals(1, swiftFile.classes.size());
    SwiftClass swiftClass = swiftFile.classes.get(0);
    assertEquals(2, swiftClass.properties.size());
    SwiftProperty swiftProperty = swiftClass.properties.get(0);
    assertEquals("ParentProperty", swiftProperty.name);
    assertEquals(1, swiftProperty.propertyAccessors.size());
    assertEquals("foo", swiftProperty.propertyAccessors.get(0).cNestedSpecifier);
  }

  @Test
  public void finishBuildingFrancaInterfaceCreatesInternalClass() {
    when(deploymentModel.isInternal(any())).thenReturn(true);

    modelBuilder.finishBuilding(francaInterface);

    SwiftFile swiftFile = modelBuilder.getFinalResult(SwiftFile.class);
    assertNotNull(swiftFile);
    assertEquals(1, swiftFile.classes.size());
    SwiftClass swiftClass = swiftFile.classes.get(0);
    assertEquals(SwiftVisibility.INTERNAL, swiftClass.visibility);
  }

  // Creates instantiable Swift interface

  @Test
  public void finishBuildingFrancaInterfaceCreatesProtocol() {
    when(deploymentModel.isInterface(francaInterface)).thenReturn(true);

    modelBuilder.finishBuilding(francaInterface);

    SwiftFile swiftFile = modelBuilder.getFinalResult(SwiftFile.class);
    assertNotNull(swiftFile);
    assertNotNull(swiftFile.classes);
    assertEquals(1, swiftFile.classes.size());
    SwiftClass swiftClass = swiftFile.classes.get(0);
    assertEquals("classy", swiftClass.name.toLowerCase());
    assertTrue(swiftClass.isInterface);
    assertEquals("fun_table", swiftClass.functionTableName);
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsEnums() {
    when(deploymentModel.isInterface(francaInterface)).thenReturn(true);
    contextStack.injectResult(swiftEnum);

    modelBuilder.finishBuilding(francaInterface);

    SwiftFile swiftFile = modelBuilder.getFinalResult(SwiftFile.class);
    assertNotNull(swiftFile);
    assertNotNull(swiftFile.classes);
    assertEquals(1, swiftFile.classes.size());
    SwiftClass swiftClass = swiftFile.classes.get(0);
    assertEquals("classy", swiftClass.name.toLowerCase());
    assertTrue(swiftClass.enums.isEmpty());
    assertNotNull(swiftFile.enums);
    assertEquals(1, swiftFile.enums.size());
    assertEquals("EnumSwiftName", swiftFile.enums.get(0).name);
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsStructs() {
    when(deploymentModel.isInterface(francaInterface)).thenReturn(true);
    contextStack.injectResult(swiftStruct);

    modelBuilder.finishBuilding(francaInterface);

    SwiftFile swiftFile = modelBuilder.getFinalResult(SwiftFile.class);
    assertNotNull(swiftFile);
    assertNotNull(swiftFile.classes);
    assertEquals(1, swiftFile.classes.size());
    SwiftClass swiftClass = swiftFile.classes.get(0);
    assertEquals("classy", swiftClass.name.toLowerCase());
    assertTrue(swiftClass.structs.isEmpty());
    assertNotNull(swiftFile.structs);
    assertEquals(1, swiftFile.structs.size());
    assertEquals("SomeStruct", swiftFile.structs.get(0).name);
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsMethods() {
    when(deploymentModel.isInterface(francaInterface)).thenReturn(true);
    contextStack.injectResult(swiftMethod);

    modelBuilder.finishBuilding(francaInterface);

    SwiftFile swiftFile = modelBuilder.getFinalResult(SwiftFile.class);
    assertNotNull(swiftFile);
    assertNotNull(swiftFile.classes);
    assertEquals(1, swiftFile.classes.size());
    SwiftClass swiftClass = swiftFile.classes.get(0);
    assertEquals("classy", swiftClass.name.toLowerCase());
    assertNotNull(swiftClass.methods);
    assertEquals(1, swiftClass.methods.size());
    assertEquals("SwiftMethod", swiftClass.methods.get(0).name);
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsParent() {
    when(deploymentModel.isInterface(francaInterface)).thenReturn(true);
    SwiftClass parentClass = SwiftClass.builder("SomeParent").build();
    contextStack.injectResult(parentClass);

    modelBuilder.finishBuilding(francaInterface);

    SwiftFile swiftFile = modelBuilder.getFinalResult(SwiftFile.class);
    assertNotNull(swiftFile);
    assertNotNull(swiftFile.classes);
    assertEquals(1, swiftFile.classes.size());

    SwiftClass swiftClass = swiftFile.classes.get(0);
    assertEquals("SomeParent", swiftClass.parentClass);
    assertFalse(swiftClass.useParentCInstance);
  }

  @Test
  public void finishBuildingFrancaInterfaceCreatesObjcInterfaceProtocol() {
    when(deploymentModel.isInterface(francaInterface)).thenReturn(true);
    when(deploymentModel.isObjcInterface(francaInterface)).thenReturn(true);

    modelBuilder.finishBuilding(francaInterface);

    SwiftFile swiftFile = modelBuilder.getFinalResult(SwiftFile.class);
    assertNotNull(swiftFile);
    assertNotNull(swiftFile.classes);
    assertEquals(1, swiftFile.classes.size());

    SwiftClass swiftClass = swiftFile.classes.get(0);
    assertNull(swiftClass.parentClass);
    assertTrue(swiftClass.isObjcInterface);
  }

  @Test
  public void finishBuildingFrancaInterfaceCreatesObjcInterfaceClass() {
    when(deploymentModel.isInterface(francaInterface)).thenReturn(false);
    when(deploymentModel.isObjcInterface(francaInterface)).thenReturn(true);

    modelBuilder.finishBuilding(francaInterface);

    SwiftFile swiftFile = modelBuilder.getFinalResult(SwiftFile.class);
    assertNotNull(swiftFile);
    assertNotNull(swiftFile.classes);
    assertEquals(1, swiftFile.classes.size());

    SwiftClass swiftClass = swiftFile.classes.get(0);
    assertEquals(SwiftTypeMapper.OBJC_PARENT_CLASS, swiftClass.parentClass);
    assertTrue(swiftClass.isObjcInterface);
  }

  @Test
  public void finishBuildingFrancaInterfaceCreatesObjcInterfaceClassWithParent() {
    when(deploymentModel.isObjcInterface(francaInterface)).thenReturn(true);
    SwiftClass parentClass = SwiftClass.builder("SomeParent").build();
    contextStack.injectResult(parentClass);

    modelBuilder.finishBuilding(francaInterface);

    SwiftFile swiftFile = modelBuilder.getFinalResult(SwiftFile.class);
    assertNotNull(swiftFile);
    assertNotNull(swiftFile.classes);
    assertEquals(1, swiftFile.classes.size());

    SwiftClass swiftClass = swiftFile.classes.get(0);
    assertEquals(parentClass.name, swiftClass.parentClass);
    assertTrue(swiftClass.isObjcInterface);
  }
}
