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
    val hasNativeEquatable: Boolean = false,
    val isImmutable: Boolean = false,
    val needsBuilder: Boolean = false,
    var generatedConstructorComment: String? = null
) : JavaTopLevelElement(name) {

    init {
        this.methods += methods
        this.constants += constants
    }

    @Suppress("unused")
    val uninitializedFields = fields.filter { !it.initial.isCustom }

    @Suppress("unused")
    val defaultedFields = fields.filter { it.initial.isCustom }

    @Suppress("unused")
    val hasDefaults = uninitializedFields.size < fields.size

    @Suppress("unused")
    val allArgsConstructorVisibility: JavaVisibility
        get() = when {
            fields.any { it.visibility == JavaVisibility.PACKAGE } -> JavaVisibility.PACKAGE
            else -> visibility
        }

    @Suppress("unused")
    val freeArgsConstructorVisibility: JavaVisibility
        get() = when {
            uninitializedFields.any { it.visibility == JavaVisibility.PACKAGE } ->
                JavaVisibility.PACKAGE
            else -> visibility
        }

    @Suppress("unused")
    val constructors
        get() = methods.filter { it.isConstructor }

    override fun stream(): List<JavaElement> {
        val extendedClassStream = extendedClass?.stream() ?: emptyList()
        val implClassStream =
            when {
                isParcelable || needsBuilder ->
                    fields
                        .map { it.type }
                        .filterIsInstance<JavaTemplateType>()
                        .map { it.implementationType }
                else -> emptyList()
            }
        return super.stream() + fields + extendedClassStream + implClassStream
    }

    override val imports
        get() =
            if (extendedClass != null) {
                val parentImports =
                    extendedClass.imports.filterNot { it.javaPackage == this.javaPackage }
                (super.imports + parentImports).toSortedSet()
            } else {
                super.imports
            }
}
