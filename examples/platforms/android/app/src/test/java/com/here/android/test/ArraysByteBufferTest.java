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
import static junit.framework.Assert.assertNotNull;

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
public class ArraysByteBufferTest {

  @Test
  public void methodWithByteBuffer_emptyArray() {
    byte[] byteBuffer = new byte[0];

    byte[] resultBuffer = ArraysByteBuffer.methodWithByteBuffer(byteBuffer);

    assertNotNull(resultBuffer);
    assertEquals(0, resultBuffer.length);
  }

  @Test
  public void methodWithByteBuffer_reversesArray() {
    byte[] byteBuffer = "Nonsense".getBytes();

    byte[] resultBuffer = ArraysByteBuffer.methodWithByteBuffer(byteBuffer);

    assertNotNull(resultBuffer);
    assertEquals("esnesnoN", new String(resultBuffer));
  }

  @Test
  public void methodWithImplicitArray_emptyArray() {
    List<Long> uintList = new ArrayList<>();

    List<Long> resultList = ArraysByteBuffer.methodWithImplicitArray(uintList);

    assertNotNull(resultList);
    assertEquals(0, resultList.size());
  }

  @Test
  public void methodWithImplicitArray_reversesArray() {
    List<Long> uintList = java.util.Arrays.asList(1L, 2L, 3L);

    List<Long> resultList = ArraysByteBuffer.methodWithImplicitArray(uintList);

    assertNotNull(resultList);
    assertEquals(java.util.Arrays.asList(3L, 2L, 1L), resultList);
  }

  @Test
  public void methodWithExplicitArray_emptyArray() {
    List<Long> uintList = new ArrayList<>();

    List<Long> resultList = ArraysByteBuffer.methodWithExplicitArray(uintList);

    assertNotNull(resultList);
    assertEquals(0, resultList.size());
  }

  @Test
  public void methodWithExplicitArray_reversesArray() {
    List<Long> uintList = java.util.Arrays.asList(1L, 2L, 3L);

    List<Long> resultList = ArraysByteBuffer.methodWithExplicitArray(uintList);

    assertNotNull(resultList);
    assertEquals(java.util.Arrays.asList(3L, 2L, 1L), resultList);
  }

  @Test
  public void methodWithByteBufferInStruct_emptyArray() {
    ArraysByteBuffer.StructWithByteBuffer struct = new ArraysByteBuffer.StructWithByteBuffer();
    struct.image = new byte[0];

    ArraysByteBuffer.StructWithByteBuffer resultStruct =
        ArraysByteBuffer.methodWithByteBufferInStruct(struct);

    assertNotNull(resultStruct);
    assertEquals(0, resultStruct.image.length);
  }

  @Test
  public void methodWithByteBufferInStruct_reversesArray() {
    ArraysByteBuffer.StructWithByteBuffer struct = new ArraysByteBuffer.StructWithByteBuffer();
    struct.image = "Nonsense".getBytes();

    ArraysByteBuffer.StructWithByteBuffer resultStruct =
        ArraysByteBuffer.methodWithByteBufferInStruct(struct);

    assertNotNull(resultStruct);
    assertEquals("esnesnoN", new String(resultStruct.image));
  }

  @Test
  public void methodWithImplicitArrayInStruct_emptyArray() {
    ArraysByteBuffer.StructWithImplicitArray struct =
        new ArraysByteBuffer.StructWithImplicitArray();
    struct.image = new ArrayList<>();

    ArraysByteBuffer.StructWithImplicitArray resultStruct =
        ArraysByteBuffer.methodWithImplicitArrayInStruct(struct);

    assertNotNull(resultStruct);
    assertEquals(0, resultStruct.image.size());
  }

  @Test
  public void methodWithImplicitArrayInStruct_reversesArray() {
    ArraysByteBuffer.StructWithImplicitArray struct =
        new ArraysByteBuffer.StructWithImplicitArray();
    struct.image = java.util.Arrays.asList(1L, 2L, 3L);

    ArraysByteBuffer.StructWithImplicitArray resultStruct =
        ArraysByteBuffer.methodWithImplicitArrayInStruct(struct);

    assertNotNull(resultStruct);
    assertEquals(java.util.Arrays.asList(3L, 2L, 1L), resultStruct.image);
  }

  @Test
  public void methodWithExplicitArrayInStruct_emptyArray() {
    ArraysByteBuffer.StructWithExplicitArray struct =
        new ArraysByteBuffer.StructWithExplicitArray();
    struct.image = new ArrayList<>();

    ArraysByteBuffer.StructWithExplicitArray resultStruct =
        ArraysByteBuffer.methodWithExplicitArrayInStruct(struct);

    assertNotNull(resultStruct);
    assertEquals(0, resultStruct.image.size());
  }

  @Test
  public void methodWithExplicitArrayInStruct_reversesArray() {
    ArraysByteBuffer.StructWithExplicitArray struct =
        new ArraysByteBuffer.StructWithExplicitArray();
    struct.image = java.util.Arrays.asList(1L, 2L, 3L);

    ArraysByteBuffer.StructWithExplicitArray resultStruct =
        ArraysByteBuffer.methodWithExplicitArrayInStruct(struct);

    assertNotNull(resultStruct);
    assertEquals(java.util.Arrays.asList(3L, 2L, 1L), resultStruct.image);
  }
}
