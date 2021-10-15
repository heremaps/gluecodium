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

class LimeFieldConstructor(
    path: LimePath,
    visibility: LimeVisibility = LimeVisibility.PUBLIC,
    comment: LimeComment = LimeComment(),
    attributes: LimeAttributes? = null,
    val structRef: LimeTypeRef,
    val fieldRefs: List<LimeFieldRef> = emptyList()
) : LimeNamedElement(path, visibility, comment, attributes) {
    val struct
        get() = structRef.type as LimeStruct
    val fields
        get() = fieldRefs.map { it.field }
    val omittedFields
        get() = struct.fields - fields

    fun asFunction() = LimeFunction(
        path = path,
        comment = comment,
        attributes = attributes,
        returnType = LimeReturnType(structRef),
        parameters = fields.map { LimeParameter(path.child(it.name), typeRef = it.typeRef) },
        isStatic = true,
        isConstructor = true
    )
}
