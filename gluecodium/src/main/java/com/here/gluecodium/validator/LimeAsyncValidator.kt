/*
 * Copyright (C) 2016-2022 HERE Europe B.V.
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
import com.here.gluecodium.model.lime.LimeAttributeType.ASYNC
import com.here.gluecodium.model.lime.LimeContainer
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeProperty

/**
 * Validates the correct usage of `@Async` attribute.
 */
internal class LimeAsyncValidator(private val logger: LimeLogger) {
    fun validate(limeModel: LimeModel): Boolean {
        val allElements = limeModel.referenceMap.values
        val containers = allElements.filterIsInstance<LimeContainer>()
        val properties = allElements.filterIsInstance<LimeProperty>()
        val lambdas = allElements.filterIsInstance<LimeLambda>()
        val validationResults =
            containers.flatMap { validateContainer(it) } + (properties + lambdas).map { validateNonFunction(it) }

        return !validationResults.contains(false)
    }

    private fun validateContainer(limeContainer: LimeContainer) = limeContainer.functions.map { validateFunction(it, limeContainer) }

    private fun validateFunction(
        limeFunction: LimeFunction,
        limeContainer: LimeContainer,
    ) = when {
        !limeFunction.attributes.have(ASYNC) -> true
        limeContainer is LimeInterface -> {
            logger.error(limeFunction, "`@Async` attribute cannot be used in interfaces")
            false
        }
        limeFunction.isConstructor -> {
            logger.error(limeFunction, "`@Async` attribute cannot be used on constructors")
            false
        }
        else -> true
    }

    private fun validateNonFunction(limeElement: LimeNamedElement) =
        if (limeElement.attributes.have(ASYNC)) {
            logger.error(limeElement, "`@Async` attribute can only be used on functions")
            false
        } else {
            true
        }
}
