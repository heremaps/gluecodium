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

package com.here.ivi.api.model.cmodel;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.MockitoAnnotations.initMocks;

import com.here.ivi.api.generator.cbridge.CppTypeInfo;
import java.util.HashSet;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;

public class CStructTest {

  @Mock private CppTypeInfo cppTypeInfo;
  private CStruct cStruct;

  @Before
  public void setUp() {
    initMocks(this);
    CType fakeType = mock(CType.class);
    fakeType.includes = new HashSet<>();
    cppTypeInfo = new CppTypeInfo(fakeType);
    cStruct = new CStruct("NAME", "BASE_NAME", "BASE_API_NAME", cppTypeInfo);
  }

  @Test
  public void structReturnsCorrectNameForFiledSetter() {
    String expected = "BASE_NAME_FIELD_NAME_set";
    String actual = cStruct.getNameOfFieldSetter("FIELD_NAME");
    assertEquals(expected, actual);
  }

  @Test
  public void structReturnsCorrectNameForFiledGetter() {
    String expected = "BASE_NAME_FIELD_NAME_get";
    String actual = cStruct.getNameOfFieldGetter("FIELD_NAME");
    assertEquals(expected, actual);
  }
}
