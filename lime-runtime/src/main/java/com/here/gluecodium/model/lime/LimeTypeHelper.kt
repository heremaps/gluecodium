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

object LimeTypeHelper {
    fun getActualType(limeType: LimeType): LimeType =
        when (limeType) {
            is LimeTypeAlias -> getActualType(limeType.typeRef.type)
            else -> limeType
        }

    fun getAllFieldTypes(limeType: LimeType): List<LimeType> {
        val leafType = getLeafType(limeType)
        return listOf(leafType) + when (leafType) {
            is LimeStruct -> leafType.fields.flatMap { getAllFieldTypes(it.typeRef.type) }
            else -> emptyList()
        }
    }

    private fun getLeafType(limeType: LimeType): LimeType =
        when (limeType) {
            is LimeTypeAlias -> getLeafType(limeType.typeRef.type)
            is LimeList -> getLeafType(limeType.elementType.type)
            is LimeMap -> getLeafType(limeType.valueType.type)
            else -> limeType
        }

    /**
     * Backtick-escape the given identifier if at least one of the following is true:
     * * identifier exactly matches a LimeIDL keyword
     * * identifier contains a non-alphanumeric character that is not underscore
     * * identifier starts with a digit
     */
    fun escapeIdentifier(identifier: String) =
        when {
            limeKeywords.contains(identifier) || identifier.contains(Regex("\\W")) ||
                identifier.first().isDigit() -> "`$identifier`"
            else -> identifier
        }

    private val limeKeywords = setOf("class", "const", "constructor", "fun", "enum", "exception",
        "get", "import", "interface", "internal", "lambda", "open", "package", "property", "public",
        "set", "static", "struct", "throws", "typealias", "types", "Void", "Boolean", "Float",
        "Double", "Byte", "Short", "Int", "Long", "UByte", "UShort", "UInt", "ULong", "String",
        "Blob", "Date", "List", "Map", "Set", "true", "false", "null", "NaN", "Infinity")
}
