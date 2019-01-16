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

package com.here.genium.model.swift

import java.util.LinkedList

class SwiftStruct @JvmOverloads constructor(
    name: String,
    visibility: SwiftVisibility?,
    category: SwiftType.TypeCategory = SwiftType.TypeCategory.STRUCT,
    implementingClass: String? = null,
    publicName: String? = null,
    optional: Boolean = false,
    private val cPrefix: String? = null,
    val isEquatable: Boolean = false,
    val isImmutable: Boolean = false
) : SwiftType(
    name,
    visibility,
    category,
    implementingClass,
    publicName ?: name,
    optional
) {

    val fields: MutableList<SwiftField> = LinkedList()
    val constants: MutableList<SwiftConstant> = LinkedList()
    val isInterface: Boolean = name != implementingClass

    // Has to be a function. For a property Kotlin will generate a getter with "C" capitalized.
    @Suppress("unused")
    fun getcPrefix() = cPrefix

    override fun withAlias(aliasName: String): SwiftType {
        val container = SwiftStruct(
            name,
            visibility,
            category,
            implementingClass,
            aliasName,
            optional,
            cPrefix,
            isEquatable,
            isImmutable
        )
        container.comment = this.comment
        container.fields.addAll(fields)
        return container
    }
}
