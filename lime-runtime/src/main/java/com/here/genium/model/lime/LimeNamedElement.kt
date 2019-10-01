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

package com.here.gluecodium.model.lime

abstract class LimeNamedElement protected constructor(
    val path: LimePath,
    val visibility: LimeVisibility = LimeVisibility.PUBLIC,
    val comment: LimeComment = LimeComment(),
    attributes: LimeAttributes? = null
) : LimeElement {

    open val name
        get() = path.name

    open val fullName
        get() = path.toString()

    open val escapedName
        get() = LimeTypeHelper.escapeIdentifier(name)

    @Suppress("unused")
    val packageName
        get() = path.head.joinToString(".") { LimeTypeHelper.escapeIdentifier(it) }

    val attributes = attributes ?: LimeAttributes.Builder().build()
}
