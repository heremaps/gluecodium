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
    val isExcluded: Boolean = false,
    val placeholders: Map<String, LimeComment> = emptyMap(),
) {
    init {
        taggedSections.forEach {
            if (isPlaceholder(it.first)) {
                if (!placeholders.contains(it.second)) {
                    throw IllegalArgumentException("Invalid comment placeholder requested: ${it.second}.")
                }
            }
        }
    }

    constructor(comment: String, path: LimePath = LimePath.EMPTY_PATH) : this(path, listOf("" to comment))

    fun isEmpty() = taggedSections.all { it.second.isEmpty() }

    fun getFor(platform: String) =
        taggedSections
            .filter { it.first == "" || it.first == platform || isPlaceholder(it.first) }
            .joinToString("") { if (!isPlaceholder(it.first)) it.second else resolvePlaceholder(it.second, platform) }
            .trim()

    fun withPath(newPath: LimePath) = LimeComment(newPath, taggedSections, isExcluded, placeholders)

    fun withExcluded(newExcluded: Boolean): LimeComment {
        return if (newExcluded != isExcluded) {
            LimeComment(path, taggedSections, newExcluded, placeholders)
        } else {
            this
        }
    }

    override fun toString() =
        taggedSections.joinToString("") {
            when (it.first) {
                "" -> escapeText(it.second)
                else -> "{@${it.first} ${escapeText(it.second)}}"
            }
        }.trim()

    private fun escapeText(text: String) = text.replace("""[@{}\\]""".toRegex()) { "\\${it.value}" }

    private fun isPlaceholder(label: String) = (label == "Placeholder")

    private fun resolvePlaceholder(
        name: String,
        platform: String,
    ): String = placeholders[name]!!.getFor(platform)
}
