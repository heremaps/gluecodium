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
package com.here.android.test;

import static junit.framework.Assert.assertEquals;

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
public class InheritanceTest {

  @Test
  public void createChildClassInstance() {
    ChildClass instance = ChildClass.createChildClass();

    assertEquals("Johnny", instance.getName());
    assertEquals(7, instance.getLuckyNumber());
  }

  @Test
  public void castChildClassInstanceToParent() {
    ParentInterface instance = ChildClass.createChildClass().castToParent();

    assertEquals("Johnny", instance.getName());
    assertEquals(7, instance.getLuckyNumber());
  }

  @Test
  public void createGrandchildClassInstance() {
    GrandchildClass instance = GrandchildClass.createGrandchildClass();

    assertEquals("John F. Kimberly", instance.getName());
    assertEquals(42, instance.getLuckyNumber());
  }

  @Test
  public void castGrandchildClassInstanceToParent() {
    ParentInterface instance = GrandchildClass.createGrandchildClass().castToParent();

    assertEquals("John F. Kimberly", instance.getName());
    assertEquals(42, instance.getLuckyNumber());
  }
}
