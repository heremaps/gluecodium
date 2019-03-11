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

package com.here.genium.generator.swift;

import static org.junit.Assert.assertEquals;

import com.here.genium.model.swift.SwiftType;
import com.here.genium.model.swift.SwiftValue;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class SwiftValueMapperTest {

  @Test
  public void mapDefaultValueForString() {
    SwiftType swiftType = SwiftType.STRING;

    SwiftValue result = SwiftValueMapper.mapDefaultValue(swiftType, "\\Jonny \"Magic\" Smith\n");

    assertEquals("\"\\\\Jonny \\\"Magic\\\" Smith\\n\"", result.name);
  }

  @Test
  public void mapDefaultValueForEnum() {
    SwiftType swiftType = new SwiftType("SomeType", SwiftType.TypeCategory.ENUM);

    SwiftValue result = SwiftValueMapper.mapDefaultValue(swiftType, "SomeString");

    assertEquals("SomeType.someString", result.name);
  }

  @Test
  public void mapDefaultValueForInteger() {
    SwiftType swiftType = new SwiftType("UInt64");

    SwiftValue result = SwiftValueMapper.mapDefaultValue(swiftType, "SomeString");

    assertEquals("SomeString", result.name);
  }
}
