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

package com.here.gluecodium.generator.swift

import com.here.gluecodium.generator.common.GeneratedFile
import com.here.gluecodium.generator.common.templates.TemplateEngine
import com.here.gluecodium.model.swift.SwiftArray
import com.here.gluecodium.model.swift.SwiftDictionary
import com.here.gluecodium.model.swift.SwiftSet
import com.here.gluecodium.model.swift.SwiftType
import java.util.TreeMap

class SwiftGenericsGenerator(private val internalPrefix: String?) {
    private val generics = mutableMapOf<String, SwiftType>()

    fun collect(generics: Map<String, SwiftType>) {
        this.generics += generics
    }

    fun generate(): List<GeneratedFile> {
        val sortedTypes = TreeMap(generics).values
        return generateArrays(sortedTypes) + generateDictionaries(sortedTypes) +
                generateSets(sortedTypes)
    }

    private fun generateArrays(swiftTypes: Collection<SwiftType>): List<GeneratedFile> {
        val arrays = swiftTypes.filterIsInstance<SwiftArray>()
        val data = mapOf("arrays" to arrays, "internalPrefix" to internalPrefix)
        return when {
            arrays.isEmpty() -> emptyList()
            else -> listOf(GeneratedFile(
                TemplateEngine.render("swift/Array", data),
                "swift/Collections.swift"
            ))
        }
    }

    private fun generateDictionaries(swiftTypes: Collection<SwiftType>): List<GeneratedFile> {
        val dictionaries = swiftTypes.filterIsInstance<SwiftDictionary>()
        val data = mapOf("dictionaries" to dictionaries, "internalPrefix" to internalPrefix)
        return when {
            dictionaries.isEmpty() -> emptyList()
            else -> listOf(GeneratedFile(
                TemplateEngine.render("swift/Dictionary", data),
                "swift/Dictionaries.swift"
            ))
        }
    }

    private fun generateSets(swiftTypes: Collection<SwiftType>): List<GeneratedFile> {
        val sets = swiftTypes.filterIsInstance<SwiftSet>()
        val data = mapOf("sets" to sets, "internalPrefix" to internalPrefix)
        return when {
            sets.isEmpty() -> emptyList()
            else -> listOf(GeneratedFile(
                TemplateEngine.render("swift/Set", data),
                "swift/Sets.swift"
            ))
        }
    }
}
