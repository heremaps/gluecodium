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
import com.here.genium.model.swift.SwiftDictionary
import com.here.genium.model.swift.SwiftFile
import java.util.TreeMap

class SwiftMapGenerator {

    private val mapCollector: MutableMap<String, SwiftDictionary> = HashMap()

    fun collect(maps: Map<String, SwiftDictionary>) {
        mapCollector.putAll(maps)
    }

    fun generate(): List<GeneratedFile> {
        val mapFile = SwiftFile()
        mapFile.dictionaries.addAll(TreeMap(mapCollector).values)

        return if (mapFile.isEmpty) {
            emptyList()
        } else {
            val content = TemplateEngine.render("swift/Dictionary", mapFile)
            listOf(GeneratedFile(content, SWIFT_DICTONARY))
        }
    }

    companion object {
        private const val SWIFT_DICTONARY = "swift/Dictionaries.swift"
    }
}
