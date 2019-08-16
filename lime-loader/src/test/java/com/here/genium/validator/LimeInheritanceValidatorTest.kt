/*
 * Copyright (C) 2016-2019 HERE Europe B.V.
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

package com.here.genium.validator

import com.here.genium.model.lime.LimeClass
import com.here.genium.model.lime.LimeDirectTypeRef
import com.here.genium.model.lime.LimeElement
import com.here.genium.model.lime.LimeInterface
import com.here.genium.model.lime.LimeLazyTypeRef
import com.here.genium.model.lime.LimeModel
import com.here.genium.model.lime.LimePath
import com.here.genium.model.lime.LimePath.Companion.EMPTY_PATH
import com.here.genium.model.lime.LimeStruct
import com.here.genium.model.lime.LimeTypesCollection
import io.mockk.mockk
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class LimeInheritanceValidatorTest {

    private val allElements = mutableMapOf<String, LimeElement>()
    private val limeModel = LimeModel(allElements, emptyList())

    private val fooPath = LimePath(emptyList(), listOf("foo"))

    private val validator = LimeInheritanceValidator(mockk(relaxed = true))

    @Test
    fun validateWithTypeCollection() {
        allElements[""] = LimeTypesCollection(EMPTY_PATH)

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateWithClassWithNoParent() {
        allElements[""] = LimeClass(EMPTY_PATH)

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateClassWithInvalidParent() {
        val limeStruct = LimeStruct(fooPath)
        allElements[""] = LimeClass(EMPTY_PATH, parent = LimeDirectTypeRef(limeStruct))

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateClassWithSelfParent() {
        allElements[""] = LimeClass(EMPTY_PATH, parent = LimeLazyTypeRef("", allElements))

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateClassWithChildParent() {
        val childClass = LimeClass(fooPath, parent = LimeLazyTypeRef("", allElements))
        allElements[""] = LimeClass(EMPTY_PATH, parent = LimeDirectTypeRef(childClass))

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateClassWithClassParent() {
        val anotherClass = LimeClass(fooPath)
        allElements[""] = LimeClass(EMPTY_PATH, parent = LimeDirectTypeRef(anotherClass))

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateClassWithInterfaceParent() {
        val anotherInterface = LimeInterface(fooPath)
        allElements[""] = LimeClass(EMPTY_PATH, parent = LimeDirectTypeRef(anotherInterface))

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateInterfaceWithNoParent() {
        allElements[""] = LimeInterface(EMPTY_PATH)

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateInterfaceWithInvalidParent() {
        val limeStruct = LimeStruct(fooPath)
        allElements[""] = LimeInterface(EMPTY_PATH, parent = LimeDirectTypeRef(limeStruct))

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateInterfaceWithSelfParent() {
        allElements[""] = LimeInterface(EMPTY_PATH, parent = LimeLazyTypeRef("", allElements))

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateInterfaceWithChildParent() {
        val childInterface = LimeInterface(fooPath, parent = LimeLazyTypeRef("", allElements))
        allElements[""] = LimeInterface(EMPTY_PATH, parent = LimeDirectTypeRef(childInterface))

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateInterfaceWithClassParent() {
        val anotherClass = LimeClass(fooPath)
        allElements[""] = LimeInterface(EMPTY_PATH, parent = LimeDirectTypeRef(anotherClass))

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateInterfaceWithInterfaceParent() {
        val anotherInterface = LimeInterface(fooPath)
        allElements[""] = LimeInterface(EMPTY_PATH, parent = LimeDirectTypeRef(anotherInterface))

        assertTrue(validator.validate(limeModel))
    }
}
