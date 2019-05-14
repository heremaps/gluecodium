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

package com.here.genium.model.java

import java.util.function.Function
import java.util.stream.Stream

class JavaClass(
    name: String,
    val extendedClass: JavaType? = null,
    val fields: List<JavaField> = emptyList(),
    methods: List<JavaMethod> = emptyList(),
    constants: List<JavaConstant> = emptyList(),
    val isImplClass: Boolean = false,
    val needsDisposer: Boolean = false,
    val isParcelable: Boolean = false,
    val isEquatable: Boolean = false,
    val isImmutable: Boolean = false,
    val needsBuilder: Boolean = false
) : JavaTopLevelElement(name) {

    init {
        this.methods += methods
        this.constants += constants
    }

    @Suppress("unused")
    val uninitializedFields = fields.filter { !it.initial.isCustom }

    @Suppress("unused")
    val hasDefaults = uninitializedFields.size < fields.size

    @Suppress("unused")
    val constructors
        get() = methods.filter { it.isConstructor }

    override fun stream(): Stream<JavaElement> {
        val extendedClassStream =
            if (extendedClass != null) extendedClass.stream() else Stream.empty()
        val implClassStream =
            when {
                isParcelable || needsBuilder ->
                    fields
                        .map { it.type }
                        .filterIsInstance<JavaTemplateType>()
                        .map { it.implementationType }
                        .stream()
                else -> Stream.empty()
            }
        return Stream.of(super.stream(), fields.stream(), extendedClassStream, implClassStream)
            .flatMap(Function.identity())
    }

    override fun getImports(): Set<JavaImport> {

        val imports = super.getImports()
        if (extendedClass != null) {
            imports.addAll(extendedClass.imports)
        }

        // No need to import things from the same package. This also filters out a self-import.
        imports.removeIf { anImport -> anImport.javaPackage == this.javaPackage }

        return imports
    }
}
