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

package com.here.gluecodium.model.cpp

import com.here.gluecodium.generator.cpp.CppLibraryIncludes
import com.here.gluecodium.model.common.Include

class CppPrimitiveTypeRef private constructor(
    name: String,
    includes: List<Include> = emptyList(),
    refersToConstType: Boolean = false
) : CppTypeRef(name, includes, refersToValueType = true, refersToConstType = refersToConstType) {

    companion object {
        private val intIncludes = listOf(CppLibraryIncludes.INT_TYPES)

        val VOID = CppPrimitiveTypeRef("void")
        val BOOL = CppPrimitiveTypeRef("bool")
        val FLOAT = CppPrimitiveTypeRef("float")
        val DOUBLE = CppPrimitiveTypeRef("double")
        val CHAR = CppPrimitiveTypeRef("char")
        val CSTRING = CppPrimitiveTypeRef("const char*", refersToConstType = true)
        val INT8 = CppPrimitiveTypeRef("int8_t", intIncludes)
        val INT16 = CppPrimitiveTypeRef("int16_t", intIncludes)
        val INT32 = CppPrimitiveTypeRef("int32_t", intIncludes)
        val INT64 = CppPrimitiveTypeRef("int64_t", intIncludes)
        val UINT8 = CppPrimitiveTypeRef("uint8_t", intIncludes)
        val UINT16 = CppPrimitiveTypeRef("uint16_t", intIncludes)
        val UINT32 = CppPrimitiveTypeRef("uint32_t", intIncludes)
        val UINT64 = CppPrimitiveTypeRef("uint64_t", intIncludes)
    }
}
