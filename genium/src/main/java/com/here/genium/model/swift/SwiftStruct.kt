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

package com.here.gluecodium.model.swift

class SwiftStruct(
    name: String,
    cPrefix: String = "",
    visibility: SwiftVisibility? = null,
    category: TypeCategory = TypeCategory.STRUCT,
    val isInterface: Boolean = false,
    publicName: String? = null,
    optional: Boolean = false,
    val isEquatable: Boolean = false,
    val isImmutable: Boolean = false,
    val fields: List<SwiftField> = emptyList(),
    val constants: List<SwiftConstant> = emptyList(),
    val methods: List<SwiftMethod> = emptyList(),
    var generatedConstructorComment: String? = null
) : SwiftType(name, cPrefix, visibility, category, publicName ?: name, optional) {

    @Suppress("unused")
    val constructors
        get() = methods.filter { it.isConstructor }

    @Suppress("unused")
    val publicFields
        get() = fields.filterNot { it.visibility == SwiftVisibility.INTERNAL }

    @Suppress("MemberVisibilityCanBePrivate")
    val internalFields
        get() = fields.filter { it.visibility == SwiftVisibility.INTERNAL }

    @Suppress("unused")
    val constructorVisibility =
        if (internalFields.isNotEmpty()) SwiftVisibility.INTERNAL else visibility

    @Suppress("unused")
    val needsReducedConstructor =
        internalFields.isNotEmpty() && internalFields.all { it.defaultValue != null }

    override fun withAlias(aliasName: String): SwiftType {
        val swiftStruct = SwiftStruct(
            name,
            cPrefix,
            visibility,
            category,
            isInterface,
            aliasName,
            optional,
            isEquatable,
            isImmutable,
            fields,
            constants,
            methods
        )
        swiftStruct.comment = this.comment
        return swiftStruct
    }

    override fun withOptional(optional: Boolean): SwiftType {
        if (this.optional == optional) {
            return this
        }

        val swiftStruct = SwiftStruct(
            name,
            cPrefix,
            visibility,
            category,
            isInterface,
            publicName,
            optional,
            isEquatable,
            isImmutable,
            fields,
            constants,
            methods
        )
        swiftStruct.comment = comment
        return swiftStruct
    }

    override fun stream() = super.stream() + fields + constants
}
