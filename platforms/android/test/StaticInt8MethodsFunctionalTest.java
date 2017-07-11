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

import android.support.test.runner.AndroidJUnit4;

import com.here.android.test.StaticInt8MethodsTest;
import org.junit.Test;
import org.junit.runner.RunWith;

import static junit.framework.Assert.assertEquals;

@RunWith(AndroidJUnit4.class)
public class StaticInt8MethodsFunctionalTest {
  @Test
  public void returnInputNumber() {
    byte theByte = 115;
    byte actual = StaticInt8MethodsTest.returnNextNumber(theByte);
    byte expected = 116;
    assertEquals(expected, actual);
  }

  @Test
  public void sumTwoNumbers() {
    byte firstByte = 50;
    byte secondByte = 60;
    byte actual = StaticInt8MethodsTest.sumTwoNumbers(firstByte, secondByte);
    int expected = firstByte + secondByte;
    assertEquals(expected, actual);
  }

  @Test
  public void returnFirstPrime() {
    byte actual = StaticInt8MethodsTest.returnFirstPrime();
    byte expected = 2;
    assertEquals(expected, actual);
  }
}
