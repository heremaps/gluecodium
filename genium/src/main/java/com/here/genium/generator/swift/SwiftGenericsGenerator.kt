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

package com.here.genium.generator.swift

import com.here.genium.generator.common.GeneratedFile
import com.here.genium.generator.common.templates.TemplateEngine
import com.here.genium.model.swift.SwiftArray
import com.here.genium.model.swift.SwiftDictionary
import com.here.genium.model.swift.SwiftSet
import com.here.genium.model.swift.SwiftType
import java.util.TreeMap

class SwiftGenericsGenerator {
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
        val data = mapOf("arrays" to swiftTypes.filterIsInstance<SwiftArray>())
        return when {
            data.isEmpty() -> emptyList()
            else -> listOf(GeneratedFile(
                TemplateEngine.render("swift/Array", data),
                "swift/Collections.swift"
            ))
        }
    }

    private fun generateDictionaries(swiftTypes: Collection<SwiftType>): List<GeneratedFile> {
        val data = mapOf("dictionaries" to swiftTypes.filterIsInstance<SwiftDictionary>())
        return when {
            data.isEmpty() -> emptyList()
            else -> listOf(GeneratedFile(
                TemplateEngine.render("swift/Dictionary", data),
                "swift/Dictionaries.swift"
            ))
        }
    }

    private fun generateSets(swiftTypes: Collection<SwiftType>): List<GeneratedFile> {
        val data = mapOf("sets" to swiftTypes.filterIsInstance<SwiftSet>())
        return when {
            data.isEmpty() -> emptyList()
            else -> listOf(GeneratedFile(
                TemplateEngine.render("swift/Set", data),
                "swift/Sets.swift"
            ))
        }
    }
}
