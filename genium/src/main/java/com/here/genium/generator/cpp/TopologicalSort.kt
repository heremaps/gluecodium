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

package com.here.genium.generator.cpp

import com.here.genium.cli.GeniumExecutionException
import com.here.genium.model.cpp.CppElement
import com.here.genium.model.cpp.CppMethod
import com.here.genium.model.cpp.CppStruct
import com.here.genium.model.cpp.CppTemplateTypeRef
import com.here.genium.model.cpp.CppTypeDefRef
import com.here.genium.model.cpp.CppTypeRef
import com.here.genium.model.cpp.CppTypedElement
import com.here.genium.model.cpp.CppUsing

class TopologicalSort(private val elements: List<CppElement>) {

    private val fullyQualifiedNames = elements.map { it.fullyQualifiedName }.toSet()

    /**
     * Do a topological sort based on Kahn's algorithm
     * https://en.wikipedia.org/wiki/Topological_sorting on the given structs and assign priorities
     * to structs so the most-basic structs are defined first to avoid compilation errors on C++.
     */
    fun sort(): List<CppElement> {
        val dependencies =
            elements.associateBy({ it.fullyQualifiedName }, { getElementDependencies(it) })

        val sortedElements = mutableListOf<CppElement>()
        while (sortedElements.size < elements.size) {
            // Find the first element with no dependency needed which is not in the sorted elements.
            val nextElement = elements.firstOrNull {
                val dependencySet = dependencies[it.fullyQualifiedName]
                dependencySet != null && dependencySet.isEmpty() && !sortedElements.contains(it)
            } ?: throw GeniumExecutionException("Cycle detected in CPP elements dependencies.")

            sortedElements.add(nextElement)

            // As dependency to "nextElement" is now fulfilled we must remove it from elements
            // dependencies.
            for (name in fullyQualifiedNames) {
                dependencies[name]?.remove(nextElement.fullyQualifiedName)
            }
        }

        return sortedElements
    }

    private fun getTypeDependencies(typeRef: CppTypeRef): MutableSet<String> {
        val dependencies = when (typeRef) {
            is CppTemplateTypeRef ->
                typeRef.templateParameters.flatMapTo(mutableSetOf()) { getTypeDependencies(it) }
            is CppTypeDefRef -> getTypeDependencies(typeRef.actualType)
            else -> mutableSetOf()
        }

        if (fullyQualifiedNames.contains(typeRef.name)) {
            dependencies.add(typeRef.name)
        }

        return dependencies
    }

    private fun getElementDependencies(cppElement: CppElement): MutableSet<String> {
        val result = when (cppElement) {
            is CppTypedElement -> {
                val dependencies = getTypeDependencies(cppElement.type)
                if (fullyQualifiedNames.contains(cppElement.type.name)) {
                    dependencies.add(cppElement.type.name)
                }
                dependencies
            }
            is CppStruct ->
                cppElement.stream().flatMap { getElementDependencies(it) }.toMutableSet()
            is CppUsing -> getTypeDependencies(cppElement.definition)
            is CppMethod -> (cppElement.parameters.map { it.type } + cppElement.returnType)
                .flatMapTo(mutableSetOf()) { getTypeDependencies(it) }
            else -> mutableSetOf()
        }
        result.remove(cppElement.fullyQualifiedName)
        return result
    }
}
