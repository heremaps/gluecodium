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

import com.here.genium.model.lime.LimeContainer
import com.here.genium.model.lime.LimeContainer.ContainerType.CLASS
import com.here.genium.model.lime.LimeContainer.ContainerType.INTERFACE
import com.here.genium.model.lime.LimeDirectTypeRef
import com.here.genium.model.lime.LimeElement
import com.here.genium.model.lime.LimeLazyTypeRef
import com.here.genium.model.lime.LimeModel
import com.here.genium.model.lime.LimePath
import com.here.genium.model.lime.LimePath.Companion.EMPTY_PATH
import com.here.genium.model.lime.LimeStruct
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4
import java.util.logging.Logger

@RunWith(JUnit4::class)
class LimeInheritanceValidatorTest {

    private val allElements = mutableMapOf<String, LimeElement>()
    private val limeModel = LimeModel(allElements, emptyList())

    private val fooPath = LimePath(emptyList(), listOf("foo"))

    private val dummyLogger = object : Logger(null, null) { override fun severe(msg: String?) {} }
    private val validator = LimeInheritanceValidator(dummyLogger)

    @Test
    fun validateWithTypeCollection() {
        allElements[""] =
            LimeContainer(EMPTY_PATH, type = LimeContainer.ContainerType.TYPE_COLLECTION)

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateWithClassWithNoParent() {
        allElements[""] = LimeContainer(EMPTY_PATH, type = CLASS)

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateClassWithInvalidParent() {
        val limeStruct = LimeStruct(fooPath)
        allElements[""] =
            LimeContainer(EMPTY_PATH, type = CLASS, parent = LimeDirectTypeRef(limeStruct))

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateClassWithSelfParent() {
        allElements[""] =
            LimeContainer(EMPTY_PATH, type = CLASS, parent = LimeLazyTypeRef("", allElements))

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateClassWithChildParent() {
        val childClass =
            LimeContainer(fooPath, type = CLASS, parent = LimeLazyTypeRef("", allElements))
        allElements[""] =
            LimeContainer(EMPTY_PATH, type = CLASS, parent = LimeDirectTypeRef(childClass))

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateClassWithClassParent() {
        val anotherClass = LimeContainer(fooPath, type = CLASS)
        allElements[""] =
            LimeContainer(EMPTY_PATH, type = CLASS, parent = LimeDirectTypeRef(anotherClass))

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateClassWithInterfaceParent() {
        val anotherInterface = LimeContainer(fooPath, type = INTERFACE)
        allElements[""] =
            LimeContainer(EMPTY_PATH, type = CLASS, parent = LimeDirectTypeRef(anotherInterface))

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateInterfaceWithNoParent() {
        allElements[""] = LimeContainer(EMPTY_PATH, type = INTERFACE)

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateInterfaceWithInvalidParent() {
        val limeStruct = LimeStruct(fooPath)
        allElements[""] =
            LimeContainer(EMPTY_PATH, type = INTERFACE, parent = LimeDirectTypeRef(limeStruct))

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateInterfaceWithSelfParent() {
        allElements[""] =
            LimeContainer(EMPTY_PATH, type = INTERFACE, parent = LimeLazyTypeRef("", allElements))

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateInterfaceWithChildParent() {
        val childInterface =
            LimeContainer(fooPath, type = INTERFACE, parent = LimeLazyTypeRef("", allElements))
        allElements[""] =
            LimeContainer(EMPTY_PATH, type = INTERFACE, parent = LimeDirectTypeRef(childInterface))

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateInterfaceWithClassParent() {
        val anotherClass = LimeContainer(fooPath, type = CLASS)
        allElements[""] =
            LimeContainer(EMPTY_PATH, type = INTERFACE, parent = LimeDirectTypeRef(anotherClass))

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateInterfaceWithInterfaceParent() {
        val anotherInterface = LimeContainer(fooPath, type = INTERFACE)
        allElements[""] = LimeContainer(
            EMPTY_PATH,
            type = INTERFACE,
            parent = LimeDirectTypeRef(anotherInterface)
        )

        assertTrue(validator.validate(limeModel))
    }
}
