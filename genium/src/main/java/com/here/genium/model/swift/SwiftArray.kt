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

import java.util.stream.Stream

class SwiftArray private constructor(
    val underlyingType: SwiftType,
    visibility: SwiftVisibility?,
    publicName: String,
    optional: Boolean,
    cPrefix: String
) : SwiftType(
    getImplName(underlyingType),
    cPrefix,
    visibility,
    TypeCategory.ARRAY,
    publicName,
    optional
) {

    constructor(underlyingType: SwiftType, cPrefix: String) : this(
        underlyingType,
        null,
        getImplName(underlyingType),
        false,
        cPrefix
    )

    override fun withAlias(aliasName: String) =
        SwiftArray(underlyingType, visibility, aliasName, optional, cPrefix)

    override fun withOptional(optional: Boolean): SwiftType =
        when (optional) {
            this.optional -> this
            else -> SwiftArray(underlyingType, visibility, publicName, optional, cPrefix)
        }

    fun withoutAlias() =
        SwiftArray(underlyingType, visibility, getImplName(underlyingType), optional, cPrefix)

    override fun stream() =
        Stream.concat(super.stream(), Stream.of(underlyingType))

    companion object {
        private fun getImplName(underlyingType: SwiftType) = "[${underlyingType.publicName}]"
    }
}
