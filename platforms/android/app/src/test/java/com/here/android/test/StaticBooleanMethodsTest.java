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

import static junit.framework.Assert.assertFalse;
import static junit.framework.Assert.assertTrue;

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
public final class StaticBooleanMethodsTest {
  @Test
  public void returnInvertedBoolean_True() {
    // Arrange, act, assert
    assertFalse(StaticBooleanMethods.returnInvertedBoolean(true));
  }

  @Test
  public void returnInvertedBoolean_booleanAndReturnsFalse() {
    // Arrange, act, assert
    assertFalse(StaticBooleanMethods.returnAndBoolean(true, false));
  }

  @Test
  public void returnInvertedBoolean_booleanAndReturnsTrue() {
    // Arrange, act, assert
    assertTrue(StaticBooleanMethods.returnAndBoolean(true, true));
  }
}
