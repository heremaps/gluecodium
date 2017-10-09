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

import static org.junit.Assert.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.here.ivi.api.generator.common.NameHelper;
import org.franca.core.franca.FEnumerator;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest(NameHelper.class)
public class SwiftNameRulesTest {

  @Before
  public void setUp() {
    PowerMockito.mockStatic(NameHelper.class);
  }

  @Test
  public void getEnumItemName() {
    FEnumerator enumItem = mock(FEnumerator.class);
    String expected = "someEnumItem";
    when(NameHelper.toLowerCamelCase(any())).thenReturn(expected);

    assertEquals(expected, SwiftNameRules.getEnumItemName(enumItem));
  }
}
