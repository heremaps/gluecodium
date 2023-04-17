/*
 * Copyright (C) 2016-2019 HERE Europe B.V.
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
import static junit.framework.Assert.assertNull;

import android.os.Build;
import com.here.android.RobolectricApplication;
import java.util.ArrayList;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class)
public class BlobsTest {

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
    List<Short> uintList = new ArrayList<>();

    List<Short> resultList = ArraysByteBuffer.methodWithImplicitArray(uintList);

    assertNotNull(resultList);
    assertEquals(0, resultList.size());
  }

  @Test
  public void methodWithImplicitArray_reversesArray() {
    List<Short> uintList = java.util.Arrays.asList((short) 1, (short) 2, (short) 3);

    List<Short> resultList = ArraysByteBuffer.methodWithImplicitArray(uintList);

    assertNotNull(resultList);
    assertEquals(java.util.Arrays.asList((short) 3, (short) 2, (short) 1), resultList);
  }

  @Test
  public void methodWithExplicitArray_emptyArray() {
    List<Short> uintList = new ArrayList<>();

    List<Short> resultList = ArraysByteBuffer.methodWithExplicitArray(uintList);

    assertNotNull(resultList);
    assertEquals(0, resultList.size());
  }

  @Test
  public void methodWithExplicitArray_reversesArray() {
    List<Short> uintList = java.util.Arrays.asList((short) 1, (short) 2, (short) 3);

    List<Short> resultList = ArraysByteBuffer.methodWithExplicitArray(uintList);

    assertNotNull(resultList);
    assertEquals(java.util.Arrays.asList((short) 3, (short) 2, (short) 1), resultList);
  }

  @Test
  public void methodWithByteBufferInStruct_emptyArray() {
    ArraysByteBuffer.StructWithByteBuffer struct =
        new ArraysByteBuffer.StructWithByteBuffer(new byte[0]);

    ArraysByteBuffer.StructWithByteBuffer resultStruct =
        ArraysByteBuffer.methodWithByteBufferInStruct(struct);

    assertNotNull(resultStruct);
    assertEquals(0, resultStruct.image.length);
  }

  @Test
  public void methodWithByteBufferInStruct_reversesArray() {
    ArraysByteBuffer.StructWithByteBuffer struct =
        new ArraysByteBuffer.StructWithByteBuffer("Nonsense".getBytes());

    ArraysByteBuffer.StructWithByteBuffer resultStruct =
        ArraysByteBuffer.methodWithByteBufferInStruct(struct);

    assertNotNull(resultStruct);
    assertEquals("esnesnoN", new String(resultStruct.image));
  }

  @Test
  public void methodWithImplicitArrayInStruct_emptyArray() {
    ArraysByteBuffer.StructWithImplicitArray struct =
        new ArraysByteBuffer.StructWithImplicitArray(new ArrayList<>());

    ArraysByteBuffer.StructWithImplicitArray resultStruct =
        ArraysByteBuffer.methodWithImplicitArrayInStruct(struct);

    assertNotNull(resultStruct);
    assertEquals(0, resultStruct.image.size());
  }

  @Test
  public void methodWithImplicitArrayInStruct_reversesArray() {
    ArraysByteBuffer.StructWithImplicitArray struct =
        new ArraysByteBuffer.StructWithImplicitArray(
            java.util.Arrays.asList((short) 1, (short) 2, (short) 3));

    ArraysByteBuffer.StructWithImplicitArray resultStruct =
        ArraysByteBuffer.methodWithImplicitArrayInStruct(struct);

    assertNotNull(resultStruct);
    assertEquals(java.util.Arrays.asList((short) 3, (short) 2, (short) 1), resultStruct.image);
  }

  @Test
  public void methodWithExplicitArrayInStruct_emptyArray() {
    ArraysByteBuffer.StructWithExplicitArray struct =
        new ArraysByteBuffer.StructWithExplicitArray(new ArrayList<>());

    ArraysByteBuffer.StructWithExplicitArray resultStruct =
        ArraysByteBuffer.methodWithExplicitArrayInStruct(struct);

    assertNotNull(resultStruct);
    assertEquals(0, resultStruct.image.size());
  }

  @Test
  public void methodWithExplicitArrayInStruct_reversesArray() {
    ArraysByteBuffer.StructWithExplicitArray struct =
        new ArraysByteBuffer.StructWithExplicitArray(
            java.util.Arrays.asList((short) 1, (short) 2, (short) 3));

    ArraysByteBuffer.StructWithExplicitArray resultStruct =
        ArraysByteBuffer.methodWithExplicitArrayInStruct(struct);

    assertNotNull(resultStruct);
    assertEquals(java.util.Arrays.asList((short) 3, (short) 2, (short) 1), resultStruct.image);
  }

  @Test
  public void blobNullsBreakingNull() {
    byte[] resultBuffer = BlobNulls.getBreakingNull();

    assertNotNull(resultBuffer);
    assertEquals(0, resultBuffer.length);
  }

  @Test
  public void blobNullsValidNull() {
    byte[] resultBuffer = BlobNulls.getValidNull();

    assertNull(resultBuffer);
  }

  @Test
  public void blobDefaultsEmpty() {
    byte[] result = (new BlobDefaults()).emptyList;

    assertEquals(0, result.length);
  }

  @Test
  public void blobDefaultsDeadBeef() {
    byte[] result = (new BlobDefaults()).deadBeef;

    assertEquals((byte) 0xDE, result[0]);
    assertEquals((byte) 0xAD, result[1]);
    assertEquals((byte) 0xBE, result[2]);
    assertEquals((byte) 0xEF, result[3]);
  }

  @Test
  public void blobDefaultsDeadBeefFromCpp() {
    byte[] result = BlobDefaults.getCppDefaults().deadBeef;

    assertEquals((byte) 0xDE, result[0]);
    assertEquals((byte) 0xAD, result[1]);
    assertEquals((byte) 0xBE, result[2]);
    assertEquals((byte) 0xEF, result[3]);
  }
}
