/*
 * Copyright (C) 2016-2021 HERE Europe B.V.
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
import com.here.gluecodium.model.lime.LimeConstant
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeProperty
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeTypeRef

/**
 * Validate usage of `@Optimized` attribute on type references. Currently it only can be used for:
 * * return type of a function
 * * type of a read-only property
 * * type of a field in an `@Immutable` struct
 */
internal class LimeOptimizedListsValidator(private val logger: LimeLogger) {

    fun validate(limeModel: LimeModel): Boolean {
        val allElements = limeModel.referenceMap.values
        val validationResults = allElements.filterIsInstance<LimeConstant>().map { validateConstant(it) } +
            allElements.filterIsInstance<LimeTypeAlias>().map { validateTypeAlias(it) } +
            allElements.filterIsInstance<LimeException>().map { validateException(it) } +
            allElements.filterIsInstance<LimeContainerWithInheritance>().map { validateParent(it) } +
            allElements.filterIsInstance<LimeLambda>().map { validateLambda(it) } +
            allElements.filterIsInstance<LimeFunction>().map { validateFunction(it) } +
            allElements.filterIsInstance<LimeProperty>().map { validateProperty(it) } +
            allElements.filterIsInstance<LimeStruct>().map { validateStruct(it) }

        return !validationResults.contains(false)
    }

    private fun validateConstant(limeConstant: LimeConstant): Boolean {
        if (isOptimized(limeConstant.typeRef)) {
            logger.error(limeConstant, "`@Optimized` attribute cannot be used in a constant")
            return false
        }
        return true
    }

    private fun validateTypeAlias(limeTypeAlias: LimeTypeAlias): Boolean {
        if (isOptimized(limeTypeAlias.typeRef)) {
            logger.error(limeTypeAlias, "`@Optimized` attribute cannot be used in a type alias")
            return false
        }
        return true
    }

    private fun validateException(limeException: LimeException): Boolean {
        if (isOptimized(limeException.errorType)) {
            logger.error(limeException, "`@Optimized` attribute cannot be used in an exception")
            return false
        }
        return true
    }

    private fun validateParent(limeContainer: LimeContainerWithInheritance): Boolean {
        if (isOptimized(limeContainer.parent)) {
            logger.error(limeContainer, "`@Optimized` attribute cannot be used with inheritance")
            return false
        }
        return true
    }

    private fun validateLambda(limeLambda: LimeLambda): Boolean {
        val typeRefs = limeLambda.parameters.map { it.typeRef } + limeLambda.returnType.typeRef
        if (typeRefs.any { isOptimized(it) }) {
            logger.error(limeLambda, "`@Optimized` attribute cannot be used in a lambda")
            return false
        }
        return true
    }

    private fun validateFunction(limeFunction: LimeFunction): Boolean {
        if (limeFunction.parameters.map { it.typeRef }.any { isOptimized(it) }) {
            logger.error(limeFunction, "`@Optimized` attribute cannot be used in a function parameter")
            return false
        }
        if (isOptimized(limeFunction.thrownType?.typeRef)) {
            logger.error(limeFunction, "`@Optimized` attribute cannot be used in a function thrown type")
            return false
        }

        val returnTypeRef = limeFunction.returnType.typeRef
        if (isOptimized(returnTypeRef) && returnTypeRef.type.actualType !is LimeList) {
            logger.error(limeFunction, LIST_TYPE_MESSAGE)
            return false
        }
        return true
    }

    private fun validateProperty(limeProperty: LimeProperty): Boolean {
        if (!isOptimized(limeProperty.typeRef)) return true
        if (limeProperty.setter != null) {
            logger.error(limeProperty, "`@Optimized` attribute cannot be used in a property only if it is read-only")
            return false
        }
        if (limeProperty.typeRef.type.actualType !is LimeList) {
            logger.error(limeProperty, LIST_TYPE_MESSAGE)
            return false
        }
        return true
    }

    private fun validateStruct(limeStruct: LimeStruct): Boolean {
        if (limeStruct.fields.none { isOptimized(it.typeRef) }) return true
        if (!limeStruct.attributes.have(LimeAttributeType.IMMUTABLE)) {
            logger.error(limeStruct, "`@Optimized` attribute cannot be used in a struct only if it is immutable")
            return false
        }
        if (limeStruct.fields.any { isOptimized(it.typeRef) && it.typeRef.type.actualType !is LimeList }) {
            logger.error(limeStruct, LIST_TYPE_MESSAGE)
            return false
        }
        return true
    }

    companion object {
        private const val LIST_TYPE_MESSAGE = "`@Optimized` attribute can only be used with `List<>` type"

        private fun isOptimized(limeTypeRef: LimeTypeRef?) =
            limeTypeRef?.attributes?.have(LimeAttributeType.OPTIMIZED) ?: false
    }
}
