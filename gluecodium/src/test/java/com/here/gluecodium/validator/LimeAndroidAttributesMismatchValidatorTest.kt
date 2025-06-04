/*
 * Copyright (C) 2016-2025 HERE Europe B.V.
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

import com.here.gluecodium.common.LimeLogger
import com.here.gluecodium.generator.common.GeneratorOptions
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeAttributes
import com.here.gluecodium.model.lime.LimeBasicTypeRef
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimeProperty
import com.here.gluecodium.model.lime.LimeReturnType
import com.here.gluecodium.model.lime.LimeStruct
import io.mockk.justRun
import io.mockk.mockk
import io.mockk.verify
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class LimeAndroidAttributesMismatchValidatorTest {
    private val allElements = mutableMapOf<String, LimeElement>()
    private val limeModel = LimeModel(allElements, emptyList())
    private val somePath = LimePath(emptyList(), listOf("foo", "bar"))

    @Test
    fun elementWithoutAttributesDoesNotGenerateWarning() {
        val limeStruct = LimeStruct(path = somePath)
        allElements[somePath.toString()] = limeStruct

        val logger: LimeLogger = mockk()
        val validator = LimeAndroidAttributesMismatchValidator(logger)
        val result = validator.validate(limeModel)

        verify(exactly = 0) { logger.warning(limeStruct, any()) }
        assertTrue(result)
    }

    @Test
    fun elementWithSameAttributesForJavaAndKotlinDoesNotGenerateWarning() {
        val attributes =
            LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.KOTLIN, LimeAttributeValueType.SKIP)
                .addAttribute(LimeAttributeType.JAVA, LimeAttributeValueType.SKIP)
                .build()

        val limeStruct = LimeStruct(path = somePath, attributes = attributes)
        allElements[somePath.toString()] = limeStruct

        val logger: LimeLogger = mockk()
        val validator = LimeAndroidAttributesMismatchValidator(logger)
        val result = validator.validate(limeModel)

        verify(exactly = 0) { logger.warning(limeStruct, any()) }
        assertTrue(result)
    }

    @Test
    fun elementWithAttributeOnlyForJavaGeneratesWarningWhenWerrorNotSet() {
        val attributes =
            LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.JAVA, LimeAttributeValueType.SKIP)
                .build()

        val limeStruct = LimeStruct(path = somePath, attributes = attributes)
        allElements[somePath.toString()] = limeStruct

        val logger: LimeLogger = mockk()
        justRun { logger.warning(limeStruct, any()) }

        val validator = LimeAndroidAttributesMismatchValidator(logger)
        val result = validator.validate(limeModel)

        verify(exactly = 1) { logger.warning(limeStruct, "Attributes missing in Kotlin, but present in Java: [Skip]") }
        assertTrue(result)
    }

    @Test
    fun elementWithAttributeOnlyForJavaGeneratesErrorWhenWerrorSet() {
        val attributes =
            LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.JAVA, LimeAttributeValueType.SKIP)
                .build()

        val limeStruct = LimeStruct(path = somePath, attributes = attributes)
        allElements[somePath.toString()] = limeStruct

        val logger: LimeLogger = mockk()
        justRun { logger.error(limeStruct, any()) }

        val generatorOptions = GeneratorOptions(werror = setOf(GeneratorOptions.WARNING_ANDROID_ATTRIBUTES_MISMATCH))
        val validator = LimeAndroidAttributesMismatchValidator(logger, generatorOptions)
        val result = validator.validate(limeModel)

        verify(exactly = 1) { logger.error(limeStruct, "Attributes missing in Kotlin, but present in Java: [Skip]") }
        assertFalse(result)
    }

    @Test
    fun elementWithAttributesOnlyForKotlinGeneratesWarningWhenWerrorNotSet() {
        val attributes =
            LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.KOTLIN, LimeAttributeValueType.SKIP)
                .build()

        val limeStruct = LimeStruct(path = somePath, attributes = attributes)
        allElements[somePath.toString()] = limeStruct

        val logger: LimeLogger = mockk()
        justRun { logger.warning(limeStruct, any()) }

        val validator = LimeAndroidAttributesMismatchValidator(logger)
        val result = validator.validate(limeModel)

        verify(exactly = 1) { logger.warning(limeStruct, "Attributes missing in Java, but present in Kotlin: [Skip]") }
        assertTrue(result)
    }

    @Test
    fun mismatchForTwoPlatformsGeneratesTwoWarningsWhenWerrorNotSet() {
        val attributes =
            LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.JAVA, LimeAttributeValueType.SKIP)
                .addAttribute(LimeAttributeType.KOTLIN, LimeAttributeValueType.INTERNAL)
                .build()

        val limeStruct = LimeStruct(path = somePath, attributes = attributes)
        allElements[somePath.toString()] = limeStruct

        val logger: LimeLogger = mockk()
        justRun { logger.warning(limeStruct, any()) }

        val validator = LimeAndroidAttributesMismatchValidator(logger)
        val result = validator.validate(limeModel)

        verify(exactly = 1) { logger.warning(limeStruct, "Attributes missing in Kotlin, but present in Java: [Skip]") }
        verify(exactly = 1) { logger.warning(limeStruct, "Attributes missing in Java, but present in Kotlin: [Internal]") }
        assertTrue(result)
    }

    @Test
    fun propertyWithGetterThatHasAttributeOnlyForJavaGeneratesErrorWhenWerrorSet() {
        val attributes =
            LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.JAVA, LimeAttributeValueType.NAME, "someSpecialGetterName")
                .build()

        val getter = LimeFunction(path = somePath.child("get"), returnType = LimeReturnType(LimeBasicTypeRef.INT), attributes = attributes)
        val limeProperty = LimeProperty(path = somePath, typeRef = LimeBasicTypeRef.INT, getter = getter)
        allElements[somePath.toString()] = limeProperty

        val logger: LimeLogger = mockk()
        justRun { logger.error(limeProperty.getter, any()) }

        val generatorOptions = GeneratorOptions(werror = setOf(GeneratorOptions.WARNING_ANDROID_ATTRIBUTES_MISMATCH))
        val validator = LimeAndroidAttributesMismatchValidator(logger, generatorOptions)
        val result = validator.validate(limeModel)

        verify(exactly = 1) { logger.error(limeProperty.getter, "Attributes missing in Kotlin, but present in Java: [Name]") }
        assertFalse(result)
    }

    @Test
    fun propertyWithSetterThatHasAttributeOnlyForKotlinGeneratesErrorWhenWerrorSet() {
        val attributes =
            LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.KOTLIN, LimeAttributeValueType.NAME, "setSomeProperty")
                .build()

        val setterPath = somePath.child("set")
        val setter =
            LimeFunction(
                path = setterPath,
                parameters = listOf(LimeParameter(path = setterPath.child("param"), typeRef = LimeBasicTypeRef.INT)),
                attributes = attributes,
            )
        val getter = LimeFunction(path = somePath.child("get"), returnType = LimeReturnType(LimeBasicTypeRef.INT))
        val limeProperty = LimeProperty(path = somePath, typeRef = LimeBasicTypeRef.INT, getter = getter, setter = setter)
        allElements[somePath.toString()] = limeProperty

        val logger: LimeLogger = mockk()
        justRun { logger.error(setter, any()) }

        val generatorOptions = GeneratorOptions(werror = setOf(GeneratorOptions.WARNING_ANDROID_ATTRIBUTES_MISMATCH))
        val validator = LimeAndroidAttributesMismatchValidator(logger, generatorOptions)
        val result = validator.validate(limeModel)

        verify(exactly = 1) { logger.error(setter, "Attributes missing in Java, but present in Kotlin: [Name]") }
        assertFalse(result)
    }
}
