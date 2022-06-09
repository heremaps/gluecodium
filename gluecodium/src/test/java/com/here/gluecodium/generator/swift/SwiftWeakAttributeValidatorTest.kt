/*
 * Copyright (C) 2016-2020 HERE Europe B.V.
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

package com.here.gluecodium.generator.swift

import com.here.gluecodium.model.lime.LimeAttributeType.SWIFT
import com.here.gluecodium.model.lime.LimeAttributeValueType.WEAK
import com.here.gluecodium.model.lime.LimeAttributes
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeBasicTypeRef
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimePath.Companion.EMPTY_PATH
import com.here.gluecodium.model.lime.LimeProperty
import com.here.gluecodium.model.lime.LimeReturnType
import io.mockk.MockKAnnotations
import io.mockk.mockk
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class SwiftWeakAttributeValidatorTest {

    private val barPath = LimePath(emptyList(), listOf("Bar"))
    private val fooPath = barPath.child("foo")
    private val nullableBool = LimeBasicTypeRef(LimeBasicType.TypeId.BOOLEAN, isNullable = true)
    private val dummyFunction = LimeFunction(EMPTY_PATH)
    private val weakAttributes = LimeAttributes.Builder().addAttribute(SWIFT, WEAK).build()

    private val limeReferenceMap = mutableMapOf<String, LimeElement>()

    private lateinit var validator: SwiftWeakAttributeValidator

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)
        validator = SwiftWeakAttributeValidator(mockk(relaxed = true))
    }

    @Test
    fun validatePropertyWithNoAttribute() {
        val limeProperty = LimeProperty(EMPTY_PATH, typeRef = LimeBasicTypeRef.DOUBLE, getter = dummyFunction)

        assertTrue(validator.validate(listOf(limeProperty)))
    }

    @Test
    fun validatePropertyInClass() {
        val limeProperty = LimeProperty(
            fooPath,
            typeRef = nullableBool,
            getter = dummyFunction,
            attributes = weakAttributes
        )
        limeReferenceMap[barPath.toString()] = LimeClass(barPath)

        assertTrue(validator.validate(listOf(limeProperty)))
    }

    @Test
    fun validatePropertyNonNullable() {
        val limeProperty = LimeProperty(
            fooPath,
            typeRef = LimeBasicTypeRef.DOUBLE,
            getter = dummyFunction,
            attributes = weakAttributes
        )
        limeReferenceMap[barPath.toString()] = LimeInterface(barPath)

        assertFalse(validator.validate(listOf(limeProperty)))
    }

    @Test
    fun validatePropertyValidNonInterface() {
        val limeProperty = LimeProperty(
            fooPath,
            typeRef = nullableBool,
            getter = dummyFunction,
            attributes = weakAttributes
        )
        limeReferenceMap[barPath.toString()] = LimeInterface(barPath)

        assertTrue(validator.validate(listOf(limeProperty)))
    }

    @Test
    fun validatePropertyInvalidInterfaceVoid() {
        val limeInterface = LimeInterface(EMPTY_PATH, functions = listOf(LimeFunction(EMPTY_PATH)))
        val limeProperty = LimeProperty(
            fooPath,
            typeRef = LimeDirectTypeRef(limeInterface, isNullable = true),
            getter = dummyFunction,
            attributes = weakAttributes
        )
        limeReferenceMap[barPath.toString()] = LimeInterface(barPath)

        assertFalse(validator.validate(listOf(limeProperty)))
    }

    @Test
    fun validatePropertyValidInterfaceVoid() {
        val limeInterface =
            LimeInterface(EMPTY_PATH, functions = listOf(LimeFunction(EMPTY_PATH)), attributes = weakAttributes)
        val limeProperty = LimeProperty(
            fooPath,
            typeRef = LimeDirectTypeRef(limeInterface, isNullable = true),
            getter = dummyFunction,
            attributes = weakAttributes
        )
        limeReferenceMap[barPath.toString()] = LimeInterface(barPath)

        assertTrue(validator.validate(listOf(limeProperty)))
    }

    @Test
    fun validatePropertyValidInterfaceNullable() {
        val limeFunction = LimeFunction(EMPTY_PATH, returnType = LimeReturnType(nullableBool))
        val limeInterface = LimeInterface(EMPTY_PATH, functions = listOf(limeFunction), attributes = weakAttributes)
        val limeProperty = LimeProperty(
            fooPath,
            typeRef = LimeDirectTypeRef(limeInterface, isNullable = true),
            getter = dummyFunction,
            attributes = weakAttributes
        )
        limeReferenceMap[barPath.toString()] = LimeInterface(barPath)

        assertTrue(validator.validate(listOf(limeProperty)))
    }

    @Test
    fun validatePropertyInvalidInterface() {
        val limeFunction =
            LimeFunction(EMPTY_PATH, returnType = LimeReturnType(LimeBasicTypeRef(LimeBasicType.TypeId.BOOLEAN)))
        val limeInterface = LimeInterface(EMPTY_PATH, functions = listOf(limeFunction), attributes = weakAttributes)
        val limeProperty = LimeProperty(
            fooPath,
            typeRef = LimeDirectTypeRef(limeInterface, isNullable = true),
            getter = dummyFunction,
            attributes = weakAttributes
        )
        limeReferenceMap[barPath.toString()] = LimeInterface(barPath)

        assertFalse(validator.validate(listOf(limeProperty)))
    }

    @Test
    fun validateInterfaceVoid() {
        val limeInterface =
            LimeInterface(EMPTY_PATH, functions = listOf(LimeFunction(EMPTY_PATH)), attributes = weakAttributes)

        assertTrue(validator.validate(listOf(limeInterface)))
    }

    @Test
    fun validateInterfaceNullable() {
        val limeFunction = LimeFunction(EMPTY_PATH, returnType = LimeReturnType(nullableBool))
        val limeInterface = LimeInterface(EMPTY_PATH, functions = listOf(limeFunction), attributes = weakAttributes)

        assertTrue(validator.validate(listOf(limeInterface)))
    }

    @Test
    fun validateInvalidInterface() {
        val limeFunction =
            LimeFunction(EMPTY_PATH, returnType = LimeReturnType(LimeBasicTypeRef(LimeBasicType.TypeId.BOOLEAN)))
        val limeInterface = LimeInterface(EMPTY_PATH, functions = listOf(limeFunction), attributes = weakAttributes)

        assertFalse(validator.validate(listOf(limeInterface)))
    }

    @Test
    fun validateInterfaceNoWeak() {
        val limeFunction =
            LimeFunction(EMPTY_PATH, returnType = LimeReturnType(LimeBasicTypeRef(LimeBasicType.TypeId.BOOLEAN)))
        val limeInterface = LimeInterface(EMPTY_PATH, functions = listOf(limeFunction))

        assertTrue(validator.validate(listOf(limeInterface)))
    }
}
