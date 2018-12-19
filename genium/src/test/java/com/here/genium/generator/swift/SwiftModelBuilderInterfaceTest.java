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
import java.util.Collections;
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
  private final SwiftMethod swiftMethod =
      new SwiftMethod(
          "SwiftMethod",
          null,
          null,
          SwiftType.VOID,
          null,
          null,
          null,
          null,
          false,
          false,
          Collections.singletonList(new SwiftParameter("MethodValue", SwiftType.STRING)));

  @Mock private FrancaDeploymentModel deploymentModel;
  @Mock private FInterface francaInterface;

  private SwiftModelBuilder modelBuilder;

  @Before
  public void setUp() {
    initMocks(this);
    mockStatic(DefinedBy.class, SwiftNameRules.class, CBridgeNameRules.class);

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
    assertFalse(swiftClass.isInterface());
    assertTrue(swiftClass.getImplementsProtocols().isEmpty());
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
    assertNotNull(swiftClass.getEnums());
    assertEquals(1, swiftClass.getEnums().size());
    assertEquals("EnumSwiftName", swiftClass.getEnums().get(0).name);
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
    assertNotNull(swiftClass.getStructs());
    assertEquals(1, swiftClass.getStructs().size());
    assertEquals("SomeStruct", swiftClass.getStructs().get(0).name);
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
    assertNotNull(swiftClass.getMethods());
    assertEquals(1, swiftClass.getMethods().size());
    assertEquals("SwiftMethod", swiftClass.getMethods().get(0).name);
  }

  @Test
  public void finishBuildingFrancaInstantiableInterfaceReadsClassParent() {
    SwiftClass parentClass = new SwiftClass("SomeParent");
    contextStack.injectResult(parentClass);

    modelBuilder.finishBuilding(francaInterface);

    SwiftFile swiftFile = modelBuilder.getFinalResult(SwiftFile.class);
    assertNotNull(swiftFile);
    assertNotNull(swiftFile.classes);
    assertEquals(1, swiftFile.classes.size());
    SwiftClass swiftClass = swiftFile.classes.get(0);
    assertEquals("SomeParent", swiftClass.getParentClass());
    assertTrue(swiftClass.getUseParentCInstance());
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
    assertEquals(1, resultClass.getConstants().size());
    assertEquals(swiftConstant, resultClass.getConstants().get(0));
  }

  @Test
  public void finishBuildingFrancaInstantiableInterfaceReadsInterfaceParent() {
    SwiftClass parentClass = new SwiftClass("SomeParent", null, true);
    contextStack.injectResult(parentClass);

    modelBuilder.finishBuilding(francaInterface);

    SwiftFile swiftFile = modelBuilder.getFinalResult(SwiftFile.class);
    assertNotNull(swiftFile);
    assertNotNull(swiftFile.classes);
    assertEquals(1, swiftFile.classes.size());
    SwiftClass swiftClass = swiftFile.classes.get(0);
    assertNull(swiftClass.getParentClass());
    assertFalse(swiftClass.getUseParentCInstance());
    assertEquals(1, swiftClass.getImplementsProtocols().size());
    assertEquals("SomeParent", swiftClass.getImplementsProtocols().get(0));
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsParentMethods() {
    SwiftClass parentClass = new SwiftClass("SomeParent", null, true);
    SwiftMethod parentMethod =
        new SwiftMethod("ParentMethod", null, null, SwiftType.VOID, null, "foo");
    parentClass.getMethods().add(parentMethod);
    contextStack.injectResult(parentClass);
    contextStack.injectResult(swiftMethod);

    modelBuilder.finishBuilding(francaInterface);

    SwiftFile swiftFile = modelBuilder.getFinalResult(SwiftFile.class);
    assertNotNull(swiftFile);
    assertNotNull(swiftFile.classes);
    assertEquals(1, swiftFile.classes.size());
    SwiftClass swiftClass = swiftFile.classes.get(0);
    assertEquals(2, swiftClass.getMethods().size());
    SwiftMethod resultMethod = swiftClass.getMethods().get(0);
    assertEquals("ParentMethod", resultMethod.name);
    assertEquals("foo", resultMethod.getCNestedSpecifier());
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsParentProperties() {
    SwiftClass parentClass = new SwiftClass("SomeParent", null, true);
    SwiftProperty parentProperty = new SwiftProperty("ParentProperty", null, null, false);
    parentClass.getProperties().add(parentProperty);
    SwiftMethod parentMethod =
        new SwiftMethod("ParentMethod", null, null, SwiftType.VOID, null, "foo");
    SwiftProperty childProperty = new SwiftProperty("", null, null, false);

    parentProperty.propertyAccessors.add(parentMethod);
    contextStack.injectResult(parentClass);
    contextStack.injectResult(childProperty);

    modelBuilder.finishBuilding(francaInterface);

    SwiftFile swiftFile = modelBuilder.getFinalResult(SwiftFile.class);
    assertNotNull(swiftFile);
    assertNotNull(swiftFile.classes);
    assertEquals(1, swiftFile.classes.size());
    SwiftClass swiftClass = swiftFile.classes.get(0);
    assertEquals(2, swiftClass.getProperties().size());
    SwiftProperty swiftProperty = swiftClass.getProperties().get(0);
    assertEquals("ParentProperty", swiftProperty.name);
    assertEquals(1, swiftProperty.propertyAccessors.size());
    assertEquals("foo", swiftProperty.propertyAccessors.get(0).getCNestedSpecifier());
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
    assertTrue(swiftClass.isInterface());
    assertEquals("fun_table", swiftClass.getFunctionTableName());
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
    assertTrue(swiftClass.getEnums().isEmpty());
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
    assertTrue(swiftClass.getStructs().isEmpty());
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
    assertNotNull(swiftClass.getMethods());
    assertEquals(1, swiftClass.getMethods().size());
    assertEquals("SwiftMethod", swiftClass.getMethods().get(0).name);
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsParent() {
    when(deploymentModel.isInterface(francaInterface)).thenReturn(true);
    SwiftClass parentClass = new SwiftClass("SomeParent");
    contextStack.injectResult(parentClass);

    modelBuilder.finishBuilding(francaInterface);

    SwiftFile swiftFile = modelBuilder.getFinalResult(SwiftFile.class);
    assertNotNull(swiftFile);
    assertNotNull(swiftFile.classes);
    assertEquals(1, swiftFile.classes.size());

    SwiftClass swiftClass = swiftFile.classes.get(0);
    assertEquals("SomeParent", swiftClass.getParentClass());
    assertFalse(swiftClass.getUseParentCInstance());
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
    assertNull(swiftClass.getParentClass());
    assertTrue(swiftClass.isObjcInterface());
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
    assertEquals(SwiftTypeMapper.OBJC_PARENT_CLASS, swiftClass.getParentClass());
    assertTrue(swiftClass.isObjcInterface());
  }

  @Test
  public void finishBuildingFrancaInterfaceCreatesObjcInterfaceClassWithParent() {
    when(deploymentModel.isObjcInterface(francaInterface)).thenReturn(true);
    SwiftClass parentClass = new SwiftClass("SomeParent");
    contextStack.injectResult(parentClass);

    modelBuilder.finishBuilding(francaInterface);

    SwiftFile swiftFile = modelBuilder.getFinalResult(SwiftFile.class);
    assertNotNull(swiftFile);
    assertNotNull(swiftFile.classes);
    assertEquals(1, swiftFile.classes.size());

    SwiftClass swiftClass = swiftFile.classes.get(0);
    assertEquals(parentClass.name, swiftClass.getParentClass());
    assertTrue(swiftClass.isObjcInterface());
  }
}
