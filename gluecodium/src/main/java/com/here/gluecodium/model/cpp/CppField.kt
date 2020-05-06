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

class CppField(
    name: String,
    fullyQualifiedName: String,
    type: CppTypeRef,
    val initializer: CppValue? = null,
    val isNotNull: Boolean = false,
    val isNullable: Boolean = false,
    val hasImmutableType: Boolean = false,
    isInstance: Boolean = false,
    val isClassEquatable: Boolean = false,
    val isClassPointerEquatable: Boolean = false,
    val getterName: String? = null,
    val setterName: String? = null
) : CppTypedElement(name, fullyQualifiedName, type) {

    override val childElements
        get() = listOfNotNull(type, initializer)

    @Suppress("unused")
    fun hasComment() = !comment.isEmpty || isNotNull

    @Suppress("unused")
    val needsPointerValueEqual = isNullable && !isClassPointerEquatable || isClassEquatable

    @Suppress("unused")
    val needsRawPointerEqual =
        isNullable && isInstance && !isClassEquatable && !isClassPointerEquatable
}
