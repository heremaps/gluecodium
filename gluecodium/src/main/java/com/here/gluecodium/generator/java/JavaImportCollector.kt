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

package com.here.gluecodium.generator.java

import com.here.gluecodium.generator.common.ImportsCollector
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeConstant
import com.here.gluecodium.model.lime.LimeContainer
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeStruct

internal class JavaImportCollector(
    private val importsResolver: JavaImportResolver,
    private val retainPredicate: (LimeNamedElement) -> Boolean
) : ImportsCollector<JavaImport> {

    override fun collectImports(limeElement: LimeNamedElement): List<JavaImport> {
        if (!retainPredicate(limeElement)) return emptyList()

        val nestedImports = when (limeElement) {
            is LimeStruct ->
                collectContainerImports(limeElement) + limeElement.fields.flatMap { collectImports(it) }
            is LimeContainer -> collectContainerImports(limeElement)
            is LimeFunction -> collectFunctionImports(limeElement)
            is LimeLambda -> collectFunctionImports(limeElement.asFunction())
            is LimeConstant -> importsResolver.resolveElementImports(limeElement.value)
            is LimeField ->
                limeElement.defaultValue?.let { importsResolver.resolveElementImports(it) } ?: emptyList()
            else -> emptyList()
        }
        return importsResolver.resolveElementImports(limeElement) + nestedImports
    }

    fun collectImplImports(limeInterface: LimeInterface, defImports: List<JavaImport>): List<JavaImport> {
        if (limeInterface.parents.isEmpty()) return defImports
        val parentImport = limeInterface.parents.map { importsResolver.createTopElementImport(it.type.actualType) }
        return defImports - parentImport +
            (limeInterface.inheritedFunctions + limeInterface.inheritedProperties).flatMap { collectImports(it) }
    }

    private fun collectContainerImports(limeContainer: LimeContainer): List<JavaImport> {
        val nestedElements = limeContainer.functions + limeContainer.properties + limeContainer.structs +
            limeContainer.classes + limeContainer.interfaces + limeContainer.exceptions + limeContainer.lambdas +
            limeContainer.constants
        val inheritedElements =
            when {
                limeContainer !is LimeContainerWithInheritance -> emptyList()
                (limeContainer is LimeClass && limeContainer.parentInterfaces.isNotEmpty()) ||
                    (limeContainer is LimeInterface && limeContainer.path.hasParent) ->
                    limeContainer.inheritedFunctions + limeContainer.inheritedProperties
                else -> emptyList()
            }
        return (nestedElements + inheritedElements).flatMap { collectImports(it) }
    }

    private fun collectFunctionImports(limeFunction: LimeFunction): List<JavaImport> {
        return limeFunction.parameters.flatMap { importsResolver.resolveElementImports(it) }
    }
}
