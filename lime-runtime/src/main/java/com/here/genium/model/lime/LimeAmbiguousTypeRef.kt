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

class LimeAmbiguousTypeRef(
    private val relativePath: List<String>,
    private val parentPaths: List<LimePath>,
    private val imports: List<LimePath>,
    private val referenceMap: Map<String, LimeElement>,
    override val isNullable: Boolean = false
) : LimeTypeRef() {

    override val elementFullName by lazy { type.path.toString() }

    override val type by lazy {
        for (limePath in imports.filter { it.name == relativePath.first() }) {
            val key = limePath.child(relativePath.drop(1)).toString()
            return@lazy referenceMap[key] as? LimeType ?: continue
        }
        for (limePath in parentPaths) {
            val key = limePath.child(relativePath).toString()
            return@lazy referenceMap[key] as? LimeType ?: continue
        }
        throw LimeModelLoaderException("Type $relativePath was not found")
    }

    override fun asNullable() =
        when {
            isNullable -> this
            else -> LimeAmbiguousTypeRef(relativePath, parentPaths, imports, referenceMap, true)
        }
}
