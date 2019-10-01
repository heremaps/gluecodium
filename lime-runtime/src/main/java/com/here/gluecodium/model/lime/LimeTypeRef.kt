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

abstract class LimeTypeRef : LimeElement {
    abstract val elementFullName: String
    abstract val type: LimeType
    abstract val isNullable: Boolean

    abstract fun asNullable(): LimeTypeRef

    override fun toString() = type.name + if (isNullable) "?" else ""

    val escapedName
        get() = type.escapedName + if (isNullable) "?" else ""
}
