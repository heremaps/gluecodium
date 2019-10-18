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

import com.here.gluecodium.generator.cbridge.CBridgeNameRules
import com.here.gluecodium.generator.common.NameHelper
import com.here.gluecodium.model.common.Comments

class SwiftMethod(
    name: String,
    visibility: SwiftVisibility? = null,
    comment: Comments = Comments(),
    val returnType: SwiftType = SwiftType.VOID,
    var returnComment: String? = null,
    val cNestedSpecifier: String? = null,
    val cShortName: String? = null,
    val error: SwiftThrownType? = null,
    val isStatic: Boolean = false,
    val isConstructor: Boolean = false,
    val isOverriding: Boolean = false,
    val parameters: List<SwiftParameter> = emptyList()
) : SwiftModelElement(name, visibility) {

    init {
        this.comment = comment
    }

    @Suppress("unused")
    val isReturningVoid = returnType == SwiftType.VOID

    @Suppress("unused")
    val hasComment
        get() = !comment.isEmpty || !returnComment.isNullOrBlank() || parameters.any { !it.comment.isEmpty }

    // Has to be a function. For a property Kotlin will generate a getter with "C" capitalized.
    @Suppress("unused")
    fun getcBaseName() = NameHelper.joinNames(
        cNestedSpecifier, cShortName, CBridgeNameRules.UNDERSCORE
    )

    override val childElements
        get() = parameters + returnType
}
