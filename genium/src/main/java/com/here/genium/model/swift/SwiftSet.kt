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

class SwiftSet(
    val elementType: SwiftType,
    cPrefix: String,
    visibility: SwiftVisibility? = null,
    publicName: String = getImplName(elementType),
    optional: Boolean = false
) : SwiftType(
    getImplName(elementType),
    cPrefix,
    visibility,
    TypeCategory.SET,
    publicName,
    optional
) {
    override fun withAlias(aliasName: String) =
        SwiftSet(elementType, cPrefix, visibility, aliasName, optional)

    override fun withOptional(optional: Boolean) =
        when {
            this.optional != optional ->
                SwiftSet(elementType, cPrefix, visibility, publicName, optional)
            else -> this
        }

    override fun stream() = Stream.concat(super.stream(), Stream.of(elementType))

    companion object {
        private fun getImplName(underlyingType: SwiftType) =
            "Set<" + underlyingType.publicName + ">"
    }
}
