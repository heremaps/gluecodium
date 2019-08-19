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
import com.here.genium.model.lime.LimeDirectTypeRef
import com.here.genium.model.lime.LimeElement
import com.here.genium.model.lime.LimeField
import com.here.genium.model.lime.LimeModel
import com.here.genium.model.lime.LimePath.Companion.EMPTY_PATH
import io.mockk.mockk
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class LimeTypesContainerRefsValidatorTest {

    private val allElements = mutableMapOf<String, LimeElement>()
    private val limeModel = LimeModel(allElements, emptyList())

    private val validator = LimeTypesContainerRefsValidator(mockk(relaxed = true))

    @Test
    fun validateClassReference() {
        val limeClass = LimeContainer(EMPTY_PATH, type = LimeContainer.ContainerType.CLASS)
        allElements[""] = LimeField(EMPTY_PATH, typeRef = LimeDirectTypeRef(limeClass))

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateTypesReference() {
        val limeClass = LimeContainer(EMPTY_PATH, type = LimeContainer.ContainerType.TYPE_COLLECTION)
        allElements[""] = LimeField(EMPTY_PATH, typeRef = LimeDirectTypeRef(limeClass))

        assertFalse(validator.validate(limeModel))
    }
}
