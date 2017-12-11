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

import com.here.ivi.api.model.swift.SwiftType;
import com.here.ivi.api.model.swift.SwiftValue;
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
