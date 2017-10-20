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

package com.here.ivi.api.generator.cbridge;

import static org.junit.Assert.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;
import static org.mockito.MockitoAnnotations.initMocks;
import static org.powermock.api.mockito.PowerMockito.mockStatic;

import com.here.ivi.api.common.CollectionsHelper;
import com.here.ivi.api.generator.baseapi.CppModelBuilder;
import com.here.ivi.api.generator.common.ModelBuilderContextStack;
import com.here.ivi.api.model.cmodel.*;
import com.here.ivi.api.model.franca.Interface;
import java.util.List;
import org.franca.core.franca.*;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest(CBridgeNameRules.class)
public class CModelBuilderInstancesTest {
  private static final String FULL_FUNCTION_NAME = "FULL_FUNCTION_NAME";
  private static final String DELEGATE_NAME = "DELEGATE_NAME";
  private static final String PARAM_NAME = "inputParam";

  @Mock private CppModelBuilder cppModelbuilder;
  @Mock private IncludeResolver resolver;
  @Mock private Interface anInterface;
  @Mock private FInterface francaInterface;
  @Mock private FMethod francaMethod;
  @Mock private FArgument francaArgument;
  @Mock private FTypeCollection francaTypeCollection;
  @Mock private FModel francaModel;

  private CModelBuilder modelBuilder;
  private final ModelBuilderContextStack<CElement> contextStack = new ModelBuilderContextStack<>();

  @Before
  public void setUp() {
    mockStatic(CBridgeNameRules.class);
    initMocks(this);

    when(anInterface.isStatic(any())).thenReturn(false);
    when(CBridgeNameRules.getMethodName(any())).thenReturn(FULL_FUNCTION_NAME);
    when(CBridgeNameRules.getDelegateMethodName(any())).thenReturn(DELEGATE_NAME);

    when(francaArgument.getName()).thenReturn(PARAM_NAME);
    when(francaMethod.eContainer()).thenReturn(francaTypeCollection);
    when(francaTypeCollection.eContainer()).thenReturn(francaModel);
    when(francaInterface.eContainer()).thenReturn(francaModel);

    FModel francaParent = mock(FModel.class);
    when(francaInterface.getName()).thenReturn("SomeClass");
    when(francaInterface.eContainer()).thenReturn(francaParent);
    when(francaParent.getName()).thenReturn("some.package");

    modelBuilder = new CModelBuilder(contextStack, anInterface, resolver, cppModelbuilder);
  }

  @Test
  public void assertInstanceMethodNoParams() {
    modelBuilder.startBuilding(francaInterface);
    modelBuilder.startBuilding(francaMethod);

    modelBuilder.finishBuilding(francaMethod);

    CFunction interfaceFunction = getResults(CFunction.class).get(0);
    assertNotNull(interfaceFunction.selfParameter);
    assertEquals(
        "Instance parameter should not be part of normal parameters",
        0,
        interfaceFunction.parameters.size());
    assertEquals(
        "Instance should be part of C signature parameters",
        1,
        interfaceFunction.getSignatureParameters().size());
  }

  @Test
  public void assertInstanceMethodWithParams() {
    modelBuilder.startBuilding(francaInterface);
    modelBuilder.startBuilding(francaMethod);
    CInParameter param = new CInParameter(PARAM_NAME, new CppTypeInfo(CType.DOUBLE));
    contextStack.getCurrentContext().previousResults.add(param);

    modelBuilder.finishBuilding(francaMethod);

    CFunction interfaceFunction = getResults(CFunction.class).get(0);
    assertEquals(
        "Instance function should only take normal parameters",
        1,
        interfaceFunction.parameters.size());
    assertEquals(
        "Instance parameter should be part of signature",
        2,
        interfaceFunction.getSignatureParameters().size());
  }

  private <T extends CElement> List<T> getResults(Class<T> clazz) {
    return CollectionsHelper.getAllOfType(contextStack.getCurrentContext().previousResults, clazz);
  }
}
