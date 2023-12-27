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

package com.here.gluecodium.validator

import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeExternalDescriptor
import com.here.gluecodium.model.lime.LimeExternalDescriptor.Companion.CPP_TAG
import com.here.gluecodium.model.lime.LimeExternalDescriptor.Companion.GETTER_NAME_NAME
import com.here.gluecodium.model.lime.LimeExternalDescriptor.Companion.INCLUDE_NAME
import com.here.gluecodium.model.lime.LimeExternalDescriptor.Companion.NAME_NAME
import com.here.gluecodium.model.lime.LimeExternalDescriptor.Companion.SETTER_NAME_NAME
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimePath.Companion.EMPTY_PATH
import com.here.gluecodium.model.lime.LimeType
import io.mockk.mockk
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

@RunWith(Parameterized::class)
class LimeExternalTypesValidatorTest(private val valueName: String) {
    private val allElements = mutableMapOf<String, LimeElement>()
    private val limeModel = LimeModel(allElements, emptyList())

    private val validator = LimeExternalTypesValidator(mockk(relaxed = true))

    @Test
    fun validateAsExternalType() {
        allElements[""] =
            object : LimeType(
                EMPTY_PATH,
                external =
                    LimeExternalDescriptor.Builder()
                        .addValue(CPP_TAG, INCLUDE_NAME, "")
                        .addValue(CPP_TAG, valueName, "")
                        .build(),
            ) {}

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateInExternalType() {
        allElements[""] =
            object : LimeType(
                EMPTY_PATH,
                external = LimeExternalDescriptor.Builder().addValue(CPP_TAG, INCLUDE_NAME, "").build(),
            ) {}
        allElements["foo"] =
            object : LimeNamedElement(
                LimePath(emptyList(), listOf("foo")),
                external = LimeExternalDescriptor.Builder().addValue(CPP_TAG, valueName, "").build(),
            ) {}

        assertTrue(validator.validate(limeModel))
    }

    @Test
    fun validateWithoutExternalType() {
        allElements[""] = object : LimeType(EMPTY_PATH) {}
        allElements["foo"] =
            object : LimeNamedElement(
                LimePath(emptyList(), listOf("foo")),
                external = LimeExternalDescriptor.Builder().addValue(CPP_TAG, valueName, "").build(),
            ) {}

        assertFalse(validator.validate(limeModel))
    }

    companion object {
        @JvmStatic
        @Parameterized.Parameters
        fun testData() =
            listOf(
                arrayOf(NAME_NAME),
                arrayOf(GETTER_NAME_NAME),
                arrayOf(SETTER_NAME_NAME),
            )
    }
}
