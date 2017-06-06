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

package com.here.ivi.api.model.cppmodel;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.mockito.Mockito.*;

import com.here.ivi.api.generator.common.cpp.templates.CppMethodBodyTemplate;
import org.eclipse.xtend2.lib.StringConcatenation;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class CppMethodTest {
  private static final String METHOD_NAME = "doSomething";

  @Test
  public void generateBodyWithNullCppMethodBodyTemplate() {
    CppMethod cppMethod = new CppMethod.Builder(METHOD_NAME).build();
    assertNull(cppMethod.generateBody());
  }

  @Test
  public void generateBodyWithMockCppMethodBodyTemplate() {
    CppMethodBodyTemplate methodBodyTemplate = mock(CppMethodBodyTemplate.class);
    CppMethod cppMethod =
        new CppMethod.Builder(METHOD_NAME).bodyTemplate(methodBodyTemplate).build();
    when(methodBodyTemplate.generate(cppMethod)).thenReturn(new StringConcatenation());

    assertNotNull(cppMethod.generateBody());

    verify(methodBodyTemplate).generate(cppMethod);
  }
}
