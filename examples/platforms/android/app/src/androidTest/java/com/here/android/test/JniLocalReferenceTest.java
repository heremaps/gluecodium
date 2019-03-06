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

import com.here.android.hello.HelloWorld;
import com.here.android.hello.HelloWorldBuiltinTypes;

import org.junit.Ignore;
import org.junit.Test;

import java.util.Collections;
import java.util.List;

import static junit.framework.Assert.assertEquals;

/**
 * These tests need to be run on the device since they will always pass on emulator.
 */
public final class JniLocalReferenceTest {
  // JNI local reference limit is 512, take double that +1 to be sure
  private static final int LOOP_COUNT = 1025;

  @Test
  public void uint8Array() {
    List<Short> input = Collections.nCopies(LOOP_COUNT, (short) 7);
    List<Short> result = Arrays.reverseUint8Array(input);
    assertEquals(input.size(), result.size());
  }

  @Test
  public void int8Array() {
      List<Byte> input = Collections.nCopies(LOOP_COUNT, (byte) 7);
      List<Byte> result = Arrays.reverseInt8Array(input);
      assertEquals(input.size(), result.size());
    }

  @Test
  public void uint16Array() {
    List<Integer> input = Collections.nCopies(LOOP_COUNT, 7);
    List<Integer> result = Arrays.reverseUint16Array(input);
    assertEquals(input.size(), result.size());
  }

  @Test
  public void int16Array() {
    List<Short> input = Collections.nCopies(LOOP_COUNT, (short) 7);
    List<Short> result = Arrays.reverseInt16Array(input);
    assertEquals(input.size(), result.size());
  }

  @Test
  public void uint32Array() {
    List<Long> input = Collections.nCopies(LOOP_COUNT, (long) 7);
    List<Long> result = Arrays.reverseUint32Array(input);
    assertEquals(input.size(), result.size());
  }

  @Test
  public void int32Array() {
    List<Integer> input = Collections.nCopies(LOOP_COUNT, 7);
    List<Integer> result = Arrays.reverseInt32Array(input);
    assertEquals(input.size(), result.size());
  }

  @Test
  public void uint64Array() {
    List<Long> input = Collections.nCopies(LOOP_COUNT, 7l);
    List<Long> result = Arrays.reverseUint64Array(input);
    assertEquals(input.size(), result.size());
  }

  @Test
  public void int64Array() {
    List<Long> input = Collections.nCopies(LOOP_COUNT, 7l);
    List<Long> result = Arrays.reverseInt64Array(input);
    assertEquals(input.size(), result.size());
  }

  @Test
  public void boolArray() {
    List<Boolean> input = Collections.nCopies(LOOP_COUNT, true);
    List<Boolean> result = Arrays.reverseBoolArray(input);
    assertEquals(input.size(), result.size());
  }

  @Test
  public void floatArray() {
    List<Float> input = Collections.nCopies(LOOP_COUNT, 7f);
    List<Float> result = Arrays.reverseFloatArray(input);
    assertEquals(input.size(), result.size());
  }

  @Test
  public void doubleArray() {
    List<Double> input = Collections.nCopies(LOOP_COUNT, 7.);
    List<Double> result = Arrays.reverseDoubleArray(input);
    assertEquals(input.size(), result.size());
  }

  @Test
  public void stringArray() {
    List<String> input = Collections.nCopies(LOOP_COUNT, "seven");
    List<String> result = Arrays.reverseStringArray(input);
    assertEquals(input.size(), result.size());
  }

  @Test
  public void enumArray() {
    List<Arrays.ArrayEnum> input = Collections.nCopies(LOOP_COUNT, Arrays.ArrayEnum.ENUM_ONE);
    List<Arrays.ArrayEnum> result = Arrays.reverseEnumsArray(input);
    assertEquals(input.size(), result.size());
  }

  @Test
  public void structArray() {
    List<Arrays.BasicStruct> input = Collections.nCopies(LOOP_COUNT, new Arrays.BasicStruct());
    List<Arrays.BasicStruct> result = Arrays.reverseStructArray(input);
    assertEquals(input.size(), result.size());
  }

  @Test
  public void builtinUint8() {
    for (int i = LOOP_COUNT; i > 0; --i) {
      HelloWorldBuiltinTypes.methodWithUint8((byte) 1);
    }
  }

  @Test
  public void builtinInt8() {
    for (int i = LOOP_COUNT; i > 0; --i) {
      HelloWorldBuiltinTypes.methodWithInt8((byte) 1);
    }
  }

  @Test
  public void builtinUint16() {
    for (int i = LOOP_COUNT; i > 0; --i) {
      HelloWorldBuiltinTypes.methodWithUint16(1);
    }
  }

  @Test
  public void builtinInt16() {
    for (int i = LOOP_COUNT; i > 0; --i) {
      HelloWorldBuiltinTypes.methodWithInt16((short) 1);
    }
  }

  @Test
  public void builtinUint32() {
    for (int i = LOOP_COUNT; i > 0; --i) {
      HelloWorldBuiltinTypes.methodWithUint32( 1l);
    }
  }

  @Test
  public void builtinInt32() {
    for (int i = LOOP_COUNT; i > 0; --i) {
      HelloWorldBuiltinTypes.methodWithInt32(1);
    }
  }

  @Test
  public void builtinUint64() {
    for (int i = LOOP_COUNT; i > 0; --i) {
      HelloWorldBuiltinTypes.methodWithUint64(1l);
    }
  }

  @Test
  public void builtinInt64() {
    for (int i = LOOP_COUNT; i > 0; --i) {
      HelloWorldBuiltinTypes.methodWithInt64(1l);
    }
  }

  @Test
  public void builtinBool() {
    for (int i = LOOP_COUNT; i > 0; --i) {
      HelloWorldBuiltinTypes.methodWithBoolean(true);
    }
  }

  @Test
  public void builtinFloat() {
    for (int i = LOOP_COUNT; i > 0; --i) {
      HelloWorldBuiltinTypes.methodWithFloat(1f);
    }
  }

  @Test
  public void builtinDouble() {
    for (int i = LOOP_COUNT; i > 0; --i) {
      HelloWorldBuiltinTypes.methodWithDouble(1.);
    }
  }

  @Test
  public void builtinString() {
    for (int i = LOOP_COUNT; i > 0; --i) {
      HelloWorld.helloWorldMethod("one");
    }
  }

  @Test
  public void structs() {
    PlainDataStructures.AllTypesStruct struct = new PlainDataStructures.AllTypesStruct();
    for (int i = LOOP_COUNT; i > 0; --i) {
      struct = PlainDataStructures.returnAllTypesStruct(struct);
    }
  }

  @Test
  public void modifyStructs() {
    PlainDataStructures.AllTypesStruct struct = new PlainDataStructures.AllTypesStruct();
    for (int i = LOOP_COUNT; i > 0; --i) {
      struct = PlainDataStructures.modifyAllTypesStruct(struct);
    }
  }
}

