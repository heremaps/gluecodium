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
import com.here.gluecodium.model.lime.LimeAttributeType.DART
import com.here.gluecodium.model.lime.LimeAttributeType.JAVA
import com.here.gluecodium.model.lime.LimeAttributeType.KOTLIN
import com.here.gluecodium.model.lime.LimeAttributeType.SWIFT
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeAttributes
import com.here.gluecodium.model.lime.LimeBasicTypeRef
import com.here.gluecodium.model.lime.LimeComment
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeParameter
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
class LimeFunctionsValidatorDocsTest {
    private val allElements = mutableMapOf<String, LimeElement>()
    private val limeModel = LimeModel(allElements, emptyList())
    private val limeStructPath = LimePath(emptyList(), listOf("foo", "bar"))
    private val limeFunctionPath = limeStructPath.child("baz")
    private val limeComment = LimeComment(comment = "This is some function")
    private val generatorOptions = GeneratorOptions(werror = setOf(GeneratorOptions.WARNING_LIME_FUNCTION_DOCS))

    @Test
    fun validateMissingParamsCommentsWhenWerrorIsEnabled() {
        // Given LimeFunction with parameter that isn't properly documented.
        val limeFunction =
            LimeFunction(
                path = limeFunctionPath,
                comment = limeComment,
                returnType = LimeReturnType(typeRef = LimeBasicTypeRef.INT, comment = LimeComment("Important integer")),
                parameters = listOf(LimeParameter(path = limeFunctionPath.child("param1"), typeRef = LimeBasicTypeRef.FLOAT)),
            )
        allElements[limeFunctionPath.toString()] = limeFunction
        allElements[limeStructPath.toString()] = LimeStruct(path = limeStructPath, functions = listOf(limeFunction))

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
                path = limeFunctionPath,
                comment = limeComment,
                returnType = LimeReturnType(typeRef = LimeBasicTypeRef.INT, comment = LimeComment("Important integer")),
                parameters = listOf(LimeParameter(path = limeFunctionPath.child("param1"), typeRef = LimeBasicTypeRef.FLOAT)),
            )
        allElements[limeFunctionPath.toString()] = limeFunction
        allElements[limeStructPath.toString()] = LimeStruct(path = limeStructPath, functions = listOf(limeFunction))

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
                path = limeFunctionPath,
                comment = limeComment,
                returnType = LimeReturnType(typeRef = LimeBasicTypeRef.INT),
            )
        allElements[limeFunctionPath.toString()] = limeFunction
        allElements[limeStructPath.toString()] = LimeStruct(path = limeStructPath, functions = listOf(limeFunction))

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
                path = limeFunctionPath,
                comment = limeComment,
                returnType = LimeReturnType.VOID,
            )
        allElements[limeFunctionPath.toString()] = limeFunction
        allElements[limeStructPath.toString()] = LimeStruct(path = limeStructPath, functions = listOf(limeFunction))

        // When validating it with werror flag enabled.
        val validator = LimeFunctionsValidator(logger = mockk(relaxed = true), generatorOptions = generatorOptions)
        val result = validator.validate(limeModel)

        // Then validation passes - the function returns nothing (void).
        assertTrue(result)
    }

    @Test
    fun validateMissingReturnCommentForConstructorWhenWerrorIsEnabled() {
        // Given LimeFunction that is constructor without documented return value.
        val limeFunction =
            LimeFunction(
                path = limeFunctionPath,
                comment = limeComment,
                isConstructor = true,
                returnType = LimeReturnType(typeRef = LimeBasicTypeRef.INT),
            )
        allElements[limeFunctionPath.toString()] = limeFunction
        allElements[limeStructPath.toString()] = LimeStruct(path = limeStructPath, functions = listOf(limeFunction))

        // When validating it with werror flag enabled.
        val validator = LimeFunctionsValidator(logger = mockk(relaxed = true), generatorOptions = generatorOptions)
        val result = validator.validate(limeModel)

        // Then validation passes - the constructor does not need to document return value.
        assertTrue(result)
    }

    @Test
    fun validateMissingReturnCommentWhenWerrorIsDisabled() {
        // Given LimeFunction without documented return value.
        val limeFunction =
            LimeFunction(
                path = limeFunctionPath,
                comment = limeComment,
                returnType = LimeReturnType(typeRef = LimeBasicTypeRef.INT),
            )
        allElements[limeFunctionPath.toString()] = limeFunction
        allElements[limeStructPath.toString()] = LimeStruct(path = limeStructPath, functions = listOf(limeFunction))

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
                path = limeFunctionPath,
                comment = limeComment,
                returnType =
                    LimeReturnType(
                        typeRef = LimeBasicTypeRef.INT,
                        comment = LimeComment("Important value"),
                    ),
                parameters =
                    listOf(
                        LimeParameter(
                            path = limeFunctionPath.child("param1"),
                            typeRef = LimeBasicTypeRef.FLOAT,
                            comment = LimeComment("Some param"),
                        ),
                        LimeParameter(
                            path = limeFunctionPath.child("param2"),
                            typeRef = LimeBasicTypeRef.FLOAT,
                            comment = LimeComment("Another param"),
                        ),
                    ),
            )
        allElements[limeFunctionPath.toString()] = limeFunction
        allElements[limeStructPath.toString()] = LimeStruct(path = limeStructPath, functions = listOf(limeFunction))

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
                path = limeFunctionPath,
                comment = limeComment,
                attributes = attributes,
                returnType = LimeReturnType(typeRef = LimeBasicTypeRef.INT, comment = LimeComment("Important integer")),
                parameters = listOf(LimeParameter(path = limeFunctionPath.child("param1"), typeRef = LimeBasicTypeRef.FLOAT)),
            )
        allElements[limeFunctionPath.toString()] = limeFunction
        allElements[limeStructPath.toString()] = LimeStruct(path = limeStructPath, functions = listOf(limeFunction))

        // When validating it with werror flag.
        val validator = LimeFunctionsValidator(logger = mockk(relaxed = true), generatorOptions = generatorOptions)
        val result = validator.validate(limeModel)

        // Then docs validation passes (for internal functions it is skipped).
        assertTrue(result)
    }

    @Test
    fun validateFunctionParamDocsFromInternalType() {
        // Given LimeFunction from internal type and parameter that isn't properly documented.
        val limeFunction =
            LimeFunction(
                path = limeFunctionPath,
                comment = limeComment,
                returnType = LimeReturnType(typeRef = LimeBasicTypeRef.INT, comment = LimeComment("Important integer")),
                parameters = listOf(LimeParameter(path = limeFunctionPath.child("param1"), typeRef = LimeBasicTypeRef.FLOAT)),
            )

        val attributes = LimeAttributes.Builder().addAttribute(LimeAttributeType.INTERNAL).build()
        val internalStruct = LimeStruct(path = limeStructPath, attributes = attributes, functions = listOf(limeFunction))

        allElements[limeFunctionPath.toString()] = limeFunction
        allElements[limeStructPath.toString()] = internalStruct

        // When validating it with werror flag.
        val validator = LimeFunctionsValidator(logger = mockk(relaxed = true), generatorOptions = generatorOptions)
        val result = validator.validate(limeModel)

        // Then docs validation passes (for functions from internal types it is skipped).
        assertTrue(result)
    }

    @Test
    fun validateFunctionParamDocsFromTypeNestedInInternalOne() {
        // Given LimeFunction from type nested in internal and parameter that isn't properly documented.
        val limeFunction =
            LimeFunction(
                path = limeFunctionPath,
                comment = limeComment,
                returnType = LimeReturnType(typeRef = LimeBasicTypeRef.INT, comment = LimeComment("Important integer")),
                parameters = listOf(LimeParameter(path = limeFunctionPath.child("param1"), typeRef = LimeBasicTypeRef.FLOAT)),
            )

        val nestedStruct = LimeStruct(path = limeStructPath, functions = listOf(limeFunction))

        val attributes = LimeAttributes.Builder().addAttribute(LimeAttributeType.INTERNAL).build()
        val internalStruct = LimeStruct(path = limeStructPath.parent, attributes = attributes, structs = listOf(nestedStruct))

        allElements[limeFunctionPath.toString()] = limeFunction
        allElements[limeStructPath.toString()] = nestedStruct
        allElements[limeStructPath.parent.toString()] = internalStruct

        // When validating it with werror flag.
        val validator = LimeFunctionsValidator(logger = mockk(relaxed = true), generatorOptions = generatorOptions)
        val result = validator.validate(limeModel)

        // Then docs validation passes (for functions from internal types it is skipped).
        assertTrue(result)
    }

    @Test
    fun validationShouldPassWhenAllPlatformsAreInternal() {
        // Given LimeFunction with internal annotation and parameter that isn't properly documented.
        val builder = LimeAttributes.Builder()
        listOf(JAVA, SWIFT, DART, KOTLIN).forEach {
            builder.addAttribute(it, LimeAttributeValueType.INTERNAL)
        }
        val attributes = builder.build()

        val limeFunction =
            LimeFunction(
                path = limeFunctionPath,
                comment = limeComment,
                attributes = attributes,
                returnType = LimeReturnType(typeRef = LimeBasicTypeRef.INT, comment = LimeComment("Important integer")),
                parameters = listOf(LimeParameter(path = limeFunctionPath.child("param1"), typeRef = LimeBasicTypeRef.FLOAT)),
            )
        allElements[limeFunctionPath.toString()] = limeFunction
        allElements[limeStructPath.toString()] = LimeStruct(path = limeStructPath, functions = listOf(limeFunction))

        // When validating it with werror flag.
        val validator = LimeFunctionsValidator(logger = mockk(relaxed = true), generatorOptions = generatorOptions)
        val result = validator.validate(limeModel)

        // Then docs validation passes (all platforms are internal -- we should not raise warning).
        assertTrue(result)
    }

    @Test
    fun validationShouldPassWhenAllPlatformsAreInternalInParentElement() {
        // Given LimeFunction from type nested in internal and parameter that isn't properly documented.
        val limeFunction =
            LimeFunction(
                path = limeFunctionPath,
                comment = limeComment,
                returnType = LimeReturnType(typeRef = LimeBasicTypeRef.INT, comment = LimeComment("Important integer")),
                parameters = listOf(LimeParameter(path = limeFunctionPath.child("param1"), typeRef = LimeBasicTypeRef.FLOAT)),
            )

        val nestedStruct = LimeStruct(path = limeStructPath, functions = listOf(limeFunction))

        val builder = LimeAttributes.Builder()
        listOf(JAVA, SWIFT, DART, KOTLIN).forEach {
            builder.addAttribute(it, LimeAttributeValueType.INTERNAL)
        }
        val attributes = builder.build()
        val internalStruct = LimeStruct(path = limeStructPath.parent, attributes = attributes, structs = listOf(nestedStruct))

        allElements[limeFunctionPath.toString()] = limeFunction
        allElements[limeStructPath.toString()] = nestedStruct
        allElements[limeStructPath.parent.toString()] = internalStruct

        // When validating it with werror flag.
        val validator = LimeFunctionsValidator(logger = mockk(relaxed = true), generatorOptions = generatorOptions)
        val result = validator.validate(limeModel)

        // Then docs validation passes (for functions from internal types it is skipped).
        assertTrue(result)
    }

    @Test
    fun validationShouldPassWhenAllPlatformsAreSkipped() {
        // Given LimeFunction with skipped annotation for all platforms and parameter that isn't properly documented.
        val builder = LimeAttributes.Builder()
        listOf(JAVA, SWIFT, DART, KOTLIN).forEach {
            builder.addAttribute(it, LimeAttributeValueType.SKIP)
        }
        val attributes = builder.build()

        val limeFunction =
            LimeFunction(
                path = limeFunctionPath,
                comment = limeComment,
                attributes = attributes,
                returnType = LimeReturnType(typeRef = LimeBasicTypeRef.INT, comment = LimeComment("Important integer")),
                parameters = listOf(LimeParameter(path = limeFunctionPath.child("param1"), typeRef = LimeBasicTypeRef.FLOAT)),
            )
        allElements[limeFunctionPath.toString()] = limeFunction
        allElements[limeStructPath.toString()] = LimeStruct(path = limeStructPath, functions = listOf(limeFunction))

        // When validating it with werror flag.
        val validator = LimeFunctionsValidator(logger = mockk(relaxed = true), generatorOptions = generatorOptions)
        val result = validator.validate(limeModel)

        // Then docs validation passes (all platforms are skipped -- we should not raise warning).
        assertTrue(result)
    }

    @Test
    fun validationShouldPassWhenAllPlatformsAreSkippedInParentElement() {
        // Given LimeFunction from type nested in type skipped for all platforms and parameter that isn't properly documented.
        val limeFunction =
            LimeFunction(
                path = limeFunctionPath,
                comment = limeComment,
                returnType = LimeReturnType(typeRef = LimeBasicTypeRef.INT, comment = LimeComment("Important integer")),
                parameters = listOf(LimeParameter(path = limeFunctionPath.child("param1"), typeRef = LimeBasicTypeRef.FLOAT)),
            )

        val nestedStruct = LimeStruct(path = limeStructPath, functions = listOf(limeFunction))

        val builder = LimeAttributes.Builder()
        listOf(JAVA, SWIFT, DART, KOTLIN).forEach {
            builder.addAttribute(it, LimeAttributeValueType.SKIP)
        }
        val attributes = builder.build()
        val internalStruct = LimeStruct(path = limeStructPath.parent, attributes = attributes, structs = listOf(nestedStruct))

        allElements[limeFunctionPath.toString()] = limeFunction
        allElements[limeStructPath.toString()] = nestedStruct
        allElements[limeStructPath.parent.toString()] = internalStruct

        // When validating it with werror flag.
        val validator = LimeFunctionsValidator(logger = mockk(relaxed = true), generatorOptions = generatorOptions)
        val result = validator.validate(limeModel)

        // Then docs validation passes (for functions from internal types it is skipped).
        assertTrue(result)
    }

    @Test
    fun validationShouldPassWhenAllNonSkippedPlatformsAreInternal() {
        // Given LimeFunction with internal annotation for all platforms that are not skipped and parameter that isn't properly documented.
        val builder = LimeAttributes.Builder()

        // Skip all platforms except SWIFT.
        listOf(JAVA, DART, KOTLIN).forEach {
            builder.addAttribute(it, LimeAttributeValueType.SKIP)
        }

        // Remaining SWIFT platform is internal.
        builder.addAttribute(SWIFT, LimeAttributeValueType.INTERNAL)
        val attributes = builder.build()

        val limeFunction =
            LimeFunction(
                path = limeFunctionPath,
                comment = limeComment,
                attributes = attributes,
                returnType = LimeReturnType(typeRef = LimeBasicTypeRef.INT, comment = LimeComment("Important integer")),
                parameters = listOf(LimeParameter(path = limeFunctionPath.child("param1"), typeRef = LimeBasicTypeRef.FLOAT)),
            )
        allElements[limeFunctionPath.toString()] = limeFunction
        allElements[limeStructPath.toString()] = LimeStruct(path = limeStructPath, functions = listOf(limeFunction))

        // When validating it with werror flag.
        val validator = LimeFunctionsValidator(logger = mockk(relaxed = true), generatorOptions = generatorOptions)
        val result = validator.validate(limeModel)

        // Then docs validation passes (all platforms are skipped -- we should not raise warning).
        assertTrue(result)
    }
}
