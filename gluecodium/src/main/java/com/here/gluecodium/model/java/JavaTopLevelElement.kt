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

abstract class JavaTopLevelElement(
    name: String,
    val classNames: List<String>,
    var isStatic: Boolean = false,
    val isFinal: Boolean = false,
    val skipDeclaration: Boolean = false
) : JavaElement(name) {

    var javaPackage = JavaPackage.DEFAULT
    val methods: MutableSet<JavaMethod> = mutableSetOf()
    val parentInterfaces: MutableSet<JavaTypeRef> = mutableSetOf()

    val constants: MutableSet<JavaConstant> = mutableSetOf()
    val enums: MutableSet<JavaEnum> = mutableSetOf()
    val exceptions: MutableSet<JavaExceptionClass> = mutableSetOf()

    val innerClasses: MutableSet<JavaClass> = mutableSetOf()
    val innerInterfaces: MutableSet<JavaInterface> = mutableSetOf()

    open val imports: Set<JavaImport>
        get() {
            val imports = allElementsRecursive
                .filterIsInstance<JavaElementWithImports>()
                .flatMap { it.imports }
                .toMutableList()
            imports += parentInterfaces.flatMap { it.imports }
            imports += methods.filterNot { it.isSkipped }.mapNotNull { it.exception }.flatMap { it.imports }
            imports += innerClasses.flatMap { it.imports }
            imports += innerInterfaces.flatMap { it.imports }

            // No need to import things from the same package. This also filters out a self-import.
            imports.removeIf { it.javaPackage == this.javaPackage }

            return imports.toSortedSet()
        }

    override val childElements
        get() = super.childElements + methods.filterNot { it.isSkipped } + constants + parentInterfaces + enums +
                innerClasses + exceptions
}
