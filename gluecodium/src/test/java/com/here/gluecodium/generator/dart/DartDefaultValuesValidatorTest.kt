/*
 * Copyright (C) 2016-2024 HERE Europe B.V.
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

package com.here.gluecodium.generator.dart

import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeAttributes
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeBasicTypeRef
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeValue
import io.mockk.mockk
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class DartDefaultValuesValidatorTest {
    private val allElements = mutableMapOf<String, LimeElement>()
    private val typePath = LimePath(emptyList(), listOf("someType"))
    private val anotherTypePath = LimePath(emptyList(), listOf("anotherType"))
    private val anotherType = LimeStruct(path = anotherTypePath)
    private val positionalDefaultsAttributes =
        LimeAttributes.Builder().addAttribute(
            LimeAttributeType.DART,
            LimeAttributeValueType.POSITIONAL_DEFAULTS,
        ).build()
    private val immutableAttributes = LimeAttributes.Builder().addAttribute(LimeAttributeType.IMMUTABLE).build()
    private val anotherImmutableType = LimeStruct(path = anotherTypePath, attributes = immutableAttributes)
    private val validator = DartDefaultValuesValidator(mockk(relaxed = true))

    @Test
    fun validateStructWithoutPositionalDefaults() {
        // Given a structure that is not annotated with 'PositionalDefaults'
        // and has nullable field with default value different from 'null'.
        val field =
            LimeField(
                path = typePath.child("someField"),
                typeRef = LimeDirectTypeRef(type = anotherType, isNullable = true),
                defaultValue = LimeValue.StructInitializer(LimeDirectTypeRef(type = anotherType, isNullable = true), listOf()),
            )

        val structWithFields = LimeStruct(path = typePath, fields = listOf(field))
        allElements[typePath.toString()] = structWithFields

        // When validating default values.
        val result = validator.validate(allElements)

        // Then validation succeeds.
        assertTrue(result)
    }

    @Test
    fun validatePositionalDefaultsStructThatDoesNotHaveStructFields() {
        // Given a structure that is annotated with 'PositionalDefaults'
        // and has nullable field that is not struct and has value different from 'null'.
        val field =
            LimeField(
                path = typePath.child("someField"),
                typeRef = LimeBasicTypeRef(LimeBasicType.TypeId.INT32, isNullable = true),
                defaultValue = LimeValue.Literal(LimeBasicTypeRef(LimeBasicType.TypeId.INT32, isNullable = true), "123"),
            )

        val structWithFields = LimeStruct(path = typePath, fields = listOf(field), attributes = positionalDefaultsAttributes)
        allElements[typePath.toString()] = structWithFields

        // When validating default values.
        val result = validator.validate(allElements)

        // Then validation succeeds.
        assertTrue(result)
    }

    @Test
    fun validatePositionalDefaultsStructThatHasImmutableField() {
        // Given a structure that is annotated with 'PositionalDefaults'
        // and has nullable field annotated as immutable with default value different from 'null'.
        val field =
            LimeField(
                path = typePath.child("someField"),
                typeRef = LimeDirectTypeRef(type = anotherImmutableType, isNullable = true),
                defaultValue = LimeValue.StructInitializer(LimeDirectTypeRef(type = anotherImmutableType, isNullable = true), listOf()),
            )

        val structWithFields = LimeStruct(path = typePath, fields = listOf(field), attributes = positionalDefaultsAttributes)
        allElements[typePath.toString()] = structWithFields

        // When validating default values.
        val result = validator.validate(allElements)

        // Then validation succeeds.
        assertTrue(result)
    }

    @Test
    fun validatePositionalDefaultsStructThatHasMutableStructFieldEqualsNull() {
        // Given a structure that is annotated with 'PositionalDefaults'
        // and has nullable field with default value equals 'null'.
        val field =
            LimeField(
                path = typePath.child("someField"),
                typeRef = LimeDirectTypeRef(type = anotherType, isNullable = true),
                defaultValue = LimeValue.Null(LimeDirectTypeRef(type = anotherType, isNullable = true)),
            )

        val structWithFields = LimeStruct(path = typePath, fields = listOf(field), attributes = positionalDefaultsAttributes)
        allElements[typePath.toString()] = structWithFields

        // When validating default values.
        val result = validator.validate(allElements)

        // Then validation succeeds.
        assertTrue(result)
    }

    @Test
    fun validatePositionalDefaultsStructThatHasMutableStructFieldNotEqualNull() {
        // Given a structure that is annotated with 'PositionalDefaults'
        // and has nullable field with default value different from 'null'.
        val field =
            LimeField(
                path = typePath.child("someField"),
                typeRef = LimeDirectTypeRef(type = anotherType, isNullable = true),
                defaultValue = LimeValue.StructInitializer(LimeDirectTypeRef(type = anotherType, isNullable = true), listOf()),
            )

        val structWithFields = LimeStruct(path = typePath, fields = listOf(field), attributes = positionalDefaultsAttributes)
        allElements[typePath.toString()] = structWithFields

        // When validating default values.
        val result = validator.validate(allElements)

        // Then validation fails.
        assertFalse(result)
    }
}
