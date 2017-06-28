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

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.here.ivi.api.model.cmodel.CFunction;
import com.here.ivi.api.model.cmodel.CInterface;
import com.here.ivi.api.model.franca.Interface;
import java.util.Collections;
import navigation.BaseApiSpec;
import org.eclipse.emf.common.util.BasicEList;
import org.eclipse.emf.common.util.EList;
import org.franca.core.franca.*;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Answers;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

public class CBridgeGeneratorTest {
  private CBridgeGenerator generator;

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private Interface<BaseApiSpec.InterfacePropertyAccessor> anInterface;

  @Mock private FInterface fInterface;
  @Mock private EList<FMethod> methods;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
    when(anInterface.getFrancaInterface()).thenReturn(fInterface);
    when(fInterface.getName()).thenReturn("TEST_NAME");
    when(fInterface.getMethods()).thenReturn(methods);
    when(anInterface.getPackage()).thenReturn(Collections.singletonList("Package"));
    generator = new CBridgeGenerator(new CBridgeNameRules());
  }

  @Test
  public void basicModel() {
    CInterface cModel = generator.buildCBridgeModel(anInterface);
    assertEquals("Should generate cmodel with filename", "TEST_NAME.h", cModel.fileName);
    assertEquals(
        "Should generate cmodel with path to stub header file",
        "stub/Package/TEST_NAMEStub.h",
        cModel.stubHeaderFileName);
    assertNotNull("Function list should be instantiated", cModel.functions);
    assertTrue("Function list by default empty", cModel.functions.isEmpty());
  }

  @Test
  public void basicFunctions() {

    EList<FMethod> myMethods = new BasicEList<>();
    FMethod method = mock(FMethod.class);
    when(method.getName()).thenReturn("function1");
    when(method.getInArgs()).thenReturn(new BasicEList<>());
    when(method.getOutArgs()).thenReturn(new BasicEList<>());
    myMethods.add(method);
    when(fInterface.getMethods()).thenReturn(myMethods);
    CInterface cModel = generator.buildCBridgeModel(anInterface);
    assertNotNull("Model should be instantiated", cModel);
    assertNotNull("Function list should be instantiated", cModel.functions);
    assertEquals("there should be a function", 1, cModel.functions.size());
    CFunction functionToTest = cModel.functions.get(0);
    assertEquals(
        "The method delegate should be set to its base API stub name",
        "Package::Stub::function1",
        functionToTest.delegateName);
  }
}
