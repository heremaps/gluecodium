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

import static org.mockito.Mockito.when;

import com.here.ivi.api.model.Interface;
import com.here.ivi.api.model.cmodel.CInterface;
import java.util.Collections;
import navigation.BaseApiSpec;
import org.eclipse.emf.common.util.EList;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FMethod;
import org.junit.Assert;
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
  public void createStaticHeaderIncludes() {
    CInterface cModel = generator.buildCBridgeModel(anInterface);
    Assert.assertEquals("Should generate cmodel with filename", "TEST_NAME.h", cModel.fileName);
    Assert.assertEquals(
        "Should generate cmodel with path to stub header file",
        "stub/Package/TEST_NAMEStub.h",
        cModel.stubHeaderFileName);
  }
}
