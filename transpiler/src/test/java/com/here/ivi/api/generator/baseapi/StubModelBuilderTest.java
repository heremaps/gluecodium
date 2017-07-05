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
import static org.mockito.ArgumentMatchers.same;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import com.here.ivi.api.generator.common.ModelBuilderContextStack;
import com.here.ivi.api.model.cppmodel.CppClass;
import com.here.ivi.api.model.cppmodel.CppCustomType;
import com.here.ivi.api.model.cppmodel.CppElement;
import com.here.ivi.api.model.cppmodel.CppMethod;
import com.here.ivi.api.model.cppmodel.CppParameter;
import com.here.ivi.api.model.franca.FrancaElement;
import com.here.ivi.api.test.ArrayEList;
import java.util.ArrayList;
import java.util.List;
import navigation.BaseApiSpec;
import org.franca.core.franca.FArgument;
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

  private static final String CLASS_NAME = "classy";
  private static final String RETURN_TYPE_COMMENT = "no comments";
  private static final String PARAMETER_NAME = "flowers";

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private ModelBuilderContextStack<CppElement> contextStack;

  @Mock private FrancaElement<BaseApiSpec.InterfacePropertyAccessor> rootModel;
  @Mock private BaseApiSpec.InterfacePropertyAccessor propertyAccessor;

  @Mock private FInterface francaInterface;
  @Mock private FMethod francaMethod;
  @Mock private FArgument francaArgument;

  private StubModelBuilder modelBuilder;

  private final CppCustomType cppCustomType = new CppCustomType("typically");
  private final CppMethod cppMethod = new CppMethod.Builder("classical").build();

  private CppElement getFirstResult() {
    List<CppElement> results = contextStack.getParentContext().previousResults;
    assertFalse(results.isEmpty());

    return results.get(0);
  }

  private void injectResult(CppElement element) {
    contextStack.getCurrentContext().previousResults.add(element);
  }

  @Before
  public void setUp() {
    PowerMockito.mockStatic(StubMethodMapper.class);
    MockitoAnnotations.initMocks(this);

    modelBuilder = new StubModelBuilder(contextStack, rootModel);

    contextStack.getCurrentContext().currentResults = new ArrayList<>();
    contextStack.getCurrentContext().previousResults = new ArrayList<>();
    contextStack.getParentContext().previousResults = new ArrayList<>();

    when(rootModel.getPropertyAccessor()).thenReturn(propertyAccessor);

    when(francaInterface.getName()).thenReturn(CLASS_NAME);
    when(francaMethod.getInArgs()).thenReturn(new ArrayEList<>());
    when(francaArgument.getName()).thenReturn(PARAMETER_NAME);

    when(StubMethodMapper.mapMethodReturnType(any(), any()))
        .thenReturn(new StubMethodMapper.ReturnTypeData(cppCustomType, RETURN_TYPE_COMMENT));
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsName() {
    modelBuilder.finishBuilding(francaInterface);

    CppElement result = getFirstResult();
    assertTrue(result instanceof CppClass);
    assertTrue(((CppClass) result).name.toLowerCase().startsWith(CLASS_NAME));

    verify(francaInterface).getName();
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
  public void finishBuildingFrancaMethodReadsReturnTypeData() {
    modelBuilder.finishBuilding(francaMethod);

    CppElement result = getFirstResult();
    assertTrue(result instanceof CppMethod);

    CppMethod cppMethod = (CppMethod) result;
    assertEquals(cppCustomType, cppMethod.getReturnType());
    assertTrue(cppMethod.comment.endsWith(RETURN_TYPE_COMMENT));
  }

  @Test
  public void finishBuildingFrancaMethodReadsStaticFlag() {
    when(propertyAccessor.getStatic(francaMethod)).thenReturn(true);

    modelBuilder.finishBuilding(francaMethod);

    CppElement result = getFirstResult();
    assertTrue(result instanceof CppMethod);

    assertTrue(((CppMethod) result).getSpecifiers().contains(CppMethod.Specifier.STATIC));
  }

  @Test
  public void finishBuildingFrancaMethodReadsInputParameters() {
    CppParameter cppParameter = new CppParameter();
    cppParameter.name = "flowers";
    injectResult(cppParameter);

    modelBuilder.finishBuilding(francaMethod);

    CppElement result = getFirstResult();
    assertTrue(result instanceof CppMethod);

    List<CppParameter> cppParameters = ((CppMethod) result).getInParameters();
    assertFalse(cppParameters.isEmpty());
    assertEquals(cppParameter, cppParameters.get(0));
  }

  @Test
  public void finishBuildingInputArgumentReadsName() {
    modelBuilder.finishBuildingInputArgument(francaArgument);

    CppElement result = getFirstResult();
    assertTrue(result instanceof CppParameter);

    CppParameter cppParameter = (CppParameter) result;
    assertEquals(PARAMETER_NAME, cppParameter.name);
    assertEquals(CppParameter.Mode.Input, cppParameter.mode);
  }

  @Test
  public void finishBuildingInputArgumentMapsType() {
    when(StubMethodMapper.mapArgumentType(any(), any(), any())).thenReturn(cppCustomType);

    modelBuilder.finishBuildingInputArgument(francaArgument);

    CppElement result = getFirstResult();
    assertTrue(result instanceof CppParameter);

    assertEquals(cppCustomType, ((CppParameter) result).type);

    PowerMockito.verifyStatic();
    StubMethodMapper.mapArgumentType(same(francaArgument), same(null), same(rootModel));
  }
}
