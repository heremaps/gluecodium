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

import com.here.gluecodium.common.LimeLogger
import com.here.gluecodium.generator.common.GeneratorOptions
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.validator.LimeValidatorUtils.needsDocumentationComment

class LimeLambdaValidator(private val logger: LimeLogger, generatorOptions: GeneratorOptions = GeneratorOptions()) {
    private val werrorLambdaDocs = generatorOptions.werror.contains(GeneratorOptions.WARNING_LIME_LAMBDA_DOCS)
    private val maybeError: LimeLogger.(LimeNamedElement, String) -> Unit =
        if (werrorLambdaDocs) LimeLogger::error else LimeLogger::warning

    fun validate(limeModel: LimeModel): Boolean {
        val validationResults =
            limeModel.referenceMap.values
                .filterIsInstance<LimeLambda>()
                .map { validateLambda(it, limeModel.referenceMap) }

        return !validationResults.contains(false)
    }

    private fun validateLambda(
        limeLambda: LimeLambda,
        referenceMap: Map<String, LimeElement>,
    ): Boolean {
        var result = true
        if (needsDocumentationComment(limeLambda, referenceMap) && !validateLambdaDocs(limeLambda)) {
            if (werrorLambdaDocs) {
                result = false
            }
        }

        return result
    }

    private fun validateLambdaDocs(limeLambda: LimeLambda): Boolean {
        var result = true
        for (parameter in limeLambda.parameters) {
            if (parameter.comment.isEmpty()) {
                logger.maybeError(limeLambda, "Parameter '${parameter.name}' must be documented")
                result = false
            }
        }

        if (!limeLambda.returnType.isVoid && limeLambda.returnType.comment.isEmpty()) {
            logger.maybeError(limeLambda, "Return must be documented")
            result = false
        }

        return result
    }
}
