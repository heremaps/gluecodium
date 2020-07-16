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

open class SwiftType protected constructor(
    name: String,
    val cPrefix: String = "",
    visibility: SwiftVisibility? = null,
    val category: TypeCategory,
    val publicName: String = name,
    val optional: Boolean = false,
    val externalFramework: String? = null
) : SwiftModelElement(name, visibility) {
    val className
        get() = if (category == TypeCategory.CLASS) mangledName else ""

    open val mangledName
        get() = name.replace("_", "_1").replace(".", "_") + "_"

    constructor(
        name: String,
        cPrefix: String = "",
        category: TypeCategory = TypeCategory.BUILTIN_SIMPLE
    ) : this(name, cPrefix, null, category, name, false)

    enum class TypeCategory {
        BUILTIN_SIMPLE,
        BUILTIN_STRING,
        BUILTIN_OTHER,
        STRUCT,
        ENUM,
        CLASS,
        ARRAY,
        DICTIONARY,
        SET,
        CLOSURE,
        EXTENSION
    }

    // Has to be a function. For a property Kotlin will generate a getter with "C" capitalized.
    @Suppress("unused")
    fun getcPrefix() = cPrefix

    @Suppress("unused")
    val isExternal
        get() = externalFramework != null

    open fun withAlias(aliasName: String) =
        SwiftType(name, cPrefix, visibility, category, aliasName, optional, externalFramework)

    open fun withOptional(optional: Boolean) =
        when (optional) {
            this.optional -> this
            else -> SwiftType(name, cPrefix, visibility, category, publicName, optional, externalFramework)
        }

    companion object {
        val INT8 = SwiftType("Int8", "int8_t")
        val UINT8 = SwiftType("UInt8", "uint8_t")
        val INT16 = SwiftType("Int16", "int16_t")
        val UINT16 = SwiftType("UInt16", "uint16_t")
        val INT32 = SwiftType("Int32", "int32_t")
        val UINT32 = SwiftType("UInt32", "uint32_t")
        val INT64 = SwiftType("Int64", "int64_t")
        val UINT64 = SwiftType("UInt64", "uint64_t")

        val VOID = SwiftType("Void")
        val BOOL = SwiftType("Bool", "bool")
        val FLOAT = SwiftType("Float", "float")
        val DOUBLE = SwiftType("Double", "double")
        val STRING = SwiftType("String", "std_string", TypeCategory.BUILTIN_STRING)
        val DATA = SwiftType("Data", "data", TypeCategory.BUILTIN_OTHER)
        val DATE = SwiftType("Date", "date", TypeCategory.BUILTIN_OTHER)
        val LOCALE = SwiftType("Locale", "locale", TypeCategory.BUILTIN_OTHER)
    }
}
