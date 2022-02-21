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

import java.time.DateTimeException
import java.time.Instant
import java.time.format.DateTimeFormatter

object LimeTypeHelper {

    fun getAllTypes(limeElement: LimeNamedElement): List<LimeType> {
        val limeType = limeElement as? LimeType ?: return emptyList()

        val nestedContainerTypes = (limeType as? LimeContainer)?.let {
            it.structs + it.enumerations + it.exceptions + it.typeAliases + it.classes + it.interfaces + it.lambdas
        } ?: emptyList()

        return listOf(limeType) + nestedContainerTypes.flatMap { getAllTypes(it) }
    }

    fun getAllValues(limeElement: LimeNamedElement): List<LimeValue> =
        when (limeElement) {
            is LimeConstant -> listOf(limeElement.value)
            is LimeField -> listOfNotNull(limeElement.defaultValue)
            is LimeContainerWithInheritance -> (
                limeElement.constants + limeElement.structs +
                    limeElement.classes + limeElement.interfaces
                ).flatMap { getAllValues(it) }
            is LimeTypesCollection ->
                (limeElement.constants + limeElement.structs).flatMap { getAllValues(it) }
            is LimeStruct ->
                (limeElement.constants + limeElement.fields).flatMap { getAllValues(it) }
            else -> emptyList()
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

    fun getAllParentTypes(allTypes: List<LimeType>): List<LimeType> {
        if (allTypes.isEmpty()) return emptyList()
        val parents = allTypes.filterIsInstance<LimeContainerWithInheritance>().flatMap { it.parents }.map { it.type }
        return parents + getAllParentTypes(parents)
    }

    fun collectDescendantInterfaces(elements: List<LimeNamedElement>): Map<String, List<LimeInterface>> {
        val allInterfaces = elements.flatMap { getAllTypes(it) }.filterIsInstance<LimeInterface>()
        val result = mutableMapOf<String, MutableList<LimeInterface>>()
        for (limeInterface in allInterfaces) {
            getAllParentTypes(listOf(limeInterface)).forEach {
                result.getOrPut(it.fullName) { mutableListOf() } += limeInterface
            }
        }
        for (entry in result) {
            // Pre-sort by name to have a stable ordering of elements which have the same inheritance distance.
            entry.value.sortBy { it.fullName }
            entry.value.sortByDescending { computeInheritanceDistance(it, entry.key) ?: Int.MIN_VALUE }
        }
        return result
    }

    private fun computeInheritanceDistance(limeContainer: LimeContainerWithInheritance, parentFullName: String): Int? {
        if (limeContainer.parents.isEmpty()) return null
        val parentTypes = limeContainer.parents.map { it.type.actualType }
        if (parentTypes.any { it.fullName == parentFullName }) return 1
        val parentDistances = parentTypes.filterIsInstance<LimeContainerWithInheritance>()
            .mapNotNull { computeInheritanceDistance(it, parentFullName) }
        return parentDistances.minOrNull()?.let { it + 1 }
    }

    fun dateLiteralEpochSeconds(literalText: String): Long? {
        val epochSeconds = try {
            Instant.from(DateTimeFormatter.ISO_DATE_TIME.parse(literalText)).epochSecond
        } catch (e: DateTimeException) {
            return null
        }
        return epochSeconds
    }

    private val limeKeywords = setOf(
        "class", "const", "constructor", "enum", "exception", "external", "field", "fun",
        "get", "import", "interface", "internal", "lambda", "narrow", "open", "package", "property", "public",
        "set", "static", "struct", "throws", "typealias", "types", "Void", "Boolean", "Float",
        "Double", "Byte", "Short", "Int", "Long", "UByte", "UShort", "UInt", "ULong", "String",
        "Blob", "Date", "Duration", "Locale", "List", "Map", "Set", "true", "false", "null", "NaN", "Infinity"
    )
}
