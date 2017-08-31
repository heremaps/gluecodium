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
import static org.mockito.Mockito.when;
import static org.powermock.api.mockito.PowerMockito.mockStatic;

import com.here.ivi.api.common.CollectionsHelper;
import com.here.ivi.api.generator.baseapi.CppCommentParser;
import com.here.ivi.api.generator.common.AbstractFrancaCommentParser;
import com.here.ivi.api.model.franca.Interface;
import com.here.ivi.api.model.franca.ModelInfo;
import com.here.ivi.api.model.swift.SwiftClass;
import com.here.ivi.api.model.swift.SwiftInParameter;
import com.here.ivi.api.model.swift.SwiftMethod;
import com.here.ivi.api.model.swift.SwiftModelElement;
import com.here.ivi.api.model.swift.SwiftParameter;
import com.here.ivi.api.model.swift.SwiftType;
import com.here.ivi.api.test.MockContextStack;
import java.util.List;
import org.franca.core.franca.FArgument;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FMethod;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest({SwiftTypeMapper.class, CppCommentParser.class})
public class SwiftModelBuilderTest {

  private static final String PARAM_NAME = "someParamName";
  private static final String FUNCTION_NAME = "someFunctionName";
  private static final String COMMENT = "some comment on model element";
  private static final List<String> PACKAGES = asList("PKG1", "PKG2");

  private final MockContextStack<SwiftModelElement> contextStack = new MockContextStack<>();

  @Mock private AbstractFrancaCommentParser.Comments comments;
  @Mock private SwiftNameRules nameRules;
  @Mock private Interface anInterface;
  @Mock private ModelInfo modelInfo;
  @Mock private FMethod francaMethod;
  @Mock private FArgument francaArgument;
  @Mock private FInterface francaInterface;
  @Mock private SwiftType swiftType;

  private SwiftModelBuilder modelBuilder;

  @Before
  public void setUp() {
    mockStatic(SwiftTypeMapper.class, CppCommentParser.class);
    when(SwiftTypeMapper.mapType(any(), any())).thenReturn(swiftType);
    when(CppCommentParser.parse(any(FMethod.class))).thenReturn(comments);
    when(CppCommentParser.parse(any(FInterface.class))).thenReturn(comments);
    when(comments.getMainBodyText()).thenReturn(COMMENT);

    when(anInterface.getModelInfo()).thenReturn(modelInfo);
    when(modelInfo.getPackageNames()).thenReturn(PACKAGES);
    when(anInterface.isStatic(any())).thenReturn(true);
    when(francaArgument.getName()).thenReturn(PARAM_NAME);
    when(nameRules.getParameterName(any())).thenReturn(PARAM_NAME);
    when(nameRules.getMethodName(any())).thenReturn(FUNCTION_NAME);

    modelBuilder = new SwiftModelBuilder(anInterface, nameRules, contextStack);
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
    modelBuilder.finishBuildingOutputArgument(francaArgument);

    List<SwiftParameter> params = getResults(SwiftParameter.class);
    assertEquals(1, params.size());
    assertEquals(PARAM_NAME, params.get(0).variableName);
    assertSame(swiftType, params.get(0).type);
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
    assertEquals(FUNCTION_NAME, function.name);
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
  public void finishBuildingCreatesInterface() {
    SwiftMethod method = new SwiftMethod(FUNCTION_NAME);
    contextStack.injectResult(method);

    modelBuilder.finishBuilding(francaInterface);

    List<SwiftClass> classes = getResults(SwiftClass.class);
    assertEquals(1, classes.size());
    SwiftClass clazz = classes.get(0);
    assertEquals(1, clazz.methods.size());
    assertSame(method, clazz.methods.get(0));
    assertEquals(1, clazz.imports.size());
    assertEquals(String.join("_", PACKAGES), clazz.nameSpace);
  }

  private <T extends SwiftModelElement> List<T> getResults(Class<T> clazz) {
    return CollectionsHelper.getAllOfType(contextStack.getParentContext().previousResults, clazz);
  }
}
