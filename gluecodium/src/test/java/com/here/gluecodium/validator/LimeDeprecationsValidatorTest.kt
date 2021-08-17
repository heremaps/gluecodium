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

import com.here.gluecodium.model.lime.LimeAttributeType.JAVA
import com.here.gluecodium.model.lime.LimeAttributeValueType.BUILDER
import com.here.gluecodium.model.lime.LimeAttributes
import com.here.gluecodium.model.lime.LimeContainer
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimePath.Companion.EMPTY_PATH
import io.mockk.mockk
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class LimeDeprecationsValidatorTest {
    private val allElements = mutableMapOf<String, LimeElement>()
    private val limeModel = LimeModel(allElements, emptyList())

    private val validator = LimeDeprecationsValidator(mockk(relaxed = true), werror = true)

    @Test
    fun validateContainerWithNoAttributes() {
        allElements[""] = object : LimeContainer(EMPTY_PATH) {}

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateContainerWithJavaBuilderAttribute() {
        val attributes = LimeAttributes.Builder().addAttribute(JAVA, BUILDER).build()
        allElements[""] = object : LimeContainer(EMPTY_PATH, attributes = attributes) {}

        assertFalse(validator.validate(limeModel))
    }
}
