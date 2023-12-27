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

package com.here.gluecodium.generator.jni

import com.here.gluecodium.generator.common.ImportsCollector
import com.here.gluecodium.generator.common.Include
import com.here.gluecodium.model.lime.LimeContainer
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeProperty
import com.here.gluecodium.model.lime.LimeStruct

internal class JniIncludeCollector(
    private val includeResolver: JniIncludeResolver,
    private val retainPredicate: (LimeNamedElement) -> Boolean,
) : ImportsCollector<Include> {
    override fun collectImports(limeElement: LimeNamedElement) =
        when (limeElement) {
            is LimeLambda -> collectImplIncludes(limeElement)
            is LimeContainerWithInheritance ->
                collectImplIncludes(limeElement) +
                    collectImplIncludes(limeElement.inheritedFunctions, limeElement.inheritedProperties)
            is LimeContainer -> collectImplIncludes(limeElement)
            else -> emptyList()
        }

    private fun collectFunctionTypes(limeFunction: LimeFunction) =
        limeFunction.parameters.map { it.typeRef } + limeFunction.returnType.typeRef +
            listOfNotNull(limeFunction.exception?.errorType)

    private fun collectImplIncludes(
        functions: List<LimeFunction>,
        properties: List<LimeProperty>,
    ): List<Include> {
        val allFunctions =
            functions +
                properties.filter(retainPredicate).flatMap { listOfNotNull(it.getter, it.setter) }
        return allFunctions.filter(retainPredicate)
            .flatMap { collectFunctionTypes(it) }
            .flatMap { includeResolver.resolveElementImports(it) }
    }

    private fun collectImplIncludes(limeLambda: LimeLambda) =
        collectFunctionTypes(limeLambda.asFunction()).flatMap { includeResolver.resolveElementImports(it) } +
            includeResolver.resolveElementImports(limeLambda)

    private fun collectImplIncludes(limeContainer: LimeContainer) =
        collectImplIncludes(limeContainer.functions, limeContainer.properties) +
            limeContainer.structs.flatMap { collectStructImplIncludes(it) } +
            includeResolver.resolveElementImports(limeContainer)

    private fun collectStructImplIncludes(limeStruct: LimeStruct): List<Include> {
        val functionTypes = limeStruct.functions.filter(retainPredicate).flatMap { collectFunctionTypes(it) }
        val fieldTypes = limeStruct.fields.filter(retainPredicate).map { it.typeRef }
        return (functionTypes + fieldTypes).flatMap { includeResolver.resolveElementImports(it) }
    }
}
