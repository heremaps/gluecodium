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

class LimeBasicType(val typeId: TypeId) : LimeType(path = LimePath.EMPTY_PATH) {
    enum class TypeId(
        private val tag: String,
        @Suppress("unused") val isNumericType: Boolean = false
    ) {
        VOID("Void"),
        INT8("Byte", true),
        UINT8("UByte", true),
        INT16("Short", true),
        UINT16("UShort", true),
        INT32("Int", true),
        UINT32("UInt", true),
        INT64("Long", true),
        UINT64("ULong", true),
        FLOAT("Float", true),
        DOUBLE("Double", true),
        BOOLEAN("Boolean"),
        STRING("String"),
        BLOB("Blob"),
        DATE("Date");

        override fun toString() = tag
    }

    override val name
        get() = typeId.toString()

    override val escapedName
        get() = name
}
