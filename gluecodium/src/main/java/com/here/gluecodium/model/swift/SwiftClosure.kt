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

import com.here.gluecodium.model.common.Comments

class SwiftClosure(
    name: String,
    visibility: SwiftVisibility? = null,
    publicName: String = name,
    comment: Comments = Comments(),
    cPrefix: String = "",
    optional: Boolean = false,
    val functionTableName: String = "",
    val parameters: List<SwiftType>,
    val returnType: SwiftType
) : SwiftType(
    name = name,
    cPrefix = cPrefix,
    visibility = visibility,
    category = TypeCategory.CLOSURE,
    publicName = publicName,
    optional = optional
) {
    init {
        this.comment = comment
    }

    override fun withAlias(aliasName: String) =
        SwiftClosure(
            name = name,
            visibility = visibility,
            publicName = aliasName,
            comment = comment,
            cPrefix = cPrefix,
            optional = optional,
            functionTableName = functionTableName,
            parameters = parameters,
            returnType = returnType
        )

    override fun withOptional(optional: Boolean) =
        when (optional) {
            this.optional -> this
            else -> SwiftClosure(
                name = name,
                visibility = visibility,
                publicName = publicName,
                comment = comment,
                cPrefix = cPrefix,
                optional = optional,
                functionTableName = functionTableName,
                parameters = parameters,
                returnType = returnType
            )
        }
}
