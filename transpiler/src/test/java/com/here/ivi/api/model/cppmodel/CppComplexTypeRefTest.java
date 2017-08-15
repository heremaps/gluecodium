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

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public class CppComplexTypeRefTest {

  private static final String TYPE_NAME_RESOLVED = "myTypeName";
  private static final String TYPE_NAME_LAZY = "myTypeNameLazy";

  private static CppComplexTypeRef createTypeRefResolvedName() {
    return new CppComplexTypeRef.Builder(TYPE_NAME_RESOLVED).build();
  }

  @Test
  public void isValueTypeFalseForComplex() {
    CppComplexTypeRef cppCustomType = createTypeRefResolvedName();

    boolean result = cppCustomType.refersToValueType();

    assertEquals(false, result);
  }

  @Test
  public void isValueTypeTrueForEnumeration() {
    CppComplexTypeRef cppCustomType =
        new CppComplexTypeRef.Builder(TYPE_NAME_LAZY).typeInfo(CppTypeInfo.Enumeration).build();

    boolean result = cppCustomType.refersToValueType();

    assertEquals(true, result);
  }
}
