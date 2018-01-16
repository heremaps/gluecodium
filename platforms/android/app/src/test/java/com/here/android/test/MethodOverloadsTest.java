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
import java.util.ArrayList;
import java.util.List;
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
public final class MethodOverloadsTest {
  @Test
  public void isBooleanWithBoolean() {
    boolean result = MethodOverloads.isBoolean(false);

    assertTrue(result);
  }

  @Test
  public void isBooleanWithByte() {
    boolean result = MethodOverloads.isBoolean((byte) 42);

    assertFalse(result);
  }

  @Test
  public void isBooleanWithString() {
    boolean result = MethodOverloads.isBoolean("nonsense");

    assertFalse(result);
  }

  @Test
  public void isBooleanWithStruct() {
    MethodOverloads.Point value = new MethodOverloads.Point();

    boolean result = MethodOverloads.isBoolean(value);

    assertFalse(result);
  }

  @Test
  public void isBooleanWithEverything() {
    MethodOverloads.Point value4 = new MethodOverloads.Point();

    boolean result = MethodOverloads.isBoolean(false, (byte) 42, "nonsense", value4);

    assertFalse(result);
  }

  @Test
  public void isBooleanWithStringArray() {
    List<String> stringList = new ArrayList<>();
    stringList.add("nonsense");
    stringList.add("more nonsense");

    boolean result = MethodOverloads.isBooleanStringArrayOverload(stringList);

    assertFalse(result);
  }

  @Test
  public void isBooleanWithIntArray() {
    List<Byte> byteList = new ArrayList<>();
    byteList.add((byte) 42);
    byteList.add((byte) 255);

    boolean result = MethodOverloads.isBooleanIntArrayOverload(byteList);

    assertFalse(result);
  }
}
