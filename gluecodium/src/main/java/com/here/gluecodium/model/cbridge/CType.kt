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

package com.here.gluecodium.model.cbridge

import com.here.gluecodium.generator.cbridge.CBridgeNameRules
import com.here.gluecodium.model.common.Include
import java.nio.file.Paths

open class CType @JvmOverloads constructor(
    name: String,
    val includes: List<Include> = emptyList(),
    val isConst: Boolean = false
) : CElement(name) {

    constructor(name: String, include: Include): this(name, listOf(include))

    override fun toString() = if (isConst) "$CONST_SPECIFIER $name" else name

    companion object {
        protected const val CONST_SPECIFIER = "const"
        val FIXED_WIDTH_INTEGERS_INCLUDE = Include.createSystemInclude("stdint.h")
        val BOOL_INCLUDE = Include.createSystemInclude("stdbool.h")

        val VOID = CType("void")
        val INT8 = CType("int8_t", FIXED_WIDTH_INTEGERS_INCLUDE)
        val UINT8 = CType("uint8_t", FIXED_WIDTH_INTEGERS_INCLUDE)
        val INT16 = CType("int16_t", FIXED_WIDTH_INTEGERS_INCLUDE)
        val UINT16 = CType("uint16_t", FIXED_WIDTH_INTEGERS_INCLUDE)
        val INT32 = CType("int32_t", FIXED_WIDTH_INTEGERS_INCLUDE)
        val UINT32 = CType("uint32_t", FIXED_WIDTH_INTEGERS_INCLUDE)
        val INT64 = CType("int64_t", FIXED_WIDTH_INTEGERS_INCLUDE)
        val UINT64 = CType("uint64_t", FIXED_WIDTH_INTEGERS_INCLUDE)
        val BOOL = CType("bool", BOOL_INCLUDE)
        val FLOAT = CType("float")
        val DOUBLE = CType("double")
        val STRING_REF = CType(
            CBridgeNameRules.BASE_REF_NAME,
            listOf(
                Include.createInternalInclude(
                    Paths.get(
                        CBridgeNameRules.CBRIDGE_PUBLIC,
                        "include",
                        "StringHandle.h"
                    ).toString()
                )
            )
        )
        val BYTE_ARRAY_REF = CType(
            CBridgeNameRules.BASE_REF_NAME,
            listOf(
                Include.createInternalInclude(
                    Paths.get(
                        CBridgeNameRules.CBRIDGE_PUBLIC,
                        "include",
                        "ByteArrayHandle.h"
                    ).toString()
                )
            )
        )
    }
}
