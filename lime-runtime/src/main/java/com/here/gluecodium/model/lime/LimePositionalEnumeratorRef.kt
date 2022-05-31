/*
 * Copyright (C) 2016-2021 HERE Europe B.V.
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
 * A delayed-resolution reference to an enumerator, represented by the enumerator's positional [index] in the
 * list of its siblings (i.e. enumerators in the parent enumeration [enumRef]). The index is resolved into an
 * actual enumerator on the first call. The resolution logic is "lazy": if it succeeds on the first call then the result
 * is stored and the stored result is used on subsequent calls instead.
 */
class LimePositionalEnumeratorRef(
    override val enumRef: LimeTypeRef,
    private val index: Int
) : LimeEnumeratorRef() {

    override val enumerator by lazy {
        val limeType = enumRef.type.actualType as? LimeEnumeration
        val stringIndex = index.toString()
        limeType?.enumerators?.find { it.value.toString() == stringIndex }
            ?: throw LimeModelLoaderException("Enumerator ${enumRef.elementFullName}($index) was not found")
    }

    override fun remap(referenceMap: Map<String, LimeElement>) =
        LimePositionalEnumeratorRef(enumRef.remap(referenceMap), index)
}
