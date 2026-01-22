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
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

import com.here.android.external.AnotherExternalStruct
import com.here.android.external.ExternalEnum
import com.here.android.external.ExternalStruct
import java.time.Month

import android.os.Parcel
import android.os.Parcelable

@RunWith(RobolectricTestRunner::class)
@Config(application = RobolectricApplication::class)
class ExternalTypesTest {

    class MyKotlinClass : MyClass {
        override fun foo() = 77
    }

    @org.junit.Test
    fun useExternalTypes() {
        val externalStruct = ExternalStruct("foo", "bar", listOf(7, 11), AnotherExternalStruct(42))
        val inputStruct = UseExternalTypes.StructWithExternalTypes(externalStruct, ExternalEnum.BAR)
        val resultStruct = UseExternalTypes.extractExternalStruct(inputStruct)

        assertEquals("foo", resultStruct.stringField)
        assertEquals("bar", resultStruct.externalStringField)
        assertEquals(2, resultStruct.externalArrayField.size)
        assertEquals(7, resultStruct.externalArrayField[0])
        assertEquals(11, resultStruct.externalArrayField[1])
        assertEquals(42, resultStruct.externalStructField.intField)
    }

    @org.junit.Test
    fun useExternalTypesExternalEnum() {
        val externalStruct = ExternalStruct("foo", "bar", listOf(7, 11), AnotherExternalStruct(42))
        val inputStruct = UseExternalTypes.StructWithExternalTypes(externalStruct, ExternalEnum.BAR)
        val resultEnum = UseExternalTypes.extractExternalEnum(inputStruct)

        assertEquals(ExternalEnum.BAR, resultEnum)
    }

    @org.junit.Test
    fun useKotlinExternalStructCurrency() {
        val currency = java.util.Currency.getInstance("EUR")
        val result = UseKotlinExternalTypes.currencyRoundTrip(currency)

        assertEquals(currency.getCurrencyCode(), result.getCurrencyCode())
        assertEquals(currency.getNumericCode(), result.getNumericCode())
    }

    @org.junit.Test
    fun useKotlinExternalStructTimeZone() {
        val timeZone = java.util.SimpleTimeZone(2, "foobar")
        timeZone.rawOffset = 42

        val result = UseKotlinExternalTypes.timeZoneRoundTrip(timeZone)
        assertEquals(timeZone.rawOffset, result.rawOffset)
    }

    @org.junit.Test
    fun useKotlinExternalEnum() {
        val month = Month.of(2)
        val result = UseKotlinExternalTypes.monthRoundTrip(month)

        assertEquals(month, result)
    }

    @org.junit.Test
    fun useKotlinExternalColor() {
        val color = android.graphics.Color.argb(0, 0, 127, 255)
        val result = UseKotlinExternalTypes.colorRoundTrip(color)

        assertEquals(color, result)
    }

    @org.junit.Test
    fun useKotlinExternalSeason() {
        val season = "SPRING"
        val result = UseKotlinExternalTypes.seasonRoundTrip(season)

        assertEquals(season, result)
    }


    @org.junit.Test
    fun useKotlinExternalTypesInStruct() {
        val timeZone = java.util.SimpleTimeZone(2, "foobar")
        timeZone.setRawOffset(42)

        val struct = KotlinExternalTypesStruct(
            java.util.Currency.getInstance("EUR"),
            timeZone,
            Month.of(2),
            android.graphics.Color.argb(0, 0, 127, 255),
            "SPRING"
        )

        val result = UseKotlinExternalTypes.structRoundTrip(struct)

        assertEquals(struct.currency.getCurrencyCode(), result.currency.getCurrencyCode())
        assertEquals(struct.timeZone.getRawOffset(), result.timeZone.getRawOffset())
        assertEquals(struct.month, result.month)
        assertEquals(struct.color, result.color)
        assertEquals(struct.season, result.season)
    }

    @org.junit.Test
    fun useMyClass() {
        val result: Int = UseMyClass().callBar(MyKotlinClass())
        assertEquals(77, result)
    }

    @OptIn(com.here.android.lorem.ipsum.FunctionalTestsInternalAPI::class)
    @org.junit.Test
    fun createSomeSerializableExternalStruct() {
        val struct = ExternalMarkedAsSerializable(42)
        assertFalse(Parcelable::class.java.isInstance(struct))
    }

    @org.junit.Test
    fun createSomeSerializableExternalStructWithExternalSerializableField() {
        val externalStruct = AnExternalStruct(42)
        val mainStruct = SerializableStructWithExternalField(externalStruct)

        val parcel = Parcel.obtain()
        parcel.writeParcelable(mainStruct, 0)
        parcel.setDataPosition(0)

        val resultStruct: SerializableStructWithExternalField? = parcel.readParcelable(java.lang.Thread.currentThread().getContextClassLoader())

        assertNotNull(resultStruct)
        assertTrue(Parcelable::class.java.isInstance(mainStruct))
        assertEquals(42, resultStruct!!.someStruct.mData)
    }

    @org.junit.Test
    fun unboxVeryBoolean() {
        val veryBoolean = true
        val result = UseKotlinExternalTypes.veryBooleanUnbox(veryBoolean)

        assertEquals(true, result)
    }

    @org.junit.Test
    fun checkExternalConst() {
        val result = UseKotlinExternalConst.DEFAULT_TRUTH
        assertEquals(true, result)
    }
}