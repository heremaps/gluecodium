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

object LimeTypeHelper {
    fun getActualType(limeType: LimeType): LimeType =
        when (limeType) {
            is LimeTypeDef -> getActualType(limeType.typeRef.type)
            else -> limeType
        }

    fun getLeafType(limeType: LimeType): LimeType =
        when (limeType) {
            is LimeTypeDef -> getLeafType(limeType.typeRef.type)
            is LimeArray -> getLeafType(limeType.elementType.type)
            is LimeMap -> getLeafType(limeType.valueType.type)
            else -> limeType
        }
}
