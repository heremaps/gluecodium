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
import static junit.framework.Assert.assertTrue;

import android.os.Build;
import android.support.compat.BuildConfig;
import com.here.android.RobolectricApplication;
import java.util.Arrays;
import java.util.Random;
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
public final class StaticByteArrayMethodsTest {
  private static final int LARGE_BYTE_ARRAY_SIZE = 100000;

  @Test
  public void returnReverseByteBuffer_smallByteArray() {
    // Arrange
    byte[] input = "InputBytes".getBytes();

    // Act
    byte[] output = StaticByteArrayMethods.returnReverseByteBuffer(input);

    // Assert
    assertEquals("setyBtupnI", new String(output));
  }

  @Test
  public void returnInputByteBuffer_emptyByteArray() {
    // Arrange
    byte[] input = {};

    // Act
    byte[] output = StaticByteArrayMethods.returnInputByteBuffer(input);

    // Assert
    assertTrue(Arrays.equals(input, output));
  }

  @Test
  public void returnInputByteBuffer_largeByteArray() {
    // Arrange
    byte[] input = new byte[LARGE_BYTE_ARRAY_SIZE];
    new Random().nextBytes(input);

    // Act
    byte[] output = StaticByteArrayMethods.returnInputByteBuffer(input);

    // Assert
    assertTrue(Arrays.equals(input, output));
  }

  @Test
  public void concatenateByteBuffers_twoSimpleByteArrays() {
    // Arrange
    byte[] input1 = "byte".getBytes();
    byte[] input2 = "array".getBytes();

    // Act
    byte[] output = StaticByteArrayMethods.concatenateByteBuffers(input1, input2);

    // Assert
    assertEquals("bytearray", new String(output));
  }
}
