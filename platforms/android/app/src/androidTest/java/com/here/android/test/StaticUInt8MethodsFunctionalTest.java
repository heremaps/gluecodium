/*
 * Copyright (C) 2017 HERE Global B.V. and its affiliate(s). All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 */

package com.here.android.test;

import android.support.test.runner.AndroidJUnit4;

import com.here.android.test.StaticUInt8MethodsTest;
import org.junit.Test;
import org.junit.runner.RunWith;

import static junit.framework.Assert.assertEquals;

@RunWith(AndroidJUnit4.class)
public class StaticUInt8MethodsFunctionalTest {
  @Test
  public void returnInputNumber() {
    long number = 200;
    long actual = StaticUInt8MethodsTest.returnNextNumber(number);
    long expected = 201;
    assertEquals(expected, actual);
  }

  @Test
  public void sumTwoNumbers() {
    long firstNumber = 160;
    long secondNumber = 80;
    long actual = StaticUInt8MethodsTest.sumTwoNumbers(firstNumber, secondNumber);
    long expected = firstNumber + secondNumber;
    assertEquals(expected, actual);
  }

  @Test
  public void returnPrime() {
    long actual = StaticUInt8MethodsTest.returnPrime();
    long expected = 131;
    assertEquals(expected, actual);
  }
}
