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
import com.here.gluecodium.model.common.Hierarchical
import org.trimou.util.Strings

abstract class SwiftModelElement(
    val name: String,
    visibility: SwiftVisibility? = null
) : Hierarchical<SwiftModelElement> {
    val visibility = visibility ?: SwiftVisibility.PUBLIC
    var comment = Comments()
    var attributes: List<String>? = null

    open val simpleName: String
        get() {
            val parts = Strings.split(name, ".")
            return parts[parts.size - 1]
        }

    override fun toString() = name
}
