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

package com.here.gluecodium.generator.cpp

import com.here.gluecodium.cli.GluecodiumExecutionException
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeGenericType
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeTypeRef
import com.here.gluecodium.model.lime.LimeTypedElement

internal class TopologicalSort(private val elements: List<LimeNamedElement>) {

    private val fullNames = elements.map { it.fullName }.toSet()

    /**
     * Do a topological sort based on Kahn's algorithm
     * https://en.wikipedia.org/wiki/Topological_sorting on the given structs and assign priorities
     * to structs so the most-basic structs are defined first to avoid compilation errors on C++.
     */
    fun sort(): List<LimeNamedElement> {
        val dependencies = elements.associateBy(
            { it.fullName },
            { getElementDependencies(it).toMutableSet() }
        )

        val sortedElements = mutableListOf<LimeNamedElement>()
        while (sortedElements.size < elements.size) {
            // Find the first element with no dependency needed which is not in the sorted elements.
            val nextElement = elements.firstOrNull {
                val dependencySet = dependencies[it.fullName]
                dependencySet != null && dependencySet.isEmpty() && !sortedElements.contains(it)
            } ?: throw GluecodiumExecutionException("Cycle detected in C++ elements dependencies.")

            sortedElements.add(nextElement)

            // As dependency to "nextElement" is now fulfilled we must remove it from elements
            // dependencies.
            for (name in fullNames) {
                dependencies[name]?.remove(nextElement.fullName)
            }
        }

        return sortedElements
    }

    private fun getTypeRefDependencies(limeTypeRef: LimeTypeRef): List<String> =
        when (val limeType = limeTypeRef.type) {
            is LimeGenericType -> limeType.childTypes.flatMap { getTypeRefDependencies(it) }
            else -> emptyList()
        } + listOfNotNull(limeTypeRef.type.fullName.takeIf { fullNames.contains(it) })

    private fun getElementDependencies(limeElement: LimeNamedElement): Set<String> =
        when (limeElement) {
            is LimeTypedElement -> getTypeRefDependencies(limeElement.typeRef)
            is LimeStruct -> (limeElement.fields + limeElement.functions + limeElement.constants)
                .flatMap { getElementDependencies(it) }
            is LimeTypeAlias -> getTypeRefDependencies(limeElement.typeRef)
            is LimeFunction -> (
                limeElement.parameters.map { it.typeRef } +
                    listOfNotNull(limeElement.returnType.typeRef, limeElement.exception?.errorType)
                )
                .flatMap { getTypeRefDependencies(it) }
            is LimeLambda -> (limeElement.parameters.map { it.typeRef } + limeElement.returnType.typeRef)
                .flatMap { getTypeRefDependencies(it) }
            else -> emptyList()
        }.toSet() - limeElement.fullName
}
