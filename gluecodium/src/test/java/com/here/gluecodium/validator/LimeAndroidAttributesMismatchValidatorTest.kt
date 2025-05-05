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
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeAttributes
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimeStruct
import io.mockk.justRun
import io.mockk.mockk
import io.mockk.verify
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
        validator.validate(limeModel)

        verify(exactly = 0) { logger.warning(limeStruct, any()) }
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
        validator.validate(limeModel)

        verify(exactly = 0) { logger.warning(limeStruct, any()) }
    }

    @Test
    fun elementWithAttributeOnlyForJavaGeneratesWarning() {
        val attributes =
            LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.JAVA, LimeAttributeValueType.SKIP)
                .build()

        val limeStruct = LimeStruct(path = somePath, attributes = attributes)
        allElements[somePath.toString()] = limeStruct

        val logger: LimeLogger = mockk()
        justRun { logger.warning(limeStruct, any()) }

        val validator = LimeAndroidAttributesMismatchValidator(logger)
        validator.validate(limeModel)

        verify(exactly = 1) { logger.warning(limeStruct, "Attributes missing in Kotlin, but present in Java: [Skip]") }
    }

    @Test
    fun elementWithAttributesOnlyForKotlinGeneratesWarning() {
        val attributes =
            LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.KOTLIN, LimeAttributeValueType.SKIP)
                .build()

        val limeStruct = LimeStruct(path = somePath, attributes = attributes)
        allElements[somePath.toString()] = limeStruct

        val logger: LimeLogger = mockk()
        justRun { logger.warning(limeStruct, any()) }

        val validator = LimeAndroidAttributesMismatchValidator(logger)
        validator.validate(limeModel)

        verify(exactly = 1) { logger.warning(limeStruct, "Attributes missing in Java, but present in Kotlin: [Skip]") }
    }

    @Test
    fun mismatchForTwoPlatformsGeneratesTwoWarnings() {
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
        validator.validate(limeModel)

        verify(exactly = 1) { logger.warning(limeStruct, "Attributes missing in Kotlin, but present in Java: [Skip]") }
        verify(exactly = 1) { logger.warning(limeStruct, "Attributes missing in Java, but present in Kotlin: [Internal]") }
    }
}
