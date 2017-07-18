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
public final class StaticIntMethodsFunctionalTest {
    @Test
    public void returnNextNumberINT8() {
        // Arrange, act
        byte actual = StaticIntMethodsTest.returnNextNumberINT8((byte) 115);

        // Assert
        assertEquals(116, actual);
    }

    @Test
    public void sumTwoNumbersINT18() {
        // Arrange
        byte firstByte = 50;
        byte secondByte = 60;

        // Act
        byte actual = StaticIntMethodsTest.sumTwoNumbersINT8(firstByte, secondByte);

        // Assert
        assertEquals(firstByte + secondByte, actual);
    }

    @Test
    public void returnPrimeINT8() {
        // Arrange, act
        byte actual = StaticIntMethodsTest.returnPrimeINT8();

        // Assert
        assertEquals(2, actual);
    }

    @Test
    public void returnNextNumberUINT8() {
        long number = 200;

        long actual = StaticIntMethodsTest.returnNextNumberUINT8(number);

        long expected = 201;
        assertEquals(expected, actual);
    }

    @Test
    public void sumTwoNumbersUINT8() {
        long firstNumber = 160;
        long secondNumber = 80;

        long actual = StaticIntMethodsTest.sumTwoNumbersUINT8(firstNumber, secondNumber);

        long expected = firstNumber + secondNumber;
        assertEquals(expected, actual);
    }

    @Test
    public void returnPrimeUINT8() {
        long actual = StaticIntMethodsTest.returnPrimeUINT8();

        long expected = 131;
        assertEquals(expected, actual);
    }

    @Test
    public void returnNextNumberINT16() {
        short number = 2000;
        short actual = StaticIntMethodsTest.returnNextNumberINT16(number);

        short expected = 2001;

        assertEquals(expected, actual);
    }

    @Test
    public void sumTwoNumbersINT16() {
        short firstNumber = 1600;
        short secondNumber = 800;

        short actual = StaticIntMethodsTest.sumTwoNumbersINT16(firstNumber, secondNumber);

        long expected = firstNumber + secondNumber;
        assertEquals(expected, actual);
    }

    @Test
    public void returnPrimeINT16() {
        short actual = StaticIntMethodsTest.returnPrimeINT16();

        short expected = 257;
        assertEquals(expected, actual);
    }

    @Test
    public void returnNextNumberUINT16() {
        long number = 40000;

        long actual = StaticIntMethodsTest.returnNextNumberUINT16(number);

        long expected = 40001;
        assertEquals(expected, actual);
    }

    @Test
    public void sumTwoNumbersUINT16() {
        long firstNumber = 16000;
        long secondNumber = 8000;

        long actual = StaticIntMethodsTest.sumTwoNumbersUINT16(firstNumber, secondNumber);

        long expected = firstNumber + secondNumber;
        assertEquals(expected, actual);
    }

    @Test
    public void returnPrimeUINT16() {
        long actual = StaticIntMethodsTest.returnPrimeUINT16();

        long expected = 32771;
        assertEquals(expected, actual);
    }

    @Test
    public void returnNextNumberINT32() {
        int number = 80000;

        long actual = StaticIntMethodsTest.returnNextNumberINT32(number);

        long expected = 80001;
        assertEquals(expected, actual);
    }

    @Test
    public void sumTwoNumbersINT32() {
        int firstNumber = 160000;
        int secondNumber = 80000;

        int actual = StaticIntMethodsTest.sumTwoNumbersINT32(firstNumber, secondNumber);

        long expected = firstNumber + secondNumber;
        assertEquals(expected, actual);
    }

    @Test
    public void returnPrimeINT32() {
        int actual = StaticIntMethodsTest.returnPrimeINT32();

        int expected = 65537;
        assertEquals(expected, actual);
    }

    @Test
    public void returnNextNumberUINT32() {
        long number = 2000000000;

        long actual = StaticIntMethodsTest.returnNextNumberUINT32(number);

        long expected = 2000000001;
        assertEquals(expected, actual);
    }

    @Test
    public void sumTwoNumbersUINT32() {
        long firstNumber = 2000000000;
        long secondNumber = 2000000001;

        long actual = StaticIntMethodsTest.sumTwoNumbersUINT32(firstNumber, secondNumber);

        long expected = firstNumber + secondNumber;
        assertEquals(expected, actual);
    }

    @Test
    public void returnPrimeUINT32() {
        long actual = StaticIntMethodsTest.returnPrimeUINT32();

        long expected = 2147483659L;

        assertEquals(expected, actual);
    }

    @Test
    public void returnNextNumberINT64() {
        long number = 5000000000L;

        long actual = StaticIntMethodsTest.returnNextNumberINT64(number);

        long expected = 5000000001L;
        assertEquals(expected, actual);
    }

    @Test
    public void sumTwoNumbersINT64() {
        long firstNumber = 5000000000L;
        long secondNumber = 7000000000L;

        long actual = StaticIntMethodsTest.sumTwoNumbersINT64(firstNumber, secondNumber);

        long expected = firstNumber + secondNumber;
        assertEquals(expected, actual);
    }

    @Test
    public void returnPrimeINT64() {
        long actual = StaticIntMethodsTest.returnPrimeINT64();

        long expected = 4294967311L;
        assertEquals(expected, actual);
    }

    @Test
    public void returnNextNumberUINT64() {
        // TODO APIGEN-217: update this test whith values above 2^63
        long number = 5000000000L;

        long actual = StaticIntMethodsTest.returnNextNumberUINT64(number);

        long expected = 5000000001L;
        assertEquals(expected, actual);
    }

    @Test
    public void sumTwoNumbersUINT64() {
        // TODO APIGEN-217: update this test whith values above 2^63
        long firstNumber = 5000000000L;
        long secondNumber = 7000000000L;

        long actual = StaticIntMethodsTest.sumTwoNumbersUINT64(firstNumber, secondNumber);

        long expected = firstNumber + secondNumber;
        assertEquals(expected, actual);
    }

    @Test
    public void returnPrimeUINT64() {
        // TODO APIGEN-217: update this test whith value above 2^63
        long actual = StaticIntMethodsTest.returnPrimeUINT64();
        long expected = 4294967311L;
        assertEquals(expected, actual);
    }
}
