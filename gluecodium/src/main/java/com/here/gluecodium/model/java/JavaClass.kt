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

package com.here.gluecodium.model.java

class JavaClass(
    name: String,
    classNames: List<String> = listOf(name),
    isFinal: Boolean = false,
    skipDeclaration: Boolean = false,
    val extendedClass: JavaTypeRef? = null,
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
) : JavaTopLevelElement(
    name = name,
    classNames = classNames,
    isFinal = isFinal,
    skipDeclaration = skipDeclaration
) {

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

    override val childElements: List<JavaElement>
        get() {
            val extendedClassElements = extendedClass?.childElements ?: emptyList()
            val implClasses =
                when {
                    isParcelable || needsBuilder ->
                        fields
                            .map { it.type }
                            .filterIsInstance<JavaTemplateTypeRef>()
                            .map { it.implementationType }
                    else -> emptyList()
                }
            return super.childElements + fields + extendedClassElements + implClasses
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
