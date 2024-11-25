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

package com.here.gluecodium.validator

import com.here.gluecodium.generator.common.GeneratorOptions
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributes
import com.here.gluecodium.model.lime.LimeBasicTypeRef
import com.here.gluecodium.model.lime.LimeComment
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimePath.Companion.EMPTY_PATH
import com.here.gluecodium.model.lime.LimeReturnType
import com.here.gluecodium.model.lime.LimeStruct
import io.mockk.mockk
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class LimeFunctionsValidatorDocsTest {
    private val allElements = mutableMapOf<String, LimeElement>()
    private val limeModel = LimeModel(allElements, emptyList())
    private val limePath = LimePath(emptyList(), listOf("foo", "bar"))
    private val limeComment = LimeComment(comment = "This is some function")
    private val generatorOptions = GeneratorOptions(werror = setOf(GeneratorOptions.WARNING_LIME_FUNCTION_DOCS))

    @Test
    fun validateMissingParamsCommentsWhenWerrorIsEnabled() {
        // Given LimeFunction with parameter that isn't properly documented.
        val limeFunction =
            LimeFunction(
                path = limePath,
                comment = limeComment,
                returnType = LimeReturnType(typeRef = LimeBasicTypeRef.INT, comment = LimeComment("Important integer")),
                parameters = listOf(LimeParameter(path = limePath.child("param1"), typeRef = LimeBasicTypeRef.FLOAT)),
            )
        allElements[""] = limeFunction
        allElements["foo"] = LimeStruct(EMPTY_PATH)

        // When validating it with werror flag enabled.
        val validator = LimeFunctionsValidator(logger = mockk(relaxed = true), generatorOptions = generatorOptions)
        val result = validator.validate(limeModel)

        // Then validation fails.
        assertFalse(result)
    }

    @Test
    fun validateMissingParamsCommentsWhenWerrorIsDisabled() {
        // Given LimeFunction with parameter that isn't properly documented.
        val limeFunction =
            LimeFunction(
                path = limePath,
                comment = limeComment,
                returnType = LimeReturnType(typeRef = LimeBasicTypeRef.INT, comment = LimeComment("Important integer")),
                parameters = listOf(LimeParameter(path = limePath.child("param1"), typeRef = LimeBasicTypeRef.FLOAT)),
            )
        allElements[""] = limeFunction
        allElements["foo"] = LimeStruct(EMPTY_PATH)

        // When validating it without werror flag.
        val validator = LimeFunctionsValidator(logger = mockk(relaxed = true))
        val result = validator.validate(limeModel)

        // Then validation passes.
        assertTrue(result)
    }

    @Test
    fun validateMissingReturnCommentWhenWerrorIsEnabled() {
        // Given LimeFunction without documented return value.
        val limeFunction =
            LimeFunction(
                path = limePath,
                comment = limeComment,
                returnType = LimeReturnType(typeRef = LimeBasicTypeRef.INT),
            )
        allElements[""] = limeFunction
        allElements["foo"] = LimeStruct(EMPTY_PATH)

        // When validating it with werror flag enabled.
        val validator = LimeFunctionsValidator(logger = mockk(relaxed = true), generatorOptions = generatorOptions)
        val result = validator.validate(limeModel)

        // Then validation fails.
        assertFalse(result)
    }

    @Test
    fun validateMissingReturnCommentForVoidTypeWhenWerrorIsEnabled() {
        // Given LimeFunction without documented return value for void type.
        val limeFunction =
            LimeFunction(
                path = limePath,
                comment = limeComment,
                returnType = LimeReturnType.VOID,
            )
        allElements[""] = limeFunction
        allElements["foo"] = LimeStruct(EMPTY_PATH)

        // When validating it with werror flag enabled.
        val validator = LimeFunctionsValidator(logger = mockk(relaxed = true), generatorOptions = generatorOptions)
        val result = validator.validate(limeModel)

        // Then validation passes - the function returns nothing (void).
        assertTrue(result)
    }

    @Test
    fun validateMissingReturnCommentWhenWerrorIsDisabled() {
        // Given LimeFunction without documented return value.
        val limeFunction =
            LimeFunction(
                path = limePath,
                comment = limeComment,
                returnType = LimeReturnType(typeRef = LimeBasicTypeRef.INT),
            )
        allElements[""] = limeFunction
        allElements["foo"] = LimeStruct(EMPTY_PATH)

        // When validating it without werror flag.
        val validator = LimeFunctionsValidator(logger = mockk(relaxed = true))
        val result = validator.validate(limeModel)

        // Then validation passes.
        assertTrue(result)
    }

    @Test
    fun validateCorrectParamsAndReturnDocsWhenWerrorIsEnabled() {
        // Given LimeFunction with parameters and return that are properly documented.
        val limeFunction =
            LimeFunction(
                path = limePath,
                comment = limeComment,
                returnType =
                    LimeReturnType(
                        typeRef = LimeBasicTypeRef.INT,
                        comment = LimeComment("Important value"),
                    ),
                parameters =
                    listOf(
                        LimeParameter(
                            path = limePath.child("param1"),
                            typeRef = LimeBasicTypeRef.FLOAT,
                            comment = LimeComment("Some param"),
                        ),
                        LimeParameter(
                            path = limePath.child("param2"),
                            typeRef = LimeBasicTypeRef.FLOAT,
                            comment = LimeComment("Another param"),
                        ),
                    ),
            )
        allElements[""] = limeFunction
        allElements["foo"] = LimeStruct(EMPTY_PATH)

        // When validating it with werror flag enabled.
        val validator = LimeFunctionsValidator(logger = mockk(relaxed = true), generatorOptions = generatorOptions)
        val result = validator.validate(limeModel)

        // Then validation passes.
        assertTrue(result)
    }

    @Test
    fun validateInternalFunctionParamDocs() {
        // Given LimeFunction with internal annotation and parameter that isn't properly documented.
        val attributes = LimeAttributes.Builder().addAttribute(LimeAttributeType.INTERNAL).build()

        val limeFunction =
            LimeFunction(
                path = limePath,
                comment = limeComment,
                attributes = attributes,
                returnType = LimeReturnType(typeRef = LimeBasicTypeRef.INT, comment = LimeComment("Important integer")),
                parameters = listOf(LimeParameter(path = limePath.child("param1"), typeRef = LimeBasicTypeRef.FLOAT)),
            )
        allElements[""] = limeFunction
        allElements["foo"] = LimeStruct(EMPTY_PATH)

        // When validating it with werror flag.
        val validator = LimeFunctionsValidator(logger = mockk(relaxed = true), generatorOptions = generatorOptions)
        val result = validator.validate(limeModel)

        // Then docs validation passes (for internal functions it is skipped).
        assertTrue(result)
    }

    @Test
    fun validateFunctionParamDocsFromInternalType() {
        // Given LimeFunction from internal type and parameter that isn't properly documented.
        val attributes = LimeAttributes.Builder().addAttribute(LimeAttributeType.INTERNAL).build()
        val internalStruct = LimeStruct(path = limePath.parent, attributes = attributes)

        val limeFunction =
            LimeFunction(
                path = limePath,
                comment = limeComment,
                returnType = LimeReturnType(typeRef = LimeBasicTypeRef.INT, comment = LimeComment("Important integer")),
                parameters = listOf(LimeParameter(path = limePath.child("param1"), typeRef = LimeBasicTypeRef.FLOAT)),
            )
        allElements[""] = limeFunction
        allElements["foo"] = internalStruct

        // When validating it with werror flag.
        val validator = LimeFunctionsValidator(logger = mockk(relaxed = true), generatorOptions = generatorOptions)
        val result = validator.validate(limeModel)

        // Then docs validation passes (for functions from internal types it is skipped).
        assertTrue(result)
    }

    @Test
    fun validateFunctionParamDocsFromTypeNestedInInternalOne() {
        // Given LimeFunction from type nested in internal and parameter that isn't properly documented.
        val attributes = LimeAttributes.Builder().addAttribute(LimeAttributeType.INTERNAL).build()
        val internalStruct = LimeStruct(path = limePath.parent, attributes = attributes)
        val nestedStruct = LimeStruct(path = limePath)

        val functionPath = limePath.child("baz")
        val limeFunction =
            LimeFunction(
                path = functionPath,
                comment = limeComment,
                returnType = LimeReturnType(typeRef = LimeBasicTypeRef.INT, comment = LimeComment("Important integer")),
                parameters = listOf(LimeParameter(path = functionPath.child("param1"), typeRef = LimeBasicTypeRef.FLOAT)),
            )
        allElements[""] = limeFunction
        allElements["foo"] = internalStruct
        allElements["foo.bar"] = nestedStruct

        // When validating it with werror flag.
        val validator = LimeFunctionsValidator(logger = mockk(relaxed = true), generatorOptions = generatorOptions)
        val result = validator.validate(limeModel)

        // Then docs validation passes (for functions from internal types it is skipped).
        assertTrue(result)
    }
}
