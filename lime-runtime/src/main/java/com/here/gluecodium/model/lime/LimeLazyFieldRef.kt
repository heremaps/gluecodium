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
 * A delayed-resolution reference to a field of a struct, represented by the field's name. The field's name is resolved
 * into an actual field on the first call. The resolution logic is "lazy": if it succeeds on the first call then the
 * result is stored and the stored result is used on subsequent calls instead.
 */
class LimeLazyFieldRef(structTypeRef: LimeTypeRef, fieldName: String, attributes: LimeAttributes? = null) :
    LimeFieldRef(attributes) {
    override val field by lazy {
        val limeStruct =
            structTypeRef.type.actualType as? LimeStruct
                ?: throw LimeModelLoaderException("Type ${structTypeRef.elementFullName} is not a struct")
        limeStruct.fields.find { it.name == fieldName }
            ?: throw LimeModelLoaderException("Field ${structTypeRef.elementFullName}.$fieldName was not found")
    }
}
