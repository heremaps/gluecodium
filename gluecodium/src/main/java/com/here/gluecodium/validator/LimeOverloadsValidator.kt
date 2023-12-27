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

import com.here.gluecodium.common.LimeLogger
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeFieldConstructor
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeSignatureResolver

internal class LimeOverloadsValidator(
    private val signatureResolver: LimeSignatureResolver,
    private val logger: LimeLogger,
    private val validateCustomConstructors: Boolean = false,
) {
    fun validate(limeModel: Collection<LimeElement>): Boolean {
        val validationResults =
            limeModel.filterIsInstance<LimeFunction>().map { validateFunction(it, signatureResolver) } +
                limeModel.filterIsInstance<LimeFieldConstructor>().map { validateFieldConstructor(it, signatureResolver) }
        return !validationResults.contains(false)
    }

    private fun validateFunction(
        limeFunction: LimeFunction,
        signatureResolver: LimeSignatureResolver,
    ) = when {
        signatureResolver.hasSignatureClash(limeFunction) -> {
            logger.error(limeFunction, "function has conflicting overloads")
            false
        }
        validateCustomConstructors && signatureResolver.hasConstructorSignatureClash(limeFunction) -> {
            logger.error(limeFunction, "constructor has conflicting overloads")
            false
        }
        else -> true
    }

    private fun validateFieldConstructor(
        limeFieldConstructor: LimeFieldConstructor,
        signatureResolver: LimeSignatureResolver,
    ): Boolean {
        if (validateCustomConstructors) {
            if (signatureResolver.hasConstructorSignatureClash(limeFieldConstructor.asFunction())) {
                logger.error(limeFieldConstructor, "field constructor has conflicting overloads")
                return false
            }
        } else {
            val allSiblings = limeFieldConstructor.struct.fieldConstructors.map { it.asFunction() }
            if (signatureResolver.hasSignatureClash(limeFieldConstructor.asFunction(), allSiblings)) {
                logger.error(limeFieldConstructor, "field constructor has conflicting overloads")
                return false
            }
        }
        return true
    }
}
