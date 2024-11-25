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
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeLambdaParameter
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimeReturnType
import com.here.gluecodium.model.lime.LimeStruct
import io.mockk.mockk
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class LimeLambdaValidatorDocsTest {
    private val allElements = mutableMapOf<String, LimeElement>()
    private val limeModel = LimeModel(allElements, emptyList())
    private val limeComment = LimeComment(comment = "This is some lambda")
    private val generatorOptions = GeneratorOptions(werror = setOf(GeneratorOptions.WARNING_LIME_LAMBDA_DOCS))

    @Test
    fun validateMissingParamsCommentsWhenWerrorIsEnabledGlobalLambda() {
        // Given LimeLambda with parameter that isn't properly documented.
        val lambdaPath = LimePath(listOf(), listOf("SomeLambda"))
        val limeLambda =
            LimeLambda(
                path = lambdaPath,
                comment = limeComment,
                returnType = LimeReturnType(typeRef = LimeBasicTypeRef.INT, comment = LimeComment("Important integer")),
                parameters = listOf(LimeLambdaParameter(path = lambdaPath.child("param1"), typeRef = LimeBasicTypeRef.FLOAT)),
            )
        allElements[lambdaPath.toString()] = limeLambda

        // When validating it with werror flag enabled.
        val validator = LimeLambdaValidator(logger = mockk(relaxed = true), generatorOptions = generatorOptions)
        val result = validator.validate(limeModel)

        // Then validation fails.
        assertFalse(result)
    }

    @Test
    fun validateMissingParamsCommentsWhenWerrorIsDisabledGlobalLambda() {
        // Given LimeLambda with parameter that isn't properly documented.
        val lambdaPath = LimePath(listOf(), listOf("SomeLambda"))
        val limeLambda =
            LimeLambda(
                path = lambdaPath,
                comment = limeComment,
                returnType = LimeReturnType(typeRef = LimeBasicTypeRef.INT, comment = LimeComment("Important integer")),
                parameters = listOf(LimeLambdaParameter(path = lambdaPath.child("param1"), typeRef = LimeBasicTypeRef.FLOAT)),
            )
        allElements[lambdaPath.toString()] = limeLambda

        // When validating it without werror flag.
        val validator = LimeLambdaValidator(logger = mockk(relaxed = true))
        val result = validator.validate(limeModel)

        // Then validation passes.
        assertTrue(result)
    }

    @Test
    fun validateMissingReturnCommentWhenWerrorIsEnabledGlobalLambda() {
        // Given LimeLambda without documented return value.
        val lambdaPath = LimePath(listOf(), listOf("SomeLambda"))
        val limeLambda =
            LimeLambda(
                path = lambdaPath,
                comment = limeComment,
                returnType = LimeReturnType(typeRef = LimeBasicTypeRef.INT),
            )
        allElements[lambdaPath.toString()] = limeLambda

        // When validating it with werror flag enabled.
        val validator = LimeLambdaValidator(logger = mockk(relaxed = true), generatorOptions = generatorOptions)
        val result = validator.validate(limeModel)

        // Then validation fails.
        assertFalse(result)
    }

    @Test
    fun validateMissingReturnCommentForVoidTypeWhenWerrorIsEnabledGlobalLambda() {
        // Given LimeLambda without documented return value for void type.
        val lambdaPath = LimePath(listOf(), listOf("SomeLambda"))
        val limeLambda =
            LimeLambda(
                path = lambdaPath,
                comment = limeComment,
                returnType = LimeReturnType.VOID,
            )
        allElements[lambdaPath.toString()] = limeLambda

        // When validating it with werror flag enabled.
        val validator = LimeLambdaValidator(logger = mockk(relaxed = true), generatorOptions = generatorOptions)
        val result = validator.validate(limeModel)

        // Then validation passes - the lambda returns nothing (void) --> comment for return is not needed.
        assertTrue(result)
    }

    @Test
    fun validateMissingReturnCommentWhenWerrorIsDisabledGlobalLambda() {
        // Given LimeLambda without documented return value.
        val lambdaPath = LimePath(listOf(), listOf("SomeLambda"))
        val limeLambda =
            LimeLambda(
                path = lambdaPath,
                comment = limeComment,
                returnType = LimeReturnType(typeRef = LimeBasicTypeRef.INT),
            )
        allElements[lambdaPath.toString()] = limeLambda

        // When validating it without werror flag.
        val validator = LimeLambdaValidator(logger = mockk(relaxed = true))
        val result = validator.validate(limeModel)

        // Then validation passes.
        assertTrue(result)
    }

    @Test
    fun validateCorrectParamsAndReturnDocsWhenWerrorIsEnabledGlobalLambda() {
        // Given LimeLambda with parameters and return that are properly documented.
        val lambdaPath = LimePath(listOf(), listOf("SomeLambda"))
        val limeLambda =
            LimeLambda(
                path = lambdaPath,
                comment = limeComment,
                returnType =
                    LimeReturnType(
                        typeRef = LimeBasicTypeRef.INT,
                        comment = LimeComment("Important value"),
                    ),
                parameters =
                    listOf(
                        LimeLambdaParameter(
                            path = lambdaPath.child("param1"),
                            typeRef = LimeBasicTypeRef.FLOAT,
                            comment = LimeComment("Some param"),
                        ),
                        LimeLambdaParameter(
                            path = lambdaPath.child("param2"),
                            typeRef = LimeBasicTypeRef.FLOAT,
                            comment = LimeComment("Another param"),
                        ),
                    ),
            )
        allElements[lambdaPath.toString()] = limeLambda

        // When validating it with werror flag enabled.
        val validator = LimeLambdaValidator(logger = mockk(relaxed = true), generatorOptions = generatorOptions)
        val result = validator.validate(limeModel)

        // Then validation passes.
        assertTrue(result)
    }

    @Test
    fun validateInternalLambdaParamDocs() {
        // Given LimeLambda with internal annotation and parameter that isn't properly documented.
        val attributes = LimeAttributes.Builder().addAttribute(LimeAttributeType.INTERNAL).build()

        val lambdaPath = LimePath(listOf(), listOf("SomeLambda"))
        val limeLambda =
            LimeLambda(
                path = lambdaPath,
                comment = limeComment,
                attributes = attributes,
                returnType = LimeReturnType(typeRef = LimeBasicTypeRef.INT, comment = LimeComment("Important integer")),
                parameters = listOf(LimeLambdaParameter(path = lambdaPath.child("param1"), typeRef = LimeBasicTypeRef.FLOAT)),
            )
        allElements[lambdaPath.toString()] = limeLambda

        // When validating it with werror flag.
        val validator = LimeLambdaValidator(logger = mockk(relaxed = true), generatorOptions = generatorOptions)
        val result = validator.validate(limeModel)

        // Then docs validation passes (for internal lambdas it is skipped).
        assertTrue(result)
    }

    @Test
    fun validateLambdaParamDocsFromInternalType() {
        // Given LimeLambda from internal type and parameter that isn't properly documented.
        val internalStructPath = LimePath(listOf(), listOf("SomeInternalStruct"))
        val lambdaPath = internalStructPath.child("SomeLambda")

        val limeLambda =
            LimeLambda(
                path = lambdaPath,
                comment = limeComment,
                returnType = LimeReturnType(typeRef = LimeBasicTypeRef.INT, comment = LimeComment("Important integer")),
                parameters = listOf(LimeLambdaParameter(path = lambdaPath.child("param1"), typeRef = LimeBasicTypeRef.FLOAT)),
            )

        val attributes = LimeAttributes.Builder().addAttribute(LimeAttributeType.INTERNAL).build()
        val internalStruct = LimeStruct(path = internalStructPath.parent, attributes = attributes, lambdas = listOf(limeLambda))

        allElements[lambdaPath.toString()] = limeLambda
        allElements[internalStructPath.toString()] = internalStruct

        // When validating it with werror flag.
        val validator = LimeLambdaValidator(logger = mockk(relaxed = true), generatorOptions = generatorOptions)
        val result = validator.validate(limeModel)

        // Then docs validation passes (for lambdas from internal types it is skipped).
        assertTrue(result)
    }

    @Test
    fun validateLambdaParamDocsFromTypeNestedInInternalOne() {
        // Given LimeLambda from type nested in internal and parameter that isn't properly documented.
        val internalStructPath = LimePath(listOf(), listOf("SomeInternalStruct"))
        val nestedStructPath = internalStructPath.child("SomeNestedStruct")
        val lambdaPath = nestedStructPath.child("SomeLambda")

        val limeLambda =
            LimeLambda(
                path = lambdaPath,
                comment = limeComment,
                returnType = LimeReturnType(typeRef = LimeBasicTypeRef.INT, comment = LimeComment("Important integer")),
                parameters = listOf(LimeLambdaParameter(path = lambdaPath.child("param1"), typeRef = LimeBasicTypeRef.FLOAT)),
            )

        val nestedStruct = LimeStruct(path = nestedStructPath, lambdas = listOf(limeLambda))

        val attributes = LimeAttributes.Builder().addAttribute(LimeAttributeType.INTERNAL).build()
        val internalStruct = LimeStruct(path = internalStructPath, attributes = attributes, structs = listOf(nestedStruct))

        allElements[lambdaPath.toString()] = limeLambda
        allElements[nestedStructPath.toString()] = nestedStruct
        allElements[internalStructPath.toString()] = internalStruct

        // When validating it with werror flag.
        val validator = LimeLambdaValidator(logger = mockk(relaxed = true), generatorOptions = generatorOptions)
        val result = validator.validate(limeModel)

        // Then docs validation passes (for lambdas from types nested in internal ones it is skipped).
        assertTrue(result)
    }
}
