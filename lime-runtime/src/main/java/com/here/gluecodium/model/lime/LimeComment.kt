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

/**
 * The comment block is built from a sequence of tagged text section. A section with an empty tag
 * represents text that applies regardless of the chosen platform. A non-empty tag means the text
 * only applies to the platform represented by the tag (and thus should be skipped for all other
 * platforms).
 */
class LimeComment(
    val path: LimePath = LimePath.EMPTY_PATH,
    private val taggedSections: List<Pair<String, String>> = emptyList(),
    val isExcluded: Boolean = false
) {
    constructor(comment: String, path: LimePath = LimePath.EMPTY_PATH) : this(path, listOf("" to comment))

    fun isEmpty() = taggedSections.all { it.second.isEmpty() }

    fun getFor(platform: String) =
        taggedSections
            .filter { it.first == "" || it.first == platform }
            .joinToString("") { it.second }
            .trim()

    fun withPath(newPath: LimePath) = LimeComment(newPath, taggedSections, isExcluded)

    fun withExcluded(newExcluded: Boolean) =
        if (newExcluded != isExcluded) LimeComment(path, taggedSections, newExcluded) else this

    override fun toString() = taggedSections.joinToString("") {
        when (it.first) {
            "" -> escapeText(it.second)
            else -> "{@${it.first} ${escapeText(it.second)}}"
        }
    }.trim()

    private fun escapeText(text: String) = text.replace("""[@{}\\]""".toRegex()) { "\\${it.value}" }
}
