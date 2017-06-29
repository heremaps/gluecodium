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
import static org.mockito.MockitoAnnotations.initMocks;

import java.util.Collections;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Mock;

@RunWith(JUnit4.class)
public class CppTypeDefTypeTest {

  @Mock CppPrimitiveType primitiveType;

  @Before
  public void setUp() {
    initMocks(this);
  }

  @Test
  public void getActualType() {

    //arrange
    CppTypeDefType innerTypeDefType =
        new CppTypeDefType("TypeDef_inner", primitiveType, Collections.emptyList());
    CppTypeDefType outerTypeDefType =
        new CppTypeDefType("TypeDef_outer", innerTypeDefType, Collections.emptyList());

    //act
    CppType actualType = outerTypeDefType.getActualType();

    assertEquals(primitiveType, actualType);
  }
}
