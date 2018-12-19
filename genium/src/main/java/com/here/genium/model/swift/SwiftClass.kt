/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
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

package com.here.genium.model.swift

import java.util.LinkedList

class SwiftClass @JvmOverloads constructor(
    name: String,
    visibility: SwiftVisibility? = null,
    val isInterface: Boolean = false,
    val parentClass: String? = null,
    @Suppress("unused") val nameSpace: String? = null,
    private val cInstance: String? = null,
    val functionTableName: String? = null,
    val useParentCInstance: Boolean = false,
    @Suppress("unused") val isObjcInterface: Boolean = false
) : SwiftType(name, visibility, SwiftType.TypeCategory.CLASS, null, name, false) {

    val implementsProtocols: List<String> = LinkedList()
    val properties: List<SwiftProperty> = LinkedList()
    val methods: List<SwiftMethod> = LinkedList()
    val structs: List<SwiftStruct> = LinkedList()
    val enums: List<SwiftEnum> = LinkedList()
    val typedefs: List<SwiftTypeDef> = LinkedList()
    val constants: List<SwiftConstant> = LinkedList()

    // Has to be a function. For a property Kotlin will generate a getter with "C" capitalized.
    @Suppress("unused")
    fun getcInstance() = cInstance

    @Suppress("unused")
    val hasParents
        get() = parentClass != null || !implementsProtocols.isEmpty()

    @Suppress("unused")
    val constructors
        get() = methods.filter { it.isConstructor }
}
