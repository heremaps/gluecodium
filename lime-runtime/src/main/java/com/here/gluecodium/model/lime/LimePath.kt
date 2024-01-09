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
 * An object of this class represents a "path" in the LIME model tree from the root to some specific
 * element (not necessary a tree leaf). A given path fully identifies the element, there are no two
 * elements with identical paths in the whole model (please note that the model is not a single tree,
 * but several disjoint trees).
 *
 * [tail] represents the traversable portion of the path, i.e. the hierarchy of elements nested in
 * each other that can be traversed back and forth. In contrast, [head] represents the
 * non-traversable part (similar to package or namespace in some languages).
 */
data class LimePath(
    val head: List<String>,
    val tail: List<String>,
    val disambiguator: String = "",
) : Comparable<LimePath> {
    val container
        get() = tail.first()

    val name
        get() = tail.last()

    val parent
        get() = LimePath(head, tail.dropLast(1))

    val tailParents
        get() = (1..tail.size).map { LimePath(head, tail.dropLast(it)) }

    val allParents
        get() = tailParents + (1..head.size).map { LimePath(head.dropLast(it), emptyList()) }

    val hasParent
        get() = tail.size > 1

    fun child(
        childName: String,
        disambiguator: String? = null,
    ) = LimePath(head, tail + childName, disambiguator ?: this.disambiguator)

    fun child(
        childNames: List<String>,
        disambiguator: String? = null,
    ) = LimePath(head, tail + childNames, disambiguator ?: this.disambiguator)

    fun withSuffix(disambiguator: String) = LimePath(head, tail, disambiguator)

    fun toAmbiguousString() = (head + tail).joinToString(separator = ".")

    override fun toString() = toAmbiguousString() + if (disambiguator.isNotEmpty()) ":$disambiguator" else ""

    override fun compareTo(other: LimePath) = toString().compareTo(other.toString())

    companion object {
        val EMPTY_PATH = LimePath(emptyList(), emptyList())
    }
}
