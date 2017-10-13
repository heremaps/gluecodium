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

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertSame;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.MockitoAnnotations.initMocks;
import static org.powermock.api.mockito.PowerMockito.mockStatic;
import static org.powermock.api.mockito.PowerMockito.when;

import com.here.ivi.api.generator.swift.SwiftNameRules;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest(SwiftNameRules.class)
public class SwiftPropertyTest {

  public static final String PROPERTY_NAME = "PROPERTY_NAME";
  public static final String CBRIDGE_GETTER_NAME = "CBRIDGE_GETTER_NAME";
  public static final String CBRIDGE_SETTER_NAME = "CBRIDGE_SETTER_NAME";
  @Mock private SwiftType swiftType;

  @Before
  public void setUp() {
    mockStatic(SwiftNameRules.class);
    initMocks(this);
    when(SwiftNameRules.getPropertyGetterName(any())).thenReturn(CBRIDGE_GETTER_NAME);
    when(SwiftNameRules.getPropertySetterName(any())).thenReturn(CBRIDGE_SETTER_NAME);
  }

  @Test
  public void constructorCreatesGetterForReadonlyProperty() {
    SwiftProperty property = new SwiftProperty(PROPERTY_NAME, swiftType, true, "");

    assertEquals("Should be one accessor method - getter", 1, property.propertyAccessors.size());
    verifyGetterCreation(property);
  }

  @Test
  public void constructorCreatesGetterAndSetterForWritableProperty() {
    SwiftProperty property = new SwiftProperty(PROPERTY_NAME, swiftType, false, "");

    assertEquals(
        "Should be two accessor methods - getter and setter", 2, property.propertyAccessors.size());
    verifyGetterCreation(property);
    verifySetterCreation(property);
  }

  private void verifyGetterCreation(SwiftProperty property) {
    SwiftMethod getter = property.propertyAccessors.get(0);
    assertSame(swiftType, getter.returnType);
    assertEquals("Getter should have no parameters", 0, getter.parameters.size());
    assertEquals(CBRIDGE_GETTER_NAME, getter.cBaseName);
  }

  private void verifySetterCreation(SwiftProperty property) {
    SwiftMethod setter = property.propertyAccessors.get(1);
    assertSame(SwiftType.VOID, setter.returnType);
    assertEquals("Setter should have one parameters", 1, setter.parameters.size());
    assertSame(swiftType, setter.parameters.get(0).type);
    assertEquals(CBRIDGE_SETTER_NAME, setter.cBaseName);
  }
}
