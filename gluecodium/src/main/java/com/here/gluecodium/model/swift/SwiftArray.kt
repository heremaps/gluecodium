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

class SwiftArray private constructor(
    val elementType: SwiftType,
    visibility: SwiftVisibility?,
    publicName: String,
    optional: Boolean,
    cPrefix: String
) : SwiftType(
    getImplName(elementType),
    cPrefix,
    visibility,
    TypeCategory.ARRAY,
    publicName,
    optional
) {

    constructor(elementType: SwiftType, cPrefix: String) : this(
        elementType,
        null,
        getImplName(elementType),
        false,
        cPrefix
    )

    override fun withAlias(aliasName: String) =
        SwiftArray(elementType, visibility, aliasName, optional, cPrefix)

    override fun withOptional(optional: Boolean): SwiftType =
        when (optional) {
            this.optional -> this
            else -> SwiftArray(elementType, visibility, publicName, optional, cPrefix)
        }

    fun withoutAlias() =
        SwiftArray(elementType, visibility, getImplName(elementType), optional, cPrefix)

    override val childElements
        get() = listOf(elementType)

    companion object {
        private fun getImplName(elementType: SwiftType) = "[${elementType.publicName}]"
    }
}
