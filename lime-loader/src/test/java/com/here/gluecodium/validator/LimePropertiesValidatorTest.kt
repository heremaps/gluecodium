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

package com.here.gluecodium.validator

import com.here.gluecodium.model.lime.LimeBasicTypeRef
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimePath.Companion.EMPTY_PATH
import com.here.gluecodium.model.lime.LimeProperty
import io.mockk.mockk
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class LimePropertiesValidatorTest {

    private val allElements = mutableMapOf<String, LimeElement>()
    private val limeModel = LimeModel(allElements, emptyList())
    private val limeGetter = LimeFunction(EMPTY_PATH)
    private val limePropertyFoo = LimeProperty(
        LimePath(emptyList(), listOf("foo")),
        typeRef = LimeBasicTypeRef.INT,
        getter = limeGetter
    )
    private val limePropertyBar = LimeProperty(
        LimePath(emptyList(), listOf("bar")),
        typeRef = LimeBasicTypeRef.INT,
        getter = limeGetter
    )
    private val limePropertyFoo2 = LimeProperty(
        LimePath(listOf("baz"), listOf("foo")),
        typeRef = LimeBasicTypeRef.INT,
        getter = limeGetter
    )
    private val limeContainerDoubleFoo = object : LimeContainerWithInheritance(
        EMPTY_PATH,
        properties = listOf(limePropertyFoo, limePropertyFoo2)
    ) {}

    private val validator = LimePropertiesValidator(mockk(relaxed = true))

    @Test
    fun validateNoProperties() {
        allElements[""] = object : LimeContainerWithInheritance(EMPTY_PATH) {}

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validatePropertiesNoNameClash() {
        allElements[""] = object : LimeContainerWithInheritance(
            EMPTY_PATH,
            properties = listOf(limePropertyFoo, limePropertyBar)
        ) {}

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validatePropertiesWithNameClash() {
        allElements[""] = limeContainerDoubleFoo

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateInheritanceNoOwnProperties() {
        allElements[""] = object : LimeContainerWithInheritance(
            EMPTY_PATH,
            parent = LimeDirectTypeRef(limeContainerDoubleFoo)
        ) {}

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validatePropertiesInheritanceNoNameClash() {
        allElements[""] = object : LimeContainerWithInheritance(
            EMPTY_PATH,
            parent = LimeDirectTypeRef(limeContainerDoubleFoo),
            properties = listOf(limePropertyBar)
        ) {}

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validatePropertiesInheritanceWithNameClash() {
        allElements[""] = object : LimeContainerWithInheritance(
            EMPTY_PATH,
            parent = LimeDirectTypeRef(limeContainerDoubleFoo),
            properties = listOf(limePropertyFoo)
        ) {}

        assertFalse(validator.validate(limeModel))
    }
}
