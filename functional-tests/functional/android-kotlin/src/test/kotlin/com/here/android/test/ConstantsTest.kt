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
class ConstantsTest {
    val deltaFloat: Float = 0.00000000000001f
    val deltaDouble: Double = 0.00000000000001

    @org.junit.Test
    fun intConstantFromTypeCollection() {
        val result: Int = UseTypeCollectionConstants.getIntConstant()
        assertEquals(Constants.INT_CONSTANT, result)
    }

    @org.junit.Test
    fun uintConstantFromTypeCollection() {
        val result: Long = UseTypeCollectionConstants.getUintConstant()
        assertEquals(Constants.UINT_CONSTANT, result)
    }

    @org.junit.Test
    fun floatConstantFromTypeCollection() {
        val result: Float = UseTypeCollectionConstants.getFloatConstant()

        assertEquals(Constants.FLOAT_CONSTANT, result, deltaFloat)
    }

    @org.junit.Test
    fun doubleConstantFromTypeCollection() {
        val result: Double = UseTypeCollectionConstants.getDoubleConstant()
        assertEquals(Constants.DOUBLE_CONSTANT, result, deltaDouble)
    }

    @org.junit.Test
    fun stringConstantFromTypeCollection() {
        val result: String = UseTypeCollectionConstants.getStringConstant()
        assertEquals(Constants.STRING_CONSTANT, result)
    }

    @org.junit.Test
    fun enumConstantFromTypeCollection() {
        val result: Constants.StateEnum = UseTypeCollectionConstants.getEnumConstant()
        assertEquals(Constants.ENUM_CONSTANT, result)
    }

    @org.junit.Test
    fun intConstantFromInterface() {
        val result: Int = UseInterfaceConstants.getIntConstant()
        assertEquals(ConstantsInterface.INT_CONSTANT, result)
    }

    @org.junit.Test
    fun uintConstantFromInterface() {
        val result: Long = UseInterfaceConstants.getUintConstant()
        assertEquals(ConstantsInterface.UINT_CONSTANT, result)
    }

    @org.junit.Test
    fun floatConstantFromInterface() {
        val result: Float = UseInterfaceConstants.getFloatConstant()
        assertEquals(ConstantsInterface.FLOAT_CONSTANT, result, deltaFloat)
    }

    @org.junit.Test
    fun doubleConstantFromInterface() {
        val result: Double = UseInterfaceConstants.getDoubleConstant()
        assertEquals(ConstantsInterface.DOUBLE_CONSTANT, result, deltaDouble)
    }

    @org.junit.Test
    fun stringConstantFromInterface() {
        val result: String = UseInterfaceConstants.getStringConstant()
        assertEquals(ConstantsInterface.STRING_CONSTANT, result)
    }

    @org.junit.Test
    fun enumConstantFromInterface() {
        val result: ConstantsInterface.StateEnum = UseInterfaceConstants.getEnumConstant()
        assertEquals(ConstantsInterface.ENUM_CONSTANT, result)
    }

    @org.junit.Test
    fun compareStructConstants() {
        val result: StructConstants.SomeStruct = UseStructConstants.getStructConstant()
        assertEquals(StructConstants.STRUCT_CONSTANT, result)
    }

    @org.junit.Test
    fun compareNestingStructConstants() {
        val result: StructConstants.NestingStruct = UseStructConstants.getNestingStructConstant()
        assertEquals(StructConstants.NESTING_STRUCT_CONSTANT, result)
    }

    @org.junit.Test
    fun checkListConstant() {
        val result: List<String> = CollectionConstants.LIST_CONSTANT
        assertEquals(listOf("foo", "bar"), result)
    }

    @org.junit.Test
    fun checkSetConstant() {
        val result: Set<String> = CollectionConstants.SET_CONSTANT
        assertEquals(setOf("foo", "bar"), result)
    }

    @org.junit.Test
    fun checkMapConstant() {
        val result: Map<String, String> = CollectionConstants.MAP_CONSTANT
        assertEquals(mapOf("foo" to "bar"), result)
    }

    @org.junit.Test
    fun checkMixedConstant() {
        val result: MutableMap<MutableList<String>, MutableSet<String>> = CollectionConstants.MIXED_CONSTANT
        assertEquals(mapOf(listOf("foo") to setOf("bar")), result)
    }
}