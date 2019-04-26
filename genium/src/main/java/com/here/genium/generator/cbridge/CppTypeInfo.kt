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

package com.here.genium.generator.cbridge

import com.here.genium.generator.cpp.CppLibraryIncludes
import com.here.genium.model.cbridge.CElement
import com.here.genium.model.cbridge.CType
import com.here.genium.model.common.Include

open class CppTypeInfo(
    name: String,
    val cType: CType,
    val functionReturnType: CType,
    var typeCategory: TypeCategory,
    val includes: List<Include>
) : CElement(name) {

    enum class TypeCategory {
        BUILTIN_SIMPLE,
        BUILTIN_STRING,
        BUILTIN_BYTEBUFFER,
        BUILTIN_DATE,
        STRUCT,
        CLASS,
        ENUM,
        ARRAY,
        MAP
    }

    constructor(type: CType, typeCategory: TypeCategory = TypeCategory.BUILTIN_SIMPLE) : this(
        type.name,
        type,
        type,
        typeCategory,
        emptyList()
    )

    // Has to be a function. For a property Kotlin will generate a getter with "C" capitalized.
    @Suppress("unused")
    fun getcType() = cType

    companion object {
        val STRING = CppTypeInfo(name = "std::string",
            cType = CType.STRING_REF,
            functionReturnType = CType.STRING_REF,
            typeCategory = TypeCategory.BUILTIN_STRING,
            includes = listOf(
                CppLibraryIncludes.STRING,
                CppLibraryIncludes.NEW,
                Include.createInternalInclude(CBridgeNameRules.BASE_HANDLE_IMPL_FILE),
                Include.createInternalInclude(CBridgeNameRules.STRING_HANDLE_FILE)
            )
        )
        val DATE = CppTypeInfo(name = "std::chrono::system_clock::time_point",
            cType = CType.INT64,
            functionReturnType = CType.INT64,
            typeCategory = TypeCategory.BUILTIN_DATE,
            includes = listOf(
                CppLibraryIncludes.CHRONO,
                CppLibraryIncludes.NEW,
                Include.createInternalInclude(CBridgeNameRules.BASE_HANDLE_IMPL_FILE),
                Include.createInternalInclude(CBridgeNameRules.DATE_HANDLE_FILE))
        )
    }
}
