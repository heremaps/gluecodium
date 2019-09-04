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

abstract class JavaTopLevelElement protected constructor(name: String) : JavaElement(name) {

    var javaPackage = JavaPackage.DEFAULT
    val methods: MutableSet<JavaMethod> = mutableSetOf()
    val parentInterfaces: MutableSet<JavaType> = mutableSetOf()

    val constants: MutableSet<JavaConstant> = mutableSetOf()
    val enums: MutableSet<JavaEnum> = mutableSetOf()
    val exceptions: MutableSet<JavaExceptionClass> = mutableSetOf()

    val innerClasses: MutableSet<JavaClass> = mutableSetOf()
    val qualifiers: MutableSet<Qualifier> = mutableSetOf()

    open val imports: Set<JavaImport>
        get() {
            val imports = streamRecursive().toList()
                .filterIsInstance<JavaElementWithImports>()
                .flatMap { it.imports }
                .toSortedSet()
            imports += parentInterfaces.flatMap { it.imports }
            imports += methods.mapNotNull { it.exception }.flatMap { it.imports }

            // No need to import things from the same package. This also filters out a self-import.
            imports.removeIf { it.javaPackage == this.javaPackage }

            return imports
        }

    enum class Qualifier(private val value: String) {
        STATIC("static"),
        FINAL("final");

        override fun toString() = value
    }

    override fun stream() =
        listOf(methods, constants, parentInterfaces, enums, innerClasses, exceptions).flatten()
}
