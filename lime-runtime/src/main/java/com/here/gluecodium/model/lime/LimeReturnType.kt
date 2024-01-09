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

import com.here.gluecodium.model.lime.LimeBasicType.TypeId

/**
 * Represents a return type of a [LimeFunction].
 */
class LimeReturnType(
    val typeRef: LimeTypeRef,
    val comment: LimeComment = LimeComment(),
    attributes: LimeAttributes? = null,
) : LimeElement(attributes) {
    val isVoid
        get() =
            !typeRef.isNullable &&
                typeRef.type.actualType.let { it is LimeBasicType && it.typeId == TypeId.VOID }

    companion object {
        val VOID = LimeReturnType(LimeBasicTypeRef(TypeId.VOID))
    }
}
