/*
 * Copyright (C) 2016-2025 HERE Europe B.V.
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
package com.here.android.test

import com.here.android.RobolectricApplication
import org.junit.Assert.assertEquals
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(application = RobolectricApplication::class)
class StaticIntMethodsTest {
    @org.junit.Test
    fun returnNextNumberInt8() {
        // Arrange, act
        val actual: Byte = StaticIntMethods.returnNextNumberInt8(115.toByte())

        // Assert
        assertEquals(116, actual.toInt())
    }

    @org.junit.Test
    fun sumTwoNumbersInt8() {
        // Arrange
        val firstByte: Byte = 50
        val secondByte: Byte = 60

        // Act
        val actual: Byte = StaticIntMethods.sumTwoNumbersInt8(firstByte, secondByte)

        // Assert
        assertEquals(firstByte + secondByte, actual.toInt())
    }

    @org.junit.Test
    fun returnPrimeInt8() {
        // Arrange, act, assert
        assertEquals(2.toByte(), StaticIntMethods.returnPrimeInt8())
    }

    @org.junit.Test
    fun returnNextNumberUint8() {
        // Arrange
        val number: Short = 200
        val expected: Short = 201

        // Act
        val actual: Short = StaticIntMethods.returnNextNumberUint8(number)

        // Assert
        assertEquals(expected, actual)
    }

    @org.junit.Test
    fun sumTwoNumbersUint8() {
        // Arrange
        val firstNumber: Short = 160
        val secondNumber: Short = 80
        val expected: Short = (firstNumber + secondNumber).toShort()

        // Act
        val actual: Short = StaticIntMethods.sumTwoNumbersUint8(firstNumber, secondNumber)

        // Assert
        assertEquals(expected, actual)
    }

    @org.junit.Test
    fun returnPrimeUint8() {
        // Arrange, act, assert
        assertEquals(131.toShort(), StaticIntMethods.returnPrimeUint8())
    }

    @org.junit.Test
    fun returnNextNumberInt16() {
        // Arrange
        val number: Short = 2000
        val expected: Short = 2001

        // Act
        val actual: Short = StaticIntMethods.returnNextNumberInt16(number)

        // Assert
        assertEquals(expected, actual)
    }

    @org.junit.Test
    fun sumTwoNumbersInt16() {
        // Arrange
        val firstNumber: Short = 1600
        val secondNumber: Short = 800
        val expected: Long = (firstNumber + secondNumber).toLong()

        // Act
        val actual: Short = StaticIntMethods.sumTwoNumbersInt16(firstNumber, secondNumber)

        // Assert
        assertEquals(expected, actual.toLong())
    }

    @org.junit.Test
    fun returnPrimeInt16() {
        // Arrange, act, assert
        assertEquals(257.toShort(), StaticIntMethods.returnPrimeInt16())
    }

    @org.junit.Test
    fun returnNextNumberUint16() {
        // Arrange
        val number: Int = 40000
        val expected: Int = 40001

        // Act
        val actual: Int = StaticIntMethods.returnNextNumberUint16(number)

        // Assert
        assertEquals(expected, actual)
    }

    @org.junit.Test
    fun sumTwoNumbersUint16() {
        // Arrange
        val firstNumber: Int = 16000
        val secondNumber: Int = 8000
        val expected: Int = firstNumber + secondNumber

        // Act
        val actual: Int = StaticIntMethods.sumTwoNumbersUint16(firstNumber, secondNumber)

        // Assert
        assertEquals(expected, actual)
    }

    @org.junit.Test
    fun returnPrimeUint16() {
        // Arrange, act, assert
        assertEquals(32771, StaticIntMethods.returnPrimeUint16())
    }

    @org.junit.Test
    fun returnNextNumberInt32() {
        // Arrange
        val number: Int = 80000
        val expected: Int = 80001

        // Act
        val actual: Int = StaticIntMethods.returnNextNumberInt32(number)

        // Assert
        assertEquals(expected, actual)
    }

    @org.junit.Test
    fun sumTwoNumbersInt32() {
        // Arrange
        val firstNumber: Int = 160000
        val secondNumber: Int = 80000
        val expected: Long = (firstNumber + secondNumber).toLong()

        // Act
        val actual: Int = StaticIntMethods.sumTwoNumbersInt32(firstNumber, secondNumber)

        // Assert
        assertEquals(expected, actual.toLong())
    }

    @org.junit.Test
    fun returnPrimeInt32() {
        // Arrange, act, assert
        assertEquals(65537, StaticIntMethods.returnPrimeInt32())
    }

    @org.junit.Test
    fun returnNextNumberUint32() {
        // Arrange
        val number: Long = 2000000000
        val expected: Long = 2000000001

        // Act
        val actual: Long = StaticIntMethods.returnNextNumberUint32(number)

        // Assert
        assertEquals(expected, actual)
    }

    @org.junit.Test
    fun sumTwoNumbersUint32() {
        // Arrange
        val firstNumber: Long = 2000000000
        val secondNumber: Long = 2000000001
        val expected: Long = firstNumber + secondNumber

        // Act
        val actual: Long = StaticIntMethods.sumTwoNumbersUint32(firstNumber, secondNumber)

        // Assert
        assertEquals(expected, actual)
    }

    @org.junit.Test
    fun returnPrimeUint32() {
        // Arrange, act, assert
        assertEquals(2147483659L, StaticIntMethods.returnPrimeUint32())
    }

    @org.junit.Test
    fun returnNextNumberInt64() {
        // Arrange
        val number: Long = 5000000000L
        val expected: Long = 5000000001L

        // Act
        val actual: Long = StaticIntMethods.returnNextNumberInt64(number)

        // Assert
        assertEquals(expected, actual)
    }

    @org.junit.Test
    fun sumTwoNumbersInt64() {
        // Arrange
        val firstNumber: Long = 5000000000L
        val secondNumber: Long = 7000000000L
        val expected: Long = firstNumber + secondNumber

        // Act
        val actual: Long = StaticIntMethods.sumTwoNumbersInt64(firstNumber, secondNumber)

        // Assert
        assertEquals(expected, actual)
    }

    @org.junit.Test
    fun returnPrimeInt64() {
        // Arrange, act, assert
        assertEquals(4294967311L, StaticIntMethods.returnPrimeInt64())
    }

    @org.junit.Test
    fun returnNextNumberUint64() {
        // Arrange
        val number: Long = 5000000000L

        // Act
        val actual: Long = StaticIntMethods.returnNextNumberUint64(number)

        // Assert
        assertEquals(5000000001L, actual)
    }

    @org.junit.Test
    fun sumTwoNumbersUint64() {
        // Arrange
        val firstNumber: Long = 5000000000L
        val secondNumber: Long = 7000000000L

        // Act
        val actual: Long = StaticIntMethods.sumTwoNumbersUint64(firstNumber, secondNumber)

        // Assert
        assertEquals(firstNumber + secondNumber, actual)
    }

    @org.junit.Test
    fun returnPrimeUint64() {
        // Arrange, act, assert
        assertEquals(4294967311L, StaticIntMethods.returnPrimeUint64())
    }
}