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

import android.os.Build;
import android.support.compat.BuildConfig;

import com.here.android.RobolectricApplication;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import static junit.framework.Assert.assertEquals;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class, constants = BuildConfig.class)
public final class StaticIntMethodsTest {
    @Test
    public void returnNextNumberINT8() {
        // Arrange, act
        byte actual = StaticIntMethods.returnNextNumberINT8((byte) 115);

        // Assert
        assertEquals(116, actual);
    }

    @Test
    public void sumTwoNumbersINT8() {
        // Arrange
        byte firstByte = 50;
        byte secondByte = 60;

        // Act
        byte actual = StaticIntMethods.sumTwoNumbersINT8(firstByte, secondByte);

        // Assert
        assertEquals(firstByte + secondByte, actual);
    }

    @Test
    public void returnPrimeINT8() {
        // Arrange, act, assert
        assertEquals(2, StaticIntMethods.returnPrimeINT8());
    }

    @Test
    public void returnNextNumberUINT8() {
        // Arrange
        long number = 200;
        long expected = 201;

        // Act
        long actual = StaticIntMethods.returnNextNumberUINT8(number);

        // Assert
        assertEquals(expected, actual);
    }

    @Test
    public void sumTwoNumbersUINT8() {
        // Arrange
        long firstNumber = 160;
        long secondNumber = 80;
        long expected = firstNumber + secondNumber;

        // Act
        long actual = StaticIntMethods.sumTwoNumbersUINT8(firstNumber, secondNumber);

        // Assert
        assertEquals(expected, actual);
    }

    @Test
    public void returnPrimeUINT8() {
        // Arrange, act, assert
        assertEquals(131L, StaticIntMethods.returnPrimeUINT8());
    }

    @Test
    public void returnNextNumberINT16() {
        // Arrange
        short number = 2000;
        short expected = 2001;

        // Act
        short actual = StaticIntMethods.returnNextNumberINT16(number);

        // Assert
        assertEquals(expected, actual);
    }

    @Test
    public void sumTwoNumbersINT16() {
        // Arrange
        short firstNumber = 1600;
        short secondNumber = 800;
        long expected = firstNumber + secondNumber;

        // Act
        short actual = StaticIntMethods.sumTwoNumbersINT16(firstNumber, secondNumber);

        // Assert
        assertEquals(expected, actual);
    }

    @Test
    public void returnPrimeINT16() {
        // Arrange, act, assert
        assertEquals((short) 257, StaticIntMethods.returnPrimeINT16());
    }

    @Test
    public void returnNextNumberUINT16() {
        // Arrange
        long number = 40000;
        long expected = 40001;

        // Act
        long actual = StaticIntMethods.returnNextNumberUINT16(number);

        // Assert
        assertEquals(expected, actual);
    }

    @Test
    public void sumTwoNumbersUINT16() {
        // Arrange
        long firstNumber = 16000;
        long secondNumber = 8000;
        long expected = firstNumber + secondNumber;

        // Act
        long actual = StaticIntMethods.sumTwoNumbersUINT16(firstNumber, secondNumber);

        // Assert
        assertEquals(expected, actual);
    }

    @Test
    public void returnPrimeUINT16() {
        // Arrange, act, assert
        assertEquals(32771L, StaticIntMethods.returnPrimeUINT16());
    }

    @Test
    public void returnNextNumberINT32() {
        // Arrange
        int number = 80000;
        long expected = 80001;

        // Act
        long actual = StaticIntMethods.returnNextNumberINT32(number);

        // Assert
        assertEquals(expected, actual);
    }

    @Test
    public void sumTwoNumbersINT32() {
        // Arrange
        int firstNumber = 160000;
        int secondNumber = 80000;
        long expected = firstNumber + secondNumber;

        // Act
        int actual = StaticIntMethods.sumTwoNumbersINT32(firstNumber, secondNumber);

        // Assert
        assertEquals(expected, actual);
    }

    @Test
    public void returnPrimeINT32() {
        // Arrange, act, assert
        assertEquals(65537, StaticIntMethods.returnPrimeINT32());
    }

    @Test
    public void returnNextNumberUINT32() {
        // Arrange
        long number = 2000000000;
        long expected = 2000000001;

        // Act
        long actual = StaticIntMethods.returnNextNumberUINT32(number);

        // Assert
        assertEquals(expected, actual);
    }

    @Test
    public void sumTwoNumbersUINT32() {
        // Arrange
        long firstNumber = 2000000000;
        long secondNumber = 2000000001;
        long expected = firstNumber + secondNumber;

        // Act
        long actual = StaticIntMethods.sumTwoNumbersUINT32(firstNumber, secondNumber);

        // Assert
        assertEquals(expected, actual);
    }

    @Test
    public void returnPrimeUINT32() {
        // Arrange, act, assert
        assertEquals(2147483659L, StaticIntMethods.returnPrimeUINT32());
    }

    @Test
    public void returnNextNumberINT64() {
        // Arrange
        long number = 5000000000L;
        long expected = 5000000001L;

        // Act
        long actual = StaticIntMethods.returnNextNumberINT64(number);

        // Assert
        assertEquals(expected, actual);
    }

    @Test
    public void sumTwoNumbersINT64() {
        // Arrange
        long firstNumber = 5000000000L;
        long secondNumber = 7000000000L;
        long expected = firstNumber + secondNumber;

        // Act
        long actual = StaticIntMethods.sumTwoNumbersINT64(firstNumber, secondNumber);

        // Assert
        assertEquals(expected, actual);
    }

    @Test
    public void returnPrimeINT64() {
        // Arrange, act, assert
        assertEquals(4294967311L, StaticIntMethods.returnPrimeINT64());
    }

    @Test
    public void returnNextNumberUINT64() {
        // Arrange
        // TODO APIGEN-217: update this test whith values above 2^63
        long number = 5000000000L;

        // Act
        long actual = StaticIntMethods.returnNextNumberUINT64(number);

        // Assert
        assertEquals(5000000001L, actual);
    }

    @Test
    public void sumTwoNumbersUINT64() {
        // Arrange
        // TODO APIGEN-217: update this test whith values above 2^63
        long firstNumber = 5000000000L;
        long secondNumber = 7000000000L;

        // Act
        long actual = StaticIntMethods.sumTwoNumbersUINT64(firstNumber, secondNumber);

        // Assert
        assertEquals(firstNumber + secondNumber, actual);
    }

    @Test
    public void returnPrimeUINT64() {
        // Arrange, act, assert
        // TODO APIGEN-217: update this test whith value above 2^63
        assertEquals(4294967311L, StaticIntMethods.returnPrimeUINT64());
    }
}
