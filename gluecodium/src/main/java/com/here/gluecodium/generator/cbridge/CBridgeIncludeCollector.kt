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

package com.here.gluecodium.generator.cbridge

import com.here.gluecodium.generator.common.ImportsCollector
import com.here.gluecodium.generator.common.ImportsResolver
import com.here.gluecodium.generator.common.Include
import com.here.gluecodium.model.lime.LimeAttributeType.SWIFT
import com.here.gluecodium.model.lime.LimeAttributeValueType.SKIP
import com.here.gluecodium.model.lime.LimeContainer
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeStruct

internal open class CBridgeIncludeCollector(private val includeResolver: ImportsResolver<Include>) :
    ImportsCollector<Include> {

    override fun collectImports(limeElement: LimeNamedElement): List<Include> {
        if (limeElement.attributes.have(SWIFT, SKIP)) return emptyList()
        return when (limeElement) {
            is LimeFunction -> collectFunctionIncludes(limeElement)
            is LimeLambda -> collectLambdaIncludes(limeElement)
            is LimeStruct -> collectStructIncludes(limeElement)
            is LimeContainer -> collectContainerIncludes(limeElement)
            else -> includeResolver.resolveElementImports(limeElement)
        }
    }

    protected open fun collectParentIncludes(limeContainer: LimeContainer): List<Include> = emptyList()

    private fun collectStructIncludes(limeStruct: LimeStruct) =
        collectContainerIncludes(limeStruct) + limeStruct.fields.flatMap { collectImports(it) }

    private fun collectContainerIncludes(limeContainer: LimeContainer): List<Include> {
        val nestedIncludes = (
            limeContainer.functions + limeContainer.properties + limeContainer.classes + limeContainer.interfaces +
                limeContainer.structs + limeContainer.enumerations + limeContainer.lambdas
            ).flatMap { collectImports(it) }
        val parentIncludes = collectParentIncludes(limeContainer)
        val ownIncludes = includeResolver.resolveElementImports(limeContainer)
        return nestedIncludes + parentIncludes + ownIncludes
    }

    private fun collectFunctionIncludes(limeFunction: LimeFunction): List<Include> {
        val nestedIncludes =
            (limeFunction.parameters + limeFunction.returnType).flatMap { includeResolver.resolveElementImports(it) }
        val ownIncludes = includeResolver.resolveElementImports(limeFunction)
        return nestedIncludes + ownIncludes
    }

    private fun collectLambdaIncludes(limeLambda: LimeLambda): List<Include> {
        val nestedIncludes =
            (limeLambda.parameters + limeLambda.returnType).flatMap { includeResolver.resolveElementImports(it) }
        val ownIncludes = includeResolver.resolveElementImports(limeLambda)
        return nestedIncludes + ownIncludes
    }
}
