/*
 * Copyright (C) 2018 HERE Global B.V. and its affiliate(s). All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 */
package com.here.android.hello;

import static junit.framework.Assert.assertEquals;
import static junit.framework.Assert.assertNotNull;

import android.os.Build;
import android.support.compat.BuildConfig;
import com.here.android.RobolectricApplication;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(
  sdk = Build.VERSION_CODES.M,
  application = RobolectricApplication.class,
  constants = BuildConfig.class
)
public class HelloWorldInstancesTest {

  private static final String TEST_STRING = "TestString";

  @Test
  public void simpleInstantiable_setAndGet() {
    SimpleInstantiable simpleInstantiable = HelloWorldFactory.createSimple();

    simpleInstantiable.setStringValue(TEST_STRING);

    assertEquals(TEST_STRING, simpleInstantiable.getStringValue());
  }

  @Test
  public void nestedInstantiable_create() {
    SimpleInstantiable simpleInstantiable = HelloWorldFactory.createSimple();

    NestedInstantiable nestedInstantiable = HelloWorldFactory.createNested(simpleInstantiable);

    assertNotNull(nestedInstantiable);
  }

  @Test
  public void nestedInstantiable_get() {
    NestedInstantiable nestedInstantiable =
        HelloWorldFactory.createNested(HelloWorldFactory.createSimple());

    nestedInstantiable.getInstantiable().setStringValue(TEST_STRING);

    assertEquals(TEST_STRING, nestedInstantiable.getInstantiable().getStringValue());
  }

  @Test
  public void nestedInstantiable_set() {
    NestedInstantiable nestedInstantiable =
        HelloWorldFactory.createNested(HelloWorldFactory.createSimple());
    SimpleInstantiable simpleInstantiable = HelloWorldFactory.createSimple();
    simpleInstantiable.setStringValue(TEST_STRING);

    nestedInstantiable.setInstantiable(simpleInstantiable);

    assertEquals(TEST_STRING, nestedInstantiable.getInstantiable().getStringValue());
  }
}
