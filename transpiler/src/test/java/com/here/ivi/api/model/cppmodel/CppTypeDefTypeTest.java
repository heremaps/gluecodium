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

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.util.Collections;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

@RunWith(JUnit4.class)
public class CppTypeDefTypeTest {

  @Mock private CppType cppType;

  private CppTypeDefType cppTypeDefType;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);

    cppTypeDefType = new CppTypeDefType("", cppType, Collections.emptyList());
  }

  @Test
  public void isValueTypeFalsePropagated() {
    when(cppType.isValueType()).thenReturn(false);

    boolean result = cppTypeDefType.isValueType();

    assertEquals(false, result);
    verify(cppType).isValueType();
  }

  @Test
  public void isValueTypeTruePropagated() {
    when(cppType.isValueType()).thenReturn(true);

    boolean result = cppTypeDefType.isValueType();

    assertEquals(true, result);
    verify(cppType).isValueType();
  }
}
