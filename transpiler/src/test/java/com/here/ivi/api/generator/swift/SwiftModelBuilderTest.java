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

import static java.util.Arrays.asList;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;
import static org.mockito.MockitoAnnotations.initMocks;
import static org.powermock.api.mockito.PowerMockito.mockStatic;
import static org.powermock.api.mockito.PowerMockito.verifyStatic;

import com.here.ivi.api.common.CollectionsHelper;
import com.here.ivi.api.generator.baseapi.CppCommentParser;
import com.here.ivi.api.generator.cbridge.CBridgeNameRules;
import com.here.ivi.api.generator.common.AbstractFrancaCommentParser;
import com.here.ivi.api.model.franca.Interface;
import com.here.ivi.api.model.swift.*;
import com.here.ivi.api.test.MockContextStack;
import java.util.List;
import org.franca.core.franca.FArgument;
import org.franca.core.franca.FEnumerationType;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FModel;
import org.franca.core.franca.FTypeCollection;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest({
  SwiftTypeMapper.class,
  CppCommentParser.class,
  SwiftNameRules.class,
  CBridgeNameRules.class
})
public class SwiftModelBuilderTest {

  private static final String PARAM_NAME = "someParamName";
  private static final String FUNCTION_NAME = "someFunctionName";
  private static final String STRUCT_NAME = "someStruct";
  private static final String COMMENT = "some comment on model element";
  private static final List<String> PACKAGES = asList("PKG1", "PKG2");

  private final MockContextStack<SwiftModelElement> contextStack = new MockContextStack<>();

  @Mock private AbstractFrancaCommentParser.Comments comments;
  @Mock private Interface anInterface;
  @Mock private FModel francaModel;
  @Mock private FMethod francaMethod;
  @Mock private FArgument francaArgument;
  @Mock private FInterface francaInterface;
  @Mock private FTypeCollection francaTypeCollection;
  @Mock private SwiftType swiftType;

  private SwiftModelBuilder modelBuilder;

  @Before
  public void setUp() {
    mockStatic(
        SwiftTypeMapper.class,
        CppCommentParser.class,
        SwiftNameRules.class,
        CBridgeNameRules.class);
    initMocks(this);
    when(SwiftTypeMapper.mapType(any(), any())).thenReturn(swiftType);
    when(SwiftTypeMapper.mapOutputType(any(), any())).thenReturn(swiftType);
    when(CppCommentParser.parse(any(FMethod.class))).thenReturn(comments);
    when(CppCommentParser.parse(any(FInterface.class))).thenReturn(comments);
    when(comments.getMainBodyText()).thenReturn(COMMENT);

    when(anInterface.getPackageNames()).thenReturn(PACKAGES);
    when(anInterface.isStatic(any())).thenReturn(true);
    when(francaArgument.getName()).thenReturn(PARAM_NAME);
    when(SwiftNameRules.getParameterName(any())).thenReturn(PARAM_NAME);
    when(SwiftNameRules.getMethodName(any())).thenReturn(FUNCTION_NAME);

    when(francaMethod.eContainer()).thenReturn(francaInterface);
    when(francaInterface.eContainer()).thenReturn(francaModel);
    when(francaModel.getName()).thenReturn("");

    modelBuilder = new SwiftModelBuilder(anInterface, contextStack);
  }

  @Test
  public void finishBuildingInputArgumentReturnsCreatedParams() {
    modelBuilder.finishBuildingInputArgument(francaArgument);

    List<SwiftParameter> params = getResults(SwiftParameter.class);
    assertEquals(1, params.size());
    assertEquals(PARAM_NAME, params.get(0).variableName);
    assertSame(swiftType, params.get(0).type);
  }

  @Test
  public void finishBuildingOutputArgumentReturnsCreatedParam() {
    SwiftType realType = new SwiftType("SomeType");
    when(SwiftTypeMapper.mapOutputType(any(), any())).thenReturn(realType);
    modelBuilder.finishBuildingOutputArgument(francaArgument);

    List<SwiftParameter> params = getResults(SwiftParameter.class);
    assertEquals(1, params.size());
    assertEquals(PARAM_NAME, params.get(0).variableName);
    assertSame(realType, params.get(0).type);
  }

  @Test
  public void finishBuildingMethodReadsName() {
    modelBuilder.finishBuilding(francaMethod);

    List<SwiftMethod> methods = getResults(SwiftMethod.class);
    assertEquals(1, methods.size());
    SwiftMethod function = methods.get(0);
    assertEquals(FUNCTION_NAME, function.name);

    verifyStatic();
    SwiftNameRules.getMethodName(francaMethod);
  }

  @Test
  public void finishBuildingMethodOmitsSelector() {
    when(francaMethod.getSelector()).thenReturn("selective");

    modelBuilder.finishBuilding(francaMethod);

    List<SwiftMethod> methods = getResults(SwiftMethod.class);
    assertEquals(1, methods.size());
    SwiftMethod function = methods.get(0);
    assertEquals(FUNCTION_NAME, function.name);
  }

  @Test
  public void finishBuildingMethodCreatesStaticMethod() {
    when(anInterface.isStatic(any())).thenReturn(true);

    modelBuilder.finishBuilding(francaMethod);

    List<SwiftMethod> methods = getResults(SwiftMethod.class);
    assertEquals(1, methods.size());
    assertTrue("Method is marked as static", methods.get(0).isStatic);
  }

  @Test
  public void finishBuildingMethodCreatesNonStaticMethod() {
    when(anInterface.isStatic(any())).thenReturn(false);

    modelBuilder.finishBuilding(francaMethod);

    List<SwiftMethod> methods = getResults(SwiftMethod.class);
    assertEquals(1, methods.size());
    assertFalse("Method is marked as non-static", methods.get(0).isStatic);
  }

  @Test
  public void finishBuildingCreatesMethodWithoutParams() {
    modelBuilder.finishBuilding(francaMethod);

    List<SwiftMethod> methods = getResults(SwiftMethod.class);
    assertEquals(1, methods.size());
    SwiftMethod function = methods.get(0);
    assertEquals(SwiftType.VOID, function.returnType);
    assertEquals(0, function.parameters.size());
  }

  @Test
  public void finishBuildingCreatesMethodWithParam() {
    SwiftInParameter param = new SwiftInParameter(PARAM_NAME, new SwiftType("someType"));
    contextStack.injectResult(param);

    modelBuilder.finishBuilding(francaMethod);

    List<SwiftMethod> methods = getResults(SwiftMethod.class);
    assertEquals(1, methods.size());
    SwiftMethod method = methods.get(0);
    assertEquals(1, method.parameters.size());
    assertSame(param, method.parameters.get(0));
  }

  @Test
  public void finishBuildingCreatesTypesFromTypeCollection() {
    SwiftContainerType struct = new SwiftContainerType(STRUCT_NAME);
    SwiftEnum swiftEnum = new SwiftEnum("", "");
    contextStack.injectResult(struct);
    contextStack.injectResult(swiftEnum);

    modelBuilder.finishBuilding(francaTypeCollection);

    List<SwiftFile> files = getResults(SwiftFile.class);
    assertEquals(1, files.size());
    SwiftFile file = files.get(0);
    assertEquals("There should be no classes inside file", 0, file.classes.size());
    assertEquals("There should be one struct inside file", 1, file.structs.size());
    assertSame(struct, file.structs.get(0));
    assertEquals("There should be one enum inside file", 1, file.enums.size());
    assertSame(swiftEnum, file.enums.get(0));
  }

  @Test
  public void finishBuildingCreatesEnumerationType() {
    FEnumerationType francaEnumType = mock(FEnumerationType.class);
    when(francaEnumType.eContainer()).thenReturn(francaInterface);
    when(CppCommentParser.parse(any(FEnumerationType.class))).thenReturn(comments);
    when(SwiftNameRules.getEnumTypeName(any())).thenReturn("SWIFT_NAME");
    when(CBridgeNameRules.getEnumName(any())).thenReturn("C_NAME");

    modelBuilder.finishBuilding(francaEnumType);

    List<SwiftEnum> enums = getResults(SwiftEnum.class);
    assertEquals("Should be 1 enum created.", 1, enums.size());
    SwiftEnum swiftEnum = enums.get(0);
    assertEquals("SWIFT_NAME", swiftEnum.name);
    assertEquals("C_NAME", swiftEnum.cName);
    assertEquals(COMMENT, swiftEnum.comment);
  }

  private <T extends SwiftModelElement> List<T> getResults(Class<T> clazz) {
    return CollectionsHelper.getAllOfType(contextStack.getParentContext().previousResults, clazz);
  }
}
