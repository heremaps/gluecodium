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

import static java.util.Collections.singletonList;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;
import static org.mockito.MockitoAnnotations.initMocks;
import static org.powermock.api.mockito.PowerMockito.mockStatic;

import com.here.ivi.api.generator.cbridge.CBridgeNameRules;
import com.here.ivi.api.generator.common.AbstractFrancaCommentParser;
import com.here.ivi.api.generator.cpp.CppCommentParser;
import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.franca.FrancaDeploymentModel;
import com.here.ivi.api.model.swift.SwiftClass;
import com.here.ivi.api.model.swift.SwiftContainerType;
import com.here.ivi.api.model.swift.SwiftEnum;
import com.here.ivi.api.model.swift.SwiftEnumItem;
import com.here.ivi.api.model.swift.SwiftFile;
import com.here.ivi.api.model.swift.SwiftMethod;
import com.here.ivi.api.model.swift.SwiftModelElement;
import com.here.ivi.api.model.swift.SwiftParameter;
import com.here.ivi.api.model.swift.SwiftType;
import com.here.ivi.api.model.swift.SwiftValue;
import com.here.ivi.api.test.MockContextStack;
import org.franca.core.franca.*;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest({
  DefinedBy.class,
  SwiftNameRules.class,
  CppCommentParser.class,
  CBridgeNameRules.class
})
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
  private final SwiftContainerType swiftStruct = SwiftContainerType.builder("SomeStruct").build();
  private final SwiftMethod swiftMethod = new SwiftMethod("SwiftMethod");

  @Mock private FrancaDeploymentModel deploymentModel;
  @Mock private AbstractFrancaCommentParser.Comments comments;
  @Mock private FInterface francaInterface;

  private SwiftModelBuilder modelBuilder;

  @Before
  public void setUp() {
    initMocks(this);
    mockStatic(
        DefinedBy.class, SwiftNameRules.class, CppCommentParser.class, CBridgeNameRules.class);

    swiftMethod.parameters.add(new SwiftParameter("MethodValue", SwiftType.STRING));

    when(SwiftNameRules.getClassName(any())).thenReturn("classy");
    when(CppCommentParser.parse(francaInterface)).thenReturn(comments);
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
    assertNotNull(swiftClass.implementsProtocols);
    assertEquals(1, swiftClass.implementsProtocols.size());
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
}
