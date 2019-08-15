/*
 * Copyright (C) 2016-2019 HERE Europe B.V.
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

package com.here.genium.validator

import com.here.genium.model.lime.LimeFunction
import com.here.genium.model.lime.LimeModel
import com.here.genium.model.lime.LimeSignatureResolver

internal class LimeMethodsSignatureValidator(private val logger: LimeLogger) {

    fun validate(limeModel: LimeModel): Boolean {
        val signatureResolver = LimeSignatureResolver(limeModel.referenceMap)
        val validationResults = limeModel.referenceMap.values
            .filterIsInstance<LimeFunction>()
            .map { validateMethod(it, signatureResolver) }

        return !validationResults.contains(false)
    }

    private fun validateMethod(
        limeMethod: LimeFunction,
        signatureResolver: LimeSignatureResolver
    ) = when {
        limeMethod.isConstructor &&
                signatureResolver.hasConstructorSignatureClash(limeMethod) -> {
            logger.error(limeMethod, "constructor has conflicting overloads")
            false
        }
        !limeMethod.isConstructor && signatureResolver.hasSignatureClash(limeMethod) -> {
            logger.error(limeMethod, "method has conflicting overloads")
            logger.error(limeMethod, "method has conflicting overloads")
            false
        }
        else -> true
    }
}
