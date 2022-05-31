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

package com.here.gluecodium.generator.cpp

import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeAttributes
import com.here.gluecodium.model.lime.LimeBasicTypeRef
import com.here.gluecodium.model.lime.LimeConstant
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeFieldConstructor
import com.here.gluecodium.model.lime.LimeLazyTypeRef
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimePath.Companion.EMPTY_PATH
import com.here.gluecodium.model.lime.LimeValue
import io.mockk.mockk
import org.junit.Assert.assertEquals
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

@RunWith(Parameterized::class)
class CppSkipAttributesValidatorTest(private val limeElement: LimeNamedElement, private val expectedResult: Boolean) {

    private val allElements = mutableMapOf<String, LimeElement>()
    private val limeModel = LimeModel(allElements, emptyList())

    private val validator = CppSkipAttributesValidator(mockk(relaxed = true))

    @Test
    fun validateWithElement() {
        allElements[""] = limeElement

        assertEquals(expectedResult, validator.validate(limeModel))
    }

    companion object {
        private val cppSkipAttributes =
            LimeAttributes.Builder().addAttribute(LimeAttributeType.CPP, LimeAttributeValueType.SKIP).build()

        @JvmStatic
        @Parameterized.Parameters
        fun testData() = listOf(
            arrayOf(
                LimeFieldConstructor(
                    EMPTY_PATH,
                    structRef = LimeLazyTypeRef("", emptyMap()),
                    attributes = cppSkipAttributes
                ),
                true
            ),
            arrayOf(
                LimeConstant(
                    EMPTY_PATH,
                    typeRef = LimeBasicTypeRef.INT,
                    value = LimeValue.ZERO,
                    attributes = cppSkipAttributes
                ),
                true
            ),
            arrayOf(object : LimeNamedElement(EMPTY_PATH) {}, true),
            arrayOf(object : LimeNamedElement(EMPTY_PATH, attributes = cppSkipAttributes) {}, false),
        )
    }
}
