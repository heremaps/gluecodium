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

package com.here.ivi.api.generator.baseapi;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.ArgumentMatchers.same;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import com.here.ivi.api.generator.common.ModelBuilderContextStack;
import com.here.ivi.api.model.cppmodel.CppClass;
import com.here.ivi.api.model.cppmodel.CppCustomType;
import com.here.ivi.api.model.cppmodel.CppElement;
import com.here.ivi.api.model.cppmodel.CppMethod;
import com.here.ivi.api.model.cppmodel.CppUsing;
import com.here.ivi.api.model.franca.FrancaElement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import navigation.BaseApiSpec;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FMethod;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Answers;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest(StubMethodMapper.class)
public class StubModelBuilderTest {

  private static final String INTERFACE_NAME = "in the face";

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private ModelBuilderContextStack<CppElement> contextStack;

  @Mock private FrancaElement<BaseApiSpec.InterfacePropertyAccessor> rootModel;

  @Mock private FInterface francaInterface;
  @Mock private FMethod francaMethod;

  private StubModelBuilder modelBuilder;

  private final CppUsing cppUsing = new CppUsing("we use", new CppCustomType("typically"));
  private final CppMethod cppMethod = new CppMethod.Builder("classical").build();

  private CppElement getFirstResult() {
    List<CppElement> results = contextStack.getParentContext().previousResults;
    assertFalse(results.isEmpty());

    return results.get(0);
  }

  private void injectResult(CppElement element) {
    contextStack.getCurrentContext().previousResults.add(element);
  }

  private void injectParentName(String name) {
    contextStack.getParentContext().name = name;
  }

  @Before
  public void setUp() {
    PowerMockito.mockStatic(StubMethodMapper.class);
    MockitoAnnotations.initMocks(this);

    modelBuilder = new StubModelBuilder(contextStack, rootModel);

    contextStack.getCurrentContext().currentResults = new ArrayList<>();
    contextStack.getCurrentContext().previousResults = new ArrayList<>();
    contextStack.getParentContext().previousResults = new ArrayList<>();

    when(francaInterface.getName()).thenReturn(INTERFACE_NAME);
  }

  @Test
  public void startBuildingFrancaInterface() {
    modelBuilder.startBuilding(francaInterface);

    verify(francaInterface).getName();
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsUsings() {
    injectResult(cppUsing);

    modelBuilder.finishBuilding(francaInterface);

    CppElement result = getFirstResult();
    assertTrue(result instanceof CppClass);

    CppClass cppClass = (CppClass) result;
    assertFalse(cppClass.usings.isEmpty());
    assertEquals(cppUsing, cppClass.usings.iterator().next());
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsMethods() {
    injectResult(cppMethod);

    modelBuilder.finishBuilding(francaInterface);

    CppElement result = getFirstResult();
    assertTrue(result instanceof CppClass);

    CppClass cppClass = (CppClass) result;
    assertFalse(cppClass.methods.isEmpty());
    assertEquals(cppMethod, cppClass.methods.iterator().next());
  }

  @Test
  public void finishBuildingFrancaMethodGetsParentContextName() {
    injectParentName(INTERFACE_NAME);

    modelBuilder.finishBuilding(francaMethod);

    PowerMockito.verifyStatic();
    StubMethodMapper.mapMethodElements(eq(INTERFACE_NAME), any(), same(rootModel));
  }

  @Test
  public void finishBuildingFrancaMethodStoresResult() {
    when(StubMethodMapper.mapMethodElements(any(), any(), any()))
        .thenReturn(Collections.singletonList(cppMethod));

    modelBuilder.finishBuilding(francaMethod);

    assertEquals(cppMethod, getFirstResult());

    PowerMockito.verifyStatic();
    StubMethodMapper.mapMethodElements(any(), any(), same(rootModel));
  }
}
