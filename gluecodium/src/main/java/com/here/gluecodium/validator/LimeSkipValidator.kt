/*
 * Copyright (C) 2016-2020 HERE Europe B.V.
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

import com.here.gluecodium.cli.GluecodiumExecutionException
import com.here.gluecodium.common.LimeLogger
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeType.DART
import com.here.gluecodium.model.lime.LimeAttributeType.IMMUTABLE
import com.here.gluecodium.model.lime.LimeAttributeType.JAVA
import com.here.gluecodium.model.lime.LimeAttributeType.SWIFT
import com.here.gluecodium.model.lime.LimeAttributeValueType.SKIP
import com.here.gluecodium.model.lime.LimeEnumerator
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeStruct

/**
 * Validate fields and enumerators against having a platform-skip attribute.
 */
internal class LimeSkipValidator(private val logger: LimeLogger) {

    fun validate(limeModel: LimeModel): Boolean {
        val enumerators = limeModel.referenceMap.values.filterIsInstance<LimeEnumerator>()
        val structs = limeModel.referenceMap.values.filterIsInstance<LimeStruct>()
        val validationResults = enumerators.flatMap { validateSkipAttributes(it) } + structs.map { validateFields(it) }

        return !validationResults.contains(false)
    }

    private fun validateSkipAttributes(limeElement: LimeNamedElement) =
        listOf(JAVA, SWIFT, DART).map {
            return@map if (limeElement.attributes.have(it, SKIP)) {
                logger.error(limeElement, getErrorMessage(limeElement, it))
                false
            } else true
        }

    private fun validateFields(limeStruct: LimeStruct) =
        !limeStruct.attributes.have(IMMUTABLE) ||
            !limeStruct.fields.flatMap { validateSkipAttributes(it) }.contains(false)

    companion object {
        private fun getErrorMessage(limeElement: LimeNamedElement, limeAttributeType: LimeAttributeType): String {
            val typePrefix = when (limeElement) {
                is LimeField -> "field of `@Immutable` struct"
                is LimeEnumerator -> "enumerator"
                else -> throw GluecodiumExecutionException("Unsupported element type ${limeElement.javaClass.name}")
            }
            return "$typePrefix cannot be marked with a `@$limeAttributeType(Skip)` attribute"
        }
    }
}
