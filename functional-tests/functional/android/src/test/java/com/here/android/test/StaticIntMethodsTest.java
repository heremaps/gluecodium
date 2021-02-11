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

import android.os.Build;
import com.here.android.RobolectricApplication;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class)
public final class StaticIntMethodsTest {
  @Test
  public void returnNextNumberInt8() {
    // Arrange, act
    byte actual = StaticIntMethods.returnNextNumberInt8((byte) 115);

    // Assert
    assertEquals(116, actual);
  }

  @Test
  public void sumTwoNumbersInt8() {
    // Arrange
    byte firstByte = 50;
    byte secondByte = 60;

    // Act
    byte actual = StaticIntMethods.sumTwoNumbersInt8(firstByte, secondByte);

    // Assert
    assertEquals(firstByte + secondByte, actual);
  }

  @Test
  public void returnPrimeInt8() {
    // Arrange, act, assert
    assertEquals(2, StaticIntMethods.returnPrimeInt8());
  }

  @Test
  public void returnNextNumberUint8() {
    // Arrange
    short number = 200;
    short expected = 201;

    // Act
    short actual = StaticIntMethods.returnNextNumberUint8(number);

    // Assert
    assertEquals(expected, actual);
  }

  @Test
  public void sumTwoNumbersUint8() {
    // Arrange
    short firstNumber = 160;
    short secondNumber = 80;
    short expected = (short) (firstNumber + secondNumber);

    // Act
    short actual = StaticIntMethods.sumTwoNumbersUint8(firstNumber, secondNumber);

    // Assert
    assertEquals(expected, actual);
  }

  @Test
  public void returnPrimeUint8() {
    // Arrange, act, assert
    assertEquals(131, StaticIntMethods.returnPrimeUint8());
  }

  @Test
  public void returnNextNumberInt16() {
    // Arrange
    short number = 2000;
    short expected = 2001;

    // Act
    short actual = StaticIntMethods.returnNextNumberInt16(number);

    // Assert
    assertEquals(expected, actual);
  }

  @Test
  public void sumTwoNumbersInt16() {
    // Arrange
    short firstNumber = 1600;
    short secondNumber = 800;
    long expected = firstNumber + secondNumber;

    // Act
    short actual = StaticIntMethods.sumTwoNumbersInt16(firstNumber, secondNumber);

    // Assert
    assertEquals(expected, actual);
  }

  @Test
  public void returnPrimeInt16() {
    // Arrange, act, assert
    assertEquals((short) 257, StaticIntMethods.returnPrimeInt16());
  }

  @Test
  public void returnNextNumberUint16() {
    // Arrange
    int number = 40000;
    int expected = 40001;

    // Act
    int actual = StaticIntMethods.returnNextNumberUint16(number);

    // Assert
    assertEquals(expected, actual);
  }

  @Test
  public void sumTwoNumbersUint16() {
    // Arrange
    int firstNumber = 16000;
    int secondNumber = 8000;
    int expected = firstNumber + secondNumber;

    // Act
    int actual = StaticIntMethods.sumTwoNumbersUint16(firstNumber, secondNumber);

    // Assert
    assertEquals(expected, actual);
  }

  @Test
  public void returnPrimeUint16() {
    // Arrange, act, assert
    assertEquals(32771, StaticIntMethods.returnPrimeUint16());
  }

  @Test
  public void returnNextNumberInt32() {
    // Arrange
    int number = 80000;
    long expected = 80001;

    // Act
    long actual = StaticIntMethods.returnNextNumberInt32(number);

    // Assert
    assertEquals(expected, actual);
  }

  @Test
  public void sumTwoNumbersInt32() {
    // Arrange
    int firstNumber = 160000;
    int secondNumber = 80000;
    long expected = firstNumber + secondNumber;

    // Act
    int actual = StaticIntMethods.sumTwoNumbersInt32(firstNumber, secondNumber);

    // Assert
    assertEquals(expected, actual);
  }

  @Test
  public void returnPrimeInt32() {
    // Arrange, act, assert
    assertEquals(65537, StaticIntMethods.returnPrimeInt32());
  }

  @Test
  public void returnNextNumberUint32() {
    // Arrange
    long number = 2000000000;
    long expected = 2000000001;

    // Act
    long actual = StaticIntMethods.returnNextNumberUint32(number);

    // Assert
    assertEquals(expected, actual);
  }

  @Test
  public void sumTwoNumbersUint32() {
    // Arrange
    long firstNumber = 2000000000;
    long secondNumber = 2000000001;
    long expected = firstNumber + secondNumber;

    // Act
    long actual = StaticIntMethods.sumTwoNumbersUint32(firstNumber, secondNumber);

    // Assert
    assertEquals(expected, actual);
  }

  @Test
  public void returnPrimeUint32() {
    // Arrange, act, assert
    assertEquals(2147483659L, StaticIntMethods.returnPrimeUint32());
  }

  @Test
  public void returnNextNumberInt64() {
    // Arrange
    long number = 5000000000L;
    long expected = 5000000001L;

    // Act
    long actual = StaticIntMethods.returnNextNumberInt64(number);

    // Assert
    assertEquals(expected, actual);
  }

  @Test
  public void sumTwoNumbersInt64() {
    // Arrange
    long firstNumber = 5000000000L;
    long secondNumber = 7000000000L;
    long expected = firstNumber + secondNumber;

    // Act
    long actual = StaticIntMethods.sumTwoNumbersInt64(firstNumber, secondNumber);

    // Assert
    assertEquals(expected, actual);
  }

  @Test
  public void returnPrimeInt64() {
    // Arrange, act, assert
    assertEquals(4294967311L, StaticIntMethods.returnPrimeInt64());
  }

  @Test
  public void returnNextNumberUint64() {
    // Arrange
    // TODO APIGEN-217: update this test with values above 2^63
    long number = 5000000000L;

    // Act
    long actual = StaticIntMethods.returnNextNumberUint64(number);

    // Assert
    assertEquals(5000000001L, actual);
  }

  @Test
  public void sumTwoNumbersUint64() {
    // Arrange
    // TODO APIGEN-217: update this test with values above 2^63
    long firstNumber = 5000000000L;
    long secondNumber = 7000000000L;

    // Act
    long actual = StaticIntMethods.sumTwoNumbersUint64(firstNumber, secondNumber);

    // Assert
    assertEquals(firstNumber + secondNumber, actual);
  }

  @Test
  public void returnPrimeUint64() {
    // Arrange, act, assert
    // TODO APIGEN-217: update this test with value above 2^63
    assertEquals(4294967311L, StaticIntMethods.returnPrimeUint64());
  }
}
