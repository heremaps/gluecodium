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

/**
 * A delayed-resolution reference to a type, represented by the element's positional [index] in the
 * list of its siblings (i.e. type references from child elements of the parent type
 * [parentTypeRef]). The name is resolved into an actual type through the [referenceMap] on the
 * first call. The resolution logic is "lazy": if it succeed on the first call then the result is
 * stored and the stored result is used on subsequent calls instead.
 */
class LimePositionalTypeRef(
    private val parentTypeRef: LimeTypeRef,
    private val index: Int,
    private val referenceMap: Map<String, LimeElement>,
    override val isNullable: Boolean = false
) : LimeTypeRef() {

    override val elementFullName by lazy { type.path.toString() }

    override val type by lazy {
        val limeType = parentTypeRef.type
        if (index >= 0 && index < limeType.childTypes.size) {
            limeType.childTypes[index].type
        } else {
            throw LimeModelLoaderException(
                "Type ${parentTypeRef.elementFullName}[$index] was not found"
            )
        }
    }

    override fun asNullable() =
        if (isNullable) this else LimePositionalTypeRef(parentTypeRef, index, referenceMap, true)
}
