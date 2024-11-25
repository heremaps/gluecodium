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

package com.here.gluecodium.validator

import com.here.gluecodium.common.LimeLogger
import com.here.gluecodium.generator.common.GeneratorOptions
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.validator.LimeValidatorUtils.needsDocumentationComment

internal class LimeFunctionsValidator(private val logger: LimeLogger, generatorOptions: GeneratorOptions = GeneratorOptions()) {
    private val werrorFunctionDocs = generatorOptions.werror.contains(GeneratorOptions.WARNING_LIME_FUNCTION_DOCS)
    private val maybeError: LimeLogger.(LimeNamedElement, String) -> Unit =
        if (werrorFunctionDocs) LimeLogger::error else LimeLogger::warning

    fun validate(limeModel: LimeModel): Boolean {
        val validationResults =
            limeModel.referenceMap.values
                .filterIsInstance<LimeFunction>()
                .map { validateFunction(it, limeModel.referenceMap) }

        return !validationResults.contains(false)
    }

    private fun validateFunction(
        limeFunction: LimeFunction,
        referenceMap: Map<String, LimeElement>,
    ): Boolean {
        var result = true

        val thrownType = limeFunction.thrownType?.typeRef?.type?.actualType
        if (thrownType != null && thrownType !is LimeException) {
            logger.error(limeFunction, "function throws a non-exception type ${thrownType.fullName}")
            result = false
        }
        if (limeFunction.attributes.have(LimeAttributeType.CPP, LimeAttributeValueType.REF)) {
            val parentElement = referenceMap[limeFunction.path.parent.toString()]
            if (parentElement is LimeInterface) {
                logger.error(limeFunction, "function in an interface cannot be marked with @Cpp(Ref)")
                result = false
            }
        }
        if (needsDocumentationComment(limeFunction, referenceMap) && !validateParametersComments(limeFunction)) {
            if (werrorFunctionDocs) {
                result = false
            }
        }

        return result
    }

    private fun validateParametersComments(limeFunction: LimeFunction): Boolean {
        var result = true

        for (parameter in limeFunction.parameters) {
            if (parameter.comment.isEmpty()) {
                logger.maybeError(limeFunction, "Parameter '${parameter.name}' must be documented")
                result = false
            }
        }

        if (limeFunction.returnType.comment.isEmpty()) {
            logger.maybeError(limeFunction, "Return must be documented")
            result = false
        }

        return result
    }
}
