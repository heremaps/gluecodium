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

package com.here.genium.model.lime

data class LimePath(
    val head: List<String>,
    private val tail: List<String>,
    private val disambiguationSuffix: String = ""
) {
    val container
        get() = tail.first()

    val name
        get() = tail.last()

    val parent
        get() = LimePath(head, tail.take(tail.size - 1))

    val allParents
        get() = (1..tail.size).map { LimePath(head, tail.dropLast(it)) } +
                (1..head.size).map { LimePath(head.dropLast(it), emptyList()) }

    fun child(childName: String, disambiguationSuffix: String = "") =
        LimePath(head, tail + childName, disambiguationSuffix)

    fun child(childNames: List<String>, disambiguationSuffix: String = "") =
        LimePath(head, tail + childNames, disambiguationSuffix)

    fun withSuffix(disambiguationSuffix: String) = LimePath(head, tail, disambiguationSuffix)

    override fun toString() = (head + tail).joinToString(separator = ".") + disambiguationSuffix

    companion object {
        val EMPTY_PATH = LimePath(emptyList(), emptyList())
    }
}
