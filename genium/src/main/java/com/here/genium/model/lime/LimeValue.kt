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

sealed class LimeValue(val typeRef: LimeTypeRef) : LimeElement {
    class Literal(type: LimeTypeRef, val value: String) : LimeValue(type)

    class Enumerator(type: LimeTypeRef, val valueRef: LimeEnumeratorRef) : LimeValue(type)

    class Special private constructor(type: LimeTypeRef, val value: ValueId) : LimeValue(type) {
        enum class ValueId {
            NAN,
            INFINITY,
            NEGATIVE_INFINITY
        }

        companion object {
            val FLOAT_NAN = Special(LimeBasicTypeRef.FLOAT, ValueId.NAN)
            val FLOAT_INFINITY = Special(LimeBasicTypeRef.FLOAT, ValueId.INFINITY)
            val FLOAT_NEGATIVE_INFINITY = Special(LimeBasicTypeRef.FLOAT, ValueId.NEGATIVE_INFINITY)
            val DOUBLE_NAN = Special(LimeBasicTypeRef.DOUBLE, ValueId.NAN)
            val DOUBLE_INFINITY = Special(LimeBasicTypeRef.DOUBLE, ValueId.INFINITY)
            val DOUBLE_NEGATIVE_INFINITY =
                Special(LimeBasicTypeRef.DOUBLE, ValueId.NEGATIVE_INFINITY)
        }
    }
}
