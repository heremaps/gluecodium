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
