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

package com.here.genium.model.jni

import com.here.genium.model.common.Include
import java.util.LinkedList

/**
 * JniContainer is a container for classes, fields and methods.
 *
 * It can be referring to a type collection or an interface. The Cpp/Java name attributes
 * represent the name of the owning container which is the name of the containing class in case of
 * interface or the name of the package in case of type collection.
 */
data class JniContainer @JvmOverloads constructor(
    val javaPackages: List<String> = listOf(),
    val cppNameSpaces: List<String> = listOf(),
    val javaName: String? = null,
    val javaInterfaceName: String? = null,
    val cppName: String? = null,
    val cppFullyQualifiedName: String? = null,
    val isFrancaInterface: Boolean = false,
    var isInterface: Boolean = false
) : JniElement {
    val methods: MutableList<JniMethod> = LinkedList()
    val parentMethods: MutableList<JniMethod> = LinkedList()
    val structs: MutableList<JniStruct> = LinkedList()
    val enums: MutableList<JniEnum> = LinkedList()
    val includes: MutableSet<Include> = mutableSetOf()

    fun add(struct: JniStruct) {
        struct.owningContainer = this
        structs.add(struct)
    }

    fun add(enumeration: JniEnum) {
        enumeration.owningContainer = this
        enums.add(enumeration)
    }

    fun add(method: JniMethod) {
        method.owningContainer = this
        methods.add(method)
    }

    fun addParentMethod(method: JniMethod) {
        method.owningContainer = this
        parentMethods.add(method)
    }
}
