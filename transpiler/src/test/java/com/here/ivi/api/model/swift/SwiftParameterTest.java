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

package com.here.ivi.api.model.swift;

import static junit.framework.TestCase.assertTrue;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public class SwiftParameterTest {
  private final String interfaceName = "interfaceName";
  private final String variableName = "variableName";

  @Test
  public void emptyVariableName() {
    SwiftParameter parameter = new SwiftParameter(interfaceName, new SwiftType("String"));
    assertFalse(parameter.differentInterfaceAndVariableName);
  }

  @Test
  public void differentVariableName() {
    SwiftParameter parameter =
        new SwiftParameter(interfaceName, new SwiftType("String"), variableName);

    assertTrue(parameter.differentInterfaceAndVariableName);
    assertEquals(variableName, parameter.variableName);
  }
}
