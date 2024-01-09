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

import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeBasicTypeRef
import com.here.gluecodium.model.lime.LimeConstant
import com.here.gluecodium.model.lime.LimeConstantRef
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeGenericType
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimePath.Companion.EMPTY_PATH
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeRef
import com.here.gluecodium.model.lime.LimeValue
import io.mockk.mockk
import org.junit.Assert.assertEquals
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

@RunWith(Parameterized::class)
class LimeValuesValidatorTest(
    private val limeTypeRef: LimeTypeRef,
    private val limeValue: LimeValue,
    private val expectedResult: Boolean,
) {
    private val allElements = mutableMapOf<String, LimeElement>()
    private val limeModel = LimeModel(allElements, emptyList())

    private val validator = LimeValuesValidator(mockk(relaxed = true))

    @Test
    fun validateWithField() {
        allElements[""] = LimeField(EMPTY_PATH, typeRef = limeTypeRef, defaultValue = limeValue)

        assertEquals(validator.validate(limeModel), expectedResult)
    }

    @Test
    fun validateWithConstant() {
        allElements[""] = LimeConstant(EMPTY_PATH, typeRef = limeTypeRef, value = limeValue)

        assertEquals(validator.validate(limeModel), expectedResult)
    }

    companion object {
        private val fooTypeRef = LimeDirectTypeRef(object : LimeType(EMPTY_PATH) {})
        private val fooType = object : LimeType(LimePath(emptyList(), listOf("foo"))) {}

        @JvmStatic
        @Parameterized.Parameters
        fun testData() =
            listOf(
                arrayOf(LimeBasicTypeRef.INT, LimeValue.Literal(fooTypeRef, ""), true),
                arrayOf(LimeBasicTypeRef.FLOAT, LimeValue.Literal(fooTypeRef, ""), true),
                arrayOf(LimeBasicTypeRef(LimeBasicType.TypeId.BOOLEAN), LimeValue.Literal(fooTypeRef, ""), true),
                arrayOf(LimeBasicTypeRef(LimeBasicType.TypeId.STRING), LimeValue.Literal(fooTypeRef, ""), true),
                arrayOf(
                    LimeBasicTypeRef(LimeBasicType.TypeId.DATE),
                    LimeValue.Literal(fooTypeRef, "2022-02-04T09:15:17Z"),
                    true,
                ),
                arrayOf(LimeBasicTypeRef(LimeBasicType.TypeId.DATE), LimeValue.Literal(fooTypeRef, "bar"), false),
                arrayOf(LimeBasicTypeRef(LimeBasicType.TypeId.LOCALE), LimeValue.Literal(fooTypeRef, "en-US"), true),
                arrayOf(LimeBasicTypeRef(LimeBasicType.TypeId.LOCALE), LimeValue.Literal(fooTypeRef, "und"), true),
                arrayOf(LimeBasicTypeRef(LimeBasicType.TypeId.LOCALE), LimeValue.Literal(fooTypeRef, "42"), false),
                arrayOf(LimeBasicTypeRef(LimeBasicType.TypeId.BLOB), LimeValue.Literal(fooTypeRef, ""), false),
                arrayOf(fooTypeRef, LimeValue.Literal(fooTypeRef, ""), false),
                arrayOf(
                    LimeDirectTypeRef(fooType),
                    LimeValue.Constant(
                        fooTypeRef,
                        object : LimeConstantRef() {
                            override val element = object : LimeNamedElement(EMPTY_PATH) {}
                            override val typeRef = LimeDirectTypeRef(fooType)
                        },
                    ),
                    true,
                ),
                arrayOf(
                    fooTypeRef,
                    LimeValue.Constant(
                        fooTypeRef,
                        object : LimeConstantRef() {
                            override val element = object : LimeNamedElement(EMPTY_PATH) {}
                            override val typeRef = LimeBasicTypeRef.INT
                        },
                    ),
                    false,
                ),
                arrayOf(
                    LimeDirectTypeRef(object : LimeGenericType() {}),
                    LimeValue.InitializerList(fooTypeRef, emptyList()),
                    true,
                ),
                arrayOf(
                    LimeBasicTypeRef(LimeBasicType.TypeId.BLOB),
                    LimeValue.InitializerList(fooTypeRef, emptyList()),
                    true,
                ),
                arrayOf(fooTypeRef, LimeValue.InitializerList(fooTypeRef, emptyList()), false),
                arrayOf(fooTypeRef, LimeValue.KeyValuePair(LimeValue.ZERO, LimeValue.ZERO), false),
                arrayOf(
                    LimeDirectTypeRef(object : LimeType(EMPTY_PATH) {}, isNullable = true),
                    LimeValue.Null(fooTypeRef),
                    true,
                ),
                arrayOf(fooTypeRef, LimeValue.Null(fooTypeRef), false),
                arrayOf(LimeBasicTypeRef.INT, LimeValue.Special(fooTypeRef, LimeValue.Special.ValueId.NAN), true),
                arrayOf(fooTypeRef, LimeValue.Special(fooTypeRef, LimeValue.Special.ValueId.NAN), false),
                arrayOf(
                    LimeDirectTypeRef(LimeStruct(EMPTY_PATH)),
                    LimeValue.StructInitializer(fooTypeRef, emptyList()),
                    true,
                ),
                arrayOf(fooTypeRef, LimeValue.StructInitializer(fooTypeRef, emptyList()), false),
            )
    }
}
