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
 * An ambiguous reference to a type, represented by [relativePath]. The ambiguity is resolved
 * through the [LimeAmbiguityResolver].
 *
 * The resolution logic is "lazy": if it succeeds on the first call then the result is stored and the
 * stored result is used on subsequent calls instead.
 */
class LimeAmbiguousTypeRef(
    private val relativePath: List<String>,
    private val parentPaths: List<LimePath>,
    private val imports: List<LimePath>,
    private val referenceMap: Map<String, LimeElement>,
    override val isNullable: Boolean = false,
    attributes: LimeAttributes? = null,
) : LimeTypeRef(attributes) {
    override val type by lazy {
        LimeAmbiguityResolver.resolve<LimeType>(relativePath, parentPaths, imports, referenceMap)
    }

    override fun asNullable() =
        when {
            isNullable -> this
            else -> LimeAmbiguousTypeRef(relativePath, parentPaths, imports, referenceMap, true, attributes)
        }

    override fun remap(referenceMap: Map<String, LimeElement>) =
        LimeAmbiguousTypeRef(relativePath, parentPaths, imports, referenceMap, isNullable, attributes)
}
