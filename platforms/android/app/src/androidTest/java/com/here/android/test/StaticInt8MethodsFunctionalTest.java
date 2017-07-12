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

import android.support.test.filters.SmallTest;
import android.support.test.runner.AndroidJUnit4;

import org.junit.Test;
import org.junit.runner.RunWith;

import static junit.framework.Assert.assertEquals;

@RunWith(AndroidJUnit4.class)
@SmallTest
public final class StaticInt8MethodsFunctionalTest {
    @Test
    public void returnNextNumber() {
        // Arrange, act
        byte actual = StaticInt8MethodsTest.returnNextNumber((byte) 115);

        // Assert
        assertEquals(116, actual);
    }

    @Test
    public void sumTwoNumbers() {
        // Arrange
        byte firstByte = 50;
        byte secondByte = 60;

        // Act
        byte actual = StaticInt8MethodsTest.sumTwoNumbers(firstByte, secondByte);

        // Assert
        assertEquals(firstByte + secondByte, actual);
    }

    @Test
    public void returnFirstPrime() {
        // Arrange, act
        byte actual = StaticInt8MethodsTest.returnFirstPrime();

        // Assert
        assertEquals(2, actual);
    }
}
