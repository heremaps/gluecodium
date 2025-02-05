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

import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue

import com.here.android.RobolectricApplication
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(application = RobolectricApplication::class)
class EnumsTest {
    @org.junit.Test
    fun flipEnumTC() {
        val errorEnum: InternalErrorTypeCollection = InternalErrorTypeCollection.ERROR_FATAL
        assertEquals(
            InternalErrorTypeCollection.ERROR_NONE,
            EnumsTypeCollectionMethods.flipEnumValue(errorEnum)
        )
    }

    @org.junit.Test
    fun flipEnum() {
        val errorEnum: Enums.InternalError = Enums.InternalError.ERROR_FATAL
        assertEquals(Enums.InternalError.ERROR_NONE, Enums.flipEnumValue(errorEnum))
    }

    @org.junit.Test
    fun extractEnumFromStruct() {
        val errorStruct = Enums.ErrorStruct()
        errorStruct.type = Enums.InternalError.ERROR_NONE
        assertEquals(Enums.InternalError.ERROR_FATAL, Enums.extractEnumFromStruct(errorStruct))
    }

    @org.junit.Test
    fun extractEnumFromStructTC() {
        val errorStruct: ErrorStructTypeCollection = ErrorStructTypeCollection()
        errorStruct.type = InternalErrorTypeCollection.ERROR_NONE
        assertEquals(
            InternalErrorTypeCollection.ERROR_FATAL,
            EnumsTypeCollectionMethods.extractEnumFromStruct(errorStruct)
        )
    }

    @org.junit.Test
    fun createStructWithEnumInside() {
        val message: String = "myMessage"
        val result: Enums.ErrorStruct =
            Enums.createStructWithEnumInside(Enums.InternalError.ERROR_FATAL, message)

        assertEquals(Enums.InternalError.ERROR_NONE, result.type)
        assertEquals(message, result.message)
    }

    @org.junit.Test
    fun createStructWithEnumInsideTC() {
        val message: String = "myMessage"
        val result: ErrorStructTypeCollection =
            EnumsTypeCollectionMethods.createStructWithEnumInside(
                InternalErrorTypeCollection.ERROR_FATAL, message
            )

        assertEquals(InternalErrorTypeCollection.ERROR_NONE, result.type)
        assertEquals(message, result.message)
    }

    @org.junit.Test
    fun compareAliasInJava() {
        assertEquals(EnumWithAlias.ONE, EnumWithAlias.FIRST)
    }

    @org.junit.Test
    fun compareDoubleAliasInJava() {
        assertEquals(EnumWithAlias.ONE, EnumWithAlias.THE_BEST)
    }

    @org.junit.Test
    fun compareAliasFromCpp() {
        val value: EnumWithAlias = UseEnumWithAlias.getFirst()

        assertEquals(EnumWithAlias.ONE, value)
    }

    @org.junit.Test
    fun compareAliasToTargetCpp() {
        val value: EnumWithAlias = EnumWithAlias.FIRST

        val result: Boolean = UseEnumWithAlias.compareToOne(value)

        assertTrue(result)
    }

    @org.junit.Test
    fun compareAliasToAliasCpp() {
        val value: EnumWithAlias = EnumWithAlias.FIRST

        val result: Boolean = UseEnumWithAlias.compareToFirst(value)

        assertTrue(result)
    }
}