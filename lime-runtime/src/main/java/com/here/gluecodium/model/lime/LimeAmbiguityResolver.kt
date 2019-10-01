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

object LimeAmbiguityResolver {
    /**
     * Resolves an ambiguous reference to a type, represented by [relativePath]. The ambiguity is
     * resolved with the following logic:
     * * for each import in [imports], try to match the last component of the import to the first
     * component of the [relativePath]. If it matches, try to resolve it into an actual element
     * through the [referenceMap].
     * * if import resolution fails, try appending [relativePath] to each parent path in
     * [parentPaths] and try resolving the combined path to an actual element through [referenceMap].
     * * if both approaches fail, the reference is invalid: a [LimeModelLoaderException] is thrown.
     * * if more than one type is found, the reference is ambiguous: a [LimeModelLoaderException] is
     * thrown.
     */
    inline fun <reified T : LimeNamedElement> resolve(
        relativePath: List<String>,
        parentPaths: List<LimePath>,
        imports: List<LimePath>,
        referenceMap: Map<String, LimeElement>
    ): T {
        val importedKeys = imports.filter { it.name == relativePath.first() }
            .map { it.child(relativePath.drop(1)).toString() }
        val localKeys = parentPaths.map { it.child(relativePath).toString() }
        val resolvedTypes =
            (importedKeys + localKeys).distinct().mapNotNull { referenceMap[it] as? T }
        when (resolvedTypes.size) {
            0 -> throw LimeModelLoaderException("Element $relativePath was not found")
            1 -> return resolvedTypes.first()
            else -> {
                val pathsString = resolvedTypes.map { it.path.toString() }.sorted().joinToString()
                throw LimeModelLoaderException("Element $relativePath is ambiguous: $pathsString")
            }
        }
    }
}
