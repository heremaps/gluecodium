/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 * License-Filename: LICENSE
 */

package com.here.genium.model.swift;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public class SwiftParameterTest {

  private static final String INTERFACE_NAME = "interfaceName";

  @Test
  public void emptyVariableName() {
    SwiftParameter parameter = new SwiftParameter(INTERFACE_NAME, new SwiftType("String"));
    assertFalse(parameter.differentInterfaceAndVariableName);
  }

  @Test
  public void differentVariableName() {
    final String variableName = "variableName";
    SwiftParameter parameter =
        new SwiftParameter(INTERFACE_NAME, new SwiftType("String"), variableName);

    assertTrue(parameter.differentInterfaceAndVariableName);
    assertEquals(variableName, parameter.variableName);
  }
}
