/*
 * Copyright (C) 2016-2019 HERE Europe B.V.
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

package com.here.genium.generator.swift;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.here.genium.model.swift.SwiftType;
import com.here.genium.model.swift.SwiftValue;
import org.franca.core.franca.*;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

@RunWith(JUnit4.class)
public final class SwiftValueMapperTest {

  @Mock private FEnumerationType francaEnumerationType;
  @Mock private FEnumerator francaEnumerator;
  @Mock private FQualifiedElementRef francaElementRef;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);

    when(francaEnumerator.eContainer()).thenReturn(francaEnumerationType);
    when(francaEnumerator.getName()).thenReturn("Foo");
    when(francaEnumerationType.getName()).thenReturn("Bar");
  }

  @Test
  public void mapDefaultValueForString() {
    SwiftType swiftType = SwiftType.STRING;

    SwiftValue result = SwiftValueMapper.mapDefaultValue(swiftType, "\\Jonny \"Magic\" Smith\n");

    assertEquals("\"\\\\Jonny \\\"Magic\\\" Smith\\n\"", result.name);
  }

  @Test
  public void mapDefaultValueForEnum() {
    SwiftType swiftType = new SwiftType("SomeType", "", SwiftType.TypeCategory.ENUM);

    SwiftValue result = SwiftValueMapper.mapDefaultValue(swiftType, "SomeString");

    assertEquals("SomeType.someString", result.name);
  }

  @Test
  public void mapDeploymentDefaultFloatNan() {
    SwiftType swiftType = SwiftType.FLOAT;

    SwiftValue result = SwiftValueMapper.mapDefaultValue(swiftType, "NaN");

    assertEquals("Float.nan", result.name);
  }

  @Test
  public void mapDeploymentDefaultDoubleNegativeInfinity() {
    SwiftType swiftType = SwiftType.DOUBLE;

    SwiftValue result = SwiftValueMapper.mapDefaultValue(swiftType, "-Infinity");

    assertEquals("-Double.infinity", result.name);
  }

  @Test
  public void mapDefaultValueForInteger() {
    SwiftType swiftType = new SwiftType("UInt64", "uint64_t");

    SwiftValue result = SwiftValueMapper.mapDefaultValue(swiftType, "SomeString");

    assertEquals("SomeString", result.name);
  }

  @Test
  public void mapNonConstantValue() {
    SwiftValue mappedValue = SwiftValueMapper.map(francaElementRef);

    assertNull(mappedValue);
  }

  @Test
  public void mapEnumValueInTypeCollection() {
    when(francaEnumerationType.eContainer()).thenReturn(mock(FTypeCollection.class));
    when(francaElementRef.getElement()).thenReturn(francaEnumerator);

    SwiftValue mappedValue = SwiftValueMapper.map(francaElementRef);

    assertNotNull(mappedValue);
    assertEquals("Bar.foo", mappedValue.name);
  }

  @Test
  public void mapEnumValueInInterface() {
    FInterface francaInterface = mock(FInterface.class);
    when(francaInterface.getName()).thenReturn("Baz");
    when(francaEnumerationType.eContainer()).thenReturn(francaInterface);
    when(francaElementRef.getElement()).thenReturn(francaEnumerator);

    SwiftValue mappedValue = SwiftValueMapper.map(francaElementRef);

    assertNotNull(mappedValue);
    assertEquals("Baz.Bar.foo", mappedValue.name);
  }
}
