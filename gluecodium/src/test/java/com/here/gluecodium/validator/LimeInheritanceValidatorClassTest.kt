/*
 * Copyright (C) 2016-2021 HERE Europe B.V.
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

import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLazyTypeRef
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimePath.Companion.EMPTY_PATH
import com.here.gluecodium.model.lime.LimeStruct
import io.mockk.mockk
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class LimeInheritanceValidatorClassTest {
    private val allElements = mutableMapOf<String, LimeElement>()
    private val limeModel = LimeModel(allElements, emptyList())

    private val fooPath = LimePath(emptyList(), listOf("foo"))
    private val barPath = LimePath(emptyList(), listOf("bar"))

    private val validator = LimeInheritanceValidator(mockk(relaxed = true))

    @Test
    fun validateWithClassWithNoParent() {
        allElements[""] = LimeClass(EMPTY_PATH)

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateClassWithInvalidParent() {
        val limeStruct = LimeStruct(fooPath)
        allElements[""] = LimeClass(EMPTY_PATH, parents = listOf(LimeDirectTypeRef(limeStruct)))

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateClassWithSelfParent() {
        allElements[""] = LimeClass(EMPTY_PATH, parents = listOf(LimeLazyTypeRef("", allElements)))

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateClassWithChildParent() {
        val childClass = LimeClass(fooPath, parents = listOf(LimeLazyTypeRef("", allElements)))
        allElements[""] = LimeClass(EMPTY_PATH, parents = listOf(LimeDirectTypeRef(childClass)))

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateClassWithClassParent() {
        val anotherClass = LimeClass(fooPath)
        allElements[""] = LimeClass(EMPTY_PATH, parents = listOf(LimeDirectTypeRef(anotherClass)))

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateClassWithOpenClassParent() {
        val anotherClass = LimeClass(fooPath, isOpen = true)
        allElements[""] = LimeClass(EMPTY_PATH, parents = listOf(LimeDirectTypeRef(anotherClass)))

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateClassWithInterfaceParent() {
        val anotherInterface = LimeInterface(fooPath)
        allElements[""] = LimeClass(EMPTY_PATH, parents = listOf(LimeDirectTypeRef(anotherInterface)))

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateClassWithTwoOpenClassParents() {
        val anotherClass = LimeClass(fooPath, isOpen = true)
        val yetAnotherClass = LimeClass(barPath, isOpen = true)
        allElements[""] =
            LimeClass(EMPTY_PATH, parents = listOf(LimeDirectTypeRef(anotherClass), LimeDirectTypeRef(yetAnotherClass)))

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateClassWithClassAndNarrowParents() {
        val anotherClass = LimeClass(fooPath, isOpen = true)
        val narrowInterface = LimeInterface(barPath, isNarrow = true)
        allElements[""] =
            LimeClass(
                EMPTY_PATH,
                parents = listOf(LimeDirectTypeRef(anotherClass), LimeDirectTypeRef(narrowInterface)),
            )

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateClassWithClassNarrowDiamondInheritance() {
        val grandparentInterface = LimeInterface(LimePath(emptyList(), listOf("baz")))
        val anotherClass = LimeClass(fooPath, parents = listOf(LimeDirectTypeRef(grandparentInterface)))
        val narrowInterface =
            LimeInterface(barPath, isNarrow = true, parents = listOf(LimeDirectTypeRef(grandparentInterface)))
        allElements[""] =
            LimeClass(
                EMPTY_PATH,
                parents = listOf(LimeDirectTypeRef(anotherClass), LimeDirectTypeRef(narrowInterface)),
            )

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateClassWithTwoInterfaceParents() {
        val anotherInterface = LimeInterface(fooPath)
        val yetAnotherInterface = LimeInterface(barPath)
        allElements[""] =
            LimeClass(
                EMPTY_PATH,
                parents = listOf(LimeDirectTypeRef(anotherInterface), LimeDirectTypeRef(yetAnotherInterface)),
            )

        assertFalse(validator.validate(limeModel))
    }

    @Test
    fun validateClassWithInterfaceAndNarrowParents() {
        val anotherInterface = LimeInterface(fooPath)
        val narrowInterface = LimeInterface(barPath, isNarrow = true)
        allElements[""] =
            LimeClass(
                EMPTY_PATH,
                parents = listOf(LimeDirectTypeRef(anotherInterface), LimeDirectTypeRef(narrowInterface)),
            )

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateClassWithInterfaceNarrowDiamondInheritance() {
        val grandparentInterface = LimeInterface(LimePath(emptyList(), listOf("baz")))
        val anotherInterface = LimeInterface(fooPath, parents = listOf(LimeDirectTypeRef(grandparentInterface)))
        val narrowInterface =
            LimeInterface(barPath, isNarrow = true, parents = listOf(LimeDirectTypeRef(grandparentInterface)))
        allElements[""] =
            LimeClass(
                EMPTY_PATH,
                parents = listOf(LimeDirectTypeRef(anotherInterface), LimeDirectTypeRef(narrowInterface)),
            )

        assertFalse(validator.validate(limeModel))
    }
}
