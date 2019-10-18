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

package com.here.gluecodium.model.cpp

import com.here.gluecodium.model.common.Comments
import com.here.gluecodium.model.common.Include

class CppStruct(
    name: String,
    fullyQualifiedName: String = name,
    includes: List<Include> = emptyList(),
    comment: Comments = Comments(),
    isExternal: Boolean = false,
    val fields: List<CppField> = emptyList(),
    val methods: List<CppMethod> = emptyList(),
    val constants: List<CppConstant> = emptyList(),
    val isEquatable: Boolean = false,
    val isImmutable: Boolean = false,
    val hasAccessors: Boolean = false,
    var constructorComment: String? = null
) : CppExternableElement(name, fullyQualifiedName, includes, comment, isExternal) {

    @Suppress("unused")
    val uninitializedFields = fields.filter { it.initializer == null }

    @Suppress("unused")
    val hasPartialDefaults =
        uninitializedFields.isNotEmpty() && uninitializedFields.size < fields.size

    @Suppress("unused")
    val hasImmutableFields = isImmutable || fields.any { it.hasImmutableType }

    @Suppress("unused")
    val hasDefaultConstructor =
        (!isImmutable || uninitializedFields.isEmpty()) && !uninitializedFields.any { it.hasImmutableType }

    override val childElements get() = fields + methods + constants
}
