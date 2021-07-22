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
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeSignatureResolver

internal class LimeOverloadsValidator(
    private val signatureResolver: LimeSignatureResolver,
    private val logger: LimeLogger
) {
    fun validate(limeModel: Collection<LimeElement>): Boolean {
        val validationResults =
            limeModel.filterIsInstance<LimeFunction>().map { validateFunction(it, signatureResolver) }
        return !validationResults.contains(false)
    }

    private fun validateFunction(limeFunction: LimeFunction, signatureResolver: LimeSignatureResolver): Boolean {

        var result = true

        if (limeFunction.isConstructor && signatureResolver.hasConstructorSignatureClash(limeFunction)) {
            logger.error(limeFunction, "constructor has conflicting overloads")
            result = false
        }
        if (!limeFunction.isConstructor && signatureResolver.hasSignatureClash(limeFunction)) {
            logger.error(limeFunction, "function has conflicting overloads")
            result = false
        }

        return result
    }
}
